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
					<a href='/deposit/type/KRW'><li>계좌입금</li></a>
					<a href='/deposit/type/Gift_Card'><li class="on">상품권 충전</li></a>
				</ul><!--.coin_tab -->
				
				<p class="cointitle">상품권 충전</p>
				<p>본 상품권은 전국 3,000 여개 pc방 및 온라인 가맹점에서 구매가 가능합니다.</p>
				<br>
				<img src="http://via.placeholder.com/800x200">
				<br><br>
				<table class="withdraw_tb">
					<colgroup>
						<col width="10%">
						<col width="80%">
						<col width="10%">
					</colgroup>
					<tr>
						<td>번호</td>
						<td>비트코인 상품권</td>
						<td>관리</td>
					</tr>
					<tr>
						<td>1</td>
						<td class="td2">쿠폰번호 &nbsp;<input type="text" placeholder="핀번호 복사 후 붙여넣기 기능, 특수기호는 입력 하실 수 없습니다."></td>
						<td class="td1" style="text-align:center;"><span>관리</span></td>
					</tr>
					<tr>
						<td>1</td>
						<td class="td2">쿠폰번호 &nbsp;<input type="text" placeholder="핀번호 복사 후 붙여넣기 기능, 특수기호는 입력 하실 수 없습니다."></td>
						<td class="td1" style="text-align:center;"><span class="gray">삭제</span></td>
					</tr>
				</table>	

				<div class="coin_btn_center">
					<span class="coin_btn2">확인</span> &nbsp;<span class="coin_btn3">취소</span>
				</div>

				<div class="coin_text2">
					* 텍스트들어갈 공간<br>
					* 텍스트들어갈 공간<br>
					* 텍스트들어갈 공간<br>
					* 텍스트들어갈 공간<br>
					* 텍스트들어갈 공간<br>
					* 텍스트들어갈 공간<br>
					* 텍스트들어갈 공간<br>
				</div>

				<br><br>
				<div class="withdraw_p">비트코인 상품권 적립 이력 &nbsp;&nbsp;<span>총 0건 , 합계 0원</span>
				
					<p class="data"><input type="text"> ~ <input type="text"><span>검색</span></p>
				</div>
				<table class="withdraw_tb">
					<colgroup>
						<col width="25%">
						<col width="25%">
						<col width="25%">
						<col width="25%">
					</colgroup>
					<tr>
						<td>적립요청일</td>
						<td>핀번호</td>
						<td>적립금액</td>
						<td>적립상태</td>
					</tr>
					<tr>
						<td colspan="4">적립 이력이 없습니다.</td>
					</tr>

				</table>	

				

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
    