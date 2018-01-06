<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>HOME</title>

<%@ include file="../common/layout.jsp" %>
<script>
$(function(){
	//텝메뉴
	$(function(){
		var btn = $(".tab_menu li");
		var list = $(".tab_menu div");
		list,btn.each(function(){		 
			var	ind = $(this).index()-1;		
			ind++;
			$(this).click(function(){
				list.hide().eq(ind).show();
				btn.removeClass().eq(ind).addClass("on");
			});
		});
		btn.eq(0).addClass("on");
		list.eq(0).show();
	});
});
</script>
</head>
<body>
<div id="wrap">
	<%@ include file="../common/header.jsp" %>
	<%@ include file="../common/menu.jsp" %>


<div class="contents">

		<div class="main_cont_L">
			
			<div class="side_menu">
				<ul>
					<a href="/history/profit"><li class="on">투자 수익</li></a>
					<a href="/history/loss"><li>론 지출</li></a>
				</ul>
			</div><!--.side_menu -->

			<div class="center_cont">

				<p class="cointitle"><a href="#">나의 투자</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">쿠폰</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">나의 투자</a></p>

				<div class="investment_L">
					<p class="p1">${userName}</p>
					<p class="p2">자산현황</p>

					<%--<div class="asset">
						<span class="sp1">코인</span><span class="sp2">거래가능</span><span class="sp3">투자중</span>
					</div>
					<div class="asset_krw">
						<span class="sp1">KRW</span><span class="sp2">26</span><span class="sp3">투자중</span>
						<p class="line"></p><p class="line2"></p>
					</div>
					<div class="asset_btc">
						<span class="sp1">BTC</span><span class="sp2">26</span><span class="sp3">투자중</span>
						<p class="line"></p><p class="line2"></p>
					</div>
					<div class="asset_eth">
						<span class="sp1">ETH</span><span class="sp2">26</span><span class="sp3">투자중</span>
						<p class="line"></p><p class="line2"></p>
					</div>
					<div class="asset_qtum">
						<span class="sp1">QTUM</span><span class="sp2">26</span><span class="sp3">투자중</span>
						<p class="line"></p><p class="line2"></p>
					</div>
					<div class="asset_xrp">
						<span class="sp1">XRP</span><span class="sp2">26</span><span class="sp3">투자중</span>
						<p class="line"></p><p class="line2"></p>
					</div>
					<div class="asset_ltc">
						<span class="sp1">LTC</span><span class="sp2">26</span><span class="sp3">투자중</span>
						<p class="line"></p><p class="line2"></p>
					</div>
					<div class="asset_bch">
						<span class="sp1">BCH</span><span class="sp2">26</span><span class="sp3">투자중</span>
						<p class="line"></p><p class="line2"></p>
					</div>
					<br>--%>

					<table>

						<colgroup>
							<col width="15%">
							<col width="50%">
							<col width="40%">
						</colgroup>
						<tr>
							<th>코인</th>
							<th>거래가능</th>
							<th>투자중</th>
						</tr>

						<c:forEach items="${myCoinStatus}" var="coinStatus">
							<tr>
								<td>${coinStatus.coinValue}</td>
								<td>${coinStatus.coinAmount}</td>
								<td>0</td>
							</tr>
						</c:forEach>

					</table>

					<div class="p3">총 자산</div>
					<br>
					<div class="asset">
						<span class="sp1">총자산</span><span class="sp3">1,000,000</span>
					</div>
					<!-- 
					<div class="asset_div1">
						<span class="sp1">Lv2</span><span class="sp3"></span>
					</div>
					<div class="asset_div2">
						<span class="sp1">거래금액</span><span class="sp3">38,927,904 / <span style="color:#aaa;">100,000,000원</span></span>
						<p class="line"></p>
						<p class="line2"></p>
						<p class="text">다음레벨까지 거래금액 631,072,096원 남음</p>
					</div>
					 -->	
				</div>
			
				<div class="investment_R">
					<div class="inv_div1">
						<p class="p1">잔여투자한도</p>
						<p class="p2">1,000,000원</p>
						<p class="p3"></p>
						<p class="p4"><span class="spL">0원</span><span class="spR">1,000만원</span></p>
						<p class="p5"><span class="spL">투자금(잔액기준)</span><span class="spR">전체 투자 한도</span></p>
					</div>
					<div class="inv_div1">
						<p class="p1">투자상태</p>
						<p class="p2">0원</p>
						<p class="p3"></p>
						<p class="p4"><span class="spL">론투자</span><span class="spR">0원</span></p>
						<p class="p4" style="margin-top:5px;"><span class="spL">펀딩투자</span><span class="spR">0원</span></p>
					</div>
					<div class="inv_div1" style="margin-right:0;">
						<p class="p1">수익률<span style="margin-left:75px; font-size:20px;">0.0%</span></p>
						<p class="p2"><span style="margin-right:106px;">누적금액</span>0원</p>
						<p class="p3"></p>
						<p class="p4"><span class="spL">지급원금</span><span class="spR">0원</span></p>
						<p class="p4" style="margin-top:5px;"><span class="spL">세후이자</span><span class="spR">0원</span></p>
						<p class="p4" style="margin-top:5px;"><span class="spL">안심펀드</span><span class="spR">0원</span></p>
					</div>
					
					<div class="inv_div2">
						<p>상품 수익률 리스크 등급</p>

						<div class="graph_box">담보론투자</div>
						<div class="graph_box">펀딩투자</div>
						<div class="graph_box">수익률</div>
					</div>

					<div class="inv_div3">
						<div class="number_box">전체 <span>0</span></div>
						<div class="number_box">상환중 <span>0</span></div>
						<div class="number_box">단기연체 <span>0</span></div>
						<div class="number_box">장기연체 <span>0</span></div>
						<div class="number_box">손실 <span>0</span></div>
						<div class="number_box">상환완료 <span>0</span></div>
					</div>
				</div>

				<p style="clear:both;"></p>

				<br><br>

				<div class="tab_menu">
					<ul>
						<li><span>거래내역</span></li>
						<li><span>지급현황</span></li>

					</ul>

					<div>
						<table>
							<colgroup>
								<col width="20%">
								<col width="20%">
								<col width="20%">
								<col width="20%">
								<col width="20%">
							</colgroup>
							<tr>
								<th>날짜</th>
								<th>구분</th>
								<th>거래내역</th>
								<th>입출금 금액</th>
								<th>거래 후 잔액</th>
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

						<p class="p_bt">
							<span>누적 이익 : 000,000원</span><br>
							<span>잔여 이익 : 000,000원</span><br>
							<span>예상 총 이익 : 000,000원</span><br>
						</p>
					</div>

					<div>
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
								<th>회차</th>
								<th>예정일</th>
								<th>지급일</th>
								<th>이자</th>
								<th>연체이자</th>
								<th>수익률</th>
								<th>플랫폼 사용료</th>
								<th>세금</th>
								<th>실지급금액</th>
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
						
						<p class="p_bt">
							<span>누적 이익 : 000,000원</span><br>
							<span>잔여 이익 : 000,000원</span><br>
							<span>예상 총 이익 : 000,000원</span><br>
						</p>
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