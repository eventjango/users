<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>HOME</title>

    <%@include file="../common/layout.jsp" %>


</head>
<body>
<div id="wrap">

    <%@include file="../common/header.jsp" %>
    <%@include file="../common/menu.jsp" %>

	<div class="contents">

		<div class="main_cont_L">
			
			<div class="side_menu">
				<ul>
					<a href="/loan/invest/list"><li class="on">담보 론 투자하기</li></a>
					<a href="/loan/invest/history"><li>주문 및 거래내역</li></a>
					<!-- <a href="#"><li>지급 스케쥴</li></a> -->
				</ul>
			</div><!--.side_menu -->

			<div class="center_cont">

				<p class="center_cont_title"><span>${login.name}</span>님 환영합니다.</p>
				<p class="center_cont_p2">비트코인에 투자를 시작해보세요!</p>
				
				<div class="welcome_box">	
					<p class="step_p1">STEP 1</p>
					<p class="step_p2">투자 할 금액 입금하기</p>
					<p class="step_p3">투자를 위한 고객전용 가상계좌이며, 해당 계좌의 잔액으로 투자가 가능합니다.</p>

					<div class="account_box">
						<p class="account_p1">${login.name}님의 예치금 계좌</p>
						<p class="account_p2">농협은행 00000000000</p>
					</div>

					<p class="step_p4">- 예치금은 금융위원회 P2P 가이드라인에 따라 제3자 금융기관린 농협은행에 의해 안전하게 관리됩니다.<br>
					 - 투자 후 지급 받을 원리금은 다시 고객님의 예치금 계좌로 충전됩니다.<br>
					 - 예치금 계좌의 잔액은 "나의투자" > "출금하기" 메뉴를 통해 출금 신청 가능하며, 출금용 계좌(입력 해 주신 개인 명의 계좌)로 입금됩니다.</p>
					<br><br>

					<p class="step_p1">STEP 2</p>
					<p class="step_p2">자동분산투자 설정하고 편리하게 투자하기</p>
					<p class="step_p3">1. 최소 1만원부터 매일 자동으로 투자됩니다.<br>
					2. 다수의 상품에 소액으로 부산 투자 할 수록 리스크가 줄어듭니다.<br>
					3. 투자 수익이 자동으로 재투자되어 복리수익을 기대할 수 있습니다.<br>
					4. 현재 10건 중 7건이 자동으로 투자되고 있습니다.</p>
					<br><br>

					<a href="/loan/invest/apply"><p class="registration_btn">투자하기</p></a>
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
    