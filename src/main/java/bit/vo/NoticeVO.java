package bit.vo;


import lombok.Data;

@Data
public class NoticeVO {

    private int no;

    private String title;

    private String content;

    private String regAgent;

    private String regDate;

    private String updateDate;

    private int hitCount;
}
