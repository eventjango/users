package bit.service.interfaces;

import java.util.List;
import java.util.Map;

public interface Profit {

    List<Map<String, Object>> getMyCoinStatus(String userId);

    String getMyInvestingAmount(String userId);
}
