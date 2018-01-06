package bit.controller;

import bit.interceptors.LoginInterceptor;
import bit.service.interfaces.Login;
import bit.validator.LoginValidator;
import bit.vo.LoginVO;
import bit.vo.ProductVO;
import lombok.extern.java.Log;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

/**
 * 로그인 처리 컨트롤러
 */
@Log
@Controller
public class LoginController {

    @Autowired
    private LoginValidator validator;

    @Autowired
    private Login loginService;


    /**
     * 로그인을 요구하는 로직
     * @return
     */
    @RequestMapping("/login/required")
    public String required(){

    	
        return "login/required";
    }

    /**
     * 세션이 붙어있으면 홈으로 돌리고 그렇지 않은 경우에 로그인 페이지로 이동.
     * @param loginVO
     * @param session
     * @return
     */
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(@ModelAttribute LoginVO loginVO, HttpSession session, HttpServletRequest request){

    	LoginVO login = (LoginVO) session.getAttribute("login");
    	
    	if(login == null) {
    		if(session.getAttribute("lastURL") == null) {
    			session.setAttribute("lastURL", request.getHeader("referer"));
    		}
    		return "login/login";
    		
    	}else {
    		return "redirect:/home";
    	}
    }

    /**
     * 로그인 처리.
     * @param loginVO
     * @param result
     * @param session
     * @return
     */
    @RequestMapping(value = "/login", produces = "application/json; charset=utf-8", method = RequestMethod.POST)
    @ResponseBody
    public String login(@RequestBody LoginVO loginVO,
                        BindingResult result,
                        HttpSession session){

        JSONObject jsonObject = new JSONObject();
        validator.validate(loginVO, result);

        if(!result.hasErrors() && loginService.login(loginVO)){

            loginVO.setName(loginService.getUserName(loginVO.getId()));
            session.setAttribute("login", loginVO);
            session.setMaxInactiveInterval(-1);

            jsonObject.put("result", "success");
            session.removeAttribute("lastURL");
        }
        else{
            jsonObject.put("result", "fail");
        }

        return jsonObject.toString();
    }

    /**
     * 로그아웃을 처리하고 홈으로 돌립니다.
     * @param session
     * @return
     */
    @RequestMapping(value = "/logout")
    public String logout(HttpSession session){

        if(session.getAttribute("login") != null){
            session.removeAttribute("login");
            session.invalidate();
        }

        return "redirect:/home";
    }

    /**
     * 패스워드 찾기
     * @return
     */
    @RequestMapping(value = "/search/password", method = RequestMethod.GET)
    public String searchPW() {
    	
    	return "login/pw_search";
    }

    /**
     * 패스워드 찾기 처리
     * @param params
     * @return
     */
    @RequestMapping(value = "/search/password", produces = "application/json; charset=utf-8",  method = RequestMethod.POST)
    @ResponseBody
    public String searchPW(@RequestBody HashMap<Object, Object> params) {
    	JSONObject jsonObject = new JSONObject();
    	String value = loginService.searchPw(params); 
    	
        jsonObject.put("state", value);
        
		return jsonObject.toString();
    }
 
}
