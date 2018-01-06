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

<!-- 이벤트 슬라이드 스크립트 / gnb위에 넣으면 작동 안함 / 여기에 고정 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="/js/swiper.jquery.min.js"></script>
	<!--// 이벤트 슬라이드끝-->


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

				<div class="payment_box">

					<!-- <p>투자할 포트폴리오 정보</p> -->
					<p>투자할 상품 정보</p>
					<div class="portfolio">
						<!-- <p>투자금액 : <span>30만원</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						채권수 : <span>1개</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						예상 연환산 수익률 : <span>5.78%</span>
						</p>
						 --><table>
							<colgroup>
								<col width="25%">
								<col width="25%">
								<col width="25%">
								<col width="25%">
							</colgroup>
							<!-- <tr>
								<th>투자금액</th>
								<th>예상 연 수익률</th>
								<th>투자기간</th>
								<th>상태</th>
							</tr> -->
							<tr>
								<th>남은 모집금액</th>
								<th>연 이자율</th>
								<th>모집 마감일</th>
								<th>예상 지급일</th>
							</tr>
							<c:forEach var="i" items="${productInfo}" begin="0">
									<tr>
										<td>${i.wantAmount }원</td>
										<td>${i.interestRate}%</td>
										<td>${i.deadline}</td>
										<td>${i.dueDate}</td>
									</tr>
							</c:forEach>
							
						</table>
					</div><!--.portfolio -->
					<br><br>

					<p>결제정보</p>
					<div class="payment">

						<div class="paymentIn_01">
							<div>
								<p><span>투자금액</span><input type="text" placeholder='단위 : 일 십만원'><!-- <span>300,000원</span> --></p>
							</div>
						</div>

					</div><!--.payment -->
					

					<p class="registration_btn">투자하기</p>
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
    