package bit.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/deposit/type/")
public class DepositController {

    /**
     * 입금 - 원화
     * @return
     */
    @RequestMapping("/KRW")
    public String krw(){

        return "deposit/krw";
    }
    
    /**
     * 입금 - 비트코인
     * @return
     */
    @RequestMapping("/BTC")
    public String btc(){

        return "deposit/btc";
    }
    
    /**
     * 입금 - 이더리움
     * @return
     */
    @RequestMapping("/ETH")
    public String eth(){

        return "deposit/eth";
    }
    
    /**
     * 입금 - 큐텀
     * @return
     */
    @RequestMapping("/Qtum")
    public String qTum(){

        return "deposit/qTum";
    }
    
    /**
     * 입금 - 리플
     * @return
     */
    @RequestMapping("/XRP")
    public String xrp(){

        return "deposit/xrp";
    }

    /**
     * 입금 - 라이트코인
     * @return
     */
    @RequestMapping("/LTC")
    public String ltc(){

        return "deposit/ltc";
    }

    /**
     * 입금 - 비트코인 캐시
     * @return
     */
    @RequestMapping("/BCH")
    public String bch(){

        return "deposit/bch";
    }

    /**
     * 계좌번호 안내 페이지
     * @return
     */
    @RequestMapping("/info")
    public String info(){

        return "deposit/info";
    }
    
    /**
     * 상품권 충전 페이지
     * @return
     */
    @RequestMapping("/Gift_Card")
    public String giftCard(){

        return "deposit/giftCard";
    }
}
