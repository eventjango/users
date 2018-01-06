package bit.vo;


import lombok.Data;

import javax.validation.constraints.Min;

@Data
public class ProductVO {

    private int no;

    @Min(value = 500000)
    private int wantAmount;

    private Double interestRate;

    private String payorId;
    
    private String investorId;
    
    private String payorName;

    private int coinCode;
    
    private String coinValue;
    
    private Double coinAmount;

    private String regDate;

    private String updateDate;

    private String deadline;
    
    private String dueDate;

    private int wantPeriod;

    private boolean useFlag;
}
