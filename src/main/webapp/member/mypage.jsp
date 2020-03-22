<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./resources/css/reset.css" type="text/css"
	media="all">
<link rel="stylesheet" href="./resources/css/layout.css" type="text/css"
	media="all">
<link rel="stylesheet" href="./resources/css/style.css" type="text/css"
	media="all">
<link href="./resources/css/naver-style.css" rel="stylesheet">
<script type="text/javascript" src="./resources/js/jquery-3.3.1.min.js"></script>
</head>
<body>
	<div class="extra">
		<div class="main">
			<div class="wrapper">
				<h1>
					<a href="./loginmain.jsp" id="logo">내일로</a>
				</h1>
			</div>
			<nav>
			<ul id="menu">
				<li><a href="member/updatemember.jsp" class="nav1">회원정보 수정</a></li>
				<li><a href="member/pwCheck.jsp" class="nav2">회원탈퇴</a></li>
				<li><a href="myReview.do" class="nav3">나의 후기</a></li>
				<li><a href="mytripselect.do" class="nav4">마이 트립</a></li>
			</ul>
			</nav>
			<div id="wrap">
				<div id="container">
					<div id="content">
						<div class="join">
							<h2 align="center">${id}님의개인정보입니다.</h2>
							<br> <br>
							<fieldset>
								<legend>개인정보</legend>
								<p class="field birth">
									<label for="user-birth">이름</label> <input type="text"
										id="user-confirm" class="inp-field w330"
										value=${memberDTO2.name} readonly="readonly">
								</p>
								<p class="field birth">
								<label for="user-birth">이메일</label>
									<input type="text" id="email" class="inp-field w130"
										name="email" readonly="readonly" value=${email2}> <label
										for="user-birth">@</label> <input type="text" id="email"
										class="inp-field w205" name="email" readonly="readonly" value=${email3}>
								</p>
								<p class="field birth">
									<label for="user-birth">성별</label> <input type="text"
										id="user-confirm" class="inp-field w330"
										value=${memberDTO2.gender} readonly="readonly">
								</p>
								<p class="field birth">
									<label for="user-birth">주소</label> <input type="text"
										id="user-confirm" class="inp-field w330"
										value=${memberDTO2.address} readonly="readonly">
								</p>
								<p class="field birth">
									<label for="user-birth">전화번호</label> <input type="text"
										id="user-confirm" class="inp-field w330"
										value=${memberDTO2.tel} readonly="readonly">
								</p>
							</fieldset>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="body1 po">
			<div class="main">
				<footer></footer>
			</div>
		</div>
	</div>
</body>
</html>