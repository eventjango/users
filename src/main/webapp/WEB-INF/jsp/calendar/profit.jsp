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

    <!-- 이벤트 슬라이드 스크립트 / gnb위에 넣으면 작동 안함 / 여기에 고정 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="/js/swiper.jquery.min.js"></script>
	<!--// 이벤트 슬라이드끝-->

<div class="contents">

		<div class="main_cont_L">
			
			<div class="side_menu">
				<ul>
					<a href="/calendar/profit"><li class="on">지급 스케쥴</li></a>
					<!-- <a href="/calendar/loss"><li>이자 지출 스케쥴</li></a> -->
				</ul>
			</div><!--.side_menu -->

			<div class="center_cont">

				<div class="wrap2">
					<div class="box on">
						<!-- <h4 class="t2"><a href="#">지불스케쥴</a></h4> -->
						<div class="pannel2">
							<!-- calendar 시작-->
							<div class="calendar">
								<p class="calendar_p"><span>◀</span>&nbsp;&nbsp; November 2017 &nbsp;&nbsp;<span>▶</span></p>	

								<table class="calendar_tb2">
									<colgroup>
										<col width="14%">
										<col width="14%">
										<col width="14%">
										<col width="14%">
										<col width="14%">
										<col width="14%">
										<col width="14%">
									</colgroup>
									<tr>
										<th>SUN</th>
										<th>MON</th>
										<th>TUE</th>
										<th>WED</th>
										<th>THU</th>
										<th>FRI</th>
										<th>SAT</th>
									</tr>
									<tr>
										<td><span class="days">1</span><span class="gray_sp">10,000</span><span class="red_sp">20,000</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
									</tr>
									<tr>
										<td><span class="days">1</span><span class="gray_sp">10,000</span><span class="red_sp">20,000</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
									</tr>
									<tr>
										<td><span class="days">1</span><span class="gray_sp">10,000</span><span class="red_sp">20,000</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
									</tr>
									<tr>
										<td><span class="days">1</span><span class="gray_sp">10,000</span><span class="red_sp">20,000</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
									</tr>
									<tr>
										<td><span class="days">1</span><span class="gray_sp">10,000</span><span class="red_sp">20,000</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
										<td><span class="days">1</span></td>
									</tr>
								</table>
							</div><!-- calendar 끝-->

							<!-- 우측 지급,지불 작은박스 -->
							<!-- 
							<div class="tab">
								<div class="wrap1 ex"> -->
									<!-- <ul class="tab2 cf">
										<li class="on"><a href="#">지급</a></li>
										<li><a href="#">지불</a></li>      
									</ul>
									<ul class="pannel5">
										<li class="on">
											<p><span class="left">총자산</span><span class="right">00,000원</span></p>
											<p><span class="left">원금</span><span class="right">00,000원</span></p>
											<p style="margin-bottom:0;"><span class="left">이자수익</span><span class="right">00,000000원</span></p>
											<p><span class="left" style="color:#aaa;">(세금별도)</span><span class="right"></span></p>
										</li>
										<li>
											<p><span class="left">총자산</span><span class="right">00,000원</span></p>
											<p><span class="left">원금</span><span class="right">00,000원</span></p>
											<p style="margin-bottom:0;"><span class="left">이자수익</span><span class="right">00,000000원</span></p>
											<p><span class="left" style="color:#aaa;">(세금별도)</span><span class="right"></span></p>			
										</li>
									</ul>
								--><!-- 
								</div>
								 -->
								 <!--.wrap1 ex -->
							<!-- 
							</div>
							 -->
							 <!--.tab -->

							<div class="case"><span class="gray">다가오는 예정 지불/지급 금액</span> &nbsp;<span class="red">이체된 금액</span></div>
							
							<table class="calendar_tb">
								<colgroup>
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
								</tr>
							</table>
							<table class="calendar_tb">
								<colgroup>
									<col width="20%">
									<col width="80%">
								</colgroup>
								<tr>
								<td>원금</td>
								<td></td>
								</tr>
								<tr class="tr1">
								<td>이자수익</td>
								<td></td>
								</tr>
								<tr>
								<td>총 자산</td>
								<td></td>
								</tr>

							</table>		

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
	var pad = function(x) {
    	return (x < 10) ? "0"+x : x; 
    }
	
	schedule('.calendar');
    function schedule(id, date) {
    	var schedule = $(id);
    	schedule.empty();
    
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
        calendar += '<span><a href="#" class="button left" onclick="schedule(\'' +  id + '\', \'' + prevDate + '\')">◀</a></span>';
        calendar += '' + currentYear + '년 ' + currentMonth + '월';
        calendar += '<span><a href="#" class="button right" onclick="schedule(\'' + id + '\', \'' + nextDate + '\')">▶</a></span>';
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
    	
    	$.ajax({
            type : "POST",
            url : "/test/filter",
            data : params,
            dataType : "json",
            success : function (data) {

                alert('success');
                alert(data.id + " , " + data.code);
            },
            error : function (data) {

                alert('error');
                alert(data.id);

            }
        });
    	
    }
	</script>
    
<%@include file="../common/footer.jsp"%>

</div>

</body>
</html>
    