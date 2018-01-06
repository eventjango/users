<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="../common/layout.jsp" %>
	
</head>
<body>
<div id="wrap">

	<%@ include file="../common/header.jsp" %>
	<%@ include file="../common/menu.jsp" %>
	

	<div class="contents">

		<div class="main_cont_L">
		<div class="join_box">
		<input type="radio" name="user_type" id="general" checked="checked"/><label for="general">일반회원가입</label>
		<input type="radio" name="user_type" id="business"/><label for="business">기업회원가입</label>
		<!-- <a href="/user/add" class="on">일반회원가입</a>
		<a href="/user/add2">기업회원가입</a> -->
		<br/><br/><br/>
		<div  id="business_table">
		<table class="withdraw_tb">
			<colgroup>
				<col width="20%">
				<col width="80%">
			</colgroup>
			<tbody><tr>
				<td>회사명</td>
				<td class="td1"><input type="text" id="text_crpName"></td>
			</tr>
			<tr>
				<td>대표자명</td>
				<td class="td1"><input type="text" id="text_repName"></td>
			</tr>
			<tr>
				<td>사업자 등록번호</td>
				<td class="td1"><input type="text" id="text_businessNumber"></td>
			</tr>
			<tr>
				<td>대표 전화번호</td>
				<td class="td1"><input type="text" id="text_repPnum"></td>
			</tr>
			<tr>
				<td>사업장 주소</td>
				<td class="td1"><input type="text" class="in3" id="text_zipCode1">&nbsp; - <input type="text" class="in3" id="text_zipCode2">&nbsp; <span id="open_address">우편번호찾기</span><br><br>
				<input type="text" class="in4" id="text_businessPlace1"> <input type="text" class="in5" id="text_businessPlace2">
				</td>
			</tr>
		</tbody></table>
		<br/><br/><br/>
		</div>
		
		
		
		<table class="withdraw_tb">
			<colgroup>
				<col width="20%">
				<col width="80%">
			</colgroup>
			
			<tr>
				<td>e-mail</td>
				<td class="td1"><input type="text" id="text_id">&nbsp;
                    <span id="request_id">증복확인</span><br/>
				</td>
			</tr>
			
			<tr>
				<td>이름</td>
				<td class="td1"><input type="text" class="in2" placeholder="실명을 공백없이 확인해주세요" id="text_name"></td>
			</tr>
			
			<tr>
				<td>비밀번호</td>
				<td class="td1"><input type="password" class="in1" placeholder="8자리(특수문자 포함)이상 확인해주세요" id="text_pw"><br/>
				<!-- 비밀번호는 8자리(특수문자 포함)로 만드셔야 합니다. -->
				</td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td class="td1"><input type="password" class="in1" id="text_pwChk"></td>
			</tr>
			
			<tr>
				<td>국가선택</td>
				<td class="td1">
				<select id="select_country">
					<option>대한민국</option>
					<option>대한민국</option>
					<option>대한민국</option>
					<option>대한민국</option>
				</select>
				</td>
			</tr>
			<tr>
				<td>휴대폰번호</td>
				<td class="td1"><input type="text" class="in3" id="text_pNum"><!-- &nbsp; - <input type="text" class="in3">&nbsp; - <input type="text" class="in3">&nbsp;--> <span id="Request_Sms">SMS 인증요청</span><br/>
				<!-- 휴대폰번호는 비밀번호, KRW 출금/BTC 출금 등 SMS가 발송되오니 정확히 확인해 주세요. -->
				</td>
			</tr>
			<tr>
				<td>휴대폰 인증번호</td>
				<td class="td1"><input type="text" class="in3" id="text_pNumChk"><br/>
                    휴대폰으로 전송받으신 인증번호를 확인해 주세요.
				</td>
			</tr>
			<!-- <tr>
				<td>보안비밀번호</td>
				<td class="td1"><input type="text" class="in3"><br/>
				* 출금 / 송금 / 상품권구매 / 비밀번호변경 / OTP인증 등의 서비스 이용을 위해 보안비밀번호를 (숫자 4자리) 만드셔야 합니다.<br/>
 * 4자리의 중복 및 연속 숫자, 휴대폰 번호 뒷자리 등 추측이 가능한 번호는 허용되지 않습니다. 
				</td>
			</tr> -->
			<tr>
				<td>이용약관동의</td>
				<td class="td1"><input type="checkbox" class="check" id="agree1"> 이용약관에 동의합니다.<br/>
				<div class="agree_box">
                    이용약관 내용<br/>
                    이용약관 내용<br/>
                    이용약관 내용<br/>
                    이용약관 내용<br/>
                    이용약관 내용<br/>
                    이용약관 내용<br/>
                    이용약관 내용<br/>
				</div><br/>
				<input type="checkbox" class="check" id="agree2"> 개인정보취금방침에 동의합니다.<br/>
				<div class="agree_box">
                    개인정보취금방침 내용<br/>
                    개인정보취금방침 내용<br/>
                    개인정보취금방침 내용<br/>
                    개인정보취금방침 내용<br/>
                    개인정보취금방침 내용<br/>
                    개인정보취금방침 내용<br/>
                    개인정보취금방침 내용<br/>
				</div><br/>
				</td>
			</tr>

		</table>

		<div class="agree_btnbox">
			<span class="on" id="signUp">가입</span>
            <span onclick="javascript:history.back()")>취소</span>
		</div>

		</div><!--.join_box -->

		</div><!--.main_cont_L -->

		<!-- 우측 사이드박스 시작-->
		<div class="main_cont_R">
		
		</div><!--.main_cont_R -->

	
	</div><!--.contents -->


	<%@ include file="../common/footer.jsp" %>
	
	
