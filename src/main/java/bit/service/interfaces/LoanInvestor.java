
package bit.service.interfaces;

import bit.vo.InvestVO;
import bit.vo.InvestorVO;
import bit.vo.PayorVO;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONException;

public interface LoanInvestor {

	int addConclusion(Map<String, String> params);

	int addRepayment(Map<String, String> params);

    int addInvestor(InvestorVO investorVO);
    
    int addPayor(PayorVO payorVO);

	boolean investApply(Map<String, String> params);

	boolean cancel(HashMap<String, String> params);

	String getMoney(HashMap<String,String> params);

	boolean investLoanApply(HashMap<String, String> params, String id);

	List<InvestVO> investorInvestInfo(int productNo);

	List<HashMap<String, String>> investorLoanProgressList(HashMap<String, String> params);

	List<HashMap<String, String>> investorLoanWaitList(HashMap<String, String> params);

	int currentPrice(String string) throws IOException, JSONException;
}
