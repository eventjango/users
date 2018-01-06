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
			
			<%@ include file="../common/sidemenu.jsp" %>



			<div class="center_cont">

				<ul class="coin_tab">
					<a href='/deposit/type/KRW'><li class="on">계좌입금</li></a>
					<a href='/deposit/type/Gift_Card'><li>상품권 충전</li></a>
				</ul><!--.coin_tab -->
				
				<p class="cointitle">실시간 1회용 가상계좌 발급 안내</p>
				<div class="coinbox">
					<a href="https://placeholder.com"><img src="http://via.placeholder.com/100x100"></a><br>
					1회용 가상계좌 발급
				</div>
				<div class="coinbox">
					<a href="https://placeholder.com"><img src="http://via.placeholder.com/100x100"></a><br>
					이미지 텍스트
				</div>
				<div class="coinbox">
					<a href="https://placeholder.com"><img src="http://via.placeholder.com/100x100"></a><br>
					이미지 텍스트
				</div>
				<div class="coinbox" style="margin-right:0;">
					<a href="https://placeholder.com"><img src="http://via.placeholder.com/100x100"></a><br>
					이미지 텍스트
				</div>

				<a href="/deposit/type/info"><p class="coin_btn">1회용 가상계좌 발급받기</p></a>

				<div class="coin_text">
					* 텍스트들어갈 공간<br>
					* 텍스트들어갈 공간<br>
					* 텍스트들어갈 공간<br>
					* 텍스트들어갈 공간<br>
					* 텍스트들어갈 공간<br>
					* 텍스트들어갈 공간<br>
					* 텍스트들어갈 공간<br>
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
    