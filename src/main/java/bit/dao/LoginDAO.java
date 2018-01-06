package bit.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.Map;

@Repository
public class LoginDAO {

    private final String NAMESPACE = "bit.dao.LoginDAO";

    @Autowired
    private SqlSessionTemplate session;

    public String getUser(String loginId){

        return session.selectOne(NAMESPACE  + ".selectUser", loginId);
    }

    public String getUserName(String userId){
        return session.selectOne(NAMESPACE  + ".selectUserName", userId);
    }

	public String searchPw(Map<Object, Object> params) {
		// TODO Auto-generated method stub
		return session.selectOne(NAMESPACE + ".searchPw", params);
	}

	public Map<String, Integer> selectUserState(String userId){
        return  session.selectMap(NAMESPACE + ".selectUserState", userId);
    }

	public int updatePW(HashMap<String, String> user) {
		// TODO Auto-generated method stub
		return session.update(NAMESPACE + ".updatePW",user);
	}
}
