package bit.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.dao.CoinDAO;
import bit.dao.WithdrawDAO;
import bit.service.interfaces.Coin;
import bit.service.interfaces.Withdraw;

@Service

public class WithdrawService implements Withdraw{
    @Autowired
    private WithdrawDAO withdrawDAO;

	@Override
	public boolean withdrawApply(HashMap<String, String> params) {
		// TODO Auto-generated method stub
		boolean result = false;
		if(withdrawDAO.withdrawApply(params) > 0) {
			result = true;
		}
		return result;
	}

	@Override
	public List<Map<String, Object>> getAddress(HashMap<String, String> params) {
		// TODO Auto-generated method stub
		return withdrawDAO.getAddress(params);
	}

	@Override
	public boolean addAddress(HashMap<String, String> params) {
		// TODO Auto-generated method stub
		boolean result = false;
		
		if(withdrawDAO.addAddress(params) > 0) {
			result = true;
		}
		
		return result;
	}

	@Override
	public boolean removeAddress(HashMap<String, String> params) {
		// TODO Auto-generated method stub
		boolean result = false;
		
		if(withdrawDAO.removeAddress(params) > 0) {
			result = true;
		}
		
		return result;
	}
   

}
