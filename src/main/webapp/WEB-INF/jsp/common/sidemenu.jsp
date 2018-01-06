				<%@ page contentType="text/html;charset=UTF-8" language="java" %>

				<!-- <div class="d4 ex">
					<nav class="menu">
						<ul>
							<li><a href="#" class="m">입금</a>
								<div class="sub">
								<a href="/deposit/type/KRW">원화 (KRW)</a><br>
								<a href="/deposit/type/BTC">비트코인 (BTC)</a><br>
								<a href="/deposit/type/ETH">이더리움 (ETH)</a><br>
								<a href="/deposit/type/Qtum">큐텀 (Qtum)</a><br>
								<a href="/deposit/type/XRP">리플 (XRP)</a><br>
								<a href="/deposit/type/LTC">라이트코인 (LTC)</a><br>
								<a href="/deposit/type/BCH">비트코인 캐시 (BCH)</a>
								</div>
							</li>
							<li><a href="#" class="m">출금</a>
								<div class="sub">
								<a href="/withdraw/type/KRW">원화 (KRW)</a><br>
								<a href="/withdraw/type/BTC">비트코인 (BTC)</a><br>
								<a href="/withdraw/type/ETH">이더리움 (ETH)</a><br>
								<a href="/withdraw/type/Qtum">큐텀 (Qtum)</a><br>
								<a href="/withdraw/type/XRP">리플 (XRP)</a><br>
								<a href="/withdraw/type/LTC">라이트코인 (LTC)</a><br>
								<a href="/withdraw/type/BCH">비트코인 캐시 (BCH)</a>
								</div>
							</li>
							<a href="/deposit/type/Gift_Card" class="m"><li>상품권충전</li></a>
							<li><a href="#" class="m">주소록</a></li>
						</ul>
					</nav>
				</div>
				<script>
				// .d4 .menu li .m을 클릭함.
				$(".d4 .menu li .m").click(function(){
					var i = $(this);
					var s = i.siblings(".sub");
					var dis = s.css("display");
					// 만약 변수 dis의 값이 block과 같다면 => 즉 내가 클릭한 대상이 현재 열려있다면
					if(dis=="block"){
						i.parent("li").removeClass("active");
						s.slideUp(300);
						}
					// 만약 변수 dis의 값이 none과 같다면 => 즉 내가 클릭한 대상이 현재 닫혀있다면
					if(dis=="none"){
						$(".d4 .menu li").removeClass("active");
						i.parent("li").addClass("active");
						$(".d4 .menu li .sub").slideUp(300);
						s.slideDown(300);
						}
					return false;
					});
				</script> -->
				
				<style>
					.menu_li{padding:10px 14px; border-bottom:1px solid #ddd;}
					.menu_sub_box{background:#f7f7f7; padding:10px;}
					.menu_sub_box a{display:inline-block; padding-bottom:7px;}
				</style>

				<div class="d4 ex">
					<nav class="menu">
						
						<ul>
							<li class="menu_li">입금</li>
							<div class="menu_sub_box">
								<a href="/deposit/type/KRW">- 원화 (KRW)</a><br>
								<a href="/deposit/type/BTC">- 비트코인 (BTC)</a><br>
								<a href="/deposit/type/ETH">- 이더리움 (ETH)</a><br>
								<a href="/deposit/type/Qtum">- 큐텀 (Qtum)</a><br>
								<a href="/deposit/type/XRP">- 리플 (XRP)</a><br>
								<a href="/deposit/type/LTC">- 라이트코인 (LTC)</a><br>
								<a href="/deposit/type/BCH">- 비트코인 캐시 (BCH)</a>
							</div>
						</ul>
						<ul>
							<li class="menu_li" style="border-top:1px solid #ddd;">출금</li>
							<div class="menu_sub_box">
								<a href="/withdraw/type/KRW">- 원화 (KRW)</a><br>
								<a href="/withdraw/type/BTC">- 비트코인 (BTC)</a><br>
								<a href="/withdraw/type/ETH">- 이더리움 (ETH)</a><br>
								<a href="/withdraw/type/Qtum">- 큐텀 (Qtum)</a><br>
								<a href="/withdraw/type/XRP">- 리플 (XRP)</a><br>
								<a href="/withdraw/type/LTC">- 라이트코인 (LTC)</a><br>
								<a href="/withdraw/type/BCH">- 비트코인 캐시 (BCH)</a>
							</div>
						</ul>

						<ul>
							<a href="/deposit/type/Gift_Card"><li class="menu_li" style="border-top:1px solid #ddd;">상품권 충전</li></a>
						</ul>
						<!-- <ul>
							<li class="menu_li" style="border-bottom:0;">주소록</li>
						</ul> -->

					</nav>
				</div>
