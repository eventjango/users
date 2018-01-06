package bit.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import bit.service.interfaces.LoanInvestor;
import bit.service.interfaces.Withdraw;
import bit.vo.LoginVO;
import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/withdraw/type/")
public class WithdrawController {
	
	@Autowired
    private LoanInvestor loanPutService;
	@Autowired
    private Withdraw withdrawService;

    /**
     * 출금 - 원화
     * @return
     */
    @RequestMapping("/KRW")
    public String krw(HttpSession session, Model model){

    	LoginVO loginVO = (LoginVO) session.getAttribute("login");
    	String id = loginVO.getId();
    	HashMap<String,String> params = new HashMap<>();
    	params.put("id", id);
    	params.put("type", "KRW");
    	model.addAttribute("balanceKRW",  loanPutService.getMoney(params));
    	model.addAttribute("Myaddress",withdrawService.getAddress(params));
    	
    	
        return "withdraw/krw";
    }
    
    /**
     * 출금 - 비트코인
     * @return
     */
    @RequestMapping("/BTC")
    public String btc(HttpSession session, Model model){
    	
    	LoginVO loginVO = (LoginVO) session.getAttribute("login");
    	String id = loginVO.getId();
    	HashMap<String,String> params = new HashMap<>();
    	params.put("id", id);
    	params.put("type", "BTC");
    	
    	model.addAttribute("balanceBTC",  loanPutService.getMoney(params));

        return "withdraw/btc";
    }
    
    /**
     * 출금 - 이더리움
     * @return
     */
    @RequestMapping("/ETH")
    public String eth(HttpSession session, Model model){
    	
    	LoginVO loginVO = (LoginVO) session.getAttribute("login");
    	String id = loginVO.getId();
    	
    	HashMap<String,String> params = new HashMap<>();
    	params.put("id", id);
    	params.put("type", "ETH");
    	
    	
    	model.addAttribute("balanceETH",  loanPutService.getMoney(params));

        return "withdraw/eth";
    }
    
    /**
     * 출금 - 큐텀
     * @return
     */
    @RequestMapping("/Qtum")
    public String qTum(HttpSession session, Model model){
    	
    	LoginVO loginVO = (LoginVO) session.getAttribute("login");
    	String id = loginVO.getId();
    	
    	HashMap<String,String> params = new HashMap<>();
    	params.put("id", id);
    	params.put("type", "Qtum");
    	
    	model.addAttribute("balanceQtum",  loanPutService.getMoney(params));

        return "withdraw/qTum";
    }
    
    /**
     * 출금 - 리플
     * @return
     */
    @RequestMapping("/XRP")
    public String xrp(HttpSession session, Model model){
    	
    	LoginVO loginVO = (LoginVO) session.getAttribute("login");
    	String id = loginVO.getId();
    	
    	HashMap<String,String> params = new HashMap<>();
    	params.put("id", id);
    	params.put("type", "XRP");
    	
    	model.addAttribute("balanceXRP",  loanPutService.getMoney(params));

        return "withdraw/xrp";
    }

    /**
     * 출금 - 라이트코인
     * @return
     */
    @RequestMapping("/LTC")
    public String ltc(HttpSession session, Model model){
    	
    	LoginVO loginVO = (LoginVO) session.getAttribute("login");
    	String id = loginVO.getId();
    	
    	HashMap<String,String> params = new HashMap<>();
    	params.put("id", id);
    	params.put("type", "LTC");
    	
    	model.addAttribute("balanceLTC",  loanPutService.getMoney(params));

        return "withdraw/ltc";
    }

    /**
     * 출금 - 비트코인 캐시
     * @return
     */
    @RequestMapping("/BCH")
    public String bch(HttpSession session, Model model){
    	
    	LoginVO loginVO = (LoginVO) session.getAttribute("login");
    	String id = loginVO.getId();
    	
    	HashMap<String,String> params = new HashMap<>();
    	params.put("id", id);
    	params.put("type", "BCH");
    	
    	model.addAttribute("balanceBCH",  loanPutService.getMoney(params));
    	model.addAttribute("Myaddress",withdrawService.getAddress(params));

        return "withdraw/bch";
    }
    
    /**
     * 출금 Ajax
     */
    
    @RequestMapping(value="/send", produces="application/json; charset=utf8", method = RequestMethod.POST)
    @ResponseBody
    public String withdrawKRW(@RequestBody HashMap<String, String> params){

    	JSONObject jsonObject = new JSONObject();
    	jsonObject.put("state", withdrawService.withdrawApply(params));
    	
    	return jsonObject.toString();
    }
    
    /**
     * 주소록 가져오기
     */
    @RequestMapping(value="/address", produces="application/json; charset=utf8", method = RequestMethod.POST)
    @ResponseBody
    public String getaddress(HttpSession session,@RequestBody String param){
    	
    	JSONObject jsonObject = new JSONObject();
    	LoginVO loginVO = (LoginVO) session.getAttribute("login");
    	
    	String id = loginVO.getId();
    	
    	HashMap<String, String> params = new HashMap<>();
    	
    	params.put("type", param.toLowerCase());
    	
    	params.put("id", id);
    	
        jsonObject.put("list",withdrawService.getAddress(params));
        
        return jsonObject.toString();
    }
    
    /**
     * 주소록 추가
     */
    @RequestMapping(value="/addAddress", produces="application/json; charset=utf8", method = RequestMethod.POST)
    @ResponseBody
    private String addAddress(HttpSession session,@RequestBody HashMap<String, String> params){
    	
    	JSONObject jsonObject = new JSONObject();
    	
    	LoginVO loginVO = (LoginVO) session.getAttribute("login");
    	
    	String id = loginVO.getId();
    	
    	params.put("id", id);
    	
    	if(params.get("name").equals("")) {
    		params.put("name", null);
    	}
    	
    	jsonObject.put("state", withdrawService.addAddress(params));

        return jsonObject.toString();
    }
    
    /**
     * 주소록 삭제
     */
    @RequestMapping(value="/address/remove", produces="application/json; charset=utf8", method = RequestMethod.POST)
    @ResponseBody
    public String removeAddress(HttpSession session,@RequestBody HashMap<String,String> params){
    	
    	JSONObject jsonObject = new JSONObject();
    	
    	LoginVO loginVO = (LoginVO) session.getAttribute("login");
    	
    	String id = loginVO.getId();

    	params.put("id", id);

        jsonObject.put("state",withdrawService.removeAddress(params));

        return jsonObject.toString();
    }
}
