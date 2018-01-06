<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>HOME</title>

    <%@include file="../common/layout.jsp" %>


</head>
<style>
#simplemodal-overlay {width:800px; background-color:#000;}
.modal{display:none;margin:50 auto;width:700px; background:#fff;color:#black; padding: 20px; box-sizing:border-box;}
.modal_title{text-align:center; padding:15px 0;}
</style>
<body>
<div id="wrap">

    <%@include file="../common/header.jsp" %>
    <%@include file="../common/menu.jsp" %>

	<div class="contents">

		<div class="main_cont_L">
			
			<div class="side_menu">
				<ul>
					<a href="/loan/invest/list"><li class="on">담보 론 투자하기</li></a>
					<a href="/loan/invest/history"><li>주문 및 거래내역</li></a>
					<!-- <a href="#"><li>지급 스케쥴</li></a> -->
				</ul>
			</div><!--.side_menu -->

			<div class="center_cont">

				<p class="center_cont_title">투자 신청하기</p>
				<p class="center_cont_p1">텍스트공간</p>
				<p class="center_cont_p2">텍스트들어갈 공간</p>
					
				<div class="registration_box">
					<p>보유 금액</p>
					<input type="text" class="dee" value="${money}" readonly="readonly">원
					<br><br>
					<form id="form_getInvest" method="post">
					<p>금액</p>
					<input type="text" class="dee" placeholder="금액" name="amount" id="amount">원
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
					<br/><br/>
					<p>연이율</p>
					<input type="text" class="dee" placeholder="가능범위 : 4~24" name="interestRate" id="interestRate">%
					<div id="interestCalculator"><br/></div>
					<p>대출기간</p>
					<select class="dee" name="period" id="period">
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
					<option>6</option>
					</select>개월
					<span>중도 상환수수료 없음</span><br><br>
					<!-- <p>이자 지급일</p>
					<select class="dee" name="interestPaymentDate">
					<option>5</option>
					<option>15</option>
					<option>25</option>
					</select>일
					 -->
					
					<p>이용약관동의</p>
					<div class="agree_box">
						<p>
							1.텍스트공간<br/>
							1.텍스트공간<br/>
							1.텍스트공간<br/>
							1.텍스트공간<br/>
							1.텍스트공간
						</p>
					</div>
					<input type="checkbox" class="in_check" id="isLicense"><label for="isLicense">이용약관에 동의합니다.</label>
					<br><br>
					
					<p>예상수익</p>
					<input type="text" class="dee" id="interestIncome" placeholder="예상수익" readonly="readonly">원
					<br><br>
					
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
<script type="text/javascript">
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
 
 filterNum($("[name='amount']"));
 filterNum($("[name='interestRate']"));
 
 var dataModal = {
		 div:function(){
			 var modalData = '';
			 $("#data_div").empty();
			 modalData += '<div class="modal_title">리스트내역</div>';
			 modalData += '      <div class="list_wrap">';
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
 $(".registration_btn").click(function(){
	var numChk = /\D/;
	var decChk =  /^\d*[.]\d{5}$/;
	if(numChk.test($("[name = 'amount']").val()) || $("[name='amount']").val() * 1 <= 0){
		alert('투자 금액을 확인해주세요');
		$("[name='amount']").focus();
	}else if(!($("[name='interestRate']").val() *1 >= 4 && $("[name='interestRate']").val() *1 <= 24)){
		alert('이자율을 확인해주세요');
		$("[name='interestRate']").focus();
	}else if($(".in_check").is(":checked") == false){
		alert("이용약관에 동의해주세요");
		$(".in_check").focus();
	}else{
// 		$("#confirmApply").modal();
// 		$("#data_div").append(JSON.stringify($("#form_getInvest").serializeObject()));
		dataModal.div();
	}
});
$("#cancelApply").click(function(){
	$.modal.close();
});
$("#closeApply").click(function(){
	$.modal.close();
});
$("[name = 'amount']").focusout(function(){
	
	var money = ${ money};
	
	if($("[name = 'amount']").val() * 1 > money){
		alert("보유 금액보다 많은 금액을 투자하실 수 없습니다");
		$("[name='amount']").val(money);
	}
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

$("#getApply").click(function(){
	invest.apply($("#form_getInvest"));
});

function interestIncome(amount,period,interest){
	if(amount.val() != '' && interest.val() != ''){
		return $.number((amount.val()*1)+((amount.val()*interest.val())/100)*(period.val() / 12)*(1-0.154));
	}
}
function intIncomeKey(value){
	value.keyup(function(){
		$("#interestIncome").val(interestIncome($('[name="amount"]'),$('[name="period"] option:selected'),$('[name="interestRate"]')));
    });
    value.keydown(function(){
    	$("#interestIncome").val(interestIncome($('[name="amount"]'),$('[name="period"] option:selected'),$('[name="interestRate"]')));
    });
    value.blur(function(){
    	$("#interestIncome").val(interestIncome($('[name="amount"]'),$('[name="period"] option:selected'),$('[name="interestRate"]')));
    });
}
intIncomeKey($('[name="amount"]'));
intIncomeKey($('[name="interestRate"]'));
/* $('[name="amount"]').blur(function(){
	$("#interestIncome").val(interestIncome($('[name="amount"]'),$('[name="period"] option:selected'),$('[name="interestRate"]')));
});
$('[name="interestRate"]').blur(function(){
	$("#interestIncome").val(interestIncome($('[name="amount"]'),$('[name="period"] option:selected'),$('[name="interestRate"]')));
}); */
$('[name="period"]').change(function(){
	$("#interestIncome").val(interestIncome($('[name="amount"]'),$('[name="period"] option:selected'),$('[name="interestRate"]')));
});

var invest = {
		apply:function(form){
				
			var params = JSON.stringify($(form).serializeObject());
			
				$.ajax({
				    	type: 'POST',	        
				    	url: '/loan/invest/apply',
				    	data: params,
				    	contentType : "application/json; charset:utf-8",
				    	dataType: 'json',
				    	success: function (data) {
							if(data.state){
								alert("투자 등록이 성공적으로 완료되었습니다.")
								location.href = '/loan/invest/list';
							}else{
								alert("투자 등록이 실패하였습니다.");
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
    