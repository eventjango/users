package bit.interceptors;


import bit.service.interfaces.Admin;
import bit.vo.LoginVO;
import bit.vo.RequestLog;
import bit.vo.UserVO;
import lombok.extern.java.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@Log
@Component
public class LogInterceptor extends HandlerInterceptorAdapter{

    @Autowired
    private Admin adminService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        log.info(request.getMethod() + " : " + request.getRequestURI() + " ? QUERY STRING : " + request.getQueryString());
        log.info(handler.toString());

        RequestLog log = new RequestLog();

        HttpSession session = request.getSession();
        String userid = "Unnamed";
        LoginVO loginVO = (LoginVO) session.getAttribute("login");

        if(loginVO != null){
            userid = loginVO.getId();
        }

        log.setId(userid);
        log.setIp(request.getRemoteAddr());
        log.setUrl(request.getRequestURI());

        adminService.registerRequestLog(log);

        return super.preHandle(request, response, handler);
    }

}
