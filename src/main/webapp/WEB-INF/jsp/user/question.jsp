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
					<a href="/user/modify"><li>회원정보변경</li></a>
					<a href="/user/safety"><li>보안 설정 및 인증</li></a>
					<a href="/user/question"><li class="on">문의내역 확인</li></a>
				</ul>
			</div><!--.side_menu -->

			<div class="center_cont">

				<ul>
				<li>
					<div>분류</div>
					<div>
						<select class="type">
							<option value="">분류를 선택해주세요.</option>
						</select>
					</div>
					<div>제목</div>
					<div><input type="text" class="title"></div>
				</li>
				<li>
					<textarea class="question_textarea"></textarea>
				</li>
			</ul>
			<div>
				<button onclick="location='/user/question'">목록</button>
				<button class="complete">작성완료</button>
			</div>

			
			</div><!--.center_cont -->

		</div><!--.main_cont_L -->





		<!-- 우측 사이드박스 시작-->
		<div class="main_cont_R">
		
		</div><!--.main_cont_R -->

	
	</div><!--.contents -->
	<script type="text/javascript">
	$(".complete").click(function(){
		if($(".title").val() == ''){
			alert("제목을 입력해주세요");
			$(".title").focus();
		}else if($(".question_textarea").val() == ''){
			alert("내용을 입력해주세요");
			$(".question_textarea").focus();
		}else{
			send.question($(".title").val(),$(".question_textarea").val());
		}
	});
	
	var send = {
			
			question:function(title,contents){
				
				jData = JSON.parse("{}");
// 				jData["type"] = $(".type option:selected").val();
				jData["title"] = title;
				jData["contents"] = contents;
				
				$.ajax({
	                 type : "POST",
	                 url : "/user/question/send",
	                 data : JSON.stringify(jData),
	                 contentType : "application/json; charset:utf-8",
	                 dataType : "json",
	                 async : false,
	                 success : function(data) {
	                     if(data.state){
	                         alert("문의 발송에 성공하였습니다")
	                         location.href="/user/question";
	                     }else{
	                         alert("문의 발송에 실패하였습니다")
	                     }
	                 },
	                 error : function(request, status, error) {
	                     console.log("code :" + request.status + "\n" + "error :" + error);
	                 }
	             });
				
				
			}
	}
	
	
	
	
	
	</script>
<%@include file="../common/footer.jsp"%>

</div>
</body>
</html>
    