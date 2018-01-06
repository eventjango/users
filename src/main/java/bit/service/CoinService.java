package bit.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.dao.CoinDAO;
import bit.service.interfaces.Coin;

@Service

public class CoinService implements Coin{
    @Autowired
    private CoinDAO coinDAO;

    public List<Map<String, Object>> getCoinType() {
		// TODO Auto-generated method stub

		return coinDAO.getCoinType();
	}
    
    public List<Map<String, Object>> getRCoinType() {
		// TODO Auto-generated method stub

		return coinDAO.getRCoinType();
	}

	public String getCoinCode(Object cointype) {
		// TODO Auto-generated method stub
		return coinDAO.getCoinCode(cointype);
	}

}
