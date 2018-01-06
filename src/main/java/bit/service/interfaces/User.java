package bit.service.interfaces;

import bit.vo.LoginVO;
import bit.vo.UserVO;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface User {

    UserVO getUserVO(String name);

    void checkDuplicatedUser(String id);

    int checkUserId(String id);

	String add(HashMap<String, Object> params);

	boolean checkUserPw(Map<String, String> param, LoginVO loginVO);

	boolean modifyUserPw(Map<String, String> param);

	int getUserCode(String id);

	boolean sendQuestion(Map<String, String> params);

	List<HashMap<String, String>> getQuestion(HashMap<String, String> params);
}