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
					<a href="/calendar/profit"><li>투자 수익 스케쥴</li></a>
					<a href="/calendar/loss"><li class="on">이자 지출 스케쥴</li></a>
				</ul>
			</div><!--.side_menu -->

			<div class="center_cont">

				<div class="wrap2">

					<div class="box on">
						<h4 class="t1"><a href="#">지급스케쥴</a></h4>
						<div class="pannel2">
							
							<!-- calendar 시작-->
							<div class="calendar">
								<p class="calendar_p"><span>◀</span>&nbsp;&nbsp; November 2017 &nbsp;&nbsp;<span>▶</span></p>	

								<table class="calendar_tb2">
									<colgroup>
										<col width="14%">
										<col width="14%">
										<col width="14%">
										<col width="14%">
										<col width="14%">
										<col width="14%">
										<col width="14%">
									</colgroup>
									<tr>
										<th>SUN</th>
										<th>MON</th>
										<th>TUE</th>
										<th>WED</th>
										<th>THU</th>
										<th>FRI</th>
										<th>SAT</th>
									</tr>
									<tr>
										<td><span class="days">1</span><span class="gray_sp">10,000</span><span class="red_sp">20,000</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
									</tr>
									<tr>
										<td><span class="days">1</span><span class="gray_sp">10,000</span><span class="red_sp">20,000</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
									</tr>
									<tr>
										<td><span class="days">1</span><span class="gray_sp">10,000</span><span class="red_sp">20,000</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
									</tr>
									<tr>
										<td><span class="days">1</span><span class="gray_sp">10,000</span><span class="red_sp">20,000</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
									</tr>
									<tr>
										<td><span class="days">1</span><span class="gray_sp">10,000</span><span class="red_sp">20,000</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
									</tr>
								</table>
							</div><!-- calendar 끝-->

							<!-- 우측 지급,지불 작은박스 -->
							<div class="tab">
								<div class="wrap1 ex">
									<ul class="tab1 cf">
										<li class="on"><a href="#">지급</a></li>
										<li><a href="#">지불</a></li>      
									</ul>
									<ul class="pannel1">
										<li class="on">
											<p><span class="left">총자산</span><span class="right">00,000원</span></p>
											<p><span class="left">담보대출총금액</span><span class="right">00,000원</span></p>
											<p><span class="left">이자지불된금액</span><span class="right">00,000원</span></p>
											<p><span class="left">잔여금액</span><span class="right">00,000원</span></p>
											<p><span class="left">연체금액</span><span class="right">00,000원</span></p>
											<p style="margin-bottom:0;"><span class="left">이자수익</span><span class="right">00,000000원</span></p>
											<p><span class="left" style="color:#aaa;">(세금별도)</span><span class="right"></span></p>
											<p><span class="left">이체</span><span class="right">00,000원</span></p>
										</li>
										<li>
											<p><span class="left">총자산</span><span class="right">00,000원</span></p>
											<p><span class="left">담보대출총금액</span><span class="right">00,000원</span></p>
											<p><span class="left">이자지불된금액</span><span class="right">00,000원</span></p>
											<p><span class="left">잔여금액</span><span class="right">00,000원</span></p>
											<p><span class="left">연체금액</span><span class="right">00,000원</span></p>
											<p style="margin-bottom:0;"><span class="left">이자수익</span><span class="right">00,000000원</span></p>
											<p><span class="left" style="color:#aaa;">(세금별도)</span><span class="right"></span></p>
											<p><span class="left">이체</span><span class="right">00,000원</span></p>
										</li>
									</ul>
								</div><!--.wrap1 ex -->
							</div><!--.tab -->

							<div class="case"><span class="gray">다가오는 예정 지불/지급 금액</span> &nbsp;<span class="red">이체된 금액</span></div>
							
							<table class="calendar_tb">
								<colgroup>
									<col width="20%">
									<col width="20%">
									<col width="20%">
									<col width="20%">
									<col width="20%">
								</colgroup>
								<tr>
									<th>지급날짜</th>
									<th>체결거래번호</th>
									<th>차수</th>
									<th>금액</th>
									<th>지불현황</th>
								</tr>
								<tr class="tr1">
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
								<tr class="tr1">
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

						</div><!--.pannel2 -->
					</div><!--.box-->


					<div class="box">
						<h4 class="t2"><a href="#">지불스케쥴</a></h4>
						<div class="pannel2">
							<!-- calendar 시작-->
							<div class="calendar">
								<p class="calendar_p"><span>◀</span>&nbsp;&nbsp; November 2017 &nbsp;&nbsp;<span>▶</span></p>	

								<table class="calendar_tb2">
									<colgroup>
										<col width="14%">
										<col width="14%">
										<col width="14%">
										<col width="14%">
										<col width="14%">
										<col width="14%">
										<col width="14%">
									</colgroup>
									<tr>
										<th>SUN</th>
										<th>MON</th>
										<th>TUE</th>
										<th>WED</th>
										<th>THU</th>
										<th>FRI</th>
										<th>SAT</th>
									</tr>
									<tr>
										<td><span class="days">1</span><span class="gray_sp">10,000</span><span class="red_sp">20,000</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
									</tr>
									<tr>
										<td><span class="days">1</span><span class="gray_sp">10,000</span><span class="red_sp">20,000</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
									</tr>
									<tr>
										<td><span class="days">1</span><span class="gray_sp">10,000</span><span class="red_sp">20,000</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
									</tr>
									<tr>
										<td><span class="days">1</span><span class="gray_sp">10,000</span><span class="red_sp">20,000</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
									</tr>
									<tr>
										<td><span class="days">1</span><span class="gray_sp">10,000</span><span class="red_sp">20,000</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
									</tr>
								</table>
							</div><!-- calendar 끝-->

							<!-- 우측 지급,지불 작은박스 -->
							<div class="tab">
								<div class="wrap1 ex">
									<ul class="tab2 cf">
										<li class="on"><a href="#">지급</a></li>
										<li><a href="#">지불</a></li>      
									</ul>
									<ul class="pannel5">
										<li class="on">
											<p><span class="left">총자산</span><span class="right">00,000원</span></p>
											<p><span class="left">담보대출총금액</span><span class="right">00,000원</span></p>
											<p><span class="left">이자지불된금액</span><span class="right">00,000원</span></p>
											<p><span class="left">잔여금액</span><span class="right">00,000원</span></p>
											<p><span class="left">연체금액</span><span class="right">00,000원</span></p>
											<p style="margin-bottom:0;"><span class="left">이자수익</span><span class="right">00,000000원</span></p>
											<p><span class="left" style="color:#aaa;">(세금별도)</span><span class="right"></span></p>
											<p><span class="left">이체</span><span class="right">00,000원</span></p>
										</li>
										<li>
											<p><span class="left">총자산</span><span class="right">00,000원</span></p>
											<p><span class="left">담보대출총금액</span><span class="right">00,000원</span></p>
											<p><span class="left">이자지불된금액</span><span class="right">00,000원</span></p>
											<p><span class="left">잔여금액</span><span class="right">00,000원</span></p>
											<p><span class="left">연체금액</span><span class="right">00,000원</span></p>
											<p style="margin-bottom:0;"><span class="left">이자수익</span><span class="right">00,000000원</span></p>
											<p><span class="left" style="color:#aaa;">(세금별도)</span><span class="right"></span></p>
											<p><span class="left">이체</span><span class="right">00,000원</span></p>
										</li>
									</ul>
								</div><!--.wrap1 ex -->
							</div><!--.tab -->

							<div class="case"><span class="gray">다가오는 예정 지불/지급 금액</span> &nbsp;<span class="red">이체된 금액</span></div>
							
							<table class="calendar_tb">
								<colgroup>
									<col width="20%">
									<col width="20%">
									<col width="20%">
									<col width="20%">
									<col width="20%">
								</colgroup>
								<tr>
									<th>지급날짜</th>
									<th>체결거래번호</th>
									<th>차수</th>
									<th>금액</th>
									<th>지불현황</th>
								</tr>
								<tr class="tr1">
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
								<tr class="tr1">
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

						</div><!--.pannel2 -->
					</div><!--.box-->

				</div><!--.wrap2-->

				<!-- 지급스케쥴의 우측 지불 지급 탭 메뉴 -->
				<script>
				// .tab1 li를 클릭
				$(".tab2 li").click(function(){
					// 1)내자신의 인덱스값을 변수 i에 저장 -index()명령
					var i = $(this).index();
					// 2).tab1의 상태 변경하기.
					//    -모든 tab1 li를 선택 > on클래스 삭제하기
					$(".tab2 li").removeClass("on");
					//    -내자신선택 > on클래스 추가하기
					$(this).addClass("on");
					// 3).pannel1의 상태 변경하기
					//    - 모든 .pannel1 li를 선택 > on클래스 삭제하기
					$(".pannel5 li").removeClass("on")
					//    - 모든 .pannel1 li중 순서값이 i인 대상을 선택 -eq명령 > on클래스 추가하기
					$(".pannel5 li").eq(i).addClass("on");
					// 4) a태그의 링크 무효화.
					return false;  
					});
				</script><!-- 우측 지불 지급 탭 메뉴 끝 -->


				<!-- 지불스케쥴의 우측 지불 지급 탭 메뉴 -->
				<script>
				// .tab1 li를 클릭
				$(".tab1 li").click(function(){
					// 1)내자신의 인덱스값을 변수 i에 저장 -index()명령
					var i = $(this).index();
					// 2).tab1의 상태 변경하기.
					//    -모든 tab1 li를 선택 > on클래스 삭제하기
					$(".tab1 li").removeClass("on");
					//    -내자신선택 > on클래스 추가하기
					$(this).addClass("on");
					// 3).pannel1의 상태 변경하기
					//    - 모든 .pannel1 li를 선택 > on클래스 삭제하기
					$(".pannel1 li").removeClass("on")
					//    - 모든 .pannel1 li중 순서값이 i인 대상을 선택 -eq명령 > on클래스 추가하기
					$(".pannel1 li").eq(i).addClass("on");
					// 4) a태그의 링크 무효화.
					return false;  
					});
				</script><!-- 우측 지불 지급 탭 메뉴 끝 -->



				<!-- 스케쥴 전체박스 스크립트-->
				<script>
				$(".wrap2 .box h4").mouseover(function(){
					$(".wrap2 .box").removeClass("on");
					$(this).parent(".box").addClass("on");
					return false;
					});
				</script><!-- 스케쥴 전체박스 스크립트 끝 -->	
				
							
			
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
    