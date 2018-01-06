package bit.validator;

import bit.vo.InvestorVO;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import java.util.regex.Pattern;

@Component
public class InvestValidator implements Validator{


    @Override
    public boolean supports(Class<?> aClass) {
        return InvestorVO.class.isAssignableFrom(aClass);
    }

    @Override
    public void validate(Object target, Errors errors) {

        InvestorVO investorVO = (InvestorVO) target;
        String BpersonalCode = "(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))";
        String ApersonalCode = "[1-4][0-9]{6}";
        String AccountNumber = "^[0-9]{10}?[0-9]*";

        ValidationUtils.rejectIfEmpty(errors, "accountCode", "common.field.required");
        /*ValidationUtils.rejectIfEmpty(errors, "bankName", "common.field.required");*/
        ValidationUtils.rejectIfEmpty(errors, "beforePersonalCode", "common.field.required");
        ValidationUtils.rejectIfEmpty(errors, "afterPersonalCode", "common.field.required");
        ValidationUtils.rejectIfEmpty(errors, "postCode", "common.field.required");
        ValidationUtils.rejectIfEmpty(errors, "address1", "common.field.required");
        ValidationUtils.rejectIfEmpty(errors, "address2", "common.field.required");

        /*if(investorVO.getBeforePersonalCode().length() != 6)
            errors.rejectValue("beforePersonalCode", "invest.personalCode.min6");

        if(investorVO.getAfterPersonalCode().length() != 7)
            errors.rejectValue("afterPersonalCode", "invest.personalCode.min7");*/
        
        if(!Pattern.matches(BpersonalCode,investorVO.getBeforePersonalCode()))
            errors.rejectValue("beforePersonalCode", "invest.personalCode.Bcheck");
        if(!Pattern.matches(ApersonalCode,investorVO.getAfterPersonalCode()))
            errors.rejectValue("beforePersonalCode", "invest.personalCode.Acheck");

        if(!Pattern.matches(AccountNumber, investorVO.getAccountCode()))
            errors.rejectValue("accountCode", "invest.accountCode.illegalArgument");

        /*if(!Pattern.matches("^[0-9]+$", investorVO.getBeforePersonalCode()))
            errors.rejectValue("beforePersonalCode", "invest.personalCode.illegalArgument");

        if(!Pattern.matches("^[0-9]+$", investorVO.getAfterPersonalCode()))
            errors.rejectValue("afterPersonalCode", "invest.personalCode.illegalArgument");*/

    }
}
