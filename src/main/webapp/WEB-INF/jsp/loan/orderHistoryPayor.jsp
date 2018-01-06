<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
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
					<a href="/loan/payor/list"><li>담보 론 받기</li></a>
					<a href="/loan/payor/history"><li class="on">주문 및 거래내역</li></a>
					<!-- <a href="#"><li>지급 스케쥴</li></a> -->
				</ul>
			</div><!--.side_menu -->

			<div class="center_cont">

				<div class="order_box">
					<div class="orderIn_01">
						<p>체결전 주문</p>
						<table>
							<colgroup>
								<col width="12%">
								<col width="12%">
								<col width="12%">
								<col width="12%">
								<col width="12%">
								<col width="12%">
								<col width="12%">
								<col width="12%">
								<col width="4%">
							</colgroup>
							<tr>		 	 	 	 	
								<th>거래요청일자</th><!-- regDate -->
								<th>대출금액</th><!-- amount -->
								<th>이자율</th><!--interestRate  -->
								<th>대출기간</th><!--wantPeriod  -->
								<th>마감일</th><!-- deadline -->
								<th>담보종류</th><!-- coinType -->
								<th>담보수량</th><!-- coinAmount -->
								<th>상태</th><!-- state -->
								<th>취소</th>
							</tr>
							<c:if test="${loanWaitList.size()  < 1 }">
								<tr>
									<td colspan="9">거래내역이 없습니다</td>
								</tr>
							</c:if>
							<c:forEach var ="i" items="${loanWaitList}" begin="0">
							<tr>
								<td>${i. regDate}</td>
								<td class="tdNumber"><fmt:formatNumber value="${i.amount }" pattern="#,###"/>원</td>
								<td class="tdNumber"><fmt:formatNumber value="${i.interestRate }" pattern="#,###"/>%</td>
								<td>${i. wantPeriod}개월</td>
								<td>${i. deadline}</td>
								<td>${i.coinType}</td>
								<td>${i.coinAmount}</td>
								<td>${i.state}</td>
								<td class="loanCancel pointer" id="cancel_${i.no}">취소</td>
							</tr>
							</c:forEach>
						</table>
					</div>
					<br>
					<div class="orderIn_01">
						<p>진행중인 주문</p>
						<table>
							<%-- <colgroup>
								<col width="11%">
								<col width="11%">
								<col width="11%">
								<col width="11%">
								<col width="11%">
								<col width="11%">
								<col width="11%">
								<col width="11%">
								<col width="11%">
							</colgroup>
							<tr>
								<th>체결일시</th>
								<th>담보코인종류</th>
								<th>담보코인수량</th>
								<th>이자율</th>
								<th>체결 KRW 금액</th>
								<th>기간</th>
								<th>진행상황</th>
								<th>KRW 변동</th>
								<th>수수료</th>
							</tr> --%>
							<colgroup>
								<col width="12%">
								<col width="12%">
								<col width="12%">
								<col width="12%">
								<col width="12%">
								<col width="12%">
								<col width="12%">
								<col width="12%">
							</colgroup>
							<tr>		 	 	 	 	
								<th>거래요청일자</th><!-- regDate -->
								<th>진행률</th><!-- amount -->
								<th>이자율</th><!--interestRate  -->
								<th>대출기간</th><!--wantPeriod  -->
								<th>마감일</th><!-- deadline -->
								<th>담보종류</th><!-- coinType -->
								<th>담보수량</th><!-- coinAmount -->
								<th>상태</th><!-- state -->
							</tr>
							
							<c:if test="${loanProgressList.size()  < 1 }">
								<tr>
									<td colspan="8">거래내역이 없습니다</td>
								</tr>
							</c:if>
							<c:forEach var ="i" items="${loanProgressList}" begin="0">
							<tr>
								<td>${i. regDate}</td>
								<td class="tdNumber"><fmt:formatNumber value="${i.balance }" pattern="#,###"/> / <fmt:formatNumber value="${i.amount }" pattern="#,###"/>원</td>
								<td class="tdNumber"><fmt:formatNumber value="${i.interestRate }" pattern="#,###"/>%</td>
								<td>${i. wantPeriod}개월</td>
								<td>${i. deadline}</td>
								<td>${i.coinType}</td>
								<td>${i.coinAmount}</td>
								<td>${i.state}</td>
							</tr>
							</c:forEach>
						</table>
					</div>

				
				</div><!--.order_box -->


			</div><!--.center_cont -->

		</div><!--.main_cont_L -->






		<!-- 우측 사이드박스 시작-->
		<div class="main_cont_R">
		
		</div><!--.main_cont_R -->

	
	</div><!--.contents -->
	<script type="text/javascript">
    $(".loanCancel").click(function(){
    	if(confirm("정말 취소하시겠습니까?")){
    		loan.cancel(this.id);
    	}
		    	
    });
    
    var loan = {
    		cancel:function(id){
    			$.ajax({
    	            type : "POST",
    	            url : "/loan/payor/history/cancel",
    	            data : id,
    	            dataType : "json",
    	            contentType : "application/json; charset:UTF-8",
    	            success : function (data) {
    	                if(data){
    	                	alert("취소 성공");
    	                	location.reload();
    	                }else{
    	                	alert("취소 실패");
    	                }
    	            },error : function(request, status, error) {
    	                console.log("code : " + request.status + "\n" + "error : " + error);
    	            }
    	        });
    		}
    }
    </script>

    
<%@include file="../common/footer.jsp"%>

</div>

</body>
</html>
    