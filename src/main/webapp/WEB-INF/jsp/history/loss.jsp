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
			
			<div class="side_menu">
				<ul>
					<a href="/history/profit"><li>투자 수익</li></a>
					<a href="/history/loss"><li class="on">론 지출</li></a>
				</ul>
			</div><!--.side_menu -->

			<div class="center_cont">


				<div class="investment_L">

					<span>가입일 : 2017-11-17</span>

					<p class="line" style="width:100%; height:1px; background:#ddd; margin:7px 0 20px 0;"></p>

					<p class="lon_p1">나의 예치금</p>
					<p class="lon_p2">0원</p>
					<p class="lon_p3">충전하기</p>
					<p class="lon_p4">예치금 관리</p>

					<p class="line" style="width:100%; height:1px; background:#ddd; margin:20px 0 20px 0;"></p>
					
					<p class="lon_p2">이달의 상환예정금</p>
					<p class="lon_p5"><span class="sp_L">원금</span><span class="sp_R">0 원</span></p>
					<p class="lon_p5"><span class="sp_L">이자</span><span class="sp_R">0 원</span></p>
					<p class="lon_p5"><span class="sp_L">세금</span><span class="sp_R">0 원</span></p>
					<p class="lon_p5"><span class="sp_L">수수료</span><span class="sp_R">0 원</span></p>

					<p class="lon_p6">00,000원</p>
					
					<p class="lon_p5"><span class="sp_L">상환 예정금(세후)</span><span class="sp_R">0 원</span></p>
					<p class="lon_p7">이달의 상환 내역 상세보기</p>


				</div>
			
				<div class="investment_R">
				
					<ul class="repay">
						<li><span class="sp_L">전체</span> <span class="sp_R">1</span></li>
						<li><span class="sp_L">신청중</span> <span class="sp_R">1</span></li>
						<li><span class="sp_L">상환중</span> <span class="sp_R">1</span></li>
						<li><span class="sp_L">연체중</span> <span class="sp_R">1</span></li>
						<li><span class="sp_L">상환완료</span> <span class="sp_R">1</span></li>
						<li><span class="sp_L">부도</span> <span class="sp_R">1</span></li>
					</ul>

					<div class="repay_box">

						<div class="repay_01">
							<p class="repay_p1">총 투자금액</p>
							<p class="repay_p2">0,000,000원</p>
							<p class="repay_p3"><span class="sp_L">투자신청중</span> <span class="sp_R">0원</span></p>
						</div>
						<div class="repay_01">
							<p class="repay_p1">총 상환금</p>
							<p class="repay_p2">0원</p>
							<p class="repay_p3"><span class="sp_L">상환원금</span> <span class="sp_R">0원</span><br><span class="sp_L">상환이자(세후)</span> <span class="sp_R">0원</span></p>

						</div>
						<div class="repay_01" style="margin-right:0;">
							<p class="repay_p1">나의 평균 수익률</p>
							<p class="repay_p2">13.50%</p>
							<p class="repay_p3"><span class="sp_L">부도율</span> <span class="sp_R">0.00%</span></p>
						</div>
					</div>

					<div class="repay_tb">
						<p>이달의 상환스케쥴</p>
						<span class="repay_sp1">월별 상환 스케쥴</span><span class="repay_sp2">상세보기</span>
						<table>
							<colgroup>
								<col width="12.5%">
								<col width="12.5%">
								<col width="12.5%">
								<col width="12.5%">
								<col width="12.5%">
								<col width="12.5%">
								<col width="12.5%">
								<col width="12.5%">
							</colgroup>
							<tr>
								<th>상환일</th>
								<th>차수</th>
								<th>상품명</th>
								<th>투자금액</th>
								<th>금리</th>
								<th>원금</th>
								<th>이자</th>
								<th>상태</th>
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
							</tr>
						</table>
					</div>


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
    