package bit.service.interfaces;

import bit.vo.InvestVO;
import bit.vo.ProductVO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface LoanPayor {

	int addConclusion(Map<String, String> params);

	int payorLoanApply(Map<String, String> params, String id);
	
	List<ProductVO> payorProductList(String id);

	List<ProductVO> payorProductListByFilter(Map<String, String> params);

	List<ProductVO>  payorProductInfo(int productNo);

	List<InvestVO> investorInvestList(String id);

	List<InvestVO> investorInvestListByFilter(Map<String, String> params);

	boolean payorApply(Map<String, String> params);
	
	List<HashMap<String, String>> payorLoanWaitList(HashMap<String, String> params);
	
	List<HashMap<String, String>> payorLoanProgressList(HashMap<String, String> params);

	boolean cancel(HashMap<String, String> params);

}
