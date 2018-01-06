package bit.controller;


import bit.service.interfaces.Admin;
import bit.service.interfaces.User;
import bit.vo.LoginVO;
import bit.vo.NoticeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.java.Log;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

@Log
@Controller
@RequestMapping("/service")
public class ServiceCenterController {


    @Autowired
    private Admin adminService;
    
    @Autowired
    private User userService;

	 /**
     * FAQ page
     * @return
     */
    @RequestMapping("/faq")
    public String faq(Model model) {
    	
    	
    	
    	HashMap<String, String> params = new HashMap<>();
    	params.put("id", "admin");
    	
    	model.addAttribute("list", userService.getQuestion(params));
    	
        return "serviceCenter/faq";
    }
    
    /**
     * Guide Page
     * @return
     */
    @RequestMapping("/guide")
    public String guide(){

        return "serviceCenter/guide";
    }

    /**
     * notice Page
     * @return
     */
    @RequestMapping("/notice")
    public String notice(Model model){

        List<NoticeVO> noticeList = adminService.getNoticeList("admin");

        model.addAttribute("noticeList", noticeList);
        model.addAttribute("currentNotice", noticeList
                .stream()
                .findFirst().get());

        return "serviceCenter/notice";
    }

    @RequestMapping(value = "/notice", params = {"no"})
    public String noticeDetail(@RequestParam String no, Model model){

        NoticeVO currentNotice = adminService.getNotice(no);

        adminService.updateHitCount(Integer.parseInt(no));

        model.addAttribute("currentNotice", currentNotice);
        model.addAttribute("noticeList", adminService.getNoticeList("admin"));

        return "serviceCenter/notice";
    }
    
    /**
     * error Page
     */
    @RequestMapping("/error")
    public String error(){

        return "serviceCenter/error";
    }
}
