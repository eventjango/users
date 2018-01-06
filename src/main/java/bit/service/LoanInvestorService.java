package bit.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import bit.dao.LoanDAO;
import bit.dao.UserDAO;
import bit.objects.StateInfo;
import bit.service.interfaces.LoanInvestor;
import bit.utils.URLJsonReader;
import bit.vo.InvestVO;
import bit.vo.InvestorVO;
import bit.vo.PayorVO;
import bit.vo.ProductConclusionVO;

@Service
@Transactional
public class LoanInvestorService implements LoanInvestor{

    @Autowired
    private MessageSource messageSource;

    @Autowired
    private LoanDAO loanDAO;

    @Autowired
    private UserDAO userDAO;


	@Override
    @Transactional(rollbackFor = Exception.class)
    public int addInvestor(InvestorVO investorVO) {

    	investorVO.setPersonalCode(investorVO.getBeforePersonalCode() + "-" + investorVO.getAfterPersonalCode());

        int result = loanDAO.insertInvestor(investorVO) * loanDAO.insertInvestorUp(investorVO);

        if(result < 1) throw new EmptyResultDataAccessException(messageSource.getMessage("database.emptyResult.notInsert", new Object[]{0}, Locale.KOREA), 0);

        return result;
    }
    
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int addPayor(PayorVO payorVO) {

    	payorVO.setPersonalCode(payorVO.getBeforePersonalCode() + "-" + payorVO.getAfterPersonalCode());

        int result = loanDAO.insertPayor(payorVO) * loanDAO.insertPayorUp(payorVO);

        if(result < 1) throw new EmptyResultDataAccessException(messageSource.getMessage("database.emptyResult.notInsert", new Object[]{0}, Locale.KOREA), 0);

        return result;
    }
    
    @Override
	@Transactional(rollbackFor = Exception.class)
	public boolean investApply(Map<String, String> params) {
		// TODO Auto-generated method stub
		boolean result = false;

		/**
		 * selectkey 값을 바인딩하기 위해 order_no 키를 만든다. 기본값은 0
		 * 만들어진 주문키 값으로 tx_product_order_info 에 로그를 쌓는다.
		 */
		params.put("order_no", "0");

		loanDAO.investApply(params);
		loanDAO.investApplyState(params);
		loanDAO.investApplySubAmount(params);
		loanDAO.investApplySubMoney(params);
		loanDAO.investApplyAddMoney(params);

		if(loanDAO.investTransaction(params) > 0){
			result = true;
		}


		/**
		 * . 상품 체결.
		 */
		if(loanDAO.getProductRestAmount(params) == 0) {

			try{

				/**
				 * . 해당 상품의 use-flag false 시킴.
				 */
				loanDAO.updateProductForInvalid(params);


				/**
				 * . 체결된 상품을 conclusion에 등록
				 */

				List<Map<String, String>> conclusionList
						= loanDAO.selectProductConclusionList(Integer.parseInt(params.get("number")));

				conclusionList
						.stream()
						.forEach(n -> {
							addConclusion(n);
						});

				/**
				 * . 체결된 상품을 상환을 다루는 테이블에도 등록해야 합니다.
				 * . addRepayment에서 구현.
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
	public int addConclusion(Map<String, String> param) {

		ProductConclusionVO productConclusionVO = new ProductConclusionVO();
		productConclusionVO.setProductNo(String.valueOf(param.get("productNo")));
		productConclusionVO.setAmount(String.valueOf(param.get("amount")));
		productConclusionVO.setInvestorId(param.get("investorId"));
		productConclusionVO.setOrderState(String.valueOf(StateInfo.LOAN_COMPLETE.getCode()));

		return loanDAO.insertProductConclusion(productConclusionVO);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int addRepayment(Map<String, String> params) {
		/**
		 * . 구현해야 함.
		 */
		return 0;
	}


	@Override
	public List<HashMap<String, String>> investorLoanWaitList(HashMap<String, String> params) {
		// TODO Auto-generated method stub
		return loanDAO.investorLoanWaitList(params);
	}
	@Override
	public List<HashMap<String, String>> investorLoanProgressList(HashMap<String, String> params) {
		// TODO Auto-generated method stub
		return loanDAO.investorLoanProgressList(params);
	}

	@Override
	public boolean cancel(HashMap<String, String> params) {
		// TODO Auto-generated method stub
		boolean result = false;
		if(loanDAO.investCancel(params)>0) {
			result = true;
		}
		return result;
	}
	
	@Override
	@Transactional(rollbackFor = Exception.class)
	public String getMoney(HashMap<String, String> params) {
		// TODO Auto-generated method stub
        String value = loanDAO.getMoney(params);
        if(value == null) {
        	return "0";
        }else {
        	return loanDAO.getMoney(params);
        }
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public boolean investLoanApply(HashMap<String, String> params, String id) {
		
		boolean result = false;
		params.put("userCode", String.valueOf(userDAO.getUserNo(id)));
		
		Map<String,Float> newParams = params.entrySet().stream().collect(Collectors.toMap(Map.Entry::getKey, e -> Float.valueOf((String) e.getValue())));
		if(loanDAO.investLoanApply(newParams) * loanDAO.investLoanApplySubMoney(newParams) > 0 ) {
			if(loanDAO.investBalance(newParams)>0) {
				result = true;
			}
		}
		
		return result;
	}

	@Override
	public List<InvestVO> investorInvestInfo(int productNo) {
		List<InvestVO> resultList = loanDAO.investorInvestInfo(productNo);
		
		resultList.removeIf(n -> Objects.isNull(n));

		return resultList;
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int currentPrice(String coinType) throws IOException, JSONException{
		// TODO Auto-generated method stub
		URLJsonReader jsRead = new URLJsonReader();
		JSONObject jsonObject = jsRead.readJsonFromUrl("https://api.bithumb.com/public/ticker/" + coinType);

		int price = Integer.parseInt((String) jsonObject.get("closing_price"));
		int closingPrice = (int) Math.floor(price * 0.6 / 10000) * 10000;

		HashMap<String, Object> result = new HashMap<>();
		result.put("coinType", coinType);
		result.put("currentPrice", price);
		result.put("closingPrice", closingPrice);
		
		loanDAO.insertCurrentPrice(result);
		
		return price;
	}

}
