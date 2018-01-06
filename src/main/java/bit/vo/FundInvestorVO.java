package bit.vo;

import lombok.Data;

@Data
public class FundInvestorVO {

    private String userId;

    private String accountCode;

    private String bankName;

    private String beforePersonalCode;

    private String afterPersonalCode;

    private String personalCode;

    private String addPath;

    private String address;

    private String recommendationCode;
}
