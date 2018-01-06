package bit.dao;

import bit.vo.FundInvestorVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FundDAO {

    private final String NAMESPACE = "bit.dao.FundDAO";

    @Autowired
    private SqlSessionTemplate session;


    public int insertFundInvestor(FundInvestorVO fundInvestorVO){

        return session.insert(NAMESPACE + ".insertFundInvestor", fundInvestorVO);
    }
}


