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
					* 모든 출금은 관리자 확인 후 실행됩니다.<br>
					* 출금자동화 시스템 점검 시간(23:00~02:00)에는 출금 요청을 하실 수 없습니다. [자세히보기]<br>
					* 코인이 충전된 KRW 포인트를 원하는 은행계좌로 출금 받을 수 있습니다. (단, 타인명의 출금은 불가능합니다.)
					<p>은행별 점검시간 확인</p>
				</div>				
				<br><br>	
				<table class="withdraw_tb">
					<colgroup>
						<col width="25%">
						<col width="25%">
						<col width="25%">
						<col width="25%">
					</colgroup>
					<tr>
						<td>수수료 건당<br>1,000 KRW</td>
						<td>출금 최소 금액<br>5,000 KRW</td>
						<td>일일 출금 한도<br>2,000,000,000 KRW</td>
						<td>월 출금 한도<br>무제한 KRW</td>
					</tr>
				</table>

				<p class="withdraw_p">금액입력</p>	
				<table class="withdraw_tb">
					<colgroup>
						<col width="20%">
						<col width="80%">
					</colgroup>
					<tr>
						<td>출금 가능액</td>
						<td class="td1" id="balanceKRW"></td>
					</tr>
					<tr>
						<td>출금요청 금액</td>
						<td class="td1">
								<input type="text" placeholder="1회 출금 한도는 10,000,000KRW (횟수 제한 없음)" id="wantWithdrawMoney" onchange="numchk(this)" onkeydown='return onlyNum(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'>
								&nbsp;
								<span id="maximum">최대</span>
								<span class="gray">다시입력</span>
						</td>
					</tr>
					<tr>
						<td>1일 잔여 한도</td>
						<td class="td1">2,000,000,000 KRW 현재 회원님은 인증 Level 4 단계입니다. &nbsp;<span>추가인증 받기</span></td>
					</tr>
					<tr>
						<td>1일 잔여 한도</td>
						<td class="td1">0 KRW</td>
					</tr>
				</table>

				<p class="withdraw_p">은행계좌 입력</p>	
				<table class="withdraw_tb">
					<colgroup>
						<col width="20%">
						<col width="80%">
					</colgroup>
					<tr>
						<td>출금 계좌 목록(즐겨찾기)</td>
						<td class="td1">
						<select>
							<option>계좌선택</option>
							<option>00-00000-000-00</option>
							<option>00-00000-000-00</option>
							<option>00-00000-000-00</option>
							<option>00-00000-000-00</option>
							<option>00-00000-000-00</option>
						</select>
						</td>
					</tr>
					<tr>
						<td>출금 은행</td>
						<td class="td1">
						<select>
							<option>은행명선택</option>
							<option>기업은행</option>
							<option>기업은행</option>
							<option>기업은행</option>
							<option>기업은행</option>
						</select>						
						</td>
					</tr>
					<tr>
						<td>출금 계좌번호</td>
						<td class="td1"><input type="text"> &nbsp;<span>추가인증 받기</span></td>
					</tr>
					<tr>
						<td>예금주</td>
						<td class="td1"><input type="text" placeholder="'예금주 명'을 확인하세요."></td>
					</tr>
				</table>

				<p class="withdraw_p">인증수단</p>	
				<table class="withdraw_tb">
					<colgroup>
						<col width="20%">
						<col width="80%">
					</colgroup>
					<tr>
						<td>휴대폰 인증</td>
						<td class="td1"><input type="text"> &nbsp;<span>인증요청</span></td>
					</tr>
					<tr>
						<td>보안비밀번호</td>
						<td class="td1"><input type="text"></td>
					</tr>
				</table>

				
				<p class="coin_btn">KRW 출금요청</p>

 				<div class="coin_text"> 
					* 계좌 등록이 안될 시 관리자에 문의하세요.<br>
					* 금융사고 예방을 위해 KRW 출금시 2~3일간 지연될 수 있습니다. [공지바로가기]<br>
					* 출금 신청한 KRW 금액에 출금 수수료 1,000KRW를 더한 금액이 코인 계정에서 차감됩니다.<br>
					&nbsp;&nbsp;&nbsp;Ex)10,000원 출금 신청 시, 수수료 1,000원이 합산된 총 11,000원이 회원님의 코인 계정 잔고에서 차감되고, 10,000원이 출금 계좌로 입금됩니다.
				</div>
				

			</div><!--.center_cont -->

		</div><!--.main_cont_L -->






		<!-- 우측 사이드박스 시작-->
		<div class="main_cont_R">
		
		</div><!--.main_cont_R -->

	
	</div><!--.contents -->
    
    <script type="text/javascript">
    var balanceKRW = $.number("${balanceKRW}");
	$("#balanceKRW").append(balanceKRW+"KRW");
	$(".gray").click(function(){
		$("#wantWithdrawMoney").val('');
	});
	$("#maximum").click(function(){
		$("#wantWithdrawMoney").val(balanceKRW);
	});
	$(".coin_btn").click(function(){
		
			if($("#wantWithdrawMoney").val()>=5000){
				balance.money("${login.id}","KRW",$("#wantWithdrawMoney").val().replace(/,/gi,""));
			}else{
				alert("출금 최소금액 미만");
				$("#wantWithdrawMoney").focus();
			}
	});
	function comma(ds){
			ds.value=ds.value.replace(/[^','^0-9]/g,'');
			ds.value=$.number(ds.value);
	}
	
	function numchk(ds){
		var money = $("#wantWithdrawMoney").val().replace(/[^','^0-9]/g,'');
		krw = balanceKRW.replace(/[^0-9]/g,'');
		if(krw-money >= 0){
			comma(ds); 
		}else{
			alert("보유 금액보다 많은 금액 입력됨");
			$("#wantWithdrawMoney").val(balanceKRW);
			$("#wantWithdrawMoney").focus();
		}
	}
	
	function removeChar(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) {
			return;
		}else{
			comma(event.target);
		}
	}
	
	function onlyNum(e){
		  //누른 키값을 가져오기.
		  //이벤트 객체 가져오기
		  var event = e || window.event;
		  //누른 키 값 가져오기
		  //ie에서는 event.keycode가 가지고있고
		  //다른 브라우저는 event의 which가 키보드 값을 가지고 있습니다.
		  var keycode = event.keyCode || e.which;
		 
		  if(keycode>=48 && keycode<=57 || keycode>=96 && keycode<=105 || keycode==8 || keycode==46 || keycode==37 || keycode==39)
		   return true;
		  
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
	    		    	url: '/withdraw/type/KRW',
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
    