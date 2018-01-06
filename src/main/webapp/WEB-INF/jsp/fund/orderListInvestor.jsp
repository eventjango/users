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
					<a href="/fund/invest/list"><li>펀드 투자하기</li></a>
					<a href="/fund/invest/history"><li class="on">주문 및 거래 내역</li></a>
					<!-- <a href="#"><li>지급 스케쥴</li></a> -->
				</ul>
			</div><!--.side_menu -->

			<div class="center_cont">

				<div class="order_box">
					<div class="orderIn_01">
						<p>체결전 주문</p>
						<table>
							<colgroup>
								<col width="14.2%">
								<col width="14.2%">
								<col width="14.2%">
								<col width="14.2%">
								<col width="14.2%">
								<col width="14.2%">
							</colgroup>
							<tr>
								<th>주문일시</th>
								<th>담보 코인</th>
								<th>이자율</th>
								<th>금액</th>
								<th>기간</th>
								<th>현재상황</th>
								<th>모집된금액</th>
							</tr>
							<tr>
								<td>텍스트</td>
								<td>텍스트</td>
								<td>텍스트</td>
								<td>텍스트</td>
								<td>텍스트</td>
								<td>텍스트</td>
								<td>텍스트</td>
							</tr>
						</table>
					</div>
					<br>
					<div class="orderIn_01">
						<p>진행중인 주문</p>
						<table>
							<colgroup>
								<col width="11%">
								<col width="11%">
								<col width="11%">
								<col width="11%">
								<col width="11%">
								<col width="11%">
								<col width="11%">
								<col width="11%">
								<col width="11%">
							</colgroup>
							<tr>
								<th>체결일시</th>
								<th>담보코인종류</th>
								<th>담보코인수량</th>
								<th>이자율</th>
								<th>체결 KRW 금액</th>
								<th>기간</th>
								<th>진행상황</th>
								<th>KRW 변동</th>
								<th>수수료</th>
							</tr>
							<tr>
								<td>텍스트</td>
								<td>텍스트</td>
								<td>텍스트</td>
								<td>텍스트</td>
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
								<td>텍스트</td>
								<td>텍스트</td>
								<td>텍스트</td>
								<td>텍스트</td>
							</tr>
						</table>
					</div>

				
				</div><!--.order_box -->


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
    