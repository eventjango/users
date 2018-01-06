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
					<a href="/service/notice"><li class="on">공지사항</li></a>
					<a href="/service/faq"><li><!-- 1:1 문의하기 -->자주묻는 질문</li></a>
					<a href="/service/guide"><li>가이드북</li></a>
				</ul>
			</div><!--.side_menu -->

			<div class="center_cont">

				<p class="cointitle">${currentNotice.title}</p>

				<div class="notice_box2 borderBottom"><!--// 이 안에 공지사항 들어가야함 -->

					${currentNotice.content}
				</div>
				<div class="order_box" align="center">
					<table class="w80c">
	<%-- 					<colgroup> --%>
							<col width="10%">
							<col width="50%">
							<col width="20%">
							<col width="20%">
						</colgroup>
	
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>날짜</th>
							<th>조회</th>
						</tr>
	
						<c:forEach items="${noticeList}" var="notice">
							<tr>
								<td>${notice.no}</td>
								<td><a href="/service/notice?no=${notice.no}">${notice.title}</a></td>
								<td>${notice.regDate}</td>
								<td>${notice.hitCount}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			
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
    