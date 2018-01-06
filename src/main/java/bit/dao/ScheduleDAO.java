package bit.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bit.vo.CoinVO;

@Repository
public class ScheduleDAO{

    private final String NAMESPACE = "bit.dao.ScheduleDAO";

    @Autowired
    private SqlSessionTemplate session;

	public List<HashMap<String,String>> getProfit(HashMap<String, String> params) {

		return session.selectList(NAMESPACE + ".getProfit", params);
	}
	
	public List<HashMap<String,String>> getLoss(HashMap<String, String> params) {

		return session.selectList(NAMESPACE + ".getLoss", params);
	}
	
	public List<HashMap<String,String>> getProfitList(HashMap<String, String> params) {

		return session.selectList(NAMESPACE + ".getProfitList", params);
	}
	
	public List<HashMap<String,String>> getLossList(HashMap<String, String> params) {

		return session.selectList(NAMESPACE + ".getLossList", params);
	}
}