package bit.controller;


import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import bit.objects.CoinValueFilter;
import bit.objects.StateInfo;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import bit.service.CoinService;
import bit.service.interfaces.LoanPayor;
import bit.service.interfaces.User;
import bit.service.interfaces.LoanInvestor;
import bit.validator.InvestValidator;
import bit.vo.InvestorVO;
import bit.vo.LoginVO;
import bit.vo.ProductVO;
import lombok.extern.java.Log;

@Log
@Controller
@SessionAttributes("productInfo")
@RequestMapping("/loan/invest")
public class LoanInvestorController{
	
    @Autowired
	private CoinService coinService;
    
    @Autowired
	private LoanPayor loanPayorService;

    @Autowired
    private LoanInvestor loanInvestorService;
    
    @Autowired
    private User userService;

    @Autowired
    private InvestValidator investValidator;


    /**
     * 코인 담보론 투자 리스트
     * @return
     */
    @RequestMapping("/list")
    public String list(){

        return "loan/listInvestor";
    }

    @RequestMapping(value = "/list/filtered", produces = "application/json; charset=utf-8", method = RequestMethod.POST)
    public @ResponseBody String filteredList(@RequestBody Map<String, String> params, Model model, HttpSession session){

        JSONObject jsonObject = new JSONObject();

        LoginVO loginVO = (LoginVO) session.getAttribute("login");

        if(loginVO == null){
            jsonObject.put("fail", "noSession");
            return jsonObject.toString();
        }

        params.put("id", loginVO.getId());


        List<ProductVO> resultList = loanPayorService.payorProductListByFilter(params);

        /**
         * 필터링할 값이 있으면 코인종류로 필터링.
         */
        if(params.get("coinValues").length() == 0){

            jsonObject.put("list", resultList);

        }else{

            resultList = CoinValueFilter.filteredList(resultList, Arrays.asList(params.get("coinValues").split(",")));
            jsonObject.put("list", resultList);
        }

        return jsonObject.toString();
    }

    /**
     * 코인 담보론 투자자 등록 페이지
     * @return
     */
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add(@ModelAttribute InvestorVO investorVO, HttpSession session){

        LoginVO loginVO = (LoginVO) session.getAttribute("login");
        String id = loginVO.getId();
        
        if(userService.getUserCode(id) == 100) {
        	return "loan/addInvestor";
    	}else {
    		return "redirect:/loan/invest/list"; 
    	}
        
       
    }

    /**
     * 코인 담보론 투자자 등록하기
     * @param investorVO
     * @return
     */

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addInvestor(@ModelAttribute InvestorVO investorVO, BindingResult bindingResult, HttpSession session){

        LoginVO loginVO = (LoginVO) session.getAttribute("login");

        if(loginVO == null){

            return "redirect:/login/required";
        }

        investValidator.validate(investorVO, bindingResult);

        if(bindingResult.hasErrors()) return "loan/addInvestor";

        try {
            investorVO.setUserId(loginVO.getId());
            loanInvestorService.addInvestor(investorVO);

        }catch (EmptyResultDataAccessException e){

            e.printStackTrace(); throw e;
        }

        return "redirect:/loan/invest/welcome";
    }

    /**
     * 코인 담보론 투자 환영 페이지
     * @return
     */
    @RequestMapping("/welcome")
    public String welcome(HttpSession session) {
    	
    	LoginVO loginVO = (LoginVO) session.getAttribute("login");
    	
    	String id = loginVO.getId();
    	
    	if(userService.getUserCode(id) == 100) {
    		return "redirect:/loan/invest/add";
    	}else {
    		return "loan/welcomeInvestor";
    	}
    }

    /**
     * 담보 투자 결제정보 페이지
     * @return
     */
    @RequestMapping("/payment")
    public String paymentInfo(Model model, @RequestParam int productNo){
    	model.addAttribute("productInfo", loanPayorService.payorProductInfo(productNo));
    	
    	return "loan/paymentInfoInvestor";
    }


    /**
     * 담보 투자 결제정보 모달 뿌려주기
     * @return
     */
    @RequestMapping(value="/payModal", produces="application/json; charset=utf8", method = RequestMethod.POST)
    @ResponseBody
    public String paymentInfoModal(@RequestBody int productNo,HttpSession session){
    	
    	LoginVO loginVO = (LoginVO) session.getAttribute("login");
    	String id = loginVO.getId();

        JSONObject jsonObject = new JSONObject();
        
        HashMap<String, String> params = new HashMap<>();
        params.put("id", id);
        params.put("type","KRW");

        jsonObject.put("list", loanPayorService.payorProductInfo(productNo));
        jsonObject.put("balance",  loanInvestorService.getMoney(params));

        return jsonObject.toString();
    }
    