</div>
<div id="add_address" class="modal">
 <input type="text" id="send_text" placeholder="주소를 입력해주세요!">
 <input type="button" value="전송" id="send_address">
 <span aria-hidden="true" id="close_address">&times;</span>
</div>
<script type="text/javascript">

var idDuplicated = true;
var userId = '';
var pNumDuplicated = false;
function nameCheck(value){
	 regexp = /[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]|\s/gi;
	  v = value.val();
	  if( regexp.test(v) ) {
	   //alert("한글만입력하세요");
	   $(value).val(v.replace(regexp,''));
	  }
}
function filterName(value){
	 value.keyup(function(){
	    nameCheck(value);
	});
	value.keydown(function(){
		nameCheck(value);
	});
	value.blur(function(){
		nameCheck(value);
	 });
}
function idCheck(value){
	var rgko = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]|\s/g;
	v = value.val();
	if( rgko.test(v)) {
	   //alert("한글 및 공백은 입력안됨");
	   value.val(v.replace(rgko,''));
	}
}
function filterId(value){
		 value.keyup(function(){
			 idCheck(value);
		 });
		value.keydown(function(){
			idCheck(value);
		 });
		value.blur(function(){
			idCheck(value);
		 });
}
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
filterName($("#text_name"));

filterNum($("#text_pNum"));

filterNum($("#text_pNumChk"));

filterId($("#text_id"));

$("#request_id").click(function(){
	var id = $("#text_id").val();
	var rgid = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	if(!(rgid.test(id))){
		alert("이메일을 확인해주세요");
		$("#text_id").focus();
		 idDuplicated = true;
	}else{
		duplicates.id(id);
	}
});
$("#Request_Sms").click(function(){
	var rgPn = /^01(?:0|1|[6-9])(?:\d{3}|\d{4})\d{4}$/;
	if(!rgPn.test($("#text_pNum").val())){
		alert("휴대폰 번호를 확인해주세요");
		$("#text_pNum").focus();
		pNumDuplicated = false;
	}else{
		alert("인증 메일이 발송되었습니다.");
 		$("#text_pNumChk").focus();
 		pNumDuplicated = "1234";
	}
});
 $("#signUp").click(function() {
	var rgPw = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*\W).{8,20}$/;
	var idChk = $("#text_id").val();

	if(idDuplicated || idChk != userId) {
		alert("중복확인");
		$("#text_id").focus();
	}else if($("#text_name").val() == '') {
		alert("이름을 확인해주세요");
		$("#text_name").focus();
	}else if(!rgPw.test($("#text_pw").val())){
		alert("비밀번호를 확인해주세요");
		$("#text_pw").focus();
	}else if($("#text_pw").val() != $("#text_pwChk").val()) {
		alert("비밀번호 확인을 확인해주세요");
		$("#text_pwChk").focus();
	}else if($("#text_pNumChk").val() != pNumDuplicated) {
		alert("휴대폰 인증번호를 확인해주세요 : 1234");
		$("#text_pNum").focus();
	}else if(!($("#agree1").is(":checked"))) {
		alert("이용약관에 동의해주세요");
		$("#agree1").focus();
	}else if(!($("#agree2").is(":checked"))) {
		alert("개인정보취금방침에 동의해주세요");
		$("#agree2").focus();
	}else{
		if($("[name='user_type']:checked").attr('id') == 'general'){
			signUp.general();
		}else{
			if($("#text_crpName").val() == '') {
				alert("회사명을 확인해주세요");
				$("#text_crpName").focus();
			}else if($("#text_repName").val() == '') {
				alert("대표자명을 확인해주세요");
				$("#text_repName").focus();
			}else if($("#text_businessNumber").val() == '') {
				alert("사업자 등록번호를 확인해주세요");
				$("#text_businessNumber").focus();
			}else if($("#text_repPnum").val() == '') {
				alert("대표 전화번호를 확인해주세요");
				$("#text_repPnum").focus();
			}else if($("#text_zipCode1").val() == '' || $("#text_zipCode2").val() == '') {
				alert("사업장 주소를 확인해주세요");
				$("#text_businessPlace2").focus();
			}else if($("#text_businessPlace1").val() == '' || $("#text_businessPlace2").val() == '') {
				alert("사업장 주소를 확인해주세요");
				$("#text_businessPlace2").focus();
			}else{
				signUp.business();
			}
		}
	}
	
});


