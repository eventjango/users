package bit.validator;


import bit.service.UserService;
import bit.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import java.util.regex.Pattern;

@Component
public class UserValidator implements Validator{

    @Autowired
    private UserService userService;

    @Override
    public boolean supports(Class<?> aClass) {
        return (UserVO.class.isAssignableFrom(aClass));
    }

    @Override
    public void validate(Object target, Errors errors) {

        UserVO userVO = (UserVO) target;

        ValidationUtils.rejectIfEmpty(errors, "id", "common.field.required");
        ValidationUtils.rejectIfEmpty(errors, "pw", "common.field.required");
        ValidationUtils.rejectIfEmpty(errors, "name", "common.field.required");
        ValidationUtils.rejectIfEmpty(errors, "phone", "common.field.required");
        ValidationUtils.rejectIfEmpty(errors, "userState", "common.field.required");

        /*if(userService.checkUserId(userVO.getId()) > 0) errors.rejectValue("id", "user.id.duplicated");*/
        if(!isIdValid(userVO.getId())) errors.rejectValue("id", "user.id.regex");
        if(!isPwValid(userVO.getPw())) errors.rejectValue("pw", "user.pw.regex");
    }

    private boolean isIdValid(String id){
        return (Pattern.matches("^[a-zA-Z]{1}[a-zA-Z0-9_]{4,11}$", id.trim()));
    }

    private boolean isPwValid(String pw){
        return (Pattern.matches("\"([0-9].*[!,@,#,^,&amp;,*,(,)])|([!,@,#,^,&amp;,*,(,)].*[0-9])", pw.trim()));
    }

    private boolean isEmaidValid(String email){
        return (Pattern.matches("[\\\\w\\\\~\\\\-\\\\.]+@[\\\\w\\\\~\\\\-]+(\\\\.[\\\\w\\\\~\\\\-]+)+", email.trim()));
    }
}
