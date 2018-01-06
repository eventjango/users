package bit.controller;


import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import bit.service.interfaces.Auth;
import bit.utils.GmailSend;
import bit.vo.LoginVO;
import lombok.extern.java.Log;
import sun.misc.BASE64Encoder;

@Log
@Controller
@RequestMapping
public class AuthController {
    
	@Autowired
	private Auth authService;
	
    /**
     * 이메일 인증
     * @return
     */
    @RequestMapping(value="/auth/mail")
    public String email(@RequestParam String value,HttpSession session,Model model){
    	
    	LoginVO loginVO = (LoginVO) session.getAttribute("login");
    	String id = loginVO.getId();
    	value = value.trim().replace(" ", "+");
    	HashMap<String, String> params = new HashMap<>();
    	params.put("id", id);
    	params.put("token",value);
    	model.addAttribute("state", authService.getToken(params));
    	
        return "/user/authMail";
    }
    
    /**
     * 이메일 인증 버튼 텍스트
     * @return
     */
    @RequestMapping(value="/check/mail", produces = "application/json; charset=utf-8", method = RequestMethod.POST)
    @ResponseBody
    public String emailchk(HttpSession session){
    	JSONObject jsonObject = new JSONObject();
    	LoginVO loginVO = (LoginVO) session.getAttribute("login");
    	String id = loginVO.getId();
    	HashMap<String, String> params = new HashMap<>();
    	params.put("id", id);
    	jsonObject.put("state", authService.getEmailConfirm(params));//user_info 인증여부
    	if(jsonObject.get("state").equals(true)) {
    		jsonObject.put("confirm", authService.tokenCheck(params));//token키 존재 여부(인증 완료/재인증)
    	}
    	
        return jsonObject.toString();
    }
    /**
     * 인증 메일 발송
     * @param session
     * @return
     */
    @RequestMapping(value="/send/mail", produces="application/json; charset=utf8", method=RequestMethod.POST)
    @ResponseBody
    public String sendMail(/*@RequestBody HashMap<String,String> params,*/HttpSession session) {
    	HashMap<String,String> params = new HashMap<>();
		JSONObject jsonObject = new JSONObject();
		
		LoginVO loginVO = (LoginVO) session.getAttribute("login");
		String id = loginVO.getId();
		
		GmailSend gs = new GmailSend();
		BASE64Encoder base64 = new BASE64Encoder();
		
		String token = base64.encode(gs.generateToken().getBytes()).replace(System.getProperty("line.separator"), "");

		String contents = "이메일 인증 : <a href='http://localhost:8090/auth/mail?value="+token+"'>이메일 인증하기</a>";
		gs.GmailSet("smtptest000001@gmail.com","qwe123``",id, "This mail is Bithrone Email Auth",contents);
		params.put("id",id);
		params.put("token", token);
		
		jsonObject.put("state", authService.sendMail(params));//type을 이용해서 if문으로 db에 insert할 지 update 할 지 나뉘는 쿼리 작성
		return jsonObject.toString();
    }
    
    /**
     * OTP 인증 텍스트
     * @param session
     * @return
     */
    @RequestMapping(value="/check/otp", produces = "application/json; charset=utf-8", method = RequestMethod.POST)
    @ResponseBody
    public String otpchk(HttpSession session){
    	JSONObject jsonObject = new JSONObject();
    	LoginVO loginVO = (LoginVO) session.getAttribute("login");
    	String id = loginVO.getId();
    	HashMap<String, String> params = new HashMap<>();
    	params.put("id", id);
    	jsonObject.put("state", authService.getOTPConfirm(params));//user_info 인증여부
    	
        return jsonObject.toString();
    }
}
