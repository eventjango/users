package bit.common;


import lombok.extern.java.Log;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@Log
@ControllerAdvice
public class CommonExceptionAdvice {

    /*@ExceptionHandler(Exception.class)
    private ModelAndView common(Exception e){

        return new ModelAndView("common/commonError").addObject("exception", e);
    }*/

    /*@ExceptionHandler(NullPointerException.class)
    private void common(Exception e){

        System.out.println("NULL throwed");
        log.config(e.getMessage());
    }*/

    /*@ExceptionHandler(EmptyResultDataAccessException.class)
    private void emptyResultDataException(){

    }*/
}
