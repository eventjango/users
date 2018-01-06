package bit.service.interfaces;

import java.util.Collection;
import java.util.HashMap;

public interface Auth {

	boolean getToken(HashMap<String, String> params);
	boolean updateToken(HashMap<String, String> params);
	boolean tokenCheck(HashMap<String, String> params);
	boolean getEmailConfirm(HashMap<String, String> params);
	boolean sendMail(HashMap<String, String> params);
	boolean getOTPConfirm(HashMap<String, String> params);
	boolean insertOTP(HashMap<String, String> params);
	boolean updateOTP(HashMap<String, String> param);
	String getEncodeKey(String id);
}
