package bit.vo;

import lombok.Data;

@Data
public class RequestLog {

    private int no;
    private String id;
    private String ip;
    private String url;
    private String regDate;
}


