package bit.validator;


import bit.vo.LoginVO;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class LoginValidator implements Validator{

    @Override
    public boolean supports(Class<?> aClass) {
        return (LoginVO.class.isAssignableFrom(aClass));
    }

    @Override
    public void validate(Object target, Errors errors) {

    	//LoginVO loginVO = (LoginVO) target;

        ValidationUtils.rejectIfEmpty(errors, "id", "login.id.check");
        ValidationUtils.rejectIfEmpty(errors, "pw", "login.pw.check");
        
    }
}
