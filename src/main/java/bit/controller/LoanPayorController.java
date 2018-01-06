package bit.controller;


import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import bit.objects.StateInfo;
import bit.service.CoinService;
import bit.service.interfaces.LoanInvestor;
import bit.service.interfaces.LoanPayor;
import bit.service.interfaces.User;
import bit.utils.URLJsonReader;
import bit.validator.PayValidator;
import bit.vo.InvestVO;
import bit.vo.LoginVO;
import bit.vo.PayorVO;
import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/loan/payor")
public class LoanPayorController {
	
	@Autowired
	private CoinService coinService;

	@Autowired
	private LoanPayor loanPayorService ;

	@Autowired
	private LoanInvestor loanInvestorService;

	@Autowired
    private User userService;
	
	@Autowired
    private PayValidator payValidator;

    /**
     * 코인 담보론 대출 리스트
     * @return
     */
    @RequestMapping("/list")
    public String list(){

        return "loan/listPayor";
    }


    @RequestMapping(value = "/list/filtered", produces = "application/json; charset=utf-8", method = RequestMethod.POST)
    @ResponseBody
    public String filteredList(@RequestBody Map<String, String> params, Model model, HttpSession session){

        JSONObject jsonObject = new JSONObject();

        LoginVO loginVO = (LoginVO) session.getAttribute("login");

        if(loginVO == null){
            jsonObject.put("fail", "noSession");
            return jsonObject.toString();
        }

        params.put("id", loginVO.getId());

        /**
         * . 코인종류로 필터링이 없는 페이지.
         */

        jsonObject.put("list", loanPayorService.investorInvestListByFilter(params));

        return jsonObject.toString();
    }

    /**
     * 코인 담보론 대출자 등록 페이지
     * @return
     */
    @RequestMapping("/add")
    public String add(@ModelAttribute PayorVO payorVO, HttpSession session){

        LoginVO loginVO = (LoginVO) session.getAttribute("login");
        String id = loginVO.getId();
        
        if(userService.getUserCode(id) == 100) {
        	return "loan/addPayor";
    	}else {
    		return "redirect:/loan/payor/list"; 
    	}
        
    }
    
    /**
     * 코인 담보론 투자자 등록하기
     * @param payorVO
     * @return
     */

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addPayor(@ModelAttribute PayorVO payorVO, BindingResult bindingResult, HttpSession session){

        LoginVO loginVO = (LoginVO) session.getAttribute("login");

        if(loginVO == null){

            return "redirect:/login/required";
        }

        payValidator.validate(payorVO, bindingResult);

        if(bindingResult.hasErrors()) return "loan/addPayor";

        try {
        	payorVO.setUserId(loginVO.getId());
            loanInvestorService.addPayor(payorVO);

        }catch (EmptyResultDataAccessException e){

            e.printStackTrace(); throw e;
        }

        return "redirect:/loan/payor/welcome";
    }

    /**
     * 코인 담보론 대출자 환영 페이지
     * @return
     */
    @RequestMapping("/welcome")
    public String welcome(HttpSession session) {
    	
    	LoginVO loginVO = (LoginVO) session.getAttribute("login");
    	
    	String id = loginVO.getId();
    	
    	if(userService.getUserCode(id) == 100) {
    		return "redirect:/loan/payor/add";
    	}else {
    		return "loan/welcomePayor";
    	}
    }

    /**
     *  담보 론 결제정보 페이지
     * @return
     */
    @RequestMapping("/payment")
    public String paymentInfo(){

        return "loan/paymentInfoPayor";
    }

    /**
     *  자동매각 동의 페이지
     */
    @RequestMapping("/agree")
    public String agree() {

        return "loan/agreePayor";
    }

