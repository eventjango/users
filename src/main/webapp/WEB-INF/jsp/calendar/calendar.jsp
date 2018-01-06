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
			
			<div class="side_menu">
				<ul>
					<a href="/calendar/profit">
					    <li class="on">지급 스케쥴</li>
					</a>
				</ul>
			</div><!--.side_menu -->

			<div class="center_cont">

				<div class="wrap2">
					<div class="box on">
						<div class="pannel2">
							<!-- calendar 시작-->
							<div class="calendar">
								
							</div><!-- calendar 끝-->

							<div class="case"><span class="gray">투자 수익 금액</span> &nbsp;<span class="red">이자 지출 금액</span></div>
							<div id="toList">
								<table class="calendar_tb" id="listItem">
									<%-- <colgroup>
										<col width="20%">
										<col width="20%">
										<col width="20%">
										<col width="20%">
										<col width="20%">
									</colgroup>
									<tr>
										<th>지급날짜</th>
										<th>체결거래번호</th>
										<th>차수</th>
										<th>금액</th>
										<th>지불현황</th>
									</tr>
									<tr class="tr1">
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
									<tr class="tr1">
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
									</tr> --%>
								</table>
								<table class="calendar_tb" id="itemCalc">
									<%-- <colgroup>
										<col width="20%">
										<col width="80%">
									</colgroup>
									<tr>
									<td>원금</td>
									<td></td>
									</tr>
									<tr class="tr1">
									<td>이자수익/지출</td>
									<td></td>
									</tr>
									<tr>
									<td>총 자산</td>
									<td></td>
									</tr> --%>
	
								</table>		
							</div>
						</div><!--.pannel2 -->
					</div><!--.box-->

				</div><!--.wrap2-->
			
			</div><!--.center_cont -->

		</div><!--.main_cont_L -->






		<!-- 우측 사이드박스 시작-->
		<div class="main_cont_R">
		
		</div><!--.main_cont_R -->

	
	</div><!--.contents -->
	<script type="text/javascript">
	$("#toList").hide();
	
	var graySP = function(span){
		$("#toList").hide();
		var parentId = callParent(span);
		
		$.ajax({
            type : "POST",
            url : "/calendar/profit/list",
            data : parentId,
            dataType : "json",
            contentType : "application/json; charset:UTF-8",
            success : function (data) {
            	var amount = 0;
            	var monthInterest = 0;
            	$("#listItem").empty();
        		$("#itemCalc").empty();
        		listAppendDate = '<colgroup><col width="5%"><col width="19%"><col width="19%"><col width="19%"><col width="19%"><col width="19%"></colgroup><tr><th>번호</th><th>체결일</th><th>원금</th><th>월 이자</th><th>대출기간</th><th>지불현황</th>';
				
                for(var i = 0 ; i < data.list.length ; i++) {
                    if(i%2 == 0){
					    listAppendDate += '<tr class="tr1">';
					    listAppendDate += '<td>'+ i +'</td>';
					    listAppendDate += '<td>'+ data.list[i].date +'</td>';
					    listAppendDate += '<td>'+ $.number(data.list[i].amount) +'원</td>';
					    listAppendDate += '<td>'+ $.number(data.list[i].monthInterest) +'원</td>';
					    listAppendDate += '<td>'+ data.list[i].period +'개월</td>';
					    listAppendDate += '<td>미지급</td>';
					    listAppendDate += '</tr>';
                    }else{
					    listAppendDate += '<tr>';
					    listAppendDate += '<td>'+ i +'</td>';
					    listAppendDate += '<td>'+ data.list[i].date +'</td>';
					    listAppendDate += '<td>'+ $.number(data.list[i].amount) +'원</td>';
					    listAppendDate += '<td>'+ $.number(data.list[i].monthInterest) +'원</td>';
					    listAppendDate += '<td>'+ data.list[i].period +'개월</td>';
					    listAppendDate += '<td>미지급</td>';
					    listAppendDate += '</tr>';
                    }
                    amount += data.list[i].amount;

                    monthInterest += data.list[i].monthInterest * data.list[i].period;
                }
                calcAppendDate = '<colgroup><col width="20%"><col width="80%"></colgroup><tr><td>원금 합계</td><td>'+$.number(amount)+'원</td></tr><tr class="tr1"><td>이자수익 합계</td><td>'+$.number(monthInterest)+'원</td></tr><tr><td>총 합계</td><td>'+$.number(amount+monthInterest)+'원</td></tr>'; 
				
        		$("#listItem").append(listAppendDate);
        		$("#itemCalc").append(calcAppendDate);
        		$("#toList").slideDown('slow');
            },error : function(request, status, error) {
                console.log("code : " + request.status + "\n" + "error : " + error);
            }
        });
	}
	
	var redSP = function(span){
		$("#toList").hide();
		
		var parentId = callParent(span);
		
		$.ajax({
            type : "POST",
            url : "/calendar/loss/list",
            data : parentId,
            dataType : "json",
            contentType : "application/json; charset:UTF-8",
            success : function (data) {
            	var amount = 0;
            	var monthInterest = 0;
            	$("#listItem").empty();
        		$("#itemCalc").empty();
        		listAppendDate = '<colgroup><col width="5%"><col width="19%"><col width="19%"><col width="19%"><col width="19%"><col width="19%"></colgroup><tr><th>번호</th><th>체결일</th><th>원금</th><th>월 이자</th><th>대출기간</th><th>지불현황</th>';
				
				for(var i = 0 ; i < data.list.length ; i++) {
                    if(i%2 == 0){
					    listAppendDate += '<tr class="tr1">';
					    listAppendDate += '<td>'+ i +'</td>';
					    listAppendDate += '<td>'+ data.list[i].date +'</td>';
					    listAppendDate += '<td>'+ $.number(data.list[i].amount) +'원</td>';
					    listAppendDate += '<td>'+ $.number(data.list[i].monthInterest) +'원</td>';
					    listAppendDate += '<td>'+ data.list[i].period +'개월</td>';
					    listAppendDate += '<td>미지급</td>';
					    listAppendDate += '</tr>';
                    }else{
					    listAppendDate += '<tr>';
					    listAppendDate += '<td>'+ i +'</td>';
					    listAppendDate += '<td>'+ data.list[i].date +'</td>';
					    listAppendDate += '<td>'+ $.number(data.list[i].amount) +'원</td>';
					    listAppendDate += '<td>'+ $.number(data.list[i].monthInterest) +'원</td>';
					    listAppendDate += '<td>'+ data.list[i].period +'개월</td>';
					    listAppendDate += '<td>미지급</td>';
					    listAppendDate += '</tr>';
                    }
                    amount += data.list[i].amount;
                    monthInterest += data.list[i].monthInterest * data.list[i].period;
                }
				calcAppendDate = '<colgroup><col width="20%"><col width="80%"></colgroup><tr><td>원금 합계</td><td>'+$.number(amount)+'원</td></tr><tr class="tr1"><td>이자지출 합계</td><td>'+$.number(monthInterest)+'원</td></tr><tr><td>총 합계</td><td>'+$.number(amount+monthInterest)+'원</td></tr>';
        		$("#listItem").append(listAppendDate);
        		$("#itemCalc").append(calcAppendDate);
        		
        		$("#toList").slideDown('slow');
            },error : function(request, status, error) {
                console.log("code : " + request.status + "\n" + "error : " + error);
            }
        });
	}
	
	var callParent = function(span){
		return $(span).closest("td").attr('id');
	}
	
	var pad = function(x) {
    	return (x < 10) ? "0"+x : x; 
    }
	var today = function(){
		var date = new Date();
        var today = date.getFullYear() + "-" + pad(date.getMonth() + 1) + "-" + pad(date.getDate());
        $("#"+today).css("background","beige");
	}
	
    var addSpan = function(date){
    	
    	$.ajax({
            type : "POST",
            url : "/calendar/profit",
            data : date,
            dataType : "json",
            contentType : "application/json; charset:UTF-8",
            success : function (data) {
                for(var i = 0 ; i < data.list.length ; i++){
                	$("#"+data.list[i].date).append("<span class='gray_sp' onclick='graySP(this)'>"+$.number(data.list[i].sum)+"</span>")
                }
                
            },error : function(request, status, error) {
                console.log("code : " + request.status + "\n" + "error : " + error);
            }
        });
        
        $.ajax({
            type : "POST",
            url : "/calendar/loss",
            data : date,
            dataType : "json",
            contentType : "application/json; charset:UTF-8",
            success : function (data) {
                for(var i = 0 ; i < data.list.length ; i++){
                	$("#"+data.list[i].date).append("<span class='red_sp' onclick='redSP(this)'>"+$.number(data.list[i].sum)+"</span>")
                }
                
            },error : function(request, status, error) {
                console.log("code : " + request.status + "\n" + "error : " + error);
            }
        });
        
    }
	
    function schedule(id, date) {
    	var schedule = $(id);
    	schedule.empty();
    	$("#toList").hide();
    
    	if( typeof( date ) !== 'undefined' ) {
    	    date = date.split('-');
    	    date[1] = date[1] - 1;
    	    date = new Date(date[0], date[1], date[2]);
    	} else {
    	    var date = new Date();
    	}
    	
    	var currentYear = date.getFullYear();
    
    	var currentMonth = date.getMonth() + 1;
    
    	var currentDate = date.getDate();
    	
    	date.setDate(1);
    	
    	var currentDay = date.getDay();
    
    	var dateString = new Array('SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT');
    	var lastDate = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
    	
    	if( (currentYear % 4 === 0 && currentYear % 100 !== 0) || currentYear % 400 === 0 ){
    	lastDate[1] = 29;
    	}
    	//각 달의 마지막 일을 계산, 윤년의 경우 년도가 4의 배수이고 100의 배수가 아닐 때 혹은 400의 배수일 때 2월달이 29일 임.
    
    	var currentLastDate = lastDate[currentMonth-1];
    	var week = Math.ceil( ( currentDay + currentLastDate ) / 7 );
    	//총 몇 주인지 구함.
    
    	if(currentMonth != 1){
    	    var prevDate = currentYear + '-' + ( currentMonth - 1 ) + '-' + currentDate;
    	}else{
    	    var prevDate = ( currentYear - 1 ) + '-' + 12 + '-' + currentDate;
    	}
    	//만약 이번달이 1월이라면 1년 전 12월로 출력.
    
    	if(currentMonth != 12){ 
    	    var nextDate = currentYear + '-' + ( currentMonth + 1 ) + '-' + currentDate;
    	}else{
    	    var nextDate = ( currentYear + 1 ) + '-' + 1 + '-' + currentDate;
    	}
    	//만약 이번달이 12월이라면 1년 후 1월로 출력.
    
    
    	currentMonth = pad(currentMonth);
    	//10월 이하라면 앞에 0을 붙여준다.
    
    	var calendar = '';
    
        calendar += '<div class="calendar_p">';
        calendar += '<span><button class="button left" onclick="schedule(\'' +  id + '\', \'' + prevDate + '\')"> ◀ </button></span>';
        calendar += '<span><button onclick="schedule(\'' +  id + '\')">'+ currentYear + '년 ' + currentMonth + '월 </button></span>';
        calendar += '<span><button class="button right" onclick="schedule(\'' + id + '\', \'' + nextDate + '\')"> ▶ </button></span>';
        calendar += '</div>';
        calendar += '<table class="calendar_tb2">';
        calendar += '<colgroup>';
        calendar += '<col width="14%">';
        calendar += '<col width="14%">';
        calendar += '<col width="14%">';
        calendar += '<col width="14%">';
        calendar += '<col width="14%">';
        calendar += '<col width="14%">';
        calendar += '<col width="14%">';
        calendar += '</colgroup>';
        calendar += '<tr>';
        for(var i = 0 ; i < dateString.length ; i++){
            calendar += '<th >'+ dateString[i]+'</th>';
        }
        calendar += '</tr>';
        calendar += '</thead>';
        calendar += '<tbody>';
        
        var dateNum = 1 - currentDay;
        
        for(var i = 0; i < week; i++) {
            calendar += '<tr>';
            for(var j = 0; j < 7; j++, dateNum++) {
                if( dateNum < 1 || dateNum > currentLastDate ) {
                    calendar += '<td> </td>';
                    continue;
                }
                var currentDate = pad(dateNum);
                calendar += '<td id="' + currentYear+ '-' + currentMonth + '-' + currentDate + '"><span class="days">' + dateNum + '</span></td>';
            }
            calendar += '</tr>';
        }
        
        calendar += '</tbody>';
        calendar += '</table>';
    	
    	
    	schedule.append(calendar);

    	var date = currentYear+"-"+currentMonth;
    	addSpan(date);
    	
    	today();
    }
    schedule('.calendar');
	</script>
    
<%@include file="../common/footer.jsp"%>

</div>

</body>
</html>
    