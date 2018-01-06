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

    <!-- 이벤트 슬라이드 스크립트 / gnb위에 넣으면 작동 안함 / 여기에 고정 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="/js/swiper.jquery.min.js"></script>
	<!--// 이벤트 슬라이드끝-->


	<div class="contents">

		<div class="main_cont_L">
			
			<div class="side_menu">
				<ul>
					<a href="/fund/payor/apply"><li>펀딩 모집 신청하기</li></a>
					<a href="/fund/invest/list"><li class="on">펀드 투자하기</li></a>
					<a href="/fund/invest/history"><li>주문 및 거래 내역</li></a>
					<!-- <a href="#"><li>지급 스케쥴</li></a> -->
				</ul>
			</div><!--.side_menu -->

			<div class="center_cont">

				<p class="center_cont_title">투자 신청하기</p>
				<p class="center_cont_p1">텍스트공간</p>
				<p class="center_cont_p2">텍스트들어갈 공간</p>
					
				<div class="registration_box">
					<p>금액</p>
					<input type="text" placeholder="금액">
					<br><br>
					<p>희망이율</p>
					<input type="text" placeholder="희망이율">
					<br><br>
					<p>기간</p>
					<input type="text" placeholder="기간">
					<br><br>
					<p>모집기간</p>
					<input type="text" placeholder="1~7일">
					<br><br>
					<p>희망이율</p>
					<input type="text" placeholder="희망이율">
					<br><br>
					<p>이용약관동의</p>
					<div class="agree_box">
						<p>
							1.텍스트공간<br>
							1.텍스트공간<br>
							1.텍스트공간<br>
							1.텍스트공간<br>
							1.텍스트공간
						</p>
					</div>
					<input type="checkbox" class="in_check"> 이용약관에 동의합니다.
					<br><br>
					<p>총 투자금액</p>
					<input type="text" placeholder="총 투자금액">
					<br><br>
					<p>예상수익 <span>(세금별도)</span></p>
					<input type="text" placeholder="총 투자금액">
					<br><br><br>
					<p class="registration_btn">투자 신청</p>
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
    