    /**
     *  대출 신청 페이지
     */
    @RequestMapping(value = "/apply", method = RequestMethod.GET)
    public String apply(HttpSession session, Model model) throws IOException, JSONException{

    	LoginVO loginVO = (LoginVO) session.getAttribute("login");
    	
    	String id = loginVO.getId();
    	
    	HashMap<String, String> params = new HashMap<>();
    	
    	params.put("id", id);
    	params.put("type","BTC");
    	
    	model.addAttribute("money", loanInvestorService.getMoney(params));
    	model.addAttribute("currentPrice", loanInvestorService.currentPrice("BTC"));
    	
    	return "loan/applyPayor";
    }
    /*
     * 담보 투자 신청하기 -> select Box 코인 타입 변경 시 호출되어, DB에서 해당 회원의 보유 코인 반환
     */
    @RequestMapping(value = "/getMoney", produces = "application/json; charset=utf8", method = RequestMethod.POST)
    @ResponseBody
    public HashMap<String,Object> getMoney(@RequestBody String data, HttpSession session) throws IOException, JSONException{
    	
    	LoginVO loginVO = (LoginVO)session.getAttribute("login");
    	
    	String id = loginVO.getId();
    	HashMap<String, String> param = new HashMap<>();
    	param.put("id", id);
    	param.put("type", data);
    	HashMap<String,Object> params = new HashMap<>();
    	params.put("money", loanInvestorService.getMoney(param));
    	params.put("currentPrice", loanInvestorService.currentPrice(param.get("type")));
    	
		return params;
    }
    
    /**
     * 담보 투자 결제정보 모달
     * @return
     */
    @RequestMapping(value="/payModal", produces="application/json; charset=utf8", method = RequestMethod.POST)
    @ResponseBody
    public String paymentInfoModal(@RequestBody int productNo, HttpSession session) throws IOException, JSONException{

    	LoginVO loginVO = (LoginVO) session.getAttribute("login");
    	
    	String id = loginVO.getId();
    	HashMap<String,String> params = new HashMap<>();
    	params.put("id",id);
    	params.put("type","BTC");
    	
    	JSONObject jsonObject = new JSONObject();
    	jsonObject.put("list", loanInvestorService.investorInvestInfo(productNo));
    	jsonObject.put("btc", loanInvestorService.getMoney(params));
    	jsonObject.put("currentPrice", loanInvestorService.currentPrice("BTC"));
        
		return jsonObject.toString();
    }
    /**
     * 담보 투자 결제정보 모달정보를 뿌려준후 투자신청 받기
     * @return
     */
    @RequestMapping(value="/payorApply", produces="application/json; charset=utf8", method = RequestMethod.POST)
    @ResponseBody
    public String ModalToPay(@RequestBody Map<String, String> params){
    	
    	JSONObject jsonObject = new JSONObject();
    	
    	jsonObject.put("state", loanPayorService.payorApply(params));


        /**
         * 체결이 된 경우를 여기서 코딩해야할듯.
         */

        return jsonObject.toString();
    }
    
    
    @RequestMapping(value = "/apply", produces = "application/json; charset=utf8", method = RequestMethod.POST)
    @ResponseBody
    public String apply(@RequestBody Map<String,String> params, HttpSession session) throws IOException, JSONException{
    	URLJsonReader jsRead = new URLJsonReader();
		JSONObject priceJson = jsRead.readJsonFromUrl("https://api.bithumb.com/public/ticker/"+params.get("coin_type"));
		int price = Integer.parseInt((String) priceJson.get("closing_price"));
		String closingPrice = String.valueOf(Math.floor(price * 0.6 / 10000) * 10000);
		
    	params.put("coin_type", coinService.getCoinCode(params.get("coin_type")));
    	params.put("closingPrice", closingPrice);
    	LoginVO loginVO = (LoginVO)session.getAttribute("login");
    	
    	String id = loginVO.getId();
    	
    	JSONObject jsonObject = new JSONObject();


        if(loanPayorService.payorLoanApply(params, id) > 0) {
        	jsonObject.put("state", "success");
        }else {
        	jsonObject.put("state", "fail");
        }
        
		return jsonObject.toString();
    }

    /**
     *  주문 및 거래내역 페이지
     */
    @RequestMapping("/history")
    public String orderHistory() {

        return "loan/orderHistoryPayor";
    }
    
    /**
     * 담보 대출 취소 처리
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
    	
    	jsonObject.put("state", loanPayorService.cancel(params));
        
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

    	List<HashMap<String, String>> resultList = loanPayorService.payorLoanWaitList(params);
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

        List<HashMap<String, String>> resultList = loanPayorService.payorLoanProgressList(params);
        resultList.forEach(n -> n.compute("state", (s, s2) -> StateInfo.valueOf(s2).getMessage()));

        return resultList;
    }
    
    /**
     * DB가 보유한 거래 호출
     * @return
     */

    @ModelAttribute("investList")
    private List<InvestVO> getProductList(HttpSession session){

    	LoginVO loginVO = (LoginVO) session.getAttribute("login");
    	String id = loginVO.getId();
    	
        return loanPayorService.investorInvestList(id);
    }
    
}
