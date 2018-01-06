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

				<!--<ul class="coin_tab">
					<li class="on">계좌입금</li>
					<li>상품권 충전</li>
				</ul> .coin_tab -->
				
				<p class="cointitle_big">리플(XRP)</p>

				<div class="coin_text">
					* 아래 주소로 리플(XRP) 을 입금해주세요.<br>
					* 신규가입하신 회원님께서는 주소 생성하기 버튼을 클릭하셔야 고유 리플(XRP) 주소가 발급됩니다.<br>
				</div>

				<p class="coin_btn">리플(XRP) 주소 생성 하기</p>

				<!-- 주소와 qr코드 박스 / 위에 버튼을 누르면 이 박스가 나타나게 하면 될듯합니다. -->
				<div class="deposit">
					<p class="p1">회원님의 리플(XRP) 입금 주소 :</p>
					<p class="p2">0S7GD0G809DS8790G70DG6GS0S0</p>
					<p class="p3"><img src="/images/qr.png"></p>
				</div><!-- 주소와 qr코드 끝-->

				<div class="coin_text">
					* 회원님께 할당된 위 리플(XRP) 주소로 리플(XRP)을 전송하시면 회원님의 전자지갑에 반영됩니다.<br>
					* 반영 시점 : 입금거래 후 10~30분 이후 자동으로 반영됩니다.<br>
				</div>

				<div class="coin_text2">
					<span>리플(XRP) 입금시 주의사항</span>
					<div>
					* 주의사항 텍스트가 들어갈 공간<br>
					* 주의사항 텍스트가 들어갈 공간<br>
					* 주의사항 텍스트가 들어갈 공간<br>
					* 주의사항 텍스트가 들어갈 공간<br>
					</div>
				</div>

				

			</div><!--.center_cont -->

		</div><!--.main_cont_L -->






		<!-- 우측 사이드박스 시작-->
		<div class="main_cont_R">
		
		</div><!--.main_cont_R -->

	
	</div><!--.contents -->
	<script type="text/javascript">
	$(".deposit").hide();
	$(".coin_btn").click(function(){
		$(".coin_btn").slideUp('slow', function() {
			$(".coin_btn").remove();
		});
		$('.deposit').slideDown('slow', function() {});
		
	});
	</script>
	
<%@include file="../common/footer.jsp"%>

</div>

</body>
</html>
    