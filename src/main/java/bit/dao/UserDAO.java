package bit.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bit.vo.UserVO;

@Repository
public class UserDAO{

    private final String NAMESPACE = "bit.dao.UserDAO";

    @Autowired
    private SqlSessionTemplate session;

    @SuppressWarnings("unchecked")
    public UserVO getOne(String name) {
        return session.selectOne(NAMESPACE + ".selectOne", name);
    }

    public String getUserId(String id){
        return session.selectOne(NAMESPACE + ".getUserId", id);
    }

    public int getRowCountByUserId(String id){

        return session.selectOne(NAMESPACE + ".getRowCountByUserId", id);
    }
    
    public int add(HashMap<String, Object> params){
    	return session.insert(NAMESPACE + ".generalSignUp", params);
    }
    
    public int getUserCode(String id) {
    	return session.selectOne(NAMESPACE + ".getUserCode", id);
    }

	public int modifyUserPw(Map<String, String> param) {
		// TODO Auto-generated method stub
		return session.update(NAMESPACE + ".modifyUserPw", param);
	}

	public float getUserNo(String id) {
		// TODO Auto-generated method stub
		return session.selectOne(NAMESPACE + ".getUserNo", id);
	}

	public int sendQuestion(Map<String, String> params) {
		// TODO Auto-generated method stub
		return session.insert(NAMESPACE + ".sendQuestion",params);
	}

	public List<HashMap<String, String>> getQuestion(HashMap<String, String> params) {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE + ".getQuestion", params);
	}
}