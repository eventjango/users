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
					<a href="/fund/payor/apply"><li>펀딩 모집 신청하기</li></a>
					<a href="/fund/invest/list"><li class="on">펀드 투자하기</li></a>
					<a href="/fund/invest/history"><li>주문 및 거래 내역</li></a>
					<!-- <a href="#"><li>지급 스케쥴</li></a> -->
				</ul>
			</div><!--.side_menu -->

			<div class="center_cont">

				<p class="center_cont_title">투자자 등록하기</p>
				<p class="center_cont_p1">왜 주민번호와 주소 정보가 필요한가요?</p>
				<p class="center_cont_p2">비트코인은 투자 수익에 대한 세금을 원천징수해야 하는 의무를 가지고 있습니다.<br>이를 위해서만 사용되며 다른 용도로 사용되지 않습니다.</p>
					
				<div class="registration_box">

					<form:form commandName="fundInvestorVO" action="/fund/invest/add" method="post">

					<p>주민등록번호</p>
						<form:input path="beforePersonalCode" cssClass="in_1"/> - <form:input path="afterPersonalCode" cssClass="in_1"/>
						<br/><form:errors path="beforePersonalCode"/>
						<br/><form:errors path="afterPersonalCode"/>
					<br><br>

					<p>자택주소</p>
						<form:input path="address"/>
						<form:errors path="address"/>
					<br><br>

					<p>출금용 계좌</p>
					<span style="color:#aaa;">투자 수익을 돌려받는 계좌로 사용됩니다.<br>본인 명의의 계좌를 사용해주세요.</span>
					<br>
						<form:select path="bankName">
							<option value="기업은행">기업은행</option>
							<option value="신한은행">신한은행</option>
							<option value="국민은행">국민은행</option>
						</form:select>

						<%--<input type="text" placeholder="'-'없이 숫자만 이용해 입력해주세요.">--%>
						<form:input path="accountCode" />
						<form:errors path="accountCode"/>

					<p>가입경로</p>
					<br>
						<form:select path="addPath">
							<form:option value="1">포털사이트(네이버,다음)</form:option>
							<form:option value="2">카페</form:option>
							<form:option value="3">블로그</form:option>
							<form:option value="4">지인추천</form:option>
							<form:option value="5">기타</form:option>
						</form:select>
					<br><br>


					<p>추천인 코드(선택항목)</p>
					<%--<input type="text" placeholder="추천인 코드를 입력해주세요.">--%>
						<form:input path="recommendationCode"/>
					<br><br><br>

					<%--<p class="registration_btn">완료하기</p>--%>

						<input class="registration_btn" type="submit" value="완료하기">
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
    