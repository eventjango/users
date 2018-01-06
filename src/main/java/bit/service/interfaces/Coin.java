package bit.service.interfaces;

import java.util.List;
import java.util.Map;

public interface Coin {

    List<Map<String, Object>> getCoinType();

    List<Map<String, Object>> getRCoinType();

    String getCoinCode(Object cointype);
}
