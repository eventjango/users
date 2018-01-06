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


				<div class="coin_text3">
					1. 코인 전자지갑으로부터 회원님의 외부 전자지갑으로 비트코인을 출금합니다.<br>
					2. 모든 출금은 관리자가 확인 후 실행됩니다.
				</div>				
				<br><br>	
				
				<p class="withdraw_p">라이트코인 (LTC) 출금</p>	
				<table class="withdraw_tb">
					<colgroup>
						<col width="20%">
						<col width="80%">
					</colgroup>
					<tr>
						<td>출금 가능액</td>
						<td class="td1" id="balanceLTC"></td>
					</tr>
					<tr>
						<td>1일 출금 한도</td>
						<td class="td1">70.0005 LTC (횟수제한없음)</td>
					</tr>
					<tr>
						<td>1일 잔여 한도</td>
						<td class="td1">2000 LTC 현재 회원님은 인증 Level 4 단계입니다. &nbsp;<span>추가인증 받기</span></td>
					</tr>
					<tr>
						<td>라이트코인 출금 주소</td>
						<td class="td1"><input type="text">&nbsp;<span>LTC 주소록</span></td>
					</tr>
					<tr>
						<td>출금신청 금액</td>
						<td class="td1">
								<input type="text" class="in1" id="wantWithdrawMoney" placeholder="소수 4자리까지 입력 가능합니다" onchange="numchk(this)" onkeydown='return onlyNum(this,event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'>
								 LTC&nbsp;= <input type="text" class="in1"> KRW <span id="maximum">최대</span> <span class="gray">다시입력</span></td>
					</tr>
					<tr>
						<td>비트코인 출금 수수료</td>
						<td class="td1">0.0005 LTC</td>
					</tr>
					<tr>
						<td>실제 출금 총액</td>
						<td class="td1">0 LTC</td>
					</tr>
					<tr>
						<td>SMS인증번호</td>
						<td class="td1"><input type="text" class="in1">&nbsp;<span>인증요청</span> 회원정보에 등록된 휴대폰으로 전달받으신 인증번호를 입력하세요.</td>
					</tr>
					<tr>
						<td>보안비밀번호</td>
						<td class="td1"><input type="text" class="in1"></td>
					</tr>

				</table>


				
				<p class="coin_btn">라이트코인 (LTC) 출금요청</p>

				<div class="coin_text2">
					<span>라이트코인 (LTC) 출금시 주의사항</span>
					<div>
					* 라이트코인 (LTC) 지갑 주소를 반드시 확인하고 전달해 주세요.<br>
					* 비트코인 (BTC) 과 비트코인 캐시 (BCH) 간의 오입금건은 매월 마지막 주 일괄 처리 대 드리오나,<br>
					&nbsp;&nbsp;&nbsp;기술적으로 입금처리가 불가능할 경우가 있으니, 정확한 입금주소를 반드시 확인 후 입금해주시기 바랍니다.
					</div>
				</div>
				

			</div><!--.center_cont -->

		</div><!--.main_cont_L -->






		<!-- 우측 사이드박스 시작-->
		<div class="main_cont_R">
		
		</div><!--.main_cont_R -->

	
	</div><!--.contents -->
	<script type="text/javascript">
	var balanceCoin = $.number('${balanceLTC}');
	$("#balanceLTC").append(balanceCoin+"LTC");
	$(".gray").click(function(){
		$("#wantWithdrawMoney").val('');
	});
	$("#maximum").click(function(){
		$("#wantWithdrawMoney").val(balanceCoin); 
	});
	$(".coin_btn").click(function(){
			balance.money("${login.id}","LTC",$("#wantwithdrawmoney").val().replace(/,/gi,""));
	});
	function comma(ds){
		ds.value=ds.value.replace(/[^','^'.'^0-9]/g,'');
		if(ds.value.includes(".")){
			var num = $.number(ds.value.split(".")[0]) + ".";
			num += ds.value.split(".")[1].substring(0,4);
			ds.value = num;
		} else{
			ds.value=$.number(ds.value);
		}
		
		
}

function numchk(ds){
	var money = $("#wantWithdrawMoney").val().replace(/[^','^'.'^0-9]/g,'');
	coin = balanceCoin.replace(/[^'.'^0-9]/g,'');
	if(coin-money >= 0){
		comma(ds);
	 }else{
		alert("보유 금액보다 많은 금액 입력됨");
		$("#wantWithdrawMoney").val(balanceCoin);
		$("#wantWithdrawMoney").focus();
	}
}

function removeChar(event) {
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 || keyID == 110 || keyID == 190) {
		return;
	}else{
		comma(event.target);
	}
}

function onlyNum(value,e){
	  //누른 키값을 가져오기
	  //이벤트 객체 가져오기
	  var decChk =  /^(?:\d)+\.?\d{1,4}$/;
	  var event = e || window.event;
	  //누른 키 값 가져오기
	  //ie에서는 event.keycode가 가지고있고
	  //다른 브라우저는 event의 which가 키보드 값을 가지고 있습니다.
	  var keycode = event.keyCode || e.which;
	  if(decChk.test($(value).val())){
		  if(keycode>=48 && keycode<=57 || keycode>=96 && keycode<=105 || keycode==8 || keycode==46 || keycode==37 || keycode==39 || keycode == 110 || keycode == 190)
	          return true;  
	  }else{
		  if(keycode>=48 && keycode<=57 || keycode>=96 && keycode<=105 || keycode==8 || keycode==46 || keycode==37 || keycode==39)
			    return true;
	      
	  }
	  //크롬이나 파이어폭스에서  return false로 기본이벤트 제거가 안되면 
	  //아래코드를 추가합니다.
	  //이런 문제를 해결하고자 하는 경우에 jquery를 사용
	  event.preventDefault();
	  //IE에서 기본 이벤트를 제거
	  return false;
}
	
     var balance = {
    		money : function(id,type,value){
    			jData = JSON.parse("{}");
    			jData["id"] = id;
    			jData["type"] = type;
    			jData["value"] = value;
    			
	    			$.ajax({
	    		    	type: 'POST',	        
	    		    	url: '/withdraw/type/money',
	    		    	data: JSON.stringify(jData),
	    		    	contentType : "application/json; charset:utf-8",
	    		    	dataType: 'json',
	    		    	success: function (data) {
	    		    		alert(data.state);
	    		    	},
	    		    	error : function(request, status, error) {
	    		    		console.log("code : " + request.status + "\n" + "error : " + error);
	    		    	}
	    		});
    		}
    }
	
	</script>
    
<%@include file="../common/footer.jsp"%>

</div>

</body>
</html>
    