package bit.controller;


import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import bit.service.ScheduleService;
import bit.vo.LoginVO;

//@Log
@Controller
@RequestMapping(value="/calendar")
public class ScheduleController {

	@Autowired
	private ScheduleService schedule;
    /**
     * 투자 수익 스케쥴 페이지
     * @return
     */
    @RequestMapping
    public String profit(){

        return "calendar/calendar";
    }
    @RequestMapping(value = "/profit", produces = "application/json; charset=utf-8", method = RequestMethod.POST)
    @ResponseBody
    public String getProfit(@RequestBody String yymm, HttpSession session){
    	JSONObject jsonObject = new JSONObject();
    	LoginVO loginVO = (LoginVO) session.getAttribute("login");
    	
    	HashMap<String, String> params = new HashMap<>();
    	
    	params.put("id", loginVO.getId());
    	params.put("date", yymm + "-%");
    	
    	jsonObject.put("list", schedule.getProfit(params));
    	
    	return jsonObject.toString();
    }
    
    @RequestMapping(value = "/profit/list", produces = "application/json; charset=utf-8", method = RequestMethod.POST)
    @ResponseBody
    public String getProfitList(@RequestBody String yymmdd, HttpSession session){
    	JSONObject jsonObject = new JSONObject();
    	LoginVO loginVO = (LoginVO) session.getAttribute("login");
    	
    	HashMap<String,String> params = new HashMap<>();
    	
    	params.put("id", loginVO.getId());
    	params.put("date", yymmdd);
    	
    	jsonObject.put("list", schedule.getProfitList(params));
    	
    	return jsonObject.toString();
    }
    
    @RequestMapping(value = "/loss", produces = "application/json; charset=utf-8", method = RequestMethod.POST)
    @ResponseBody
    public String getLoss(@RequestBody String yymm, HttpSession session){
    	JSONObject jsonObject = new JSONObject();
    	LoginVO loginVO = (LoginVO) session.getAttribute("login");
    	
    	HashMap<String, String> params = new HashMap<>();
    	
    	params.put("id", loginVO.getId());
    	params.put("date", yymm + "-%");
    	
    	jsonObject.put("list", schedule.getLoss(params));
    	
    	return jsonObject.toString();
    }
    
    @RequestMapping(value = "/loss/list", produces = "application/json; charset=utf-8", method = RequestMethod.POST)
    @ResponseBody
    public String getLossList(@RequestBody String yymmdd, HttpSession session){
    	JSONObject jsonObject = new JSONObject();
    	LoginVO loginVO = (LoginVO) session.getAttribute("login");
    	
    	HashMap<String, String> params = new HashMap<>();
    	
    	params.put("id", loginVO.getId());
    	params.put("date", yymmdd);
    	
    	jsonObject.put("list", schedule.getLossList(params));
    	
    	return jsonObject.toString();
    }
    /**
     * 이자 지출 스케쥴 페이지
     * @return
     */
    /*@RequestMapping("/loss")
    public String loss(){

        return "calendar/loss";
    }*/
    
}
