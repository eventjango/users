package bit.service.interfaces;

import bit.vo.InvestVO;
import bit.vo.ProductVO;

import java.util.List;

public interface Home {
	
	List<ProductVO> payorProductList();

	List<InvestVO> investList();

}
