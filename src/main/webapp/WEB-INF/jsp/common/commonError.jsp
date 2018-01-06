<%--
  Created by IntelliJ IDEA.
  User: Jun
  Date: 2017-10-25
  Time: 오전 10:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

</head>
<body>


<div class="jumbotron text-center">
    <h4>${exception}</h4>
</div>
<ul class="list-group">

    <c:forEach items="${exception.getStackTrace()}" var="stack">

        <li class="list-group-item list-group-item-warning">${stack.toString()}</li>

    </c:forEach>

</ul>

</body>
</html>
