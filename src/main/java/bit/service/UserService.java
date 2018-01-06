package bit.service;


import bit.dao.UserDAO;
import bit.service.interfaces.User;
import bit.vo.LoginVO;
import bit.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserService implements User{

    @Autowired
    private UserDAO userDAO;

    public UserVO getUserVO(String name){

        return userDAO.getOne(name);
    }

	@Override
	public void checkDuplicatedUser(String id) throws NullPointerException{

    	if(userDAO.getUserId(id) == null) throw new NullPointerException();

	}

	@Override
	public int checkUserId(String id){

        return userDAO.getRowCountByUserId(id);
    }
    
	@Override
    public String add(HashMap<String, Object> params){
    	if(params.get("id").equals(null) || params.get("id").equals("")) {
    		//return "signUp.email.check";
    		return "이메일을 확인해주세요";
    	}else if(params.get("pw").equals(null) || params.get("pw").equals("") ||
    				  params.get("pw").toString().length() < 8 || params.get("pw").toString().matches("[0-9|a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힝]*")) {
    		//return "signUp.pw.check";
    		return "패스워드를 확인해주세요"; 
    	}else if(params.get("name").equals(null) || params.get("name").equals("")) {
    		//return "signUp.name.check";
    		return "이름을 확인해주세요";
    	}else if(params.get("pNum").equals(null) || params.get("pNum").equals("")) {
    		//return "signUp.pNum.check";
    		return "휴대폰 번호를 확인해주세요";
    	}else {
    		params.put("userType", 100);
    		if(userDAO.add(params) > 0 ) {
    			//return "signUp.DB.sucess";
    			return "가입에 성공하였습니다";
    		}else {
    			//return "signUp.DB.fail";
    			return "가입에 실패하였습니다";
    		}
    		
    	}
    }
    
    @Override
    public boolean checkUserPw(Map<String, String> param, LoginVO loginVO) {
    	boolean result = false;
    	
    	if(param.get("pw").equals(loginVO.getPw())) {
    		
    		result = true;
    	}
    	
    	return result;
    }
    
    @Override
    public boolean modifyUserPw(Map<String, String> param) {
    	boolean result = false;
    	
    	if(userDAO.modifyUserPw(param) > 0 ) {
    		result = true;
    	}
    	
    	return result; 
    }
    
    @Override
    public int getUserCode(String id) {
    	return userDAO.getUserCode(id);
    }

	@Override
	public boolean sendQuestion(Map<String, String> params) {
		// TODO Auto-generated method stub
        boolean result = false;
    	
    	if(userDAO.sendQuestion(params) > 0 ) {
    		result = true;
    	}
    	
    	return result; 
	}

	@Override
	public List<HashMap<String, String>> getQuestion(HashMap<String, String> params) {
		// TODO Auto-generated method stub
		return userDAO.getQuestion(params);
	}

}
