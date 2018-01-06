<%@page import="java.text.NumberFormat"%>
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
					<a href="/loan/invest/list"><li class="on">담보 론 투자하기</li></a>
					<a href="/loan/invest/history"><li>주문 및 거래내역</li></a>
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

					<div class="filter_box1">

						<p class="filter_title_2">담보코인</p>

						<c:forEach var="i" items="${coinType}" begin="0" end="5">
						<p class="filter_box1_check"><input type="checkbox" name="coinValues" value="${i.value }"><!-- <img src="/images/filter_on.png"> --><span>${i.value}</span></p>
						</c:forEach>
					</div>
					
					<div class="filter_box1">
						<p class="filter_title_2">기간 <span style="color:#ccc;">(1~6로 설정)</span></p>
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
					<br>
					<input type="button" value="검색" id="searchFilter">
				</div><!--.filter -->

				<div class="filter_list">

					<div class="title">
						<span class="sp_1">코인 담보 론 투자 리스트</span>
						<a href='/loan/invest/welcome'><span class="sp_2">담보 론 투자하기</span></a>
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
								<th>기간</th>
								<th>이자율</th>
								<th>담보 코인 종류</th>
								<th>모집 금액</th>
								<th>진행상황</th>
								<!-- <th>첫 지급일</th> -->
								<%--<th>담보론받기</th>--%>
								<th>투자하기</th>
							</tr>
							<c:forEach var="i" items="${productList}" begin="0">
									<tr>
										<td>${i.deadline}시간</td> 
										<td>${i.wantPeriod }개월</td>
										<td class="tdNumber"><fmt:formatNumber value="${i.interestRate }" pattern="#,###"/>%</td>
										<td>${i.coinValue }</td>
										<td class="tdNumber"><fmt:formatNumber value="${i.wantAmount }" pattern="#,###"/>원</td>
										<td>0%</td><!-- invest?product_no= -->
 										<td><span class="modalButton" id="span_${i.no}">투자하기</span></td>
									</tr>
							</c:forEach>
							<!-- 
							<tr>
								<td>3hour</td>
								<td>35</td>
								<td>5%</td>
								<td>KRW</td>
								<td>1,000원</td>
								<td>0%</td>
								<td>2017.10.25</td>
								<td><span>담보론받기</span></td>
							</tr>
							 -->
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

 $(".loanCancel").click(function(){
	 if(confirm("투자 신청을 취소하시겠습니까?")){
		 loan.cancel("${login.id}",this.id.split("_")[1]);
	 }
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
			 jData["coinValues"] = chked_val;
			
			$.ajax({
				 type:'POST',
				 url:'/loan/invest/list/filtered',
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
						"<col width='12.5%'>"+
						"<col width='12.5%'>"+
						"</colgroup>"+
						"<tr>"+
						"<th>남은 모집시간</th>"+
						"<th>기간</th>"+
						"<th>이자율</th>"+
						"<th>담보 코인 종류</th>"+
						"<th>모집 금액</th>"+
						"<th>진행상황</th>"+
						"<th>투자하기</th>"+
						"</tr>"
					     for(var i = 0; i < data.list.length ; i++){
					    	 Data+= "<tr><td>"+data.list[i].deadline+"시간</th><td>"+data.list[i].wantPeriod +"개월</td><td class='tdNumber'>"+data.list[i].interestRate +"%</td><td>"+data.list[i].coinValue +"</td><td class='tdNumber'>"+$.number(data.list[i].wantAmount)+"원</td><td>0%</td><td><span class='modalButton' id='span_"+data.list[i].no+"'>투자하기</span></td></tr>";
					     }
						$(".filter_list_tb_box").append(Data);
						 $(".modalButton").click(function(){
							 var modalNumber = this.id.split("_")[1];
							 
							 loan.invest(modalNumber);
						 });
					 }else{
						 alert("검색 결과가 없습니다");
					 }
				 }
			 });
		 }
 }

 var loan = {//투자하기 모달 띄우는 js
		 
		invest:function(number){
			 
 				$.ajax({
 				    	type: 'POST',	        
 				    	url: '/loan/invest/payModal',
 				    	data: number,
 				    	contentType : "application/json; charset:utf-8",
 				    	dataType: 'json',
 				    	success: function (data) {
 				    		$("#trading_Modal").empty();
 				    		var modalData = '';
 				    		modalData += '	<p class="modal_title">'+data.list[0].payorName+'에게 투자하기</p>';
 				    		modalData += '	<div class="invest_01">';
 				    		modalData += '		<div>';
 				    		modalData += '			<p class="p_L">투자자이름</p>';
 				    		modalData += '			<p class="p_R">${login.name}</p>';
 				    		modalData += '		</div>';
 				    		modalData += '		<div>';
 				    		modalData += '			<p class="p_L">투자기간</p>';
 				    		modalData += '			<p class="p_R">'+ data.list[0].wantPeriod +'개월</p>';
 				    		modalData += '		</div>';
 				    		modalData += '		<div>';
 				    		modalData += '			<p class="p_L">예상 지급일</p>';
 				    		modalData += '			<p class="p_R">'+ data.list[0].dueDate +'</p>';
 				    		modalData += '		</div>';
 				    		modalData += '		<div>';
 				    		modalData += '			<p class="p_L">수익률</p>';
 				    		modalData += '			<p class="p_R">'+ data.list[0].interestRate +'%</p>';
 				    		modalData += '		</div>';
 				    		modalData += '	</div>';
 				    		modalData += '	<br>';
 				    		modalData += '	<table class="invest_tb">';
 				    		modalData += '		<colgroup>';
 				    		modalData += '			<col width="10%;">';
 				    		modalData += '			<col width="20%;">';
 				    		modalData += '			<col width="10%;">';
 				    		modalData += '			<col width="60%;">';
 				    		modalData += '		</colgroup>';
 				    		modalData += '	<tr style="background:#f3f3f3;">';
 				    		modalData += '		<td class="td1">보유예치금</td>';
 				    		modalData += '		<td class="td2">' + $.number(data.balance) + '원</td>';
 				    		modalData += '		<td class="td3">새로고침</td>';
 				    		modalData += '		<td class="td4">예치금계좌 기업은행 235623986956235 ${login.name}</td>';
 				    		modalData += '	</tr>';
 				    		modalData += '	<tr>';
 				    		modalData += '		<td colspan="5">';
 				    		modalData += '		계좌이체 후 충전 반영시간은 약 1~10분 사이에 입니다.<br>';
 				    		modalData += '		예치금은 예치금계좌 충전하신 금액이 반영됩니다.<br>';
 				    		modalData += '		23:30 ~ 00:30 사이에는 은행망 점검 시간으로 이체가 불가할 수 있습니다.</td>';
 				    		modalData += '	</tr>';
 				    		modalData += '	</table>';
 				    		modalData += '	<div class="invest_02">';
 				    		modalData += '		<p class="p1">투자금액 <input type="text" id="investment"><span id="maximum">최대금액투자</span> 최대 500만원</p>';
 				    		modalData += '		<p class="p2">최소투자가능금액 : <span>10</span>만원, 투자금단위 <span>10</span>만원 입니다.<br>';
 				    		modalData += '	분산투자를 위해 최대 투자금액은 펀딩목표금액의 20%로 권장합니다.</p>';
 				    		modalData += '		<p class="p3">예치금에서 <span class="red">0</span>만원이 차감됩니다. 투자후 보유금액 <span class="blue">'+ $.number(data.balance) +'</span>원</p>';
 				    		modalData += '		<p class="p4" id="money_simulator">이자지급 시뮬레이션</p>';
 				    		modalData += '	</div><!--.invest_02 -->';
 				    		modalData += '<div id="dueAmount"><table><colgroup><col width="50%;"><col width="50%;"></colgroup><tr><td>월 이자</td><td>총 이자</td></tr><tr><td><span id="month"></span></td><td><span id="all"></span></td></tr></table></div>';
 				    		modalData += '	<div class="invest_03">';
 				    		modalData += '		<textarea style="resize:none;" readonly="readonly">투자자 이용약관';
 				    		modalData += '		</textarea>';
 				    		modalData += '		<label class="pointer" for="chk"><input type="checkbox" id="chk">투자자 이용약관에 동의합니다.</label>';
 				    		modalData += '	</div>';
 				    		modalData += '	<div class="invest_04">';
 				    		modalData += '		<span class="sp1">투자신청</span> <span class="sp2">취소</span>';
 				    		modalData += '	</div>';
 				    		$("#trading_Modal").append(modalData);
 				    		function moneyCalc(){
 				    			var money1 = $("#investment").val() * data.list[0].interestRate / 100;
 				    			$("#month").text($.number(money1 / 12)+"원");
 				    			$("#all").text($.number($("#investment").val() * 1 + (money1 * data.list[0].wantPeriod / 12)) + "원");
 				    		}
							
 				    		
 				    		$("#dueAmount").hide();
 				    		
 				    		$("#maximum").click(function(){
								$("#investment").val(data.balance);
							});
							$("#investment").keyup(function(){
								var red = $("#investment").val() > 0 ? $("#investment").val() : 0;
								var blue = data.balance - $("#investment").val(); 
								$(".red").text($.number(red));
								$(".blue").text($.number(blue));
							});
							$("#investment").change(function(){
								$(".red").text($.number($("#investment").val()));
								$(".blue").text($.number(data.balance - $("#investment").val()));
							});
 				    		$("#money_simulator").click(function(){
 				    			moneyCalc();
								$("#dueAmount").slideToggle("slow",function(){
									$("#investment").keyup(function(){
										moneyCalc();
									});
								});
 				    			
 				    		});
 				    		 $("#button_invest").click(function(){

 				    		     var amount = $("#investment").val()*1;

 				    		     if(amount == null || amount == ""){
                                     alert("금액을 입력하세요");
									 return;
								 }
 				    		     
 				    		     if(amount > data.balance*1){
 				    		    	 alert("보유중인 금액을 초과");
 				    		    	 $("#investment").focus();
 				    		    	 return;
 				    		     }
 				    		     
 				    		    if(amount > data.list[0].wantAmount*1){
				    		    	 alert("남은 모집 금액을 초과");
				    		    	 $("#investment").focus();
				    		    	 return;
				    		     }

 				    			 if(confirm("투자하시겠습니까?")){
 				    				loan.investApply(data.list[0].payorId, "${login.id}", $("#investment").val(), data.list[0].no);	 
 				    			 }
 				    			 
 				    		 });
 				    		 $("#trading_Modal").modal();
 				    		filterNum($("#investment"));
 				    		
 				    	},
 				    	error : function(request, status, error) {
 				    		console.log("code : " + request.status + "\n" + "error : " + error);
 				    	}
 				    });
 		
 	},

	investApply : function(payorId, investorId,amount,number) {
 		var jData = JSON.parse("{}");
 		jData["payorId"] = payorId;
 		jData["investorId"] = investorId;
 		jData["amount"] = amount;
 		jData["number"] = number;
 		
		$.ajax({
		    	type: 'POST',	        
		    	url: '/loan/invest/investApply',
		    	data: JSON.stringify(jData),
		    	contentType : "application/json; charset:utf-8",
		    	dataType: 'json',
		    	success: function (data) {
		    		alert(data.state);
		    		location.href="/loan/invest/list";
		    	},
		    	error : function(request, status, error) {
		    		console.log("code : " + request.status + "\n" + "error : " + error);
		    	}
		});
	},
	
	cancel : function(id,num){
		var jData = JSON.parse("{}");
		jData["id"] = id;
		jData["num"] = num;
		
		$.ajax({
			type:'POST',
			url:'/loan/invest/cancel',
			data:JSON.stringify(jData),
			contentType:'application/json;charset:utf-8',
			dataType:'json',
			success:function(data){
				if(data.state){
					alert("취소 요청 성공");
					location.href="/loan/invest/list";
				}else{
					alert("취소 요청 실패");	
				}
				
			},
			error : function(request, status, error){
				console.log("code: " + request.status + "\n" + "error : " + error);
			}
		});
	}
 }
 
 </script>   
    
    
<%@include file="../common/footer.jsp"%>

</div>

</body>
</html>
    