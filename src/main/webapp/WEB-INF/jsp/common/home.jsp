<%--
  Created by IntelliJ IDEA.
  User: Jun
  Date: 2017-10-12
  Time: 오후 3:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>

<html>
<head>
    <title>HOME</title>

    <%@include file="layout.jsp" %>

</head>
<body>
<div id="wrap">

    <%@include file="header.jsp" %>
    <%@include file="menu.jsp" %>


    <!-- 이벤트 슬라이드 스크립트 / menu위에 넣으면 작동 안함 / 여기에 고정 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="/js/swiper.jquery.min.js"></script>
    <!--// 이벤트 슬라이드끝-->


    <div class="contents">

        <div class="main_cont_L">
            <div class="cont_1"><!-- 이벤트박스와 공지사항박스 부모-->

                <div class="evnet_box">
                    <div class="wrap4 event">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide s1">슬라이드1</div>
                            <div class="swiper-slide s2">슬라이드2</div>
                            <div class="swiper-slide s3">슬라이드3</div>
                            <div class="swiper-slide s4">슬라이드4</div>
                        </div>
                        <div class="pager"></div>
                    </div> <!--.wrap4-->
                    <script>
                        var sw4 = new Swiper(".wrap4",{
                        	autoplay: 3000,
                        	autoplayDisableOnInteraction: false,
                            pagination : ".wrap4 .pager",
                            continuous:true
                        });
                        
                        $( ".swiper-wrapper" ).hover(  
                        	      function() {
                        	    	  sw4.stopAutoplay();  
                        	      }, function() {
                        	    	  sw4.startAutoplay(); 
                        	      });
                    </script>
                </div><!--.evnet_box -->

                <div class="notice_box">
                    <p>공지사항</p>
                    <table>
                        <colgroup>
                            <col width="75%;">
                            <col width="25%;">
                        </colgroup>

                        <c:forEach items="${noticeList}" var="notice">
                            <tr>
                                <td><a href="/service/notice?no=${notice.no}">${notice.title}</a></td>
                                <td>${notice.regDate}</td>
                            </tr>
                        </c:forEach>
                    </table>
                    <br>
                    <p>보도자료</p>
                    <table>
                        <colgroup>
                            <col width="75%;">
                            <col width="25%;">
                        </colgroup>
                        <c:forEach items="${newsList}" var="news">
                            <tr>
                                <td>${news.title}</td>
                                <td>${news.regDate}</td>
                            </tr>
                        </c:forEach>
                    </table>
                </div><!--.notice_box -->

            </div><!--.cont_1 // 이벤트박스와 공지사항박스 부모 끝-->


            <div class="main_list_box"><!-- 코인펀드투자리스트,코인담보론리스트 박스-->

                <div class="main_list_L">
                    <p>투자 리스트</p>
                    <div class="filter_list_tb_box">
                        <table>
                            <colgroup>
                                <col width="7%">
                                <col width="12.5%">
                                <col width="12.5%">
                                <col width="12.5%">
                                <col width="12.5%">
                            </colgroup>
                            <tr>
                                <th>기간</th>
                                <th>투자 코인종류</th>
                                <th>모집 금액</th>
                                <th>코인 종류</th>
                                <th>진행상황</th>
                            </tr>


                            <c:forEach items="${investList}" var="invest">
                                <tr>
                                    <td>${invest.deadline}</td>
                                    <td>BTC</td>
                                    <td>${invest.amount}</td>
                                    <td>BTC</td>
                                    <td>NULL</td>
                                </tr>
                            </c:forEach>
                        </table><!--.table 끝 // td는 한 화면에 7개만 나옵니다. -->
                    </div><!--.filter_list_tb_box -->


                </div><!--.main_list_L -->

                <div class="main_list_R">
                    <p>코인 담보 론 투자 리스트 </p>
                    <div class="filter_list_tb_box">
                        <table>
                            <colgroup>
                                <col width="12.5%">
                                <col width="7%">
                                <col width="12.5%">
                                <col width="12.5%">
                                <col width="12.5%">
                                <col width="12.5%">
                                <%-- <col width="12.5%"> --%>
                            </colgroup>
                            <tr>
                                <th>남은 모집시간</th>
                                <th>기간</th>
                                <th>이자율</th>
                                <th>담보 코인</th>
                                <th>모집 금액</th>
                                <th>진행상황</th>
                                <!-- <th>첫 지급일</th> -->
                            </tr>
                            <c:forEach var="i" items="${productList}" begin="0" end="6">
									<tr>
										<td>${i.deadline} 시간</td> 
										<td>${i.wantPeriod }개월</td>
										<td class="tdNumber">${i.interestRate }%</td>
										<td>${i.coinValue }</td>
										<td class="tdNumber"><fmt:formatNumber value="${i.wantAmount }" pattern="#,###"/> 원</td>
										<td>0%</td>
									</tr>
							</c:forEach>
                        </table><!--.table 끝 // td는 한 화면에 7개만 나옵니다. -->
                    </div><!--.filter_list_tb_box -->

                </div><!--.main_list_R -->

            </div><!--.main_list_box // 코인펀드투자리스트,코인담보론리스트 박스 끝-->


            <div class="main_graph"><!-- 메인 그래프API 박스-->

                <h1>그래프</h1>

                <div class="main_graph_In">
                    메인 그래프API 공간
                </div><!--.main_graph_In -->

            </div><!--.main_graph // 메인 그래프API 박스 끝-->

           <%-- <div class="mian_conclusion"><!-- 메인 체결박스-->

                <div class="mian_conclusion_L">

                    <h1>거래완료</h1>
                    <div>
                        <table>
                            <colgroup>
                                <col width="25%">
                                <col width="25%">
                                <col width="25%">
                                <col width="25%">
                            </colgroup>
                            <tr>
                                <th>체결시작</th>
                                <th>1비트코인 당 가격</th>
                                <th>체결가격</th>
                                <th>비트코인 거래량</th>
                            <tr>
                            <tr>
                                <td>09-94- 11:23</td>
                                <td>5,000,000</td>
                                <td>1,926,328</td>
                                <td>0.37890000</td>
                            <tr>
                            <tr>
                                <td>09-94- 11:23</td>
                                <td>5,000,000</td>
                                <td>1,926,328</td>
                                <td>0.37890000</td>
                            <tr>
                            <tr>
                                <td>09-94- 11:23</td>
                                <td>5,000,000</td>
                                <td>1,926,328</td>
                                <td>0.37890000</td>
                            <tr>
                            <tr>
                                <td>09-94- 11:23</td>
                                <td>5,000,000</td>
                                <td>1,926,328</td>
                                <td>0.37890000</td>
                            <tr>
                            <tr>
                                <td>09-94- 11:23</td>
                                <td>5,000,000</td>
                                <td>1,926,328</td>
                                <td>0.37890000</td>
                            <tr>
                            <tr>
                                <td>09-94- 11:23</td>
                                <td>5,000,000</td>
                                <td>1,926,328</td>
                                <td>0.37890000</td>
                            <tr>
                            <tr>
                                <td>09-94- 11:23</td>
                                <td>5,000,000</td>
                                <td>1,926,328</td>
                                <td>0.37890000</td>
                            <tr>
                            <tr>
                                <td>09-94- 11:23</td>
                                <td>5,000,000</td>
                                <td>1,926,328</td>
                                <td>0.37890000</td>
                            <tr>
                            <tr>
                                <td>09-94- 11:23</td>
                                <td>5,000,000</td>
                                <td>1,926,328</td>
                                <td>0.37890000</td>
                            <tr>
                            <tr>
                                <td>09-94- 11:23</td>
                                <td>5,000,000</td>
                                <td>1,926,328</td>
                                <td>0.37890000</td>
                            <tr>
                        </table>
                    </div>

                </div><!--.mian_conclusion_L -->

                <div class="mian_conclusion_R">

                    <h1>판매,구매 물품</h1>
                    <div>
                        <table>
                            <colgroup>
                                <col width="20%">
                                <col width="40%">
                                <col width="40%">
                            </colgroup>
                            <tr>
                                <th>구매/판매</th>
                                <th>1비트코인 당 가격</th>
                                <th>비트코인 수량</th>
                            <tr>
                            <tr>
                                <td>판매(7)</td>
                                <td>5,000,000</td>
                                <td>0.0100000</td>
                            <tr>
                            <tr>
                                <td>판매(7)</td>
                                <td>5,000,000</td>
                                <td>0.0100000</td>
                            <tr>
                            <tr>
                                <td>판매(7)</td>
                                <td>5,000,000</td>
                                <td>0.0100000</td>
                            <tr>
                            <tr>
                                <td>판매(7)</td>
                                <td>5,000,000</td>
                                <td>0.0100000</td>
                            <tr>
                            <tr>
                                <td>판매(7)</td>
                                <td>5,000,000</td>
                                <td>0.0100000</td>
                            <tr>
                            <tr>
                                <td>판매(7)</td>
                                <td>5,000,000</td>
                                <td>0.0100000</td>
                            <tr>
                            <tr>
                                <td>판매(7)</td>
                                <td>5,000,000</td>
                                <td>0.0100000</td>
                            <tr>
                            <tr>
                                <td>판매(7)</td>
                                <td>5,000,000</td>
                                <td>0.0100000</td>
                            <tr>
                            <tr>
                                <td>판매(7)</td>
                                <td>5,000,000</td>
                                <td>0.0100000</td>
                            <tr>
                            <tr>
                                <td>판매(7)</td>
                                <td>5,000,000</td>
                                <td>0.0100000</td>
                            <tr>
                        </table>
                    </div>

                </div><!--.mian_conclusion_R -->


            </div>


        </div><!--.main_cont_L -->--%>


        <!-- 우측 사이드박스 시작-->
        <div class="main_cont_R">

        </div><!--.main_cont_R -->


    </div><!--.contents -->


    <%@include file="footer.jsp"%>

</div>

</body>
</html>
