package bit.service;

import bit.dao.AdminDAO;
import bit.dao.AuthDAO;
import bit.service.interfaces.Admin;
import bit.service.interfaces.Auth;
import bit.vo.NewsVO;
import bit.vo.NoticeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;

@Service
public class AuthService implements Auth {

    @Autowired
    private AuthDAO authDAO;

	@Override
	@Transactional(rollbackFor=Exception.class)
	public boolean getToken(HashMap<String, String> params) {

		boolean result = false;
		if(authDAO.getToken(params) != null) {
			if(authDAO.getToken(params).equals(params.get("token"))) {
				if(authDAO.updateEmailConfirm(params) > 0) {
					result = true;
				}
			}
		}
		
		return result;
	}
	@Override
	@Transactional(rollbackFor=Exception.class)
	public boolean tokenCheck(HashMap<String,String> params) {
		
		boolean result = false;
		if(authDAO.getToken(params) != null) {
			result = true;
		}
		return result;
	}
	
	@Override
	@Transactional(rollbackFor=Exception.class)
	public boolean updateToken(HashMap<String, String> params) {

		boolean result = false;
		if(authDAO.updateToken(params) > 0) {
			result = true;
		}
		
		return result;
	}
	@Override
	@Transactional(rollbackFor=Exception.class)
	public boolean getEmailConfirm(HashMap<String, String> params) {

		boolean result = false;
		if(authDAO.getEmailConfirm(params)) {
			result = true;
		}
		
		return result;
	}
	@Override
	@Transactional(rollbackFor=Exception.class)
	public boolean sendMail(HashMap<String, String> params) {

		boolean result = false;
		
		if(authDAO.getToken(params) == null) {
          if(authDAO.insertToken(params) > 0) {
        	  result = true;
          }
		}else {
			if(authDAO.updateToken(params) > 0) {
				result = true;
			}
		}
		
		return result;
	}
	@Override
	@Transactional(rollbackFor=Exception.class)
	public boolean getOTPConfirm(HashMap<String, String> params) {

		boolean result = false;
		if(authDAO.getOTPConfirm(params)) {
			result = true;
		}
		
		return result;
	}
	@Override
	@Transactional(rollbackFor=Exception.class)
	public boolean insertOTP(HashMap<String, String> params) {
		// TODO Auto-generated method stub
		boolean result = false;
		
		if(authDAO.insertOTP(params) > 0) {
			result = true;
		}
		
		return result;
	}
	@Override
	@Transactional(rollbackFor=Exception.class)
	public boolean updateOTP(HashMap<String, String> param) {
		// TODO Auto-generated method stub
        boolean result = false;
		
		if(authDAO.updateOTP(param) > 0) {
			result = true;
		}
		
		return result;
	}
	@Override
	@Transactional(rollbackFor=Exception.class)
	public String getEncodeKey(String id) {
		// TODO Auto-generated method stub
		return authDAO.getEncodeKey(id);
	}
}
