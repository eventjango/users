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
					<a href="/user/modify"><li class="on">회원정보변경</li></a>
					<a href="/user/safety"><li>보안 설정 및 인증</li></a>
					<a href="/user/question"><li>문의내역 확인</li></a>
				</ul>
			</div><!--.side_menu -->

			<div class="center_cont">

				<p class="cointitle">로그인 비밀번호 변경</p>
			
				<table class="withdraw_tb">
					<colgroup>
						<col width="20%">
						<col width="80%">
					</colgroup>
					<tr>
						<td>e-mail</td>
							<td class="td1" name="myId">${login.id}</td>
					</tr>
					<tr>
						<td>현재 비밀번호</td>
						<td class="td1"><input type="password" class="in2" id="currentPassword"></td>
					</tr>
					<tr>
						<td>새로운 비밀번호</td>
						<td class="td1"><input type="password" class="in2" id="newPassword" name="newPw"></td>
					</tr>
					<tr>
						<td>비밀번호 확인</td>
						<td class="td1"><input type="password" class="in2" id="nPconfirm"></td>
					</tr>
					<tr>
						<td>휴대폰번호 인증</td>
						<td class="td1"><input type="text" class="in3">&nbsp; - <input type="text" class="in3">&nbsp; - <input type="text" class="in3">&nbsp; <span>SMS 인증요청</span></td>
					</tr>
					<tr>
						<td>보안비밀번호</td>
						<td class="td1"><input type="text" class="in2"></td>
					</tr>
				</table>

				<div class="agree_btnbox">
					<span class="on" id="modifySaved">저장</span><span onclick="location.href='/home';">입력 취소</span>
				</div>



			</div><!--.center_cont -->

		</div><!--.main_cont_L -->






		<!-- 우측 사이드박스 시작-->
		<div class="main_cont_R">
		
		</div><!--.main_cont_R -->

	
	</div><!--.contents -->
    
<%@include file="../common/footer.jsp"%>

</div>
<div class="modal" id="qrcode_Modal"></div>
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

var otp = {
		modal:function(){
            $.ajax({
                type : "POST"
               ,url:"/otp/check"
               ,dataType:"json"
               ,success:function(data){
                   modalData = '';
                   modalData += '<p class="modal_title">OTP인증</p>';
                   modalData += '	<div class="otp_box">';
                   modalData += '		<p>OTP인증 (2-Factor Verification)</p>';
                   modalData += '		<p>';
                   modalData += '		2-Factor Verification 이란?';
                   modalData += '		회원님의 추가 인증수단으로써 이 기능을 설정 한 후, KRW/BTC 송금 같은 민감한 거래를 스마트폰의 Google Authenticator 앱에 표시되는 OTP(One Time Password) 일회용 비밀번호 코드로 회원님의 보안을 향상 시킬 수 있습니다.';
                   modalData += '		</p>';
                   modalData += '	</div>';
                   modalData += '	<p class="osp_p1">OTP인증 사용하기</p>';
                   modalData += '	<p class="osp_p2">Google Authenticator 앱에서 "계정설정" → "바코드스캔" 을 이용하여 바코드를 스캔 하십시오.</p>';
                   modalData += '	  ';
                   modalData += '	<div class="qr_box2">';
                   modalData += '		<div class="qr_img"><img src="'+ data.url+'"/></div>';
                   modalData += '			<div class="qr_text">';
				   modalData += '				<p class="p1">바코드 스캔을 이용할 수 없으면 이용하실 수 없습니다.</p>';
                   modalData += '			</div>';
                   modalData += '	</div>';
                   modalData += '	<div class="qr_box3">';
                   modalData += '		<table>';
                   modalData += '			<colgroup>';
                   modalData += '			  <col width="25%">';
                   modalData += '			  <col width="75%">';
                   modalData += '			</colgroup>';
                   modalData += '			<tr>';
                   modalData += '			  <td class="td1">SMS인증</td>';
                   modalData += '			  <td><input type="text"> <span>인증번호받기</span></td>';
                   modalData += '			</tr>    <tr>';
                   modalData += '			  <td class="td1">OTP Code Number</td>';
                   modalData += '			  <td><input type="text" id="otpCodeNumber" MaxLength="6"></td>';
                   modalData += '			</tr>';
                   modalData += '		</table>';
                   modalData += '		<p>';
                   modalData += '		 - OTP Code Number와 SNS 인증 두 개 다 승인이 되어야 합니다.';
                   modalData += '		</p>';
                   modalData += '	</div>';
                   modalData += '	<p class="qr_btn">완료</p>';
                   $("#qrcode_Modal").empty();
                   $("#qrcode_Modal").append(modalData);
                   $("#qrcode_Modal").modal();
                   filterNum($("#otpCodeNumber"));
                   $(".qr_btn").click(function(){
                      if($("#otpCodeNumber").val().length < 6){
                          alert("값을 입력해주세요");
                      }else{
                          otp.auth($("#otpCodeNumber").val(),data.encodedKey);  
                      }
                       
                   });
                   
               }
               ,error : function(request, status, error) {
                    console.log("code :" + request.status + "\n" + "error :" + error);
               }
                
            });
        },
        auth:function(otpCode,key){
            jData = JSON.parse("{}");
            jData["code"] = otpCode;
            jData["key"] = key;
            $.ajax({
                type : "POST"
                       ,url:"/otp/check/result"
                       ,dataType:"json"
                       ,contentType:"application/json;charset:UTF-8"
                       ,data:JSON.stringify(jData)
                       ,success:function(data){
                           
                           if(data.state){
                        	   password.check($("#currentPassword"));
                           }else{
                        	   alert("인증에 실패하였습니다");
                           }
                           
                       }
                       ,error : function(request, status, error) {
                            console.log("code :" + request.status + "\n" + "error :" + error);
                       }
            });
        }
}
$("#modifySaved").click(function(){
	if(${state}){
		otp.modal();
	}else{
		password.check($("#currentPassword"));	
	}
	
});

