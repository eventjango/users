package bit.service;

import bit.dao.FundDAO;
import bit.service.interfaces.FundInvestor;
import bit.vo.FundInvestorVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import java.util.Locale;

@Service
public class FundInvestorService implements FundInvestor{

    @Autowired
    private FundDAO fundDAO;

    @Autowired
    private MessageSource messageSource;

    @Override
    public int addFundInvestor(FundInvestorVO fundInvestorVO) {

        fundInvestorVO.setPersonalCode(String.join("-", fundInvestorVO.getBeforePersonalCode(), fundInvestorVO.getAfterPersonalCode()));

        int result = fundDAO.insertFundInvestor(fundInvestorVO);

        if(result < 1) throw new EmptyResultDataAccessException(messageSource.getMessage("database.emptyResult.notInsert", new Object[]{0}, Locale.KOREA), 0);

        return result;
    }
}
