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
					<a href="/service/faq"><li class="on"><!-- 1:1 문의하기 -->자주묻는 질문</li></a>
					<a href="/service/guide"><li>가이드북</li></a>
				</ul>
			</div><!--.side_menu -->

			<div class="center_cont">

				<p class="cointitle"><!-- FAQ -->자주묻는 질문</p>

				<div id="page">          
					<ul id="example2" class="accordion">
						<c:if test="${list.size()  < 1 }">
								<li>
								    <h3>문의 내역이 없습니다</h3>
								</li>
							</c:if>
							<c:forEach var ="i" items="${list}" begin="0">
							<li>
								<h3><span class="q">Q</span>&nbsp; ${i.title}</h3>
								<ul class="panel loading">
									<%-- <li>${i.content}</li> --%>
									<c:if test="${i.answer_title != null }">
									<!-- <br/><br/> -->
									<li><span class="a">A</span>&nbsp;${i.answer_title}</li>
									<%-- <li style="padding-left: 30px;">${i.answer}</li><br><br> --%>
									</c:if>
								</ul>
							</li>
							</c:forEach>
					</ul>       
				</div>


				<div class="notice_box2" style=" margin-top:30px;"><!--// 이 안에 1:1문의 게시판 들어가야함 -->
					<a href="/user/question/cs">필요하신 정보가 없으신가요?</a>
				</div>

			
			</div><!--.center_cont -->

		</div><!--.main_cont_L -->


		<script src="http://code.jquery.com/jquery-1.4.2.min.js"></script>
		<script type="text/javascript" src="/js/jquery.accordion.2.0.js" charset="UTF-8"></script>
		<script type="text/javascript">       
			$('#example2').accordion({
				canToggle: true
			});
			$(".loading").removeClass("loading");
		</script>




		<!-- 우측 사이드박스 시작-->
		<div class="main_cont_R">
		
		</div><!--.main_cont_R -->

	
	</div><!--.contents -->
	
<%@include file="../common/footer.jsp"%>

</div>
</body>
</html>
    