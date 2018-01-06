package bit.service;

import bit.dao.LoginDAO;
import bit.service.interfaces.Login;
import bit.utils.GmailSend;
import bit.vo.LoginVO;
import sun.misc.BASE64Encoder;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

@Service
public class LoginService implements Login{

    @Autowired
    private LoginDAO loginDAO;


    @Override
    public boolean login(LoginVO loginVO) {

        boolean loginResult = false;

        try {

            if(loginDAO.getUser(loginVO.getId()) == null) throw new EmptyResultDataAccessException(0);

            else {
                loginResult = loginDAO.getUser(loginVO.getId()).equals(loginVO.getPw());
            }
        }

        catch (EmptyResultDataAccessException e){

            loginResult = false;
        }

        return loginResult;
    }
    
    @Override
    public String searchPw(Map<Object, Object> params) {

    	String id = loginDAO.searchPw(params);

    	if(id == null) {
    		id = "id not found";
    		return id;
    	}else {
    		String state = "fail";
    		
    		GmailSend gs = new GmailSend();
    		BASE64Encoder base64 = new BASE64Encoder();
    		
    		String password = base64.encode(gs.generateToken().getBytes()).replace(System.getProperty("line.separator"), "").substring(0,7);

    		String contents = "임시 비밀번호 : ["+password+"]";
    		gs.GmailSet("smtptest000001@gmail.com","qwe123``",id, "This mail is Bithrone Temp Password",contents);
    		HashMap<String,String> user = new HashMap<>();
    		user.put("id", id);
    		user.put("pw",password);
    		if(loginDAO.updatePW(user) > 0) {
    			state = "sucess";
    		}
    		
    		return state;
    	}
    }

    @Override
    public String getUserName(String userId) {
        return loginDAO.getUserName(userId);
    }
}
