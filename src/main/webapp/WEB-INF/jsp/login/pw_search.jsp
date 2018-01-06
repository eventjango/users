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
			
		<div class="join_box">

		<p class="cointitle_big">비밀번호찾기</p>

		<div class="coin_text">
			* 비밀번호를 분실하였을 때, 고객님의 이메일로 임시 비밀번호를 보내 드립니다.<br>
			* 가입하신 성함과 이메일을 작성 후 메일발송 버튼을 눌러 주세요.<br>
		</div>

		<br><br>
		<table class="withdraw_tb">
			<colgroup>
				<col width="20%">
				<col width="80%">
			</colgroup>
			<tr>
				<td>이름</td>
				<td class="td1"><input type="text" class="in2" id="text_name"></td>
			</tr>
			<tr>
				<td>가입하신 이메일</td>
				<td class="td1"><input type="text" class="in2" id="text_id"></td>
			</tr>
		</table>	

		<div class="agree_btnbox">
			<span class="on" id="search_my_password">메일발송</span><span onclick="javascript:history.back()">취소</span> 
		</div>

		</div><!--.join_box -->
		

		</div><!--.main_cont_L -->




		<!-- 우측 사이드박스 시작-->
		<div class="main_cont_R">
		
		</div><!--.main_cont_R -->

	
	</div><!--.contents -->
	
<%@include file="../common/footer.jsp"%>

</div>
<script type="text/javascript">

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

filterName($("#text_name"));
filterId($("#text_id"));
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

$("#search_my_password").click(function(){
	search.password($("#text_name"),$("#text_id"));
});

var search = {

 		password : function(name, id) {
			if(name.val() == null || name.val() == ''){
				alert("이름을 입력해주세요");
				name.focus();

			}else if(id.val() == null || id.val() == ''){
				alert("ID를 입력해주세요");
				id.focus();

			}else{

	 		    var jData = JSON.parse("{}");
				
				jData["id"] = id.val();
				jData["name"] = name.val();
	
	 			$.ajax({
	 				type : "POST",
	 				url : "/search/password",
	 				contentType : "application/json; charset:utf-8",
	 				dataType : "json",
	 				data : JSON.stringify(jData),
	 				async : false,
	 				success : function(data) {
	 				    alert(data.state);
	 				    if(data.state == "sucess"){
	 				    	location.href="/login";
	 				    }
	 				},
	 				error : function(request, status, error) {
	 					console.log("code :" + request.status + "\n" + "error :" + error);
	 				}
	 			});
			}
 		}
 		
 }
</script>
</body>
</html>
    