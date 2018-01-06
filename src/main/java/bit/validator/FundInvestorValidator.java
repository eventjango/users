package bit.validator;

import bit.vo.FundInvestorVO;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import java.util.regex.Pattern;

@Component
public class FundInvestorValidator implements Validator {


    @Override
    public boolean supports(Class<?> aClass) {
        return FundInvestorVO.class.isAssignableFrom(aClass);
    }

    @Override
    public void validate(Object target, Errors errors) {

        FundInvestorVO fundInvestorVO = (FundInvestorVO) target;

        ValidationUtils.rejectIfEmpty(errors, "accountCode", "common.field.required");
        ValidationUtils.rejectIfEmpty(errors, "beforePersonalCode", "common.field.required");
        ValidationUtils.rejectIfEmpty(errors, "afterPersonalCode", "common.field.required");
        ValidationUtils.rejectIfEmpty(errors, "address", "common.field.required");

        if(fundInvestorVO.getBeforePersonalCode().length() != 6)
            errors.rejectValue("beforePersonalCode", "invest.personalCode.min");

        if(fundInvestorVO.getAfterPersonalCode().length() != 7)
            errors.rejectValue("afterPersonalCode", "invest.personalCode.min");

        if(!Pattern.matches("^[0-9]+$", fundInvestorVO.getAccountCode()))
            errors.rejectValue("accountCode", "invest.accountCode.illegalArgument");
    }
}
