package bit.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class ProfitDAO {

    private final String NAMESPACE = "bit.dao.ProfitDAO";

    @Autowired
    private SqlSessionTemplate session;

    public List<Map<String, Object>> myCoinStatus(String userId){
        return session.selectList(NAMESPACE + ".myCoinStatus", userId);
    }

    public Map<String, Object> myInvestingAmount(Map<String, Object> params){
        return session.selectOne(NAMESPACE + ".myInvestingAmount", params);
    }
}
