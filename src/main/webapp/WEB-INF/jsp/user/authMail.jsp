<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>HOME</title>

<%@ include file="../common/layout.jsp" %>
</head>
<script type="text/javascript">
var state = ${state};
if(state == true){
	alert("메일 인증에 성공하였습니다");
	location.href="/home";
}else{
	alert("메일 인증에 실패하였습니다");
	self.opener = self;
	self.close();
}


</script>