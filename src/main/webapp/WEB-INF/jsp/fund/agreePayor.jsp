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

				<div class="payment_box">


					<p>자동투자 안내사항</p>
					<div class="payment">

						<div class="paymentIn_01">
							<p class="p2"><span class="sp_L">투자유형</span><span class="sp_R">수익 투자형</span></p>
							<p class="p2"><span class="sp_L">투자금액 단위</span><span class="sp_R">20 만원</span></p>
						</div><!--.paymentIn_01 -->

					</div><!--.payment -->

					<br>
					<p>투자 안내사항 / 채권매각 안내 / 투자 위험고지</p>

					<div class="agree_text">
						<p style=" font-size:12px;">1.텍스트들어갈 공간<br>
						1.텍스트들어갈 공간<br>
						1.텍스트들어갈 공간<br>
						1.텍스트들어갈 공간<br>
						1.텍스트들어갈 공간<br>
						<p>
					</div>
			
					<br>
					<p class="check"><input type="checkbox"> <a href="#">개인정보취급방침</a>, <a href="#">이용약관</a>, <a href="#">투자자 이용약관</a>에 동의합니다.</p>
					
					<br><br>
					<p class="registration_btn">자동 투자 하기</p>
				</div><!--.payment_box -->
					


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
    