    /**
     * 담보 투자 결제정보 모달정보를 뿌려준후 투자신청 받기
     * @return
     */
    @RequestMapping(value="/investApply", produces="application/json; charset=utf8", method = RequestMethod.POST)
    @ResponseBody
    public String ModalToPay(@RequestBody Map<String, String> params){
    	
    	JSONObject jsonObject = new JSONObject();
    	
    	jsonObject.put("state", loanInvestorService.investApply(params));

    	return jsonObject.toString();
    }

    
    /**
     *  안내사항 고지 페이지
     */
    @RequestMapping("/agree")
    public String agree() {
    	
    	return "loan/agreeInvestor";
    }
    
    /**
     *  투자 신청 페이지
     */
    @RequestMapping(value="/apply", method = RequestMethod.GET)
    public String apply(HttpSession session, Model model) {
    	
    	LoginVO loginVO = (LoginVO) session.getAttribute("login");
    	
    	String id = loginVO.getId();
    	
    	HashMap<String, String> params = new HashMap<>();
    	
    	params.put("id", id);
    	params.put("type", "KRW");
    	
    	model.addAttribute("money", loanInvestorService.getMoney(params));
    	
    	return "loan/applyInvest";
    }
    
    /**
     *  투자 신청 페이지
     */
    @RequestMapping(value = "/apply", produces = "application/json; charset=utf8", method = RequestMethod.POST)
    @ResponseBody
    public String DBapply(HttpSession session,@RequestBody HashMap<String, String> params) {
    	
    	LoginVO loginVO = (LoginVO) session.getAttribute("login");
    	
    	String id = loginVO.getId();
    	
    	JSONObject jsonObject = new JSONObject();
    	
    	jsonObject.put("state", loanInvestorService.investLoanApply(params,id));
        
        
		return jsonObject.toString();
    }
 
  /**
   *  주문 및 거래내역 페이지
   */
    @RequestMapping("/history")
    public String orderHistory() {
  	
  	    return "loan/orderHistoryInvestor";
    }
    
    /**
     * 담보 투자 취소 처리
     * @return
     */
    @RequestMapping(value="/history/cancel", produces="application/json; charset=utf8", method = RequestMethod.POST)
    @ResponseBody
    public String investCancel(@RequestBody String param,HttpSession session){

    	JSONObject jsonObject = new JSONObject();
    	
    	LoginVO loginVO = (LoginVO) session.getAttribute("login");
    	String id = loginVO.getId();
    	
    	HashMap<String, String> params = new HashMap<>();
    	
    	params.put("id", id);
    	params.put("no", param.split("_")[1]);
    	
    	jsonObject.put("state", loanInvestorService.cancel(params));
        
		return jsonObject.toString();
    }


    /**
     * DB가 보유한 코인 종류 호출
     * @return
     */

    @ModelAttribute("coinType")
    private List<Map<String, Object>> coinType(){

        return coinService.getCoinType();
    }
    
    /**
     * DB가 보유한 거래 호출
     * @return
     */

    @ModelAttribute("productList")
    private List<ProductVO> getProductList(HttpSession session){

    	LoginVO loginVO = (LoginVO) session.getAttribute("login");
    	String id = loginVO.getId();
    	
        return loanPayorService.payorProductList(id);
    }
    
    /**
     * 체결 전인 거래 목록 호출
     */
    @ModelAttribute("loanWaitList")
    @SuppressWarnings({ "unchecked", "rawtypes", "serial" })
    private List<HashMap<String, String>> loanWaitList(HttpSession session){

    	LoginVO loginVO = (LoginVO) session.getAttribute("login");
        String id = loginVO.getId();

    	HashMap params = new HashMap<String, String>()
        {
            {
                this.put("id", id); this.put("state", "200");
            }
        };

        List<HashMap<String, String>> resultList = loanInvestorService.investorLoanWaitList(params);
        resultList.forEach(n -> n.compute("state", (s, s2) -> StateInfo.valueOf(s2).getMessage()));

        return resultList;
    }
    
    /**
     * 진행 중인 거래 목록 호출
     */
    @ModelAttribute("loanProgressList")
    @SuppressWarnings({ "unchecked", "rawtypes", "serial" })
    private List<HashMap<String, String>> loanProgressList(HttpSession session){

    	LoginVO loginVO = (LoginVO) session.getAttribute("login");
        String id = loginVO.getId();

    	HashMap params = new HashMap<String, String>()
        {
            {
                this.put("id", id); this.put("state", "201");
            }
        };

        List<HashMap<String, String>> resultList = loanInvestorService.investorLoanProgressList(params);
        resultList.forEach(n -> n.compute("state", (s, s2) -> StateInfo.valueOf(s2).getMessage()));

        return resultList;
    }
    
}


