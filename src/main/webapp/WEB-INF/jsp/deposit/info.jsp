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
				<!-- 
				<ul class="coin_tab">
					<a href='/deposit/type/info'><li class="on">계좌입금</li></a>
					<a href='/deposit/type/Gift_Card'><li>상품권 충전</li></a>
				</ul>
				 -->
				<!--.coin_tab -->
				
				<p class="cointitle">입금 계좌번호 안내</p>

				<div class="issuance_box">

					<div class="is_box">
						<table>
							<colgroup>
								<col width="30%">
								<col width="70%">
							</colgroup>
							<tr>
								<td class="td1">은행명</td>
								<td>신한은행</td>
							</tr>
							<tr>
								<td class="td1">예금주</td>
								<td>홍길동_(주)코인</td>
							</tr>
							<tr>
								<td class="td1">계좌번호</td>
								<td>00-000-00000-00</td>
							</tr>
						</table>
					</div>
					
					<div class="is_box">
						<p>발급가능 계좌 수 &nbsp;&nbsp;&nbsp;&nbsp;<span class="blue">1회</span> / <span>5회</span></p>
						<p class="time">잔여시간</p>
						<div class="time_box">
							<div class="progress">
								<span class="count"></span>
								<div class="progress-bar"></div>
							</div>
							<!-- <span class="time0"></span> -->
							<span class="time1"></span>
							<span class="time2"></span>
							<span class="time3"></span>
						</div><!--.time_box -->
					</div><!--.is_box -->

					<div class="is_box2">
						* 계좌 이체시 '받는분 통장표시 내용' / '받는통장메모'에 예금주를 입력해주세요.<br>
						* 과거 입출금 내역은 거래 내역현황 페이지에서 확인 가능합니다.<br>
						* 사용시간 지나면 사용할 수 없으며, 1회용 계좌를 새로 발급 받으셔야 합니다.
					</div>

					</div><!--.issuance_box -->

					<p class="cointitle">실시간 1회용 가상계좌 발급 안내</p>
					<div class="coinbox">
						<a href="https://placeholder.com"><img src="http://via.placeholder.com/100x100"></a><br>
						1회용 가상계좌 발급
					</div>
					<div class="coinbox">
						<a href="https://placeholder.com"><img src="http://via.placeholder.com/100x100"></a><br>
						이미지 텍스트
					</div>
					<div class="coinbox">
						<a href="https://placeholder.com"><img src="http://via.placeholder.com/100x100"></a><br>
						이미지 텍스트
					</div>
					<div class="coinbox" style="margin-right:0;">
						<a href="https://placeholder.com"><img src="http://via.placeholder.com/100x100"></a><br>
						이미지 텍스트
					</div>

					<div class="coin_text">
						* 코인에서 가상화폐를 구매하려면 원화(KRW)를 충전해야 합니다.
					</div>
				
			</div><!--.center_cont -->

		</div><!--.main_cont_L -->






		<!-- 우측 사이드박스 시작-->
		<div class="main_cont_R">
		
		</div><!--.main_cont_R -->

	
	</div><!--.contents -->
	<script type="text/javascript">
    /* function pad(n, width) {
        n = n + '';
        return n.length >= width ? n : new Array(width - n.length + 1).join('0') + n;
    } */
    var pad = function(x) {
    	return (x < 10) ? "0"+x : x; 
    }
    function setTime(seconds) {
        var time = '';
        if(parseInt(seconds / (60*60)) > 0){
            time += pad(parseInt(seconds / (60*60))) + "시간";
        }
        
        if(parseInt(seconds / 60 % 60) > 0){
        	/* if(time == ''){
        		time += pad(parseInt(seconds / 60 % 60)) + "분";	
        	}else{
        		time += ":" + pad(parseInt(seconds / 60 % 60)) + "분";
        	} */
        	time += pad(parseInt(seconds / 60 % 60)) + "분";
        }
        
        if(seconds % 60 > 0){
        	/* if(time == ''){
        		time += pad(seconds % 60) + "초";
        	}else{
        		time += ":" + pad(seconds % 60) + "초";
        	} */
        	time += pad(Math.round(seconds % 60)) + "초";
        }
        return  time;
    }
    var shown = true;
    var toggleCount = 0;
    function toggle(text) {
        var blink = setInterval(function(){
            if(shown) {
            
                text.hide();
                
                toggleCount++;
                shown = false;
            
            } else {
            
                text.show();
                if(toggleCount == 10){
                	clearInterval(blink);
                }
                
                shown = true;
        
            }
        }, 500);
    }
  
    var hh = 3;
    var mm = 0;
    var ss = 0;
    var fullTime = hh*3600 + mm * 60 + ss;
    var setMaxTime = '';
    var setHalfTime = '';
    $(".count").append(pad(hh) + ":" + pad(mm) + ":" + pad(ss));
    setMaxTime = setTime(fullTime);
    setHalfTime = setTime(fullTime/2);
    $(".time1").text(0);
    $('.time2').text(setHalfTime);
    $(".time3").text(setMaxTime);
    $(".progress-bar").progressbar({
		value : 100
	});
     var count = setInterval(function(){
        ss -= 1;
        if(ss < 0){
        
            mm -= 1;
            ss = 59;
        }
        		
        if(mm < 0){
            hh -= 1;
            mm = 59;
        }
        $(".progress-bar").progressbar({
			value : (hh*3600 + mm * 60 + ss) / fullTime * 100
		});
        $(".count").empty();
        $(".count").append(pad(hh) + ":" + pad(mm) + ":" + pad(ss));
        
        		
        if(hh < 0){
        	$(".progress-bar").attr('id','redDiv');
        	$(".count").addClass('whiteText');
            $(".count").empty();
            $(".count").append("시간이 초과되었습니다");
            toggle($(".count"));
            clearInterval(count);
        }
        
    		
    }, 1000);
	</script>
    
<%@ include file="../common/footer.jsp"%>

</div>

</body>
</html>
    