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
				
				<p class="withdraw_p">비트코인 캐시 (BCH) 출금</p>	
				<table class="withdraw_tb">
					<colgroup>
						<col width="20%">
						<col width="80%">
					</colgroup>
					<tr>
						<td>출금 가능액</td>
						<td class="td1" id="balanceBCH"></td>
					</tr>
					<tr>
						<td>1일 출금 한도</td>
						<td class="td1">70.0005 BCH (횟수제한없음)</td>
					</tr>
					<tr>
						<td>1일 잔여 한도</td>
						<td class="td1">2000 BCH 현재 회원님은 인증 Level 4 단계입니다. &nbsp;<span>추가인증 받기</span></td>
					</tr>
					<tr>
						<td>비트코인캐시 출금 주소</td>
						<td class="td1"><input type="text" id="account">&nbsp;<span id="open_address">BCH 주소록</span></td>
					</tr>
					<tr>
						<td>출금신청 금액</td>
						<td class="td1">
								<input type="text" class="in1" id="wantWithdrawMoney" placeholder="소수 4자리까지 입력 가능합니다" onchange="numchk(this)" onkeydown='return onlyNum(this,event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'>
								 BCH&nbsp;= <input type="text" class="in1"> KRW <span id="maximum">최대</span> <span class="gray">다시입력</span></td>
					</tr>
					<tr>
						<td>비트코인 출금 수수료</td>
						<td class="td1">0.0005 BCH</td>
					</tr>
					<tr>
						<td>실제 출금 총액</td>
						<td class="td1">0 BCH</td>
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


				
				<p class="coin_btn">비트코인 캐시 (BCH) 출금요청</p>

				<div class="coin_text2">
					<span>비트코인 캐시 (BCH) 출금시 주의사항</span>
					<div>
					* 비트코인 캐시 (BCH) 지갑 주소를 반드시 확인하고 전달해 주세요.<br>
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
	<div id="modal_address" class="modal">

	<p class="modal_title">나의 주소록(즐겨찾기)</p>

	<p class="p_R"><span id="create">주소록 등록</span></p>

	<table class="myaddress_tb">
		<colgroup>
			<%-- <col width="10%">
			<col width="10%">
			<col width="28%">
			<col width="16%">
			<col width="10%">
			<col width="10%">
			 --%>
			<col width="12%">
			<col width="30%">
			<col width="18%">
			<col width="12%">
			<col width="12%">
		</colgroup>
		<tr>
			<!-- <th>구분</th> -->
			<th>이름</th>
			<th>주소</th>
			<th>최근사용일시</th>
			<th>송금</th>
			<th>수정/삭제</th>
		</tr>
		<tr>
		<c:if test="${Myaddress.size()  < 1 }">
			<tr>
				<td colspan="5">내역이 없습니다</td>
			</tr>
		</c:if>
			
		<c:forEach var ="i" items="${Myaddress}" begin="0">
		<tr>
			<td>${i. alias}</td>
			<td>${i.accountCode }</td>
			<td>${i.useDate }</td>
			<td>송금</td>
			<td>수정/삭제</td>
		</tr>
		</c:forEach>
		</tr> 
	</table>
	</div>
	
	<div id="modal_account" class="modal2">

	<p class="modal_title">주소록 등록</p>

	<table class="account_tb">
		<colgroup>
			<col width="20%">
			<col width="80%">
		</colgroup>
		<tr>
		  <td class="td1">이름</td>
		  <td><input type="text" placeholder="미 입력시 이름없음으로 저장됨" id="name"></td>
		</tr>
		<tr>
		  <td class="td1">지갑주소</td>
		  <td><input type="text" id="address"></td>
		</tr>
	</table>


	<p class="account_p"><span id="add">등록</span><span id="close">닫기</span></p>

	</div>
	
	
	<script type="text/javascript">
	
	$("#open_address").click(function(){
		$("#modal_address").modal();
		get.address("bch");
	});
	$("#create").click(function(){
		$.modal.close();
		
		$("#modal_account").modal();
	});
	$("#add").click(function(){
		if($("#address").val() == ''){
			alert("주소를 입력해주세요");
			$("#address").focus();
		}else{
			add.address($("#name").val(),$("#address").val(),"bch");
			get.address();
			$.modal.close();
			
			$("#modal_address").modal();
		}
        
	});
	$("#close").click(function(){
        $.modal.close();
		
		$("#modal_address").modal();
	});
	
	var balanceCoin = $.number('${balanceBCH}');
	$("#balanceBCH").append(balanceCoin+"BCH");
	$(".gray").click(function(){
		$("#wantWithdrawMoney").val('');
	});
	$("#maximum").click(function(){
		$("#wantWithdrawMoney").val(balanceCoin); 
	});
	$(".coin_btn").click(function(){
		 
		var wantMoney = $("#wantWithdrawMoney").val().replace(/,/gi,"");
		if(${balanceBCH} < wantMoney ){
		    alert("출금 신청금액이 너무 큽니다");
		    $("#wantWithdrawMoney").focus();
		}else if($("#account").val() == ''){
		    alert("주소를 입력해주세요");
		    $("#account").focus();
		}else{
			send.money("${login.id}","BCH", wantMoney,$("#account").val());
		}
		
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

function remit_address(value){
    $("#account").val(value);
    
    $.modal.close();
}

function remove_address(value){
    if(confirm("정말 삭제하시겠습니까?")){
       remove.address(value);
    }
}
var remove = {
	address:function(value){
		var jData = JSON.parse("{}");
		jData["value"] = value;
	    $.ajax({
   		    	type: 'POST',
   		    	url: '/withdraw/type/address/remove',
   		    	data: JSON.stringify(jData),
   		    	contentType : "application/json; charset:utf-8",
   		    	dataType: 'json',
   		    	success: function (data) {
   		    		alert(data.state);
   		    		if(data.state){
   		    		    get.address("bch");
   		    		}
   		    	},
   		    	error : function(request, status, error) {
   		    		console.log("code : " + request.status + "\n" + "error : " + error);
   		    	}
	    });
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
	
     var send = {
    		money : function(id,type,value,account){
    			jData = JSON.parse("{}");
    			jData["id"] = id.trim();
    			jData["type"] = type.trim();
    			jData["value"] = value.trim();
    			jData["account"] = account.trim();
    			
	    			$.ajax({
	    		    	type: 'POST',	        
	    		    	url: '/withdraw/type/send',
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
     
    var add = {
     		address : function(name,address,type){
     			jData = JSON.parse("{}");
     			jData["name"] = name;
     			jData["address"] = address;
     			jData["type"] = type;
 	    			$.ajax({
 	    		    	type: 'POST',	        
 	    		    	url: '/withdraw/type/addAddress',
 	    		    	data: JSON.stringify(jData),
 	    		    	contentType : "application/json; charset:utf-8",
 	    		    	dataType: 'json',
 	    		    	async : false,
 	    		    	success: function (data) {
 	    		    		alert(data.state);
 	    		    		if(data.state){
 	    		    		
 	    		    		    get.address("bch");
 	    		    		
 	    		    		}
 	    		    	},
 	    		    	error : function(request, status, error) {
 	    		    		console.log("code : " + request.status + "\n" + "error : " + error);
 	    		    	}
 	    		});
     		}
            
     }
     
     var get = {
     
         address : function(type){
            	$.ajax({
	    		    	type: 'POST',	        
	    		    	url: '/withdraw/type/address',
	    		    	data: type,
	    		    	contentType : "application/json; charset:utf-8",
	    		    	dataType: 'json',
	    		    	success: function (data) {
	    		    		divData = '';
	    		    		$(".myaddress_tb").empty();
		
	    		    		divData += '<colgroup>';
	    		    		divData += '	<col width="12%">';
	    		    		divData += '	<col width="30%">';
	    		    		divData += '	<col width="18%">';
	    		    		divData += '	<col width="12%">';
	    		    		divData += '	<col width="12%">';
	    		    		divData += '</colgroup>';
	    		    		divData += '<tr>';
	    		    		divData += '	<th>이름</th>';
	    		    		divData += '	<th>주소</th>';
	    		    		divData += '	<th>최근사용일시</th>';
	    		    		divData += '	<th>송금</th>';
	    		    		divData += '	<th>수정/삭제</th>';
	    		    		divData += '</tr>';
	    		    		for(var i = 0 ; i < data.list.length ; i ++){
	    		    		    divData += '<tr>';
	    		    		    divData += '<td>';
	    		    		    divData += data.list[i].alias;
	    		    		    divData += '</td>';
	    		    		    divData += '<td>';
	    		    		    divData += data.list[i].accountCode;
	    		    		    divData += '</td>';
	    		    		    divData += '<td>';
	    		    		    divData += data.list[i].useDate;
	    		    		    divData += '</td>';
	    		    		    divData += '<td>';
	    		    		    divData += '<span class="pointer" onclick="remit_address(\''+data.list[i].accountCode+'\')">송금</span>';
	    		    		    divData += '</td>';
	    		    		    divData += '<td>';
	    		    		    divData += '수정/<span class="pointer" onclick="remove_address(\''+data.list[i].no+'\')">삭제</span>';
	    		    		    divData += '</td>';
	    		    		    
	    		    		    divData += '</tr>';
	    		    		    
	    		    		}
	    		    		$(".myaddress_tb").append(divData);
	    		    		
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
    