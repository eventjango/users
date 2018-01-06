<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<html>
<head>
    <title>HOME</title>

    <%@include file="../common/layout.jsp" %>


</head>
<body>
<div id="wrap">

    <%@include file="../common/header.jsp" %>
    <%@include file="../common/menu.jsp" %>
    


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

				<div class="filter">

					<p class="filter_title_1">Filter</p>

					<%-- <div class="filter_box1">
						<p class="filter_title_2">투자코인</p>
						<c:forEach var="i" items="${coinType}" begin="0" end="1">
						<p class="filter_box1_check"><img src="/images/filter_on.png"><span>${i.value}</span></p>
						</c:forEach>
					</div> --%>

					<%-- <div class="filter_box1">

						<p class="filter_title_2">담보코인</p>

						<c:forEach var="i" items="${coinType}" begin="0" end="5">
						<p class="filter_box1_check"><input type="checkbox" name="coinValues" value="${i.value }"><!-- <img src="/images/filter_off.png"> --><span>${i.value}</span></p>
						</c:forEach>
					</div> --%>
					
					<div class="filter_box1">
						<p class="filter_title_2">기간 <span style="color:#ccc;">(1~365로 설정)</span></p>
						<input type="text" id="minPeriod"> ~ <input type="text" id="maxPeriod">
					</div>

					<div class="filter_box1">
						<p class="filter_title_2">이자율</p>
						<input type="text" id="minRate"> ~ <input type="text" id="maxRate">
					</div>

					<div class="filter_box1">
						<p class="filter_title_2">투자가능 금액</p>
						<input type="text" id="minAmount"> ~ <input type="text" id="maxAmount">
						<!-- <p>50~1억 최저/최고</p> -->
					</div>
					<br/>
					<input type="button" id="searchFilter" value="검색">
				</div><!--.filter -->

				<div class="filter_list">

					<div class="title">
						<span class="sp_1">담보 론 리스트</span>
						<a href="/loan/payor/welcome"><span class="sp_2">담보 론 받기</span></a>
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
								<col width="12.5%">
							</colgroup>
							<tr>
								<th>남은 모집시간</th>
								<th>대출기간</th>
								<th>이자율</th>
								<th>대출 가능 금액</th>
								<th>진행상황</th>
								<!-- <th>첫 지급일</th> -->
								<%--<th>담보론받기</th>--%>
								<th>대출받기</th>
							</tr>
							<c:forEach var="i" items="${investList}" begin="0">
									<tr>
										<td>${i.deadline}시간</td> 
										<td>${i.period }개월</td>
										<td class="tdNumber"><fmt:formatNumber value="${i.interestRate }" pattern="#,###"/>%</td>
										<td class="tdNumber"><fmt:formatNumber value="${i.amount }" pattern="#,###"/>원</td>
										<td>0%</td><!-- invest?product_no= -->
 										<td><span class="modalButton" id="span_${i.no}">대출신청</span></td>
									</tr>
							</c:forEach>
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
    <div class="modal" id="trading_Modal"></div>
    
<%@include file="../common/footer.jsp"%>