var password = {
		
		check : function(pw){
			if(pw.val() == '' || pw.val() == null){
				
				alert("비밀번호를 입력해주세요");
				pw.focus();
				
			}else{
				
				var param = JSON.parse("{}");
				param["pw"] = pw.val();
				$.ajax({
	 				type : "POST",
	 				url : "/user/checkPw",
	 				data : JSON.stringify(param),
	 				contentType : "application/json; charset:utf-8",
	 				dataType : "json",
	 				async : false,
	 				success : function(data) {
	 					var pwChk = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*\W).{8}$/
	 					if(data.state == "noSession"){
	 						alert("로그인 후 이용해주세요");
	 						location.href="/login";
	 					}else if(data.state){
	 				    	
	 				    	if(pwChk.test($("#newPassword").val())){
	 				    		
		 				   		if($("#newPassword").val() == $("#nPconfirm").val()){
		 				   			
		 				   			password.modify($("#newPassword").val());
		 				   			
		 				   		}else{
		 				   			
		 				   			alert("비밀번호 확인을 확인해주세요");
		 				   			$("#nPconfirm").focus();
		 				   			
		 				   		}
		 				   	}else{
		 				   		
		 				   		alert("비밀번호 형식에 일치하지 않습니다");
		 				   		$("#newPassword").focus();
		 				   		
		 				   	}
	 				    }else{
	 				    	
	 				    	alert("비밀번호가 일치하지 않습니다");
	 				    	$("#currentPassword").focus();
	 				    	
	 				    }
	 				},
	 				error : function(request, status, error) {
	 					
	 					console.log("code :" + request.status + "\n" + "error :" + error);
	 					
	 				}
	 				
	 			});
				
			}
		},
		
		modify:function(pw){
			var param = JSON.parse("{}");
			param["pw"] = pw;
			
			$.ajax({
 				type : "POST",
 				url : "/user/modify",
 				data : JSON.stringify(param),
 				contentType : "application/json; charset:utf-8",
 				dataType : "json",
 				async : false,
 				success : function(data) {
 					if(data.state){
 						alert("비밀번호 변경에 성공하였습니다");
 						location.href = '/home';
 						
 					}else{
 						
 						alert("비밀번호 변경이 실패하였습니다");
 						
 					}
 				},
 				error : function(request, status, error) {
 					
 					console.log("code :" + request.status + "\n" + "error :" + error);
 					
 				}
 			});
			
			
		}
			
		
		
		
}

</script>
</body>
</html>
    