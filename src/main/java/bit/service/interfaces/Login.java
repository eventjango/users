package bit.service.interfaces;

import bit.vo.LoginVO;

import java.util.Map;

public interface Login {

    boolean login(LoginVO loginVO);

	String searchPw(Map<Object, Object> params);

	String getUserName(String userId);
}
