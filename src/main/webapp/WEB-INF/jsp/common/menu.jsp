<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script> -->
<!-- <script src="http://code.jquery.com/jquery-3.2.1.js" type="text/javascript"></script> -->

<style>

#gnb{width:100%; background:#333; }

#cssmenu {
  position:relative;
  border: none;
  border: 0px;
  margin: 0px;
  padding: 0px;
  font: 67.5% "Lucida Sans Unicode", "Bitstream Vera Sans", "Trebuchet Unicode MS", "Lucida Grande", Verdana, Helvetica, sans-serif;
  font-size: 14px;
  font-weight: bold;
  width: 1200px;;
  background:#333;
  margin:0 auto;
}
#cssmenu ul {
  background: #333333;
  height: 35px;
  list-style: none;
  margin: 0;
  padding: 0;
  width:1200px;
  margin:0 auto;
}
#cssmenu li {
  float: left;
  padding: 0px;
}
#cssmenu li a {
  background: #333333 url("/images/seperator.gif") bottom right no-repeat;
  display: block;
  font-weight: normal;
  line-height: 35px;
  margin: 0px;
  padding: 0px 25px;
  text-align: center;
  text-decoration: none;
}
#cssmenu > ul > li > a {
  color: #cccccc;
}
#cssmenu ul ul a {
  color: #cccccc;
}
#cssmenu li > a:hover,
#cssmenu ul li:hover > a {
  background: #2580a2 url("/images/hover.png") bottom center no-repeat;
  color: #ffffff;
  text-decoration: none;
}
#cssmenu li ul {
  background: #333333;
  display: none;
  height: auto;
  padding: 0px;
  margin: 0px;
  border: 0px;
  position: absolute;
  width: 225px;
  z-index: 200;
  /*top:1em;
	/*left:0;*/

}
#cssmenu li:hover ul {
  display: block;
}
#cssmenu li li {
  background: url('/images/sub_sep.gif') bottom left no-repeat;
  display: block;
  float: none;
  margin: 0px;
  padding: 0px;
  width: 225px;
}
#cssmenu li:hover li a {
  background: none;
}
#cssmenu li ul a {
  display: block;
  height: 35px;
  font-size: 12px;
  font-style: normal;
  margin: 0px;
  padding: 0px 10px 0px 15px;
  text-align: left;
}
#cssmenu li ul a:hover,
#cssmenu li ul li:hover > a {
  background: #2580a2 url('/images/hover_sub.png') center left no-repeat;
  border: 0px;
  color: #ffffff;
  text-decoration: none;
}
#cssmenu p {
  clear: left;
}
#cssmenu ul ul li {
  position: relative;
}
#cssmenu ul ul ul {
  left: -9999px;
  top: 0;
}
#cssmenu ul ul li:hover > ul {
  left: 100%;
}
#cssmenu.align-center > ul > li {
  display: inline-block;
  float: none;
}
#cssmenu.align-center > ul {
  text-align: center;
}
#cssmenu > ul > li {
  position: relative;
}
#cssmenu.align-right > ul > li {
  float: right;
}
#cssmenu.align-right > ul > li:hover > ul {
  right: 0;
  left: auto;
  text-align: right;
}
#cssmenu.align-right ul ul li a {
  text-align: right;
}
#cssmenu.align-right ul ul li:hover > ul {
  left: auto;
  right: 100%;
}

