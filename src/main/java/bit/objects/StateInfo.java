package bit.objects;

public enum StateInfo {

    USER_INDIVIDUAL(100, 100, "개인"),
    USER_INVEST(101, 100, "개인투자"),
    USER_CORPORATION(102, 100, "법인"),
    USER_ORGAN(103, 100, "기관"),
    LOAN_WAIT(200, 200, "대기중"),
    LOAN_PROGRESS(201, 200, "진행중"),
    LOAN_COMPLETE(202, 200, "체결"),
    LOAN_END(203, 200, "완료"),
    LOAN_CANCEL(204, 200, "취소");

    private int code;
    private int groupCode;
    private String message;

    StateInfo(int code, int groupCode, String message) {

        this.code = code;
        this.groupCode = groupCode;
        this.message = message;
    }

    public int getCode() {
        return code;
    }

    public int getGroupCode() {
        return groupCode;
    }

    public String getMessage(){ return message; }
}
