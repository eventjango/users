package bit.vo;


import lombok.Data;

@Data
public class ProductConclusionVO {

    private String no;

    private String productNo;

    private String orderState;

    private String investorId;

    private String txStartDate;

    private String txEndDate;

    private String amount;

    private String interestPaymentDate;
}
