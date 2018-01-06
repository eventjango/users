<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value = '<%= session.getAttribute("login") %>' var = "login"/>
<c:set value = '<%= session.getAttribute("lastURL") %>' var = "lastURL"/>


<div id="header">

    <div class="headerIn">
        <p class="headerIn_p1">비트코인 : <span>6,568,000원</span></p>
        <p class="headerIn_p2">이더리움 : <span>최종 : 6,444,977원($5703.52)가중평균 : 6,531,326원($5779.93)거래량 : 2253.70BTC</span></p>
        <p class="headerIn_p3">
            <select>
                <option>국가선택</option>
                <option>한국어</option>
                <option>영어</option>
                <option>일본어</option>
                <option>중국어</option>
            </select>
        </p>
    </div><!--.headerIn -->
</div><!--#header -->

<div id="header_btm">
    <a href="<c:url value="/home"/>"><p class="logo">LOGO</p></a>
    <P class="cafe_link"><span>카페</span><span>카페</span><span>카페</span></P>
    <p class="guide_btn"><span>가이드북버튼</span></p>
    <p class="login_box">
    <c:if test = "${login == null}" >
    <a href="/login"><span>로그인</span></a><a href="/user/add"><span>회원가입</span></a>
	</c:if>
    <c:if test = "${login != null }">
    <span class="logout">로그아웃</span><%--<span>${login.id.split("@")[0]} 님</span>--%><span>${login.name} 님</span>
    </c:if>
    </p>
</div><!--#header_btm -->
<script>
$(".logout").click( function(){
	if(confirm('<spring:message code = "login.logout.ask"/>')){
		alert('<spring:message code = "login.logout"/>');
		location.href="/logout";
	}else{
		return false;
	}
});
</script>