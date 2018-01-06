<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>

<html>
<head>
    <title>HOME</title>

<%@ include file="../common/layout.jsp" %>
</head>
<style>
#simplemodal-overlay {width:800px; background-color:#000;}
.modal{display:none;margin:50 auto;width:700px; background:#fff;color:#black; padding: 20px; box-sizing:border-box;}
.modal_title{text-align:center; padding:15px 0;}
</style>
<body>
<div id="wrap">
	<%@ include file="../common/header.jsp" %>
	<%@ include file="../common/menu.jsp" %>

	<div class="contents">

		<div class="main_cont_L">
			
			<div class="side_menu">
				<ul>
					<a href="/loan/payor/list"><li class="on">담보 론 받기</li></a>
					<a href="/loan/payor/history"><li>주문 및 거래내역</li></a>
					<!-- <a href="#"><li>지급 스케쥴</li></a> -->
				</ul>
			</div><!--.side_menu -->

			<div class="center_cont">
						<p class="center_cont_title">론 신청하기</p>
						<p class="center_cont_p1">텍스트공간</p>
						<p class="center_cont_p2">텍스트들어갈 공간</p>
						<div class="registration_box">
						<form id="form_getLoan" method="post">
							<p>코인 종류</p>
							<select class="dee" name="coin_type" id="coinType">
							<c:forEach var="i" items="${coinType}" begin="1" end="5">
							<option>${i.value}</option>
							</c:forEach>
							</select>
							<p>보유중인 코인</p>
							<input type="text" class="dee" placeholder="현재 보유 코인" name="own_vx" readonly="readonly">
							<br><br>
							<div>현재 시세 : <span id="current_price"><fmt:formatNumber value="${currentPrice}" pattern="#,###"/>원</span></div>
							<p>담보 코인 갯수</p>
							<input type="text" class="dee" placeholder="담보 코인 갯수" name="coinAmount" id="coinAmount">개
							<br><br>
							<p>담보론 금액</p>
							<input type="text" class="dee" placeholder="최소 50만원" name="wantAmount" readonly="readonly" id="amount">원
							<br><br>
							<p>모집기간</p>
							<select class="dee" name="deadline" id="deadline">
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
							<option>6</option>
							<option>7</option>
							</select>일
							<br><br>
							<p>연이율</p>
							<input type="text" class="dee" placeholder="희망이율 : 4~24" name="interestRate" id="interestRate">%
							<div id="interestCalculator"><br/></div>
							<p>기간</p>
							<select class="dee" name="wantPeriod" id="period">
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
							<option>6</option>
							</select>개월
							<span>중도 상환수수료 없음</span>
							<br><br>
							
							<!-- <p>이자 지급일</p>
							매 월<select class="dee" name="interestPaymentDate">
							<option>5</option>
							<option>15</option>
							<option>25</option>
							</select>일
							 --><!-- <p>금액</p>
							<input type="text" placeholder="금액">
							<br><br>
							<p>월 이자</p>
							<input type="text" placeholder="월 이자"> -->
							<br><br><br>
							<p class="registration_btn">투자 신청</p>
							</form>
						</div>	
			</div><!--.center_cont -->

		</div><!--.main_cont_L -->






		<!-- 우측 사이드박스 시작-->
		<div class="main_cont_R">
		
		</div><!--.main_cont_R -->

	
	</div><!--.contents -->
    
<%@include file="../common/footer.jsp"%>

</div>
<div id="confirmApply" class="modal"><div style="width: 90%"></div>
 <div id="data_div"></div>
 <div class="btn_wrap" >
 <div id="getApply">확인</div>
 <div class="cancel_btn" id="cancelApply">취소</div>
 </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-serialize-object/2.5.0/jquery.serialize-object.min.js"></script>
<script type="text/javascript" charset="utf-8">
var currentPrice = ${currentPrice};
$("[name='own_vx']").val('${money}');

function numCheck(value){
 	var rgPnum = /\D/g;
 	v = value.val();
 	if(rgPnum.test(v)){
 		//alert("숫자만 입력 가능합니다");
 		value.val(v.replace(rgPnum,''));
 	}
 }
 function filterNum(value){
         value.keyup(function(){
             numCheck(value);
         });
         value.keydown(function(){
             numCheck(value);
         });
         value.blur(function(){
             numCheck(value);
         });
 }
 
 filterNum($("[name='coinAmount']"));
 filterNum($("[name='interestRate']"));
 

 var dataModal = {
		 div:function(){
			 var modalData = '';
			 $("#data_div").empty();
			 modalData += '<div class="modal_title">리스트내역</div>';
			 modalData += '      <div class="list_wrap">';
			 modalData += '        <div>담보 코인종류</div>';
			 modalData += '        <div class="list_detail">'+$("#coinType option:selected").text()+'</div>';
			 modalData += '        <div>담보 코인갯수</div>';
			 modalData += '        <div class="list_detail">'+$.number($("#coinAmount").val())+'개</div>';
			 modalData += '        <div>신청금액</div>';
			 modalData += '        <div class="list_detail">'+$.number($("#amount").val())+'원</div>';
			 modalData += '        <div>모집기간</div>';
			 modalData += '        <div class="list_detail">'+$("#deadline").val()+'일</div>';
			 modalData += '        <div>연이율</div>';
			 modalData += '        <div class="list_detail">'+$("#interestRate").val()+'%</div>';
			 modalData += '        <div>대출기간</div>';
			 modalData += '        <div class="list_detail">'+$("#period").val()+'개월</div>';
			 modalData += '      </div>';
			 $("#data_div").append(modalData);
			 $("#confirmApply").modal();
		 }
 }
 
 $("[name='coinAmount']").blur(function(){
	 var wantAmount = Math.floor(currentPrice * 0.6 / 10000) * 10000 * $("[name='coinAmount']").val();
	 $("[name='wantAmount']").val(wantAmount);
 });

 $("[name='interestRate']").focusout(function(){
 	var contents = '';
 	
 	contents = "월 평균 " + $.number($("[name='interestRate']").val() / 12,2) + "%<br/>";
 	$("#interestCalculator").empty();
 	$("#interestCalculator").append(contents);
 });

 $("[name='interestRate']").focus(function(){
 	$("#interestCalculator").empty();
 	$("#interestCalculator").append("<br/>");
 });

$("[name='coin_type']").change(function(){
	
	var param = $("[name='coin_type'] option:selected").val();
	
	$.ajax({
    	type: 'POST',	        
    	url: '/loan/payor/getMoney',
    	data: param,
    	contentType : "application/json; charset:utf-8",
    	dataType: 'json',
    	success: function (data) {
    		$("[name='own_vx']").val($.number(data.money));
    		$("#current_price").text($.number(data.currentPrice));
    		currentPrice = data.currentPrice;
    	},
    	error : function(request, status, error) {
    		console.log("code : " + request.status + "\n" + "error : " + error);
    	}
    });
});
$(".registration_btn").click(function(){
	var numChk = /\D/;
	var decChk =  /^(?:\d)+\.?\d{1,4}$/;
	if($("[name='coinAmount']").val()*1 <= 0 || !decChk.test($("[name='coinAmount']").val())   || $("[name='coinAmount']").val()*1 > "${money}"*1){
		alert('담보 코인을 확인해주세요');
		$("[name='coinAmount']").focus();
	}else if(!($("[name='wantAmount']").val() *1 >= 500000)){
		alert('대출 금액을 확인해주세요');
		$("[name='wantAmount']").focus();
	}else if(!($("[name='interestRate']").val() *1 >= 4 && $("[name='interestRate']").val() *1 <= 24)){
		alert('이자율을 확인해주세요');
		$("[name='interestRate']").focus();
	}else{
		dataModal.div();
	}
});
$("#cancelApply").click(function(){
	$.modal.close();
});
$("#closeApply").click(function(){
	$.modal.close();
});

$("#getApply").click(function(){
	loan.apply('#form_getLoan');
});


var loan = {
		apply:function(form){
		
			var params = JSON.stringify($(form).serializeObject());
				
				$.ajax({
				    	type: 'POST',	        
				    	url: '/loan/payor/apply',
				    	data: params,
				    	contentType : "application/json; charset:utf-8",
				    	dataType: 'json',
				    	success: function (data) {
							if(data.state == 'success'){
								alert("대출 신청이 성공적으로 완료되었습니다.")
								location.href = '/loan/payor/list';
							}else{
								alert("대출 신청이 실패하였습니다.");
								return;
							}
				    	},
				    	error : function(request, status, error) {
				    		console.log("code : " + request.status + "\n" + "error : " + error);
				    	}
				    });
		
	}
}
</script>
</body>
</html>
    