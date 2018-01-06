
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<html>
<head>
<title>Fund List</title>
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

				<div class="filter">

					<p class="filter_title_1">Filter</p>

					<div class="filter_box1">
						<p class="filter_title_2">투자코인</p>
						<p class="filter_box1_check"><img src="/images/filter_on.png"> BTC</p>
						<p class="filter_box1_check"><img src="/images/filter_off.png"> ETH</p>
					</div>

					<div class="filter_box1">
						<p class="filter_title_2">신용등급</p>
						<select>
							<option>등급선택</option>
							<option>신용등급 공간</option>
							<option>신용등급 공간</option>
							<option>신용등급 공간</option>
							<option>신용등급 공간</option>
						</select>
					</div>
					
					<div class="filter_box1">
						<p class="filter_title_2">기간 <span style="color:#ccc;">(1~365로 설정)</span></p>
						<input type=""> ~ <input type="">
					</div>

					<div class="filter_box1">
						<p class="filter_title_2">투자모집 금액</p>
						<p>50~1억 최저/최고</p>
					</div>

				</div><!--.filter -->

				<div class="filter_list">

					<div class="title">
						<span class="sp_1">코인 펀드 투자 리스트</span>
						<!--<span class="sp_2">담보투자하기</span>-->
					</div><!--.title -->

					<div class="filter_list_tb_box">
						<table>
							<colgroup>
								<col width="12.5%">
								<col width="7%">
								<col width="12.5%">
								<col width="12.5%">
								<col width="12.5%">
								<col width="12.5%">
								<col width="12.5%">
							</colgroup>
							<tr>
								<th>신용등급</th>
								<th>기간</th>
								<th>투자 코인종류</th>
								<th>모집 금액</th>
								<th>코인 종류</th>
								<th>진행상황</th>
								<th>투자하기</th>
							</tr>
							<tr>
								<td>3hour</td>
								<td>35</td>
								<td>5%</td>
								<td>KRW</td>
								<td>1,000원</td>
								<td>채움바(개발)</td>
								<td><span>투자하기</span></td>
							</tr>
							<tr>
								<td>3hour</td>
								<td>35</td>
								<td>5%</td>
								<td>KRW</td>
								<td>1,000원</td>
								<td>채움바(개발)</td>
								<td><span>투자하기</span></td>
							</tr>
							<tr>
								<td>3hour</td>
								<td>35</td>
								<td>5%</td>
								<td>KRW</td>
								<td>1,000원</td>
								<td>채움바(개발)</td>
								<td><span>투자하기</span></td>
							</tr>
							<tr>
								<td>3hour</td>
								<td>35</td>
								<td>5%</td>
								<td>KRW</td>
								<td>1,000원</td>
								<td>채움바(개발)</td>
								<td><span>투자하기</span></td>
							</tr>
							<tr>
								<td>3hour</td>
								<td>35</td>
								<td>5%</td>
								<td>KRW</td>
								<td>1,000원</td>
								<td>채움바(개발)</td>
								<td><span>투자하기</span></td>
							</tr>
							<tr>
								<td>3hour</td>
								<td>35</td>
								<td>5%</td>
								<td>KRW</td>
								<td>1,000원</td>
								<td>채움바(개발)</td>
								<td><span>투자하기</span></td>
							</tr>
							<tr>
								<td>3hour</td>
								<td>35</td>
								<td>5%</td>
								<td>KRW</td>
								<td>1,000원</td>
								<td>채움바(개발)</td>
								<td><span>투자하기</span></td>
							</tr>
							<tr>
								<td>3hour</td>
								<td>35</td>
								<td>5%</td>
								<td>KRW</td>
								<td>1,000원</td>
								<td>채움바(개발)</td>
								<td><span>투자하기</span></td>
							</tr>
							<tr>
								<td>3hour</td>
								<td>35</td>
								<td>5%</td>
								<td>KRW</td>
								<td>1,000원</td>
								<td>채움바(개발)</td>
								<td><span>투자하기</span></td>
							</tr>
						</table><!--.table 끝 // td는 한 화면에 9개만 나오고, 10개부터는 페이징으로 넘어가야합니다. -->
					</div><!--.filter_list_tb_box -->

					<div class="pageing">
						<span class="on">1</span>
						<span>2</span>
						<span>3</span>
						<span>4</span>
						.
						.
						.
						<span>Next</span>
						<span>Last</span>
					</div>

				</div><!--.filter_list -->

			</div><!--.center_cont -->


		</div><!--.main_cont_L -->




		<!-- 우측 사이드박스 시작-->
		<div class="main_cont_R">
		
		</div><!--.main_cont_R -->

	
	</div><!--.contents -->

<%@ include file="../common/footer.jsp" %>
	
	
	
</div>

</body>

</html>
