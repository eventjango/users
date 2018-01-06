package bit.service.interfaces;

import java.util.HashMap;
import java.util.List;

public interface Schedule {

	List<HashMap<String,String>> getProfit(HashMap<String,String> params);

	List<HashMap<String,String>> getLoss(HashMap<String,String> params);
	List<HashMap<String,String>> getProfitList(HashMap<String,String> params);
	List<HashMap<String,String>> getLossList(HashMap<String,String> params);
}
