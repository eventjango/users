package bit.validator;

import java.util.regex.Pattern;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import bit.vo.PayorVO;

@Component
public class PayValidator implements Validator{


    @Override
    public boolean supports(Class<?> aClass) {
        return PayorVO.class.isAssignableFrom(aClass);
    }

    @Override
    public void validate(Object target, Errors errors) {

        PayorVO payorVO = (PayorVO) target;
        String BpersonalCode = "(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))";
        String ApersonalCode = "[1-4][0-9]{6}";
        String AccountNumber = "^[0-9]{10}?[0-9]*";

        /*ValidationUtils.rejectIfEmpty(errors, "accountCode", "common.field.required");*/
        /*
         * ValidationUtils.rejectIfEmpty(errors, "beforePersonalCode", "common.field.required");
         * ValidationUtils.rejectIfEmpty(errors, "afterPersonalCode", "common.field.required");
         */
        ValidationUtils.rejectIfEmpty(errors, "postCode", "common.field.required");
        ValidationUtils.rejectIfEmpty(errors, "address1", "common.field.required");
        ValidationUtils.rejectIfEmpty(errors, "address2", "common.field.required");

        if(!Pattern.matches(BpersonalCode,payorVO.getBeforePersonalCode()))
            errors.rejectValue("beforePersonalCode", "invest.personalCode.Bcheck");
        //Pattern ApersonalCode = Pattern.compile("[1-4][0-9]{6}");
    	//if(!ApersonalCode.matcher(PayorVO.getAfterPersonalCode()).find())
        if(!Pattern.matches(ApersonalCode,payorVO.getAfterPersonalCode()))
            errors.rejectValue("beforePersonalCode", "invest.personalCode.Acheck");

        if(!Pattern.matches(AccountNumber, payorVO.getAccountCode()))
            errors.rejectValue("accountCode", "invest.accountCode.illegalArgument");

    }
}
