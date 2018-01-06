package bit.dao;


import bit.vo.InvestVO;
import bit.vo.ProductVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class HomeDAO {

    private final String NAMESPACE = "bit.dao.HomeDAO";

    @Autowired
    private SqlSessionTemplate session;

    public List<ProductVO> selectProductList(){
        return session.selectList(NAMESPACE + ".selectProductList");
    }


    public List<InvestVO> selectInvestList(){
        return session.selectList(NAMESPACE + ".selectInvestList");
    }

}