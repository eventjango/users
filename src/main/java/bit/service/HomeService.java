package bit.service;


import java.util.List;
import java.util.Objects;

import bit.vo.InvestVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.dao.HomeDAO;
import bit.service.interfaces.Home;
import bit.vo.ProductVO;

@Service
public class HomeService implements Home{

    @Autowired
    private HomeDAO homeDAO;

	public List<ProductVO> payorProductList(){

        List<ProductVO> resultList = homeDAO.selectProductList();
        resultList.removeIf(n -> Objects.isNull(n));
        
        return resultList;
    }

    public List<InvestVO> investList(){

	    List<InvestVO> resultList = homeDAO.selectInvestList();
	    resultList.removeIf(n -> Objects.isNull(n));

	    return resultList;
    }
}
