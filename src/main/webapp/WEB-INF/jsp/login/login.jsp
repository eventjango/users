<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@include file="../common/layout.jsp"%>
	
</head>

<body>
<div id="wrap">
	<%@include file="../common/header.jsp"%>
	<%@include file="../common/menu.jsp"%>

	<div class="contents">

		<div class="main_cont_L">
			
		<div class="login_box2">

        <form:form id="form_login" commandName="loginVO" action="/login" method="post" >

            <p class="p1">MEMBER LOGIN</p>
                <p class="p2">이메일</p>
                    <form:input path="id" id="text_id"/>
                    <div><form:errors path="id"/></div>
                    <br><br>
                    <p class="p2">비밀번호</p>
                    <form:password path="pw" id="text_pw" />
                    <div><form:errors path="pw"/></div>

                    <p class="p3">일반가입 계정과 간편가입 계정은 별도의 계정으로, 잔고 및 회원 정보를 공유하지 않습니다</p>

                    <a href="/search/password"><p class="p4">비밀번호를 잊으셨나요?</p></a>

                    <input type="submit" value="로그인" class="login" id="login"><a href="/user/add"><span>회원가입</span></a>
        </form:form>

		</div>

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

filterId($("#text_id"));


$("#form_login").submit(function(){
	var jData = JSON.parse("{}");
	jData["id"] = $("#text_id").val();
	jData["pw"] = $("#text_pw").val();
	
	$.ajax({
				type : "POST",
				url : "/login",
				data : JSON.stringify(jData),
				contentType : "application/json; charset:utf-8",
				dataType : "json",
				async : false,
				success : function(data) {

					if(data.result == 'success'){
						location.href="${lastURL}";
					}else {
					    alert('<spring:message code="login.fail"/>');
                    }
				},
				error : function(request, status, error) {
					console.log("code : " + request.status + "\n" + "error : " + error);
				}
	});
	
	return false;
});


</script>
</body>

</html>
