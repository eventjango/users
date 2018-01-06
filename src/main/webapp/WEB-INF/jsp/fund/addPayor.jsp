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
					<a href="/fund/payor/apply"><li class="on">펀딩 모집 신청하기</li></a>
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
					<p>이름</p>
					<input type="text" placeholder="이름">
					<br><br>
					<p>이메일</p>
					<input type="text" placeholder="이메일">
					<br><br>
					<p>휴대폰번호</p>
					<input type="text" placeholder="휴대폰번호">
					<br><br>
					<p>생년월일</p>
					<input type="text" placeholder="생년월일">
					<br><br>
					<p>성별</p>
					<input type="radio" name="gender" checked class="radio_in"> 남 &nbsp;&nbsp;&nbsp; <input type="radio" name="gender" class="radio_in"> 여
					<br><br>
					<p>연소득</p>
					<input type="text" placeholder="2000만원">
					<br><br>
					<p>직장규모</p>
					<select>
						<option>직장 규모를 선택해주세요.</option>
						<option>직장 규모</option>
						<option>직장 규모</option>
						<option>직장 규모</option>
					</select>
					<br><br>
					<p>재직 시작</p>
					<select style="width:48%">
						<option>년</option>
						<option>1990</option>
					</select>&nbsp;&nbsp;&nbsp;&nbsp;
					<select style="width:48%">
						<option>월</option>
						<option>1월</option>
						<option>2월</option>
						<option>3월</option>
						<option>4월</option>
						<option>5월</option>
						<option>6월</option>
						<option>7월</option>
						<option>8월</option>
						<option>9월</option>
						<option>10월</option>
						<option>11월</option>
						<option>12월</option>
					</select>
					<br><br>
					<p>성별</p>
					<input type="radio" name="gender" checked class="radio_in"> 매월 5일 &nbsp;&nbsp;&nbsp; <input type="radio" name="gender" class="radio_in"> 매월 15일 &nbsp;&nbsp;&nbsp; <input type="radio" name="gender" class="radio_in"> 매월 25일
					<br><br>
					<p>대출목적</p>
					<select>
						<option>대출 목적을 선택해주세요</option>
						<option>직장 규모</option>
						<option>직장 규모</option>
						<option>직장 규모</option>
					</select>
					<br><br>
					<p>알게된 경로</p>
					<select>
						<option>알게된 경로를 선택해주세요..</option>
						<option>직장 규모</option>
						<option>직장 규모</option>
						<option>직장 규모</option>
					</select>


					<br><br>
					<a href="fund/payor/apply"><p class="registration_btn">다음단계</p></a>
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
    