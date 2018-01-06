<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
					<a href="/fund/invest/apply"><li class="on">펀딩 모집 신청하기</li></a>
					<a href="/fund/invest/list"><li>펀드 투자하기</li></a>
					<a href="/fund/invest/history"><li>주문 및 거래 내역</li></a>
					<!-- <a href="#"><li>지급 스케쥴</li></a> -->
				</ul>
			</div><!--.side_menu -->

			<div class="center_cont">

				<p class="center_cont_title">투자자 등록하기</p>
				<p class="center_cont_p1">왜 주민번호와 주소 정보가 필요한가요?</p>
				<p class="center_cont_p2">비트코인은 투자 수익에 대한 세금을 원천징수해야 하는 의무를 가지고 있습니다.<br>이를 위해서만 사용되며 다른 용도로 사용되지 않습니다.</p>

				<div class="registration_box">

					<form:form commandName="FundInvestVO" action="#" method="post">

					<p>모집화폐종류</p>
					<%--<input type="radio" name="gender" checked class="radio_in"> BTC &nbsp;&nbsp;&nbsp; <input type="radio" name="gender" class="radio_in"> ETH--%>
						<%--BTC &nbsp;&nbsp;&nbsp; <form:radiobutton path="coinValue"/>
						ETH <form:radiobutton path="coinValue"/>--%>
					<br><br>
					<p>희망모집수량</p>
					<%--<input type="text" placeholder="희망모집수량">--%>
						<form:input path="wantAmount"></form:input>
					<br><br>
					<p>모집기간(1-7)</p>
					<%--<input type="text" placeholder="1~7">--%>
						<form:input path="deadline"></form:input>
					<br><br>
					<p>이자율</p>
					<%--<input type="text" placeholder="00%">--%>
						<form:input path="interestRate"></form:input>
					<br><br>
					<p>대출기간</p>

						<%--<select>
						<option>대출 기간을 선택해주세요.</option>
						<option value="1">1개월</option>
						<option value="2">2개월</option>
						<option value="3">3개월</option>
						<option value="4">4개월</option>
						<option value="5">5개월</option>
						<option value="6">6개월</option>
						<option value="7">7개월</option>
						<option value="8">8개월</option>
						<option value="9">9개월</option>
						<option value="10">10개월</option>
						<option value="11">11개월</option>
						<option value="12">12개월</option>
						</select>--%>
						
						<form:select path="dueDate">
							<form:option value="1">1개월</form:option>
							<form:option value="2">2개월</form:option>
							<form:option value="3">3개월</form:option>
							<form:option value="4">4개월</form:option>
							<form:option value="5">5개월</form:option>
							<form:option value="6">6개월</form:option>
							<form:option value="7">7개월</form:option>
							<form:option value="8">8개월</form:option>
							<form:option value="9">9개월</form:option>
							<form:option value="10">10개월</form:option>
							<form:option value="11">11개월</form:option>
							<form:option value="12">12개월</form:option>
						</form:select>

					<br><br>

					<br><br>
					<%--<p class="registration_btn">등록하기</p>--%>
						<input class="registration_btn" type="submit" value="등록하기">
					</form:form>
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
    