package bit.vo;

import lombok.Data;


@Data
public class PayorVO {

    private String userId;

    private String accountCode;

    private String bankName;

    /**
     * 주민번호
     */
    private String beforePersonalCode;

    private String afterPersonalCode;

    private String personalCode;

    /**
     * 주소
     */
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
