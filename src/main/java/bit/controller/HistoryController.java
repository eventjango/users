package bit.controller;


import bit.service.interfaces.Profit;
import bit.service.interfaces.User;
import bit.vo.LoginVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.java.Log;

import javax.servlet.http.HttpSession;
import java.util.Objects;

@Log
@Controller
@RequestMapping("/history/")
public class HistoryController {


    @Autowired
    private User userService;


    @Autowired
    private Profit profitService;


	 /**
     * 투자 수익 페이지
     * @return
     */
    @RequestMapping("/profit")
    public String profit(Model model, HttpSession session){

        LoginVO loginVO = (LoginVO) session.getAttribute("login");

        /**
         * 1. 자산현황
         */

        model.addAttribute("userName", loginVO.getName());
        model.addAttribute("myCoinStatus", profitService.getMyCoinStatus(loginVO.getId()));


        /**
         * 2. 총 자산 / 거래금액
         */

        model.addAttribute("myInvestingAmount", profitService.getMyInvestingAmount(loginVO.getId()));


        /**
         * 3. 거래내역 리스트
         */

        /**
         * 4. 지급내역 리스트
         */


        /**
         * 5. 누적이익 / 잔여이익/ 예상 총 이익
         */

        /**
         *
         * ======================================
         */


        /**
         * 6. 잔여투자한도
         */


        /**
         * 7. 투자 상태
         */

        /**
         * 8. 수익률
         */


        /**
         *  ==== 상품 수익률 리스크 등급
         */



        return "history/profit";
    }
    
    /**
     * 이자 지출 페이지
     * @return
     */
    @RequestMapping("/loss")
    public String loss(Model model, HttpSession session){

        LoginVO loginVO = (LoginVO) session.getAttribute("login");

        /**
         *  ========== 나의 예치금
         *
         *  1. 충전하기
         *
         *  2. 예치금 관리
         */


        /**
         * ======== 이달의 상환 예정금
         *
         * 1. 원금
         *
         * 2. 이자
         *
         * 3. 세금
         *
         * 4. 수수료
         *
         * 5. 상환 내역 상세보기
         */


        /**
         * ============ 총 투자금액
         * - 투자신청중인 금액
         */


        /**
         * ============ 총 상환금
         *
         * - 상환 원금
         * - 상환 이자 (세후)
         */


        /**
         * ============ 나의 평균수익률
         *
         * - 부도율
         */


        /**
         * =========== 이달의 상환스케줄 리스트, 상세보기
         */


        return "history/loss";
    }
    
}
