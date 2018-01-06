<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>HOME</title>

<%@ include file="../common/layout.jsp" %>
</head>
<body>
<div id="wrap">
	<%@ include file="../common/header.jsp" %>
	<%@ include file="../common/menu.jsp" %>

    <div class="contents">

            <div class="main_cont_L">

                <div class="side_menu">
                    <ul>
                        <a href="/service/notice"><li>공지사항</li></a>
                        <a href="/service/faq"><li><!-- 1:1 문의하기 -->자주묻는 질문</li></a>
                        <a href="/service/guide"><li class="on">가이드북</li></a>
                    </ul>
                </div><!--.side_menu -->

                <div class="center_cont">

                    <p class="cointitle">가이드북</p>



                </div><!--.center_cont -->

            </div><!--.main_cont_L -->






		<!-- 우측 사이드박스 시작-->
		<div class="main_cont_R">
		
		</div><!--.main_cont_R -->

	
	</div><!--.contents -->
	
<%@include file="../common/footer.jsp"%>

</div>
</body>
</html>
    