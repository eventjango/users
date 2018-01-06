package bit.controller;


import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import bit.objects.CheckResult;
import bit.service.interfaces.Auth;
import bit.service.interfaces.User;
import bit.validator.UserValidator;
import bit.vo.LoginVO;
import bit.vo.UserVO;
import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private User userService;

    @Autowired
    private UserValidator validator;

    @Autowired
    private MessageSource messageSource;
    
    @Autowired
    private Auth authService;


    @SuppressWarnings("finally")
	@RequestMapping(value = "/checkid", method = RequestMethod.GET)
    public @ResponseBody String checkDuplicatedId(@RequestParam(value = "id", required = false) String id){

        JSONObject jsonObject = new JSONObject();
        CheckResult checkResult = new CheckResult();

        try {

            userService.checkDuplicatedUser(id);

            checkResult.setDuplicated(false);
            checkResult.setMessage("false");
        }
        catch (NullPointerException e){

            checkResult.setDuplicated(true);
            checkResult.setMessage("true");
        }

        finally {

            jsonObject.put("message", checkResult.getMessage());
            return jsonObject.toString();
        }

    }


    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String addUser(@ModelAttribute UserVO userVO){

        return "/user/add";
    }


    @RequestMapping(value = "/add", produces="application/json; charset=utf8", method = RequestMethod.POST)
    @ResponseBody
	public String addUser(@RequestBody HashMap<String, Object> params) throws Exception {

    	JSONObject jsonObject = new JSONObject();
        jsonObject.put("message", userService.add(params));
        if(jsonObject.get("message").equals(messageSource.getMessage("signUp.DB.sucess", new Object[]{0}, Locale.KOREA))) {
        	jsonObject.put("state", "success");
        }
        
		return jsonObject.toString();
	}
    
    @RequestMapping(value = "/business", produces="application/json; charset=utf8", method = RequestMethod.POST)
    @ResponseBody
	public String businessSignUp(@RequestBody HashMap<String, Object> params) throws Exception {

        System.out.println(params);

		return "/user/add";
	}
    
    @RequestMapping(value="/modify", method = RequestMethod.GET)
    public String modifyPassword(Model model,HttpSession session) {
    	
    	LoginVO loginVO = (LoginVO) session.getAttribute("login");
    	
    	String id = loginVO.getId();
    	
    	HashMap<String, String> param = new HashMap<>();
    	param.put("id", id);
    	
    	model.addAttribute("state",authService.getOTPConfirm(param));
    	
    	return "/user/mypage";
    }
    
    @RequestMapping(value="/safety")
    public String safetyMyAccount() {
    	
    	return "/user/safety";
    }
    
    @RequestMapping(value="/question")
    public String questionHistory(Model model,HttpSession session) {
    	
    	LoginVO loginVO = (LoginVO) session.getAttribute("login");
    	
    	String id = loginVO.getId();
    	
    	HashMap<String, String> params = new HashMap<>();
    	params.put("id", id);
    	
    	model.addAttribute("list", userService.getQuestion(params));
    	
    	return "/user/questionHistory";
    }
    
    @RequestMapping(value="/question/cs")
    public String question() {
    	
    	return "/user/question";
    }
    
    @RequestMapping(value="/checkPw")
    @ResponseBody
    public String checkPassword(@RequestBody Map<String,String> param, HttpSession session) {
    	
    	JSONObject jsonObject = new JSONObject();
    	
    	LoginVO loginVO = (LoginVO)session.getAttribute("login");
    	
    	if(loginVO == null){
    		jsonObject.put("state", "noSession");
    	}else {
    		jsonObject.put("state", userService.checkUserPw(param, loginVO));
    	}
    	
    	return jsonObject.toString(); 
    }
    
    @RequestMapping(value="/modify", produces="application/json; charset=utf8", method = RequestMethod.POST)
    @ResponseBody
    public String modifyPasswordDB(@RequestBody Map<String,String> param, HttpSession session) {
    	
    	JSONObject jsonObject = new JSONObject();
    	
    	LoginVO loginVO = (LoginVO)session.getAttribute("login"); 
    	
    	param.put("id", loginVO.getId());
    	
    	jsonObject.put("state", userService.modifyUserPw(param));
    	
    	return jsonObject.toString(); 
    }
    
    @RequestMapping(value="/question/send", produces="application/json; charset=utf8", method = RequestMethod.POST)
    @ResponseBody
    public String sendQuestion(@RequestBody Map<String,String> params, HttpSession session) {
    	
    	JSONObject jsonObject = new JSONObject();
    	
    	LoginVO loginVO = (LoginVO)session.getAttribute("login"); 
    	
    	params.put("id", loginVO.getId());
    	
    	jsonObject.put("state", userService.sendQuestion(params));
    	
    	return jsonObject.toString(); 
    }

}
