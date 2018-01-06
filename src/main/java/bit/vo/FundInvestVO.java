package bit.vo;


import lombok.Data;

/**
 *  펀드 투자 상품
 */
@Data
public class FundInvestVO {

    private int no;
    private int wantAmount;
    private int period;
    private int deadline;
    private int interestRate;
    private String coinValue;
    private String investorId;
    private String regDate;
    private String updateDate;
    private String dueDate;
}
