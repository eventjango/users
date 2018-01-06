package bit.dao;


import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bit.vo.CoinVO;

@Repository
public class CoinDAO{

    private final String NAMESPACE = "bit.dao.CoinDAO";

    @Autowired
    private SqlSessionTemplate session;

    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> getCoinType() {
        return session.selectList(NAMESPACE + ".getCoinType");
    }
    
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> getRCoinType() {
        return session.selectList(NAMESPACE + ".getRCoinType");
    }

	public String getCoinCode(Object cointype) {
		// TODO Auto-generated method stub
		return session.selectOne(NAMESPACE + ".getCoinCode", cointype);
	}
}