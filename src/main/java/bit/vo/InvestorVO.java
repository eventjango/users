package bit.vo;

import lombok.Data;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;


@Data
public class InvestorVO {

    private String userId;

    /*@NotNull(message = "common.field.required")
    @Pattern(regexp = "^[0-9]+$", message = "invest.accountCode.illegalArgument")*/
    private String accountCode;


    /*@NotNull(message = "common.field.required")*/
    private String bankName;

    /**
     * 주민번호
     */
    /*@NotNull(message = "common.field.required")
    @Size(min = 6, message = "invest.personalCode.min")
    @Pattern(regexp = "^[0-9]+$", message = "invest.personalCode.illegalArgument")*/
    private String beforePersonalCode;


    /*@NotNull(message = "common.field.required")
    @Size(min = 7, message = "invest.personalCode.min")
    @Pattern(regexp = "^[0-9]+$", message = "invest.personalCode.illegalArgument")*/
    private String afterPersonalCode;


    private String personalCode;

    /**
     * 주소
     */
    /*@NotNull(message = "common.field.required")*/
    private String postCode;
    private String address1;
    private String address2;

    /**
     * 가입경로
     */
    private String addPath;

    /**
     * 추천인 코드
     */
    private String recommendationCode;

}