</div>
<script type="text/javascript">
var currentPrice = 0;
var ownCoin = 0;
    function numCheck(value){
     	var rgPnum = /\D/g;
     	v = value.val();
     	if(rgPnum.test(v)){
     		//alert("숫자만 입력 가능합니다");
     		value.val(v.replace(rgPnum,''));
     	}
     }
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
     filterNum($("#minPeriod"));
     filterNum($("#maxPeriod"));
     filterNum($("#minRate"));
     filterNum($("#maxRate"));
     filterNum($("#minAmount"));
     filterNum($("#maxAmount"));
 $(".modalButton").click(function(){
	 var modalNumber = this.id.split("_")[1];
	 
	 loan.invest(modalNumber);
 });
 
 

 $("#searchFilter").click(function(){//필터 검색
 	 search.filter($("#minPeriod").val(),$("#maxPeriod").val(),$("#minRate").val(),$("#maxRate").val(),$("#minAmount").val(),$("#maxAmount").val());
 });
  

 var search = {
		 filter:function(nPeriod,xPeriod,nRate,xRate,nAmount,xAmount){
			 var chked_val = '';
			 if(nPeriod > xPeriod){
				 var swap = xPeriod;
				 xPeriod = nPeriod;
				 nPeriod = swap;
			 }
			 
			 if(nRate > xRate){
				 var swap = xRate;
				 xRate = nRate;
				 nRate = swap;
			 }
			 
			 if(nAmount > xAmount){
				 var swap = xAmount;
				 xAmount = nAmount;
				 nAmount = swap;
			 }
			 
			 $(":checkbox[name='coinValues']:checked").each(function(pi,po){
				 if(chked_val == null || chked_val == ''){
					 chked_val = po.value;
				 }else{
				    chked_val += ","+po.value;
				 }
			});
			 
			 jData = JSON.parse("{}");
			 jData["minPeriod"] = nPeriod;
			 jData["maxPeriod"] = xPeriod;
			 jData["minRate"] = nRate;
			 jData["maxRate"] = xRate;
			 jData["minAmount"] = nAmount;
			 jData["maxAmount"] = xAmount;
			 
			
			$.ajax({
				 type:'POST',
				 url:'/loan/payor/list/filtered',
				 data:JSON.stringify(jData),
				 contentType:"application/json;charset:UTF-8",
				 dataType:'json',
				 success:function(data){
					 if(data.list.length>0){
						 $(".filter_list_tb_box").empty();
						var Data = "<table>"+
						"<colgroup>"+
						"<col width='12.5%'>"+
						"<col width='7%'>"+
						"<col width='12.5%'>"+
						"<col width='12.5%'>"+
						"<col width='12.5%'>"+
						"<col width='12.5%'>"+
						"</colgroup>"+
						"<tr>"+
						"<th>남은 모집시간</th>"+
						"<th>대출기간</th>"+
						"<th>이자율</th>"+
						"<th>대출 가능 금액</th>"+
						"<th>진행상황</th>"+
						"<th>대출받기</th>"+
						"</tr>"
					     for(var i = 0; i < data.list.length ; i++){
					    	 Data+= "<tr><td>"+data.list[i].deadline+"시간</th><td>"+data.list[i].period +"일</td><td class='tdNumber'>"+data.list[i].interestRate +"%</td><td class='tdNumber'>"+$.number(data.list[i].amount)+"원</td><td>0%</td><td><span class='modalButton' id='span_"+data.list[i].no+"'>투자하기</span></td></tr>";
					     }
						$(".filter_list_tb_box").append(Data);
					 }else{
						 alert("검색 결과가 없습니다");
					 }
				 }
			 });
		 }
 }
 
 var loan = {
		invest:function(number){//모달 띄우는 js
 				$.ajax({
 				    	type: 'POST',	        
 				    	url: '/loan/payor/payModal',
 				    	data: number,
 				    	contentType : "application/json; charset:utf-8",
 				    	dataType: 'json',
 				    	success: function (data) {
 				    		$("#trading_Modal").empty();
 				    		var modalData = '';
 				    		modalData += "<div>투자자 : " + data.list[0].investorName + "</div>";
 				    		modalData += "<div>대출자 : ${login.name} </div>";
 				    		modalData += "<div>대출기간 : "+data.list[0].period +"일</div>";
 				    		modalData += "<div>예상지급일 : "+ data.list[0].dueDate + "</div>";
 				    		modalData += "<div>이자율 : "+ data.list[0].interestRate + "%</div>";
 				    		modalData += "<div>남은 대출가능금액 : "+ $.number(data.list[0].amount) + "원</div>";
 				    		modalData += "<div>코인 종류 : <select id='coinType'>";
 				    		<c:forEach var='i' items='${coinType}' begin='1' end='5'>
 				    		modalData += "<option>${i.value}</option>";
 				    		</c:forEach>
 				    		modalData += "</select></div>";
 				    		currentPrice = data.currentPrice;
 				    		modalData += "<div>현재 시세 : <span id='current_price'>"+$.number(data.currentPrice)+"</span></div>";
 				    		modalData += "<div>현재 보유 코인 : ";
 				    		modalData += "<span id='coinValue'></span></div>";
 				    		modalData += "<div>담보코인 갯수 : <input type='text' id='coinAmount' style='margin-right: 10px; padding : 2px;' onchange='numchk(this)' onkeydown='return onlyNum(this,event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'></div>";
 				    		modalData += "<div>대출 금액 : <input type='text' id='investment' style='margin-right: 10px; padding : 2px;' readonly='readonly'>";
 				    		modalData += "<input type='button' id='button_invest' value='신청하기'></div>";
 				    		modalData += "<div><input type='button' id='money_simulator' value='예상 금액 계산하기'>";
 				    		modalData += "<div id='dueAmount'></div>";
 				    		$("#trading_Modal").append(modalData);
 				    		
 				    		$("#money_simulator").click(function(){
 				    			$("#dueAmount").empty();
								var money1 = $("#investment").val() * data.list[0].interestRate / 100;
								var appendData = '';
								appendData += "<div>예상수익 계산기</div>";
								appendData += "<div>월 이자 " + $.number(money1 / 12) + "원</div>";
								appendData += "<div>총 이자 " + $.number($("#investment").val()*1 + (money1 * data.list[0].period / 12)) + "원</div>";
 				    			$("#dueAmount").append(appendData);
 				    		});
 				    		 $("#button_invest").click(function(){

                                 var amount = $("#investment").val();

                                 if(amount == null || amount == ""){
                                     alert("금액을 입력하세요");
                                     return;
                                 }else if(ownCoin < $("#coinAmount").val()){
                                	 alert("입력하신 코인양이 너무 큽니다");
                                	 return;
                                 }else if(data.list[0].amount < $("#investment").val()){
                                	 alert("신청금액이 대충 가능 금액보다 큽니다");
                                	 return;
                                 }

 				    			 if(confirm("대출하시겠습니까?")){
 				    				loan.payorApply(data.list[0].investorId, "${login.id}", $("#investment").val(), data.list[0].no,$("#coinType option:selected").val(),$("#coinAmount").val());	 
 				    			 }
 				    			 
 				    		 });
 				    		 
 				    		$("#coinValue").append(data.btc+"BTC");
 				    		ownCoin = data.btc;
 				    		$("#coinType").change(function(){
 				    			$("#investment").val('');
 				    			$("#coinAmount").val('');
 				    			var param = $("#coinType option:selected").val();
 				    			$.ajax({
 				    		    	type: 'POST',	        
 				    		    	url: '/loan/payor/getMoney',
 				    		    	data: param,
 				    		    	contentType : "application/json; charset:utf-8",
 				    		    	dataType: 'json',
 				    		    	success: function (data) {

 				    		    		ownCoin = data.money;
 				    		    		$("#coinValue").text($.number(data.money)+param);
 				    		    		$("#current_price").text($.number(data.currentPrice)+"원");
 				    		    		currentPrice = data.currentPrice;
 				    		    	},
 				    		    	error : function(request, status, error) {
 				    		    		console.log("code : " + request.status + "\n" + "error : " + error);
 				    		    	}
 				    		    });
 				    		});
 				    		
 				    		 $("#trading_Modal").modal();
 				    		
 				    		filterNum($("#investment"));
 				    		$("#coinAmount").blur(function(){
 				    			var wantAmount = Math.floor(currentPrice * 0.6 / 10000) * 10000 * $("#coinAmount").val().replace("\,","");
 				    			$("#investment").val(wantAmount);
 				    		});
 				    	},
 				    	error : function(request, status, error) {
 				    		console.log("code : " + request.status + "\n" + "error : " + error);
 				    	}
 				    });
 		
 	},

	payorApply : function(investorId, payorId, amount,number,coinType, coinAmount){
 		var jData = JSON.parse("{}");
 		jData["investorId"] = investorId;
 		jData["payorId"] = payorId;
 		jData["amount"] = amount;
 		jData["number"] = number;
 		jData["coinType"] = coinType;
 		jData["coinAmount"] = coinAmount;
 		
		$.ajax({
		    	type: 'POST',	        
		    	url: '/loan/payor/payorApply',
		    	data: JSON.stringify(jData),
		    	contentType : "application/json; charset:utf-8",
		    	dataType: 'json',
		    	success: function (data) {
		    		alert(data.state);
		    		location.href="/loan/payor/list";
		    	},
		    	error : function(request, status, error) {
		    		console.log("code : " + request.status + "\n" + "error : " + error);
		    	}
		});
 		/* $.post('/loan/invest/investApply', jData, function(data) {
 			  alert(data.state);
 			}, 'json'); */
	}
}
</script>
</body>
</html>
    