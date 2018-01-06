package bit.vo;


import lombok.Data;

@Data
public class LoginVO {

    private String id;
    private String pw;
    private String name;
    private int userState;
}
