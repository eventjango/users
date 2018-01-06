package bit.dao;


import bit.vo.*;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class LoanDAO {

    private final String NAMESPACE = "bit.dao.LoanDAO";

    @Autowired
    private SqlSessionTemplate session;
    
    public int payorLoanApply(Map<String, Float> params) {
		// TODO Auto-generated method stub
		return session.insert(NAMESPACE + ".payorLoanApply", params);
	}
    
    public int payorLoanApplySubMoney(Map<String, Float> params) {
		// TODO Auto-generated method stub
		return session.insert(NAMESPACE + ".payorLoanApplySubMoney", params);
	}

    public List<ProductVO> selectProductList(String id){
        return session.selectList(NAMESPACE + ".selectProductList",id);
    }

    public List<ProductVO> selectFilteredProductList(Map<String, String> params){
    	return session.selectList(NAMESPACE + ".selectFilteredProductList", params);
	}
    
    public List<InvestVO> selectInvestList(String id){
        return session.selectList(NAMESPACE + ".selectInvestList",id);
    }

    public List<InvestVO> selectFilteredInvestList(Map<String, String> params){
		return session.selectList(NAMESPACE + ".selectFilteredInvestList", params);
	}

	public List<ProductVO> payorProductInfo(int productNo) {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE + ".selectProductInfo", productNo);
	}

	public int insertInvestor(InvestorVO investorVO){

        return session.insert(NAMESPACE + ".insertInvestor", investorVO);
    }
	
	public int insertInvestorUp(InvestorVO investorVO){

        return session.insert(NAMESPACE + ".insertInvestorUp", investorVO);
    }
	
	public int insertPayor(PayorVO payorVO){

        return session.insert(NAMESPACE + ".insertPayor", payorVO);
    }
	
	public int insertPayorUp(PayorVO payorVO){

        return session.insert(NAMESPACE + ".insertPayorUp", payorVO);
    }

	/**
	 *  담보론 투자 리스트 - > 투자
	 */
	public int investApply(Map<String, String> params) {
		// TODO Auto-generated method stub
		return session.update(NAMESPACE + ".investApply", params);
	}
	
	public int investApplyState(Map<String, String> params) {
		// TODO Auto-generated method stub
		return session.update(NAMESPACE + ".investApplyState", params);
	}
	
	public int investApplySubAmount(Map<String, String> params) {
		// TODO Auto-generated method stub
		return session.update(NAMESPACE + ".investApplySubAmount", params);
	}
	
	public int investApplySubMoney(Map<String, String> params) {
		// TODO Auto-generated method stub
		return session.update(NAMESPACE + ".investApplySubMoney", params);
	}
	
	public int investApplyAddMoney(Map<String, String> params) {
		// TODO Auto-generated method stub
		return session.update(NAMESPACE + ".investApplyAddMoney", params);
	}

	public int investTransaction(Map<String, String> params){
		return session.insert(NAMESPACE + ".investTransaction", params);
	}

	public List<HashMap<String, String>> payorLoanWaitList(HashMap<String, String> params) {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE +".payorLoanWaitList",params);
	}
	
	public List<HashMap<String, String>> payorLoanProgressList(HashMap<String, String> params) {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE +".payorLoanProgressList",params);
	}

	public int investCancel(HashMap<String, String> params) {
		// TODO Auto-generated method stub
		return session.update(NAMESPACE + ".investCancel",params);
	}

	public List<HashMap<String, String>> investorLoanWaitList(HashMap<String, String> params) {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE + ".investorLoanWaitList", params);
	}
	
	public List<HashMap<String, String>> investorLoanProgressList(HashMap<String, String> params) {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE + ".investorLoanProgressList", params);
	}

	public String getMoney(HashMap<String,String> params) {
		// TODO Auto-generated method stub
		return session.selectOne(NAMESPACE + ".getMoney", params);
	}

	public int investLoanApply(Map<String, Float> newParams) {
		// TODO Auto-generated method stub
		return session.insert(NAMESPACE + ".investLoanApply", newParams);
	}
	
	public int investLoanApplySubMoney(Map<String, Float> newParams) {
		// TODO Auto-generated method stub
		return session.insert(NAMESPACE + ".investLoanApplySubMoney", newParams);
	}

	public List<InvestVO> investorInvestInfo(int productNo) {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE + ".selectInvestInfo", productNo);
	}

	public int productBalance(Map<String, Float> params) {
		// TODO Auto-generated method stub
		return session.insert(NAMESPACE + ".productBalance", params);
	}

	public int investBalance(Map<String, Float> params) {
		// TODO Auto-generated method stub
		return session.insert(NAMESPACE + ".investBalance", params);
	}

	public void payorApply(Map<String, String> params) {
		// TODO Auto-generated method stub
		session.insert(NAMESPACE + ".payorApply", params);
	}
	
	public void payorApplyState(Map<String, String> params) {
		// TODO Auto-generated method stub
		session.update(NAMESPACE + ".payorApplyState", params);
	}
	
	public void payorApplySubCoin(Map<String, String> params) {
		// TODO Auto-generated method stub
		session.update(NAMESPACE + ".payorApplySubCoin", params);
	}
	
	public void payorApplyAddCoin(Map<String, String> params) {
		// TODO Auto-generated method stub
		session.update(NAMESPACE + ".payorApplyAddCoin", params);
	}
	
	public void payorApplyAddMoney(Map<String, String> params) {
		// TODO Auto-generated method stub
		session.update(NAMESPACE + ".payorApplyAddMoney", params);
	}
	
	public void payorApplySubMoney(Map<String, String> params) {
		// TODO Auto-generated method stub
		session.update(NAMESPACE + ".payorApplySubMoney", params);
	}

	public int payorTransaction(Map<String, String> params) {
		// TODO Auto-generated method stub
		return session.insert(NAMESPACE + ".payorTransaction", params);
	}

	/**
	 * 모집금액 대비 현재투자금액의 양의 비교 (남은 모집금액값을 리턴합니다)
	 * @param params
	 * @return
	 */
	public int isProductAmountFull(Map<String, String> params){

		return session.selectOne(NAMESPACE + ".isProductAmountFull", params);
	}

	/**
	 * 해당 번호 상품을 use-false
	 * @param params
	 * @return
	 */

	public int updateProductForInvalid(Map<String, String> params){

		return session.update(NAMESPACE + ".updateProductForInvalid", params);
	}
	
	public int getProductRestAmount(Map<String,String> params) {
		return session.selectOne(NAMESPACE + ".getProductRestAmount", params);
	}
	
	public int updateInvestForInvalid(Map<String, String> params){

		return session.update(NAMESPACE + ".updateInvestForInvalid", params);
	}
	
	public int getInvestRestAmount(Map<String,String> params) {
		return session.selectOne(NAMESPACE + ".getInvestRestAmount", params);
	}

	/**
	 * 체결된 상품에 대한 정보
	 * @param productNo
	 * @return
	 */
	public List<Map<String, Object>> selectProductConclusion(int productNo){
		return session.selectList(NAMESPACE + ".selectProductConclusion", productNo);
	}

	public List<Map<String, String>> selectProductConclusionList(int productNo){
		return session.selectList(NAMESPACE + ".selectProductConclusionList", productNo);
	}


	/**
	 *  체결된 투자 리스트
	 * @param investNo
	 * @return
	 */
	public List<Map<String, String>> selectInvestConclusionList(int investNo){
		return session.selectList(NAMESPACE + ".selectInvestConclusionList", investNo);
	}

	/**
	 * 체결된 상품을 product conclusion 에 등록
	 * @param productConclusionVO
	 * @return
	 */
	public int insertProductConclusion(ProductConclusionVO productConclusionVO){
		return session.insert(NAMESPACE + ".insertProductConclusion", productConclusionVO);
	}

	/**
	 * 체결된 투자상품을 invest conclusion 에 등록
	 * @param investConclusionVO
	 * @return
	 */
	public int insertInvestConclusion(InvestConclusionVO investConclusionVO){
		return session.insert(NAMESPACE + ".insertInvestConclusion", investConclusionVO);
	}

	public int payorCancel(HashMap<String, String> params) {
		// TODO Auto-generated method stub
		return session.update(NAMESPACE + ".payorCancel",params);
	}


	/**
	 * 해당 상품에 대한 주문건을 지워준다
	 * @param productNo
	 * @return
	 */
	public int deleteOrderByProductNo(String productNo){
		return session.delete(NAMESPACE + ".deleteOrderByProductNo", productNo);
	}

	/**
	 * 해당 투자에 대한 주문건을 지워준다
	 * @param result
	 * @return
	 */
	public int deleteOrderByInvestNo(String investNo){
		return session.delete(NAMESPACE + ".deleteOrderByInvestNo", investNo);
	}

	public int insertCurrentPrice(HashMap<String, Object> result) {
		// TODO Auto-generated method stub
		return session.insert(NAMESPACE + ".insertCurrentPrice", result);
	}
}