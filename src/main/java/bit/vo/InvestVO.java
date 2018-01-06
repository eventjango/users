package bit.vo;

import lombok.Data;

/**
 * 투자 상품
 */

@Data
public class InvestVO {

    private int no;
    private int amount;
    private int period;
    private int interestRate;
    private String investorId;
    private String investorName;
    private String deadline;
    private String regDate;
    private String updateDate;
    private String dueDate;
}
