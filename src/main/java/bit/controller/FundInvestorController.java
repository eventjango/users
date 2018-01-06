package bit.controller;

import bit.service.interfaces.FundInvestor;
import bit.validator.FundInvestorValidator;
import bit.vo.FundInvestorVO;
import bit.vo.LoginVO;
import lombok.extern.java.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

@Log
@Controller
@RequestMapping("/fund/invest")
public class FundInvestorController {

    @Autowired
    private FundInvestor fundInvestorService;

    @Autowired
    private FundInvestorValidator fundInvestorValidator;

    /**
     * 코인 펀드 투자자 등록하기 화면
     * @return
     */
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add(@ModelAttribute FundInvestorVO fundInvestorVO){

        return "fund/addInvestor";
    }


    /**
     * 코인 펀드 투자자 등록
     * @param fundInvestorVO
     * @param bindingResult
     * @param session
     * @return
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String add(@ModelAttribute FundInvestorVO fundInvestorVO, BindingResult bindingResult, HttpSession session){

        LoginVO loginVO = (LoginVO) session.getAttribute("login");

        if(loginVO == null) return "redirect:/login/required";

        fundInvestorValidator.validate(fundInvestorVO, bindingResult);

        if(bindingResult.hasErrors()) return "fund/addInvestor";

        try{

            fundInvestorVO.setUserId(loginVO.getId());
            fundInvestorService.addFundInvestor(fundInvestorVO);

        }catch (EmptyResultDataAccessException e){
            e.printStackTrace(); throw e;
        }

        return "redirect:/fund/invest/welcome";
    }


    /**
     * 코인 펀드 투자 신청 화면
     * @return
     */
    @RequestMapping(value = "/apply", method = RequestMethod.POST)
    public String addInvest(){

        return "fund/applyInvest";
    }

    /**
     * 코인 펀드 투자 리스트 화면
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(Model model){

        return "fund/listInvestor";
    }

    /**
     * 코인 펀드 투자자 결제하기
     * @return
     */
    @RequestMapping("/payment")
    public String paymentInfo(){

        return "fund/paymentInfoInvestor";
    }

    /**
     * 코인 펀드 투자자 자동 투자 동의페이지
     * @return
     */
    @RequestMapping("/agree")
    public String agree(){

        return "fund/agreePayor";
    }

    /**
     * 코인 펀드 투자자 투자 신청페이지
     * @return
     */
    @RequestMapping("/apply")
    public String apply(){

        return "fund/applyInvestor";
    }
    
    /**
     * 코인 펀드 투자자 환영 페이지
     */
    @RequestMapping("/welcome")
    public String welcome(){

        return "fund/welcomeFundInvestor";
    }
    
    /**
     *  주문 및 거래내역 페이지
     */
      @RequestMapping("/history")
      public String orderHistory() {
    	
    	    return "fund/orderListInvestor";
      }
}
