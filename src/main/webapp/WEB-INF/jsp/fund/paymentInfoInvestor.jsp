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

					<p>담보 론 정보</p>
					<div class="portfolio">
						<p>투자금액 : <span>30만원</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						채권수 : <span>1개</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						예상 연환산 수익률 : <span>5.78%</span>
						</p>
						<table>
							<colgroup>
								<col width="20%">
								<col width="20%">
								<col width="20%">
								<col width="20%">
								<col width="20%">
							</colgroup>
							<tr>
								<th>담보 코인 수량</th>
								<th>월 이자</th>
								<th>론 기간</th>
								<th>론 금액</th>
								<th>상태</th>
							</tr>
							<tr>
								<td>텍스트</td>
								<td>텍스트</td>
								<td>텍스트</td>
								<td>텍스트</td>
								<td>텍스트</td>
							</tr>
							<tr>
								<td>텍스트</td>
								<td>텍스트</td>
								<td>텍스트</td>
								<td>텍스트</td>
								<td>텍스트</td>
							</tr>
							<tr>
								<td>텍스트</td>
								<td>텍스트</td>
								<td>텍스트</td>
								<td>텍스트</td>
								<td>텍스트</td>
							</tr>
							<tr>
								<td>텍스트</td>
								<td>텍스트</td>
								<td>텍스트</td>
								<td>텍스트</td>
								<td>텍스트</td>
							</tr>
						</table>
					</div><!--.portfolio -->
					<br><br>

					<p>담보코인</p>
					<div class="payment">

						<div class="paymentIn_01">
							<p><span class="sp_L">담보코인종류</span><span class="sp_R">종류명</span></p>
							<br>
							<p class="p2"><span class="sp_L">필요 담보 코인 수량</span><span class="sp_R">15</span></p>
							<p class="p2"><span class="sp_L">계좌번호표시</span><span class="sp_R">000-00000-00-000</span></p>
						</div><!--.paymentIn_01 -->
						<!-- <br>
						<div class="paymentIn_02">
							<p><span class="sp_L">입금 필요금액</span><span class="sp_R">300,000원</span></p>
							<br>
							<p class="p2"><span class="sp_L">MY 렌딧 계좌<span class="sm">(사용가능금액 0원)</span></span></p>
							<p class="p2"><span class="sp_L">신한은행 렌딧홍길동 000-00000-00-000</span></p>
							<span>이제 이후 입금확인은 1분 정도 소요될 수 있습니다.</span>
							<p class="btn">입금확인</p>
						</div>.paymentIn_02 -->

					</div><!--.payment -->
					<br><br>

					<p>담보 론 받기 전 주의사항</p>
					<div class="payment">
						
						<p>1.텍스트 공간</p>
						<p>1.텍스트 공간</p>
						<p>1.텍스트 공간</p>
						<p>1.텍스트 공간</p>
						<p>1.텍스트 공간</p>

					</div><!--.payment -->
					
					<br><br>
					<p class="payment_btn_box"><span class="payment_btn_01">이전단계</span>&nbsp;&nbsp;<span class="payment_btn_02">결제하기</span></p>
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
    