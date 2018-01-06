package bit.service.interfaces;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface Withdraw {

    boolean withdrawApply(HashMap<String,String> params);

	List<Map<String, Object>> getAddress(HashMap<String, String> params);

	boolean addAddress(HashMap<String, String> params);

	boolean removeAddress(HashMap<String, String> params);

}
