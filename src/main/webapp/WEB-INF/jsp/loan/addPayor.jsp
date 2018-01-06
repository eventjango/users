<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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

				<p class="center_cont_title">대출자 등록하기</p>
				<p class="center_cont_p1">왜 주민번호와 주소 정보가 필요한가요?</p>
				<p class="center_cont_p2">비트코인은 투자 수익에 대한 세금을 원천징수해야 하는 의무를 가지고 있습니다.<br>이를 위해서만 사용되며 다른 용도로 사용되지 않습니다.</p>
					
				<div class="registration_box">

					<form:form id="formVO" commandName="payorVO" action="/loan/payor/add" method="post">

					<p>주민등록번호</p>
						<form:input path="beforePersonalCode" cssClass="in_1" maxlength="6"/> - <form:input path="afterPersonalCode" cssClass="in_1" maxlength="7"/>
						<br/><form:errors path="beforePersonalCode"/>
						<br/><form:errors path="afterPersonalCode"/>
					<br><br>
					<p>자택주소</p>
						<form:input path="postCode" id="postCode" onclick="execDaumPostcode()" placeholder="우편번호"/>
						<form:errors path="postCode"/>
						<input type="button" id="postCodeBtn" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
						<form:input path="address1" id="address2" onclick="execDaumPostcode()" readonly="readonly" placeholder="주소"/>
						<form:errors path="address1"/>
						<form:input path="address2" id="address2" placeholder="상세주소"/>
						<form:errors path="address2"/>
					<br><br>
					

					<p>출금용 계좌</p>
					<span style="color:#aaa;">투자 수익을 돌려받는 계좌로 사용됩니다.<br>본인 명의의 계좌를 사용해주세요.</span>
					<br>

						<form:select path="bankName">
							<option value="ibk">기업은행</option>
							<option value="sinhan">신한은행</option>
							<option value="kb">국민은행</option>
						</form:select>

					<%--<input type="text" placeholder="'-'없이 숫자만 이용해 입력해주세요.">--%>
						<form:input path="accountCode" />
						<form:errors path="accountCode"/>

					<br><br>
					<p>가입경로</p>

						<form:select path="addPath">
							<form:option value="1">포털사이트(네이버,다음)</form:option>
							<form:option value="2">카페</form:option>
							<form:option value="3">블로그</form:option>
							<form:option value="4">지인추천</form:option>
							<form:option value="5">기타</form:option>
						</form:select>

					<br><br>
					<p>추천인 코드(선택항목)</p>
					<%--<input type="text" placeholder="추천인 코드를 입력해주세요.">--%>
						<form:input path="recommendationCode"/>
					<br><br><br>

						<p>약관동의</p>
						<input type="checkbox" id="isLicense" class="check"/>
					
					<%--<p class="registration_btn">완료하기</p>--%>

						<input class="registration_btn" type="submit" value="완료하기">

					</form:form>
				</div>	

			</div><!--.center_cont -->

		</div><!--.main_cont_L -->






		<!-- 우측 사이드박스 시작-->
		<div class="main_cont_R">
		
		</div><!--.main_cont_R -->

	
	</div><!--.contents -->  
    
    
    
    
    
    
    
    
    
    
<%@include file="../common/footer.jsp"%>

</div>
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
 filterNum($("#beforePersonalCode"));
 filterNum($("#afterPersonalCode"));
 
$("#formVO").submit(function(event){
	var bpCode = /(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))/;
    var apCode = /[1-4][0-9]{6}/;
    var acNumber = /[0-9]{10}?[0-9]*/;
	if(!(bpCode.test($("#beforePersonalCode").val()))){
		alert("주민등록번호 앞자리 확인");
		$("#beforePersonalCode").focus();
		event.preventDefault();
		event.stopPropagation();
		return false;
	}
	if(!apCode.test($("#afterPersonalCode").val())){
		alert("주민등록번호 뒷자리 확인");
		$("#afterPersonalCode").focus();
		event.preventDefault();
		event.stopPropagation();
		return false;
	}
	if($("#address").val() == ''){
		alert("주소 확인");
		$("#address").focus();
		event.preventDefault();
		event.stopPropagation();
		return false;
	}
	if(!acNumber.test($("#accountCode").val())){
		alert("계좌 번호 확인");
		$("#accountCode").focus();
		event.preventDefault();
		event.stopPropagation();
		return false;
	}
	if(!$("#isLicense").is(":checked")){
		alert("약관에 동의해주세요");
		event.preventDefault();
		event.stopPropagation();
		return false;
	}
});
</script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postCode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('address2').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('address2').focus();
            }
        }).open();
    }
</script>

</body>
</html>