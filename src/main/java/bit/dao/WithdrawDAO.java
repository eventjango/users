package bit.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class WithdrawDAO{

    private final String NAMESPACE = "bit.dao.WithdrawDAO";

    @Autowired
    private SqlSessionTemplate session;

	public int withdrawApply(HashMap<String, String> params) {
		// TODO Auto-generated method stub
		return session.insert(NAMESPACE + ".withdrawApply", params);
	}

	public List<Map<String, Object>> getAddress(HashMap<String, String> params) {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE + ".getAddress", params);
	}

	public int addAddress(HashMap<String, String> params) {
		// TODO Auto-generated method stub
		return session.insert(NAMESPACE + ".addAddress", params);
	}

	public int removeAddress(HashMap<String, String> params) {
		// TODO Auto-generated method stub
		return session.delete(NAMESPACE + ".removeAddress", params);
	}
}