//중복된 id 체크를 위한 ajax
 var duplicates = {

 		id : function(id) {

 		    console.log(id);

 			$.ajax({
 				type : "get",
 				url : "/user/checkid?id=" + id,
 				contentType : "application/json; charset:utf-8",
 				dataType : "json",
 				async : false,
 				success : function(data) {
 				    var result = data.message;

 				    if(result == 'true'){
 				        alert('<spring:message code="user.id.available"/>');
 				       idDuplicated = false;
 				       userId = id;
 				       $("#text_name").focus();
					}else{
                        alert('<spring:message code="user.id.duplicated"/>');
                        idDuplicated = true;
                        $("#text_id").focus();
					}
 				},
 				error : function(request, status, error) {
 					console.log("code :" + request.status + "\n" + "error :" + error);
 				}
 			});
 		}
 		
 }

 //컨트롤러로 사용자가 입력한 데이터 입력정보 전송
var signUp = {
		general : function() {
			var jData = JSON.parse("{}");
			
			jData["id"] = $("#text_id").val();
			jData["name"] = $("#text_name").val();
			jData["pw"] = $("#text_pw").val();
			jData["country"] = $("#select_country option").index($("#select_country option:selected"));  
			jData["pNum"] = $("#text_pNum").val();      
			jData["userType"] = "general";
			 
			
			signUp.result("add",jData);
		},
		business : function() {
			var jData = JSON.parse("{}");
			
			jData["crpName"] = $("#text_crpName").val();
			jData["repName"] = $("#text_repName").val();
			jData["businessNumber"] = $("#text_businessNumber").val();
			jData["repPnum"] = $("#text_repPnum").val();
			jData["businessPlace_address"] = $("#text_businessPlace1").val() + " " + $("#text_businessPlace2").val();
			jData["businessPlace_zipCode"] = $("#text_zipCode1").val() + "-" + $("#text_zipCode2").val();
			
			jData["id"] = $("#text_id").val();
			jData["name"] = $("#text_name").val();
			jData["pw"] = $("#text_pw").val();
			jData["country"] = $("#select_country option").index($("#select_country option:selected"));  
			jData["pNum"] = $("#text_pNum").val();      
			jData["userType"] = "business";
			 
			
			signUp.result("business",jData);
		},
		result : function(type, param) {
			var jData = JSON.parse("{}");
			//jData["Type"] = type;
			//jData["Data"] = param;
			
			$.ajax({
				type : "POST",
				url : "/user/" + type,
				data : JSON.stringify(param),
				contentType : "application/json; charset:utf-8",
				dataType : "json",
				async : false,
				success : function(data) {
					alert(data.message);
					if(data.state == "success"){
						location.href = "/home";	
					}
				},
				error : function(request, status, error) {
					console.log("code : " + request.status + "\n" + "error : " + error);
				}
			});
		}
		
}
 //유저 타입에 따른 사업자 정보 입력 창 표시 및 숨김
$("[name='user_type']").change(function(){
	if($("[name='user_type']:checked").attr('id') == 'business'){
		$("#business_table").show();
	}else{
		$("#business_table").hide();
	}
});
 
 $("#open_address").click(function(){
		$("#add_address").modal(); 
	});
	$("#close_modal").click(function(){
		$.modal.close();
	});
	
	$("#send_address").click(function(){
		$("#text_businessPlace1").val($("#send_text").val());
		$("#send_text").val('');
		$.modal.close();
	});
</script>
</body>

</html>
