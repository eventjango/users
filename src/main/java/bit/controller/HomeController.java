package bit.controller;


import bit.service.interfaces.Admin;
import bit.service.interfaces.Home;
import bit.vo.InvestVO;
import bit.vo.NewsVO;
import bit.vo.NoticeVO;
import bit.vo.ProductVO;
import lombok.extern.java.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;


/**
 * 홈 컨트롤러
 */
@Log
@Controller
public class HomeController {

    @Autowired
    private Home homeService;

    @Autowired
    private Admin adminService;

    /**
     * 홈 화면 표현
     * @return
     */
    @RequestMapping("/home")
    public String home(){

        return "common/home";
    }
    
    /**
     * 홈 화면단에서 대출상품리스트
     * @return
     */
    @ModelAttribute("productList")
    private List<ProductVO> payorProductList(){
    	
        return homeService.payorProductList();
    }

    /**
     * 홈 화면단에서 투자상품리스트
     * @return
     */
    private @ModelAttribute("investList")  List<InvestVO> investList(){
        return homeService.investList();
    }


    /**
     * 홈 화면단에서 공지사항
     * @return
     */
    private @ModelAttribute("noticeList") List<NoticeVO> noticeList(){

        return adminService.getNoticeList("admin");
    }

    /**
     * 홈 화면단에서 보도자료
     * @return
     */
    private @ModelAttribute("newsList") List<NewsVO> newsList(){
        return adminService.getNewsList("admin");
    }
}
