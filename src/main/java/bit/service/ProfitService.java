package bit.service;

import bit.dao.ProfitDAO;
import bit.service.interfaces.Profit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ProfitService implements Profit {

    @Autowired
    private ProfitDAO profitDAO;

    @Override
    public List<Map<String, Object>> getMyCoinStatus(String userId) {

        List<Map<String, Object>> resultList =  profitDAO.myCoinStatus(userId);

        return resultList;
    }

    @Override
    public String getMyInvestingAmount(String userId) {

        String result = "0";

        Map<String, Object> params = new HashMap<>();
        params.put("investorId", userId);

        Map<String, Object> resultMap = profitDAO.myInvestingAmount(params);

        if(resultMap != null){
            result = resultMap.get("amount").toString();
        }
        return result;
    }
}
