<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
<meta charset="utf-8">
<link rel="stylesheet" href="resources/css/reset.css" type="text/css"
	media="all">
<link rel="stylesheet" href="resources/css/layout.css" type="text/css"
	media="all">
<link rel="stylesheet" href="resources/css/style.css" type="text/css"
	media="all">
<script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#blogin").click(function() { //로그인버튼 blogin
			var idresult = $("#id").val(); //아이디가 공백이면 =idresult
			var pwresult = $("#pw").val(); //패드워드가 공백이면 =pwresult
			if (idresult == "") {
				alert("아이디를 입력해주세요.");
			}else if (pwresult == "") {
				alert("비밀번호를 입력해주세요.");	
			}else {							//전부 공백란이 아니라면
				$("#form_1").submit();		//submit해라
			}
		 
		});
		$("#binsert").click(function(){ 	//버튼회원가입(insert)를 눌렀을 때 
			window.location.href="./member/memberinsert.jsp"//회원가입창으로 가라.!
		});
		
		$("#bmypage").click(function(){ //버튼마이페이지(mypage)를 눌렀을 때
			window.location.href="memberselect.do"//마이페이지 창으로 가라.!
		});
		
	});
</script>
</head>
<body id="page1">
	<div class="extra">
		<div class="main">
			<!-- header -->
			<header>
			<div class="wrapper">
				<h1>
					<a href="loginmain.jsp" id="logo">내일로</a>
				</h1>
				<div class="right">
				</div>
			</div>
			
			<!-- 메뉴박스 --> 
			<nav>
			<ul id="menu">
				<li><a href="./neailrointroduce.do" class="nav1">내일로란</a></li>
				<li><a href="./searcharea.do?location=수도권" class="nav2">지역명소</a></li>
				<li><a href="./reviewBoard.do" class="nav3">후기</a></li>
				<li><a href="./mytrip/travelPlanning.jsp" class="nav4">여행하기</a></li>
				<li><a href="http://www.letskorail.com/korail/com/login.do?ret_url=/ebizprd/EbizPrdTicketHc11911_i1.do?hidSchdTkKndCd=08" class="nav5">티켓발권</a></li>
			</ul>
			</nav>
			
			 <%if (session.getAttribute("id") == null) {%> 

				<!-- 로그인 from -->
 		 <article class="col1">
			<ul class="tabs"> 
			<div class="tabs_cont">
				<div class="bg">
					<form id="form_1" action="LoginOk.do" method="post">
						<div class="wrapper">
							<input type="text" class="input" name="id" id="id">ID
						</div>
						<div class="wrapper">
							<input type="password" class="input" name="pw" id="pw">PW
						</div>
						<div class="wrapper pad_bot1">
							<button type="button" class="button" id="binsert">회원가입</button>
							<button type="button" class="button" id="blogin">로그인</button>
						</div>
					</form>
				</div>
			</div>
			</ul> 
			</article>
			 <%} else {%> 
			 <!--로그아웃 form -->
			 <article class="col1">
			<form id="form_1" action="LogOut" method="post">
				<div class="tabs_cont" align="center" style="color: white">
				<p>${id}님 환영합니다!</p>
					<div class="wrapper pad_bot1" align="left">
						<input type="submit" class="button margin" id="blogout" value="로그아웃" >
						<button type="button" class="button" id="bmypage" >마이페이지</button>
					</div>
				</div>
			</form>
			</article> 
			
			<%}%>
			
			 <article class="col1 pad_left1">
			<div class="text">
				<img src="resources/images/text1.jpg" alt="">
				<h2>The Best Offers</h2>
				<p>Sed ut perspiciatis unde omnis iste natus error sit
					voluptatem accusantium doloremque laudantium, totam rem aperiam,
					eaque ipsa quae ab illo inventore.</p>
				<a href="#" class="button">Read More</a>
			</div>
			</article>
			<div class="img">
				<img src="resources/images/img.jpg" alt="">
			</div>
			</header>
			<div class="ic">More Website Templates at TemplateMonster.com!</div>
			<!-- / header -->
			<!-- content -->
			<section id="content"> <article class="col1">
			<h3>Hot Travel</h3>
			<div class="pad">
				<div class="wrapper under">
					<figure class="left marg_right1"> <img
						src="resources/images/page1_img1.jpg" alt=""></figure>
					<p class="pad_bot2">
						<strong>Italy<br>Holidays
						</strong>
					</p>
					<p class="pad_bot2">Lorem ipsum dolor sit amet, consect etuer
						adipiscing.</p>
					<a href="#" class="marker_1"></a>
				</div>
				<div class="wrapper under">
					<figure class="left marg_right1"> <img
						src="resources/images/page1_img2.jpg" alt=""></figure>
					<p class="pad_bot2">
						<strong>Philippines<br>Travel
						</strong>
					</p>
					<p class="pad_bot2">Lorem ipsum dolor sit amet, consect etuer
						adipiscing.</p>
					<a href="#" class="marker_1"></a>
				</div>
				<div class="wrapper">
					<figure class="left marg_right1"> <img
						src="resources/images/page1_img3.jpg" alt=""></figure>
					<p class="pad_bot2">
						<strong>Cruise<br>Holidays
						</strong>
					</p>
					<p class="pad_bot2">Lorem ipsum dolor sit amet, consect etuer
						adipiscing.</p>
					<a href="#" class="marker_1"></a>
				</div>
			</div>
			</article> <article class="col2 pad_left1">
			<h2>Popular Places</h2>
			<div class="wrapper under">
				<figure class="left marg_right1"> <img
					src="resources/images/page1_img4.jpg" alt=""></figure>
				<p class="pad_bot2">
					<strong>Hotel du Havre</strong>
				</p>
				<p class="pad_bot2">Sed ut perspiciatis unde omnis iste natus
					error sit voluptatem accusantium doloremque laudantium, totam rem
					aperiam, eaque ipsa quae ab illo inventore veritatis et quasi
					architecto beatae vitae dicta sunt explicabo.</p>
				<p class="pad_bot2">
					<strong>Nemo enim ipsam voluptatem</strong> quia voluptas sit
					aspernatur aut odit aut fugit, sed quia consequuntur magni dolores
					eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam
					est, qui dolorem ipsum quia dolor sit amet, consectetur.
				</p>
				<a href="#" class="marker_2"></a>
			</div>
			<div class="wrapper">
				<figure class="left marg_right1"> <img
					src="resources/images/page1_img5.jpg" alt=""></figure>
				<p class="pad_bot2">
					<strong>Hotel Vacance</strong>
				</p>
				<p class="pad_bot2">At vero eos et accusamus et iusto odio
					dignissimos ducimus qui blanditiis praesentium voluptatum deleniti
					atque corrupti quos dolores et quas molestias excepturi sint
					occaecati cupiditate non provident, similique sunt in culpa.</p>
				<p class="pad_bot2">Et harum quidem rerum facilis est et
					expedita distinctio. Nam libero tempore, cum soluta nobis est
					eligendi optio cumque nihil impedit quo minus id quod maxime
					placeat facere possimus, omnis voluptas assumenda.</p>
				<a href="#" class="marker_2"></a>
			</div>
			</article> </section>
			<!-- / content -->
		</div>
		<div class="block"></div>
	</div>
	<div class="body1">
		<div class="main">
			<!-- footer -->
			<footer> </footer>
			<!-- / footer -->
		</div>
	</div>
	<script type="text/javascript">Cufon.now();
	</script>
</body>
</html>