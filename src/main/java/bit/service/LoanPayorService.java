package bit.service;


import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

import bit.objects.StateInfo;
import bit.vo.InvestConclusionVO;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import bit.dao.LoanDAO;
import bit.dao.UserDAO;
import bit.service.interfaces.LoanPayor;
import bit.utils.URLJsonReader;
import bit.vo.InvestVO;
import bit.vo.ProductVO;

@Service
@Transactional
public class LoanPayorService implements LoanPayor{

    @Autowired
    private LoanDAO loanDAO;

    @Autowired
    private UserDAO userDAO;


	@Override
    @Transactional(rollbackFor = Exception.class)
    public int payorLoanApply(Map<String, String> params, String id) {
    	params.put("product_no", "0");
    	
    	Map<String,Float> newParams = params.entrySet().stream().collect(Collectors.toMap(Map.Entry::getKey, e -> Float.valueOf((String) e.getValue())));
    	if(newParams.get("own_vx") < newParams.get("coinAmount") || newParams.get("coinAmount") <= 0 ||
    			/*newParams.get("wantAmount") != newParams.get("closingPrice") ||*/ newParams.get("interestRate") <= 0 ||
    			newParams.get("wantPeriod") <= 0) {
    		return -1;
    	}else {
    		if(id.equals("") || id.equals(null)) {
    			return -1;
    		}else {
    			newParams.put("userCode", userDAO.getUserNo(id));
    			newParams.put("wantAmount", newParams.get("closingPrice") * newParams.get("coinAmount"));
    			int result =  loanDAO.payorLoanApply(newParams) * loanDAO.payorLoanApplySubMoney(newParams);
    			if(result > 0 ) {
    				return loanDAO.productBalance(newParams);
    			}else {
    				return 0;
    			}
    		}
    	}
	}

    @Override
    @Transactional(rollbackFor = Exception.class)
	public List<ProductVO> payorProductList(String id){

        List<ProductVO> resultList = loanDAO.selectProductList(id);
        resultList.removeIf(n -> Objects.isNull(n));
        
        return resultList;
    }

	@Override
	@Transactional(rollbackFor = Exception.class)
	public List<ProductVO> payorProductListByFilter(Map<String, String> params) {

		List<ProductVO> resultList = loanDAO.selectFilteredProductList(params);
		resultList.removeIf(n -> Objects.isNull(n));

		return resultList;
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public List<ProductVO> payorProductInfo(int productNo){
		List<ProductVO> resultList = loanDAO.payorProductInfo(productNo);
		resultList.removeIf(n -> Objects.isNull(n));

		return resultList;
	}
	
	@Override
	@Transactional(rollbackFor = Exception.class)
	public List<InvestVO> investorInvestList(String id) {
		
		List<InvestVO> resultList = loanDAO.selectInvestList(id);
        resultList.removeIf(n -> Objects.isNull(n));
        
        return resultList;
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public List<InvestVO> investorInvestListByFilter(Map<String, String> params) {
		return loanDAO.selectFilteredInvestList(params);
	}
	
	@Override
	@Transactional(rollbackFor = Exception.class)
	public List<HashMap<String, String>> payorLoanWaitList(HashMap<String, String> params) {
		// TODO Auto-generated method stub
		return loanDAO.payorLoanWaitList(params);
	}
	
	@Override
	@Transactional(rollbackFor = Exception.class)
	public List<HashMap<String, String>> payorLoanProgressList(HashMap<String, String> params) {
		// TODO Auto-generated method stub
		return loanDAO.payorLoanProgressList(params);
	}
	
	@Override
	@Transactional(rollbackFor = Exception.class)
	public boolean payorApply(Map<String, String> params) {
		// TODO Auto-generated method stub
		boolean result = false;

		/**
		 * selectkey 값을 바인딩하기 위해 order_no 키를 만든다. 기본값은 0
		 */
		params.put("order_no", "0");

		loanDAO.payorApply(params);
		loanDAO.payorApplyState(params);
		loanDAO.payorApplySubCoin(params);
		loanDAO.payorApplyAddCoin(params);
		loanDAO.payorApplyAddMoney(params);
		loanDAO.payorApplySubMoney(params);

		if(loanDAO.payorTransaction(params) > 0){
			result = true;
		}

		/**
		 * . 투자상품 체결.
		 */
		if(loanDAO.getInvestRestAmount(params) == 0) {

			try
			{
				/**
				 * 해당 투자상품의 use-flag false 시킴.
				 */
				loanDAO.updateInvestForInvalid(params);

				/**
				 * 체결된 투자상품을 conclusion 에 등록.
				 */

				List<Map<String, String>> conclusionList = loanDAO.selectInvestConclusionList(Integer.parseInt(params.get("number")));

				conclusionList
						.stream()
						.forEach(n -> addConclusion(n));

				/**
				 * 체결된 상품을 상환을 다루는 테이블에도 등록할 것.
				 */

				//addRepayment(params);

			}
			catch (Exception e){

				/**
				 * .체결 실패시 해당상품에 대한 투자건들을 모두 취소시킨다.
				 */

				loanDAO.deleteOrderByProductNo(params.get("number").toString());

				e.printStackTrace();
				throw new RuntimeException("체결 실패입니다");
			}

		}

		return result;
	}



	@Override
	@Transactional(rollbackFor = Exception.class)
	public int addConclusion(Map<String, String> params) {

		InvestConclusionVO investConclusionVO = new InvestConclusionVO();

		investConclusionVO.setInvestNo(String.valueOf(params.get("investNo")));
		investConclusionVO.setAmount(String.valueOf(params.get("amount")));
		investConclusionVO.setPayorId(params.get("payerId"));
		investConclusionVO.setOrderState(String.valueOf(StateInfo.LOAN_COMPLETE.getCode()));

		return loanDAO.insertInvestConclusion(investConclusionVO);
	}
	
	@Override
	@Transactional(rollbackFor = Exception.class)
	public boolean cancel(HashMap<String, String> params) {
		// TODO Auto-generated method stub
		boolean result = false;
		if(loanDAO.payorCancel(params)>0) {
			result = true;
		}
		return result;
	}

}
