<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>HOME</title>

<%@ include file="../common/layout.jsp" %>
<style type="text/css">

#simplemodal-overlay {background-color:#000;}
.modal{display:none;margin:50 auto;width:700px; background:#fff;color:#black; padding: 20px; box-sizing:border-box;}
.modal_title{text-align:center; padding-bottom:10px;}

</style>
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
                    <a href="/user/safety"><li class="on">보안 설정 및 인증</li></a>
                    <a href="/user/question"><li>문의내역 확인</li></a>
                </ul>
            </div><!--.side_menu -->

            <div class="center_cont">

                <p class="cointitle">보안설정</p>
                <p class="cointitle">보안인증상태</p>
                <div class="confirm_box">
                <a href="#">이메일 인증</a> &nbsp; <a href="#">휴대폰 인증</a> <!-- &nbsp; <a href="#">실명 인증</a>  -->&nbsp; <!-- <a href="#">계좌 인증</a> &nbsp; --> <a href="#">OTP 인증</a> &nbsp;
                </div>

                <table class="confirm_tb">
                    <colgroup>
                        <col width="20%">
                        <col width="50%">
                        <col width="30%">
                    </colgroup>
                    <tr>
                        <td><img id="imgEmail" src="/images/filter_on.png"> &nbsp;이메일 인증</td>
                        <td>
                            <span class="sm_txt">이메일</span><br>
                            <p class="text_box1">${login.id }</p>
                        </td>
                        <td><span class="confirm_sp pointer email"></span></td>
                    </tr>

                    <tr>
                        <td><img id="imgPhone" src="/images/filter_off.png"> &nbsp;휴대폰 인증</td>
                        <td>
                            <span class="sm_txt">이름</span> <span class="sm_txt2">전화번호</span><br>
                            <div class="text_box">
                            <p class="text_box2">텍스트가 들어갈 공간</p>  <p class="text_box3">텍스트가 들어갈 공간</p>
                            </div>
                            <br>
                            <p>휴대폰 번호 변경을 원하시면 본인 인증 자료를 제출해야 합니다.</p>
                            <span class="confirm_sp2">인증 자료 제출 안내</span>
                        </td>
                        <td><span class="confirm_sp pointer phone">인증 완료</span></td>
                    </tr>
<!-- 
                    <tr>
                        <td><img src="/images/filter_off.png"> &nbsp;실명 인증</td>
                        <td>
                            <span class="sm_txt">이름</span><br>
                            <p class="text_box1">텍스트가 들어갈 공간</p>
                        </td>
                        <td><span class="confirm_sp">인증 완료</span></td>
                    </tr>

                    <tr>
                        <td><img src="/images/filter_off.png"> &nbsp;계좌 인증</td>
                        <td>
                            <span class="sm_txt">은행</span> <span class="sm_txt2">계좌번호(예금주)</span><br>
                            <div class="text_box">
                            <p class="text_box2">텍스트가 들어갈 공간</p>  <p class="text_box3">텍스트가 들어갈 공간</p>
                            </div>
                            <br>
                            <p>출금계좌 변경을 원하시면 본인 인증 자료를 제출해야 합니다.</p>
                            <span class="confirm_sp2">인증 자료 제출 안내</span>
                        </td>
                        <td><span class="confirm_sp">인증 완료</span><br><span class="confirm_sp3">추가 계좌 등록</span></td>
                    </tr>
-->

                    <tr>
                        <td><img id="imgOtp" src="/images/filter_off.png"> &nbsp;OTP 인증 <span class="confirm_sp2">권장사항</span></td>
                        <td><p class="text_box4">사용 중단하기</p></td>
                        <td><span class="confirm_sp pointer otp">인증 완료</span></td>
                    </tr>
                </table>

                <div class="confirm_guide">

                    <p>긴급 가상화폐 출금 제한 / 로그인 제한 기능 안내<br>
                       계정 해킹 등이 의심되는 긴급한 상황에 가상화폐 출금과 로그인을 빠르게 막을 수 있습니다.<br>
                       코인원 웹사이트 차단[긴급 가상화폐 출금 제한 / 로그인 제한] 버튼 또는 http://wwww.주소.co.kr 접속<br>
                       로그인하지 않은 상태: 이메일/이름/생년월일 등 개인정보 입력 필요<br>
                       로그인한 상태: 별도의 개인정보 입력 필요 없음<br>
                       [가상화폐 출금 제한] 또는 [로그인 + 가상화폐 출금 제한]을 할 수 있습니다.<br>
                       - 단 제한을 해제하려면 고객센터를 통한 본인 인증을 해야합니다.<br>
                       - 계정 해킹 등이 의심되면 즉시 제한을 걸고 고객센터로 문의주세요.</p>
                    <span class="confirm_sp4">긴급 가상화폐 출금 제한 / 로그인 제한 바로가기</span>    


                </div>

            


                <!-- <div class="agree_btnbox">
                    <span class="on">저장</span> <span>입력 취소</span>
                </div> -->



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
$(".email").click(function(){
    if("${login.id}" == null){
        alert("로그인 후 이용해주세요");
    }else{
        if(this.id == "comAuth"){
            return;
        }else{
            email.auth(this.id);
        }
    }
});
var email = {
        button:function(){
            $.ajax({
                 type : "POST",
                 url : "/check/mail",
                 contentType : "application/json; charset:utf-8",
                 dataType : "json",
                 async : false,
                 success : function(data) {
                     if(data.state){
                         if(data.confirm){
                             $(".email").text("인증완료");
                             $(".email").attr("id","comAuth");
                             $("#imgEmail").attr("src","/images/filter_on.png");
                         }else{
                             $(".email").text("재인증");
                             $(".email").attr("id","reAuth");
                             $("#imgEmail").attr("src","/images/filter_off.png");
                         }
                     }else{
                         $(".email").text("인증하기");
                         $(".email").attr("id","auth");
                         $("#imgEmail").attr("src","/images/filter_off.png");
                     }
                 },
                 error : function(request, status, error) {
                     console.log("code :" + request.status + "\n" + "error :" + error);
                 }
             });
        },
        auth:function(type){
            email.result("/send/mail",type);
        },
        result:function(url,type){
            jData = JSON.parse("{}");
            jData["type"] = type
                $.ajax({
                 type : "POST",
                 url : url,
                 data : JSON.stringify(jData),
                 contentType : "application/json; charset:utf-8",
                 dataType : "json",
                 async : false,
                 success : function(data) {
                     if(data.state){
                         alert("인증 메일 발송에 성공하였습니다")
                     }else{
                         alert("인증 메일 발송에 실패하였습니다")
                     }
                 },
                 error : function(request, status, error) {
                     console.log("code :" + request.status + "\n" + "error :" + error);
                 }
             });
        }
        
}

var otp = {
		button:function(){
			$.ajax({
				type:"POST"
			   ,url:"/check/otp"
			   ,dataType:"json"
			   ,success:function(data){
				   if(data.state){
                           $(".otp").text("인증완료");
                           $(".otp").attr("id","comAuth");
                           $("#imgOtp").attr("src","/images/filter_on.png");
                   }else{
                           $(".otp").text("인증하기");
                           $(".otp").attr("id","reAuth");
                           $("#imgOtp").attr("src","/images/filter_off.png");
				   }
			   },
			   error : function(request, status, error) {
                   console.log("code :" + request.status + "\n" + "error :" + error);
               }
			});
		},
		modal:function(){
            $.ajax({
                 type : "POST"
               ,url:"/otp/get"
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
//                    modalData += '				<p class="p1">바코드 스캔을 이용할 수 없으면 아래키를 입력할 수 있습니다.</p>';
//                    modalData += '				<p class="p2">'+'</p>';
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
//                    modalData += 'OTP인증 사용하기';
//                    modalData += 'Google Authenticator 앱에서 "계정설정 => 바코드스캔 을 이용하여 바코드를 스캔 하십시오.';
//                    modalData += '<img src="'+ data.url+'"/><br/>';
//                    modalData += 'SMS 인증 : ';
//                    modalData += '<input type="text" id="otpCodeNumber" MaxLength="6">';
//                    modalData += '<input type="button" id="commit" value="완료">';
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
                       ,url:"/otp/result"
                       ,dataType:"json"
                       ,contentType:"application/json;charset:UTF-8"
                       ,data:JSON.stringify(jData)
                       ,success:function(data){
                           
                           if(data.state){
                        	   alert("인증에 성공하였습니다");
                        	   location.reload();
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

$(".otp").click(function(){
	if("${login.id}" == null){
        alert("로그인 후 이용해주세요");
    }else{
        if(this.id == "comAuth"){
            return;
        }else{
        	otp.modal();
        }
    }
});

email.button();
otp.button();
</script>
</body>
</html>
    