.kakao{position:absolute; top:8px; right:0; color:#fff;}



</style>

<div id="gnb">

	<div id='cssmenu'>
	<ul>
	   <li><a href='/home'><span>Home</span></a></li>

	   <li class='active has-sub'><a href='/loan/invest/list'><span>코인 담보 론 투자</span></a>
		  <ul>
			 <li class='has-sub'><a href='/loan/invest/list'><span>담보 론 투자하기</span></a></li>
			 <li class='has-sub'><a href='/loan/invest/history'><span>주문 및 거래 내역</span></a></li>
			 <!-- <li class='has-sub'><a href='#'><span>지급스케쥴</span></a></li> -->
		  </ul>
	   </li>
	   <li class='active has-sub'><a href='/loan/payor/list'><span>담보 론 받기</span></a>
		  <ul>
			 <li class='has-sub'><a href='/loan/payor/list'><span>담보 론 받기</span></a></li>
			 <li class='has-sub'><a href='/loan/payor/history'><span>주문 및 거래 내역</span></a></li>
			 <!-- <li class='has-sub'><a href='#'><span>지급스케쥴</span></a></li> -->
		  </ul>
	   </li>
	   <!-- <li class='active has-sub'><a href='/fund/invest/list'><span>코인 펀딩 투자</span></a> -->
	   <li class='active has-sub'><a href='/service/error'><span>코인 펀딩 투자</span></a>
		  <ul>
			 <!-- <li class='has-sub'><a href='/fund/invest/add'><span>펀딩 모집 신청하기</span></a></li>
			 <li class='has-sub'><a href='/fund/invest/list'><span>펀드 투자하기</span></a></li>
			 <li class='has-sub'><a href='/fund/invest/history'><span>주문 및 거래 내역</span></a></li>
			 <li class='has-sub'><a href='#'><span>지급스케쥴</span></a></li> -->
			 <li class='has-sub'><a href='/service/error'><span>펀딩 모집 신청하기</span></a></li>
			 <li class='has-sub'><a href='/service/error'><span>펀드 투자하기</span></a></li>
			 <li class='has-sub'><a href='/service/error'><span>주문 및 거래 내역</span></a></li>
			 <li class='has-sub'><a href='/service/error'><span>지급스케쥴</span></a></li>
		  </ul>
	   </li>  
	   <li class='active has-sub'><a href='/calendar'><span>상환 및 수익 스케쥴</span></a>
		  <ul>
			 <li class='has-sub'><a href='/calendar'><span>지급 스케쥴</span></a></li>
			 <!-- <li class='has-sub'><a href='/calendar/loss'><span>이자지출 스케쥴</span></a></li> -->
		  </ul>
	   </li>
	   <li class='active has-sub'><a href='/deposit/type/KRW'><span>입출금</span></a>
		  <ul>
			 <li class='has-sub'><a href='/deposit/type/KRW'><span>입금</span></a>
				<ul>
				   <li><a href='/deposit/type/KRW'><span>원화 (KRW)</span></a></li>
				   <li><a href='/deposit/type/BTC'><span>비트코인 (BTC)</span></a></li>
				   <li><a href='/deposit/type/ETH'><span>이더리움 (ETH)</span></a></li>
				   <li><a href='/deposit/type/Qtum'><span>큐텀 (Qtum)</span></a></li>
				   <li><a href='/deposit/type/XRP'><span>리플 (XRP)</span></a></li>
				   <li><a href='/deposit/type/LTC'><span>라이트코인 (LTC)</span></a></li>
				   <li class='last'><a href='/deposit/type/BCH'><span>비트코인 캐시 (BCH)</span></a></li>
				</ul>
			 </li>
			 <li class='has-sub'><a href='/withdraw/type/KRW'><span>출금</span></a>
				<ul>
				   <li><a href='/withdraw/type/KRW'><span>원화 (KRW)</span></a></li>
				   <li><a href='/withdraw/type/BTC'><span>비트코인 (BTC)</span></a></li>
				   <li><a href='/withdraw/type/ETH'><span>이더리움 (ETH)</span></a></li>
				   <li><a href='/withdraw/type/Qtum'><span>큐텀 (Qtum)</span></a></li>
				   <li><a href='/withdraw/type/XRP'><span>리플 (XRP)</span></a></li>
				   <li><a href='/withdraw/type/LTC'><span>라이트코인 (LTC)</span></a></li>
				   <li class='last'><a href='/withdraw/type/BCH'><span>비트코인 캐시 (BCH)</span></a></li>
				</ul>
			 </li>
			 <li class='has-sub'><a href='/deposit/type/Gift_Card'><span>상품권 충전</span></a></li>	
			 <!-- <li class='has-sub'><a href='#'><span>주소록</span></a></li> -->	
		  </ul>
	   </li>
	   <li class='active has-sub'><a href='/history/profit'><span>투자 및 상환 이용내역</span></a>
		  <ul>
			 <li class='has-sub'><a href='/history/profit'><span>투자 수익</span></a></li>
			 <li class='has-sub'><a href='/history/loss'><span>론 지출</span></a></li>
		  </ul>
	   </li>  
	   <li class='active has-sub'><a href='/service/notice'><span>고객센터</span></a>
		  <ul>
			 <li class='has-sub'><a href='/service/notice'><span>공지사항</span></a></li>
			 <li class='has-sub'><a href='/service/faq'><span><!-- 1:1 문의하기 -->자주묻는 질문</span></a></li>
			 <li class='has-sub'><a href='/service/guide'><span>가이드북</span></a></li>
		  </ul>
	   </li>  
	   <li class='active has-sub'><a href='/user/modify'><span>마이 페이지</span></a>
		  <ul>
			 <li class='has-sub'><a href='/user/modify'><span>회원정보 변경</span></a></li>
			 <li class='has-sub'><a href='/user/safety'><span>보안 설정 및 인증</span></a></li>
			 <li class='has-sub'><a href="/user/question"><span>문의내역 확인</span></a></li>
		  </ul>
	   </li>  
	</ul>

	
	<p class="kakao">kakao 오픈채팅<p>
	</div>

</div><!--#gnb-->

<style>
.my_cash{width:100%; height:50px; border-bottom:1px solid #ddd;}
.my_cashIn{width:1200px; margin:0 auto; height:50px; line-height:50px;}
.my_cashIn:after{content:""; display:block; clear:both;}
.my_cashIn p{float:left; border-right:1px solid #ddd; box-sizing:border-box;}
.my_cashIn p.p1{width:150px; padding:0 10px; border-left:1px solid #ddd; }
.my_cashIn p.p1:after{content:""; display:block; clear:both;}
.my_cashIn p.p1 .sp_1{ float:left; font-size:14px; font-weight:500;}
.my_cashIn p.p1 .sp_2{ float:right; font-size:14px; font-weight:500;}
.my_cashIn p.p2{padding:0 20px;}
.my_cashIn p.p2 .sp_1{ float:left; margin-right:10px; color:#4186c7;}
.my_cashIn p.p2 .sp_2{ float:right;}

</style>
<c:if test = "${login != null }">
<div class="my_cash">
	<div class="my_cashIn">

		<p class="p1"><span class="sp_1">총 캐쉬</span><span class="sp_2">0</span></p>
		<p class="p2"><span class="sp_1">원화</span><span class="sp_2">0.0000</span></p>
		<p class="p2"><span class="sp_1">비트코인</span><span class="sp_2">0.0000</span></p>
		<p class="p2"><span class="sp_1">이더리움</span><span class="sp_2">0.0000</span></p>
		<p class="p2"><span class="sp_1">큐텀</span><span class="sp_2">0.0000</span></p>
		<p class="p2"><span class="sp_1">리플</span><span class="sp_2">0.0000</span></p>
		<p class="p2"><span class="sp_1">라이트코인</span><span class="sp_2">0.0000</span></p>
		<p class="p2"><span class="sp_1">비트코인 캐시</span><span class="sp_2">0.0000</span></p>

	</div>
</div>
</c:if>