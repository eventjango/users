package bit.vo;

import lombok.Data;

@Data
public class InvestConclusionVO {

    private String no;

    private String investNo;

    private String orderState;

    private String payorId;

    private String txStartDate;

    private String txEndDate;

    private String amount;

    private String interestPaymentDate;
}
