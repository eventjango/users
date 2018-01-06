package bit.interceptors;

import lombok.extern.java.Log;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Log
@Component
public class LoginInterceptor extends HandlerInterceptorAdapter {
	
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        HttpSession session = request.getSession();

        
        if(session.getAttribute("login") == null){
        	StringBuffer u;
        	
            u = request.getRequestURL();
            
            session.setAttribute("lastURL", u);

            response.sendRedirect("/login/required");

            return false;
        }
        
        	return true;

        
    }

}