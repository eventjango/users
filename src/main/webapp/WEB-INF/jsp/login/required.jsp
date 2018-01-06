<%--
  Created by IntelliJ IDEA.
  User: Develop-coin2
  Date: 2017-11-12
  Time: 오후 8:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../common/layout.jsp" %>
<html>
<head>

</head>
<body>

<script>

    alert("<spring:message code="login.required"/>"); location.href = '<c:url value="/login"/>';

</script>


</body>
</html>
