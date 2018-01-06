package bit.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.dao.CoinDAO;
import bit.dao.ScheduleDAO;
import bit.service.interfaces.Coin;
import bit.service.interfaces.Schedule;

@Service

public class ScheduleService implements Schedule{
    @Autowired
    private ScheduleDAO scheduleDAO;

	@Override
	public List<HashMap<String,String>> getProfit(HashMap<String, String> params) {
		// TODO Auto-generated method stub
		return scheduleDAO.getProfit(params);
	}
	
	@Override
	public List<HashMap<String,String>> getLoss(HashMap<String, String> params) {
		// TODO Auto-generated method stub
		return scheduleDAO.getLoss(params);
	}
	
	@Override
	public List<HashMap<String,String>> getProfitList(HashMap<String, String> params) {
		// TODO Auto-generated method stub
		return scheduleDAO.getProfitList(params);
	}
	
	@Override
	public List<HashMap<String,String>> getLossList(HashMap<String, String> params) {
		// TODO Auto-generated method stub
		return scheduleDAO.getLossList(params);
	}


}
