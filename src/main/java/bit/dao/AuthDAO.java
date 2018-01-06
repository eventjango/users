package bit.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sun.mail.imap.protocol.Namespaces.Namespace;

@Repository
public class AuthDAO {
	@Autowired
    private SqlSessionTemplate session;
	
	private final String NAMESPACE = "bit.dao.AuthDAO";

	public String getToken(HashMap<String, String> params) {
		// TODO Auto-generated method stub
		return session.selectOne(NAMESPACE + ".getToken",params);
	}
	
	public int insertToken(HashMap<String,String> params) {
		return session.insert(NAMESPACE + ".insertToken",params);
	}
	
	public int updateToken(HashMap<String, String> params) {
		// TODO Auto-generated method stub
		return session.update(NAMESPACE + ".updateToken",params);
	}

	public boolean getEmailConfirm(HashMap<String, String> params) {
		// TODO Auto-generated method stub
		return session.selectOne(NAMESPACE + ".getEmailConfirm",params);
	}

	public int updateEmailConfirm(HashMap<String, String> params) {
		// TODO Auto-generated method stub
		return session.update(NAMESPACE + ".updateEmailConfirm",params);
	}

	public boolean getOTPConfirm(HashMap<String, String> params) {
		// TODO Auto-generated method stub
		return session.selectOne(NAMESPACE + ".getOTPConfirm", params);
	}

	public int insertOTP(HashMap<String, String> params) {
		// TODO Auto-generated method stub
		return session.insert(NAMESPACE + ".insertOTP",params);
	}

	public int updateOTP(HashMap<String, String> param) {
		// TODO Auto-generated method stub
		return session.update(NAMESPACE + ".updateOTP",param);
	}

	public String getEncodeKey(String id) {
		// TODO Auto-generated method stub
		return session.selectOne(NAMESPACE + ".getEncodeKey", id);
	}


}
