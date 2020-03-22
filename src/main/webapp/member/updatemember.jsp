<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/reset.css" type="text/css"
	media="all">
<link rel="stylesheet" href="../resources/css/layout.css"
	type="text/css" media="all">
<link rel="stylesheet" href="../resources/css/style.css" type="text/css"
	media="all">
<link href="../resources/css/naver-style.css" rel="stylesheet">
<script type="text/javascript" src="../resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#checkpw").keyup(function() { //check pw 키보드 업하면 
		var pw = $("#pw").val(); // pw 값
		var checkpw = $("#checkpw").val(); //checkpw 값
		if (pw == checkpw) { //pw 값이랑 checkpw값이랑 같으면
			$("#checkpwimg").attr("class", "ico pass3");
		} else { //같지않으면
			$("#checkpwimg").attr("class", "ico pass2");
		}
	});	
	
	$("#insertb").click(function() {
		var pw = $("#pw").val();
		var checkpw = $("#checkpw").val();
		var name = $("#name").val();
		var email = $("#email").val();
		var address = $("#address").val();
		var tel = $("#tel").val();
		if (pw == "") {
			alert("비밀번호를 입력헤주세요.");
		} else if (pw != checkpw) {
			alert("비밀번호가 같지않습니다.")
		} else if (name == "") {
			alert("이름을 입력해주세요.");
		} else if (email == "") {
			alert("이메일을 입력해주세요.");
		} else if (address == "") {
			alert("주소를 입력해주세요.");
		} else if (tel == "") {
			alert("전화번호를 입력해주세요");
		} else {
			$("#insertform").submit();
		}
	});
	
});
</script>
</head>
<body id="page2">
	<div class="extra">
		<div class="main">
			<div class="wrapper">
				<h1>
					<a href="../loginmain.jsp" id="logo">내일로</a>
				</h1>
			</div>
			<nav>
			<ul id="menu">
				<li><a href="../memberselect.do" class="nav1">나의 정보</a></li>
				<li><a href="../member/pwCheck.jsp" class="nav2">회원탈퇴</a></li>
				<li><a href="../myReview.do" class="nav3">나의 후기</a></li>
				<li><a href="../mytripselect.do" class="nav4">마이 트립</a></li>
			</ul>
			</nav>
			<div id="wrap">
				<div id="container">
					<div id="content">
						<h2 class="blind">내일로 회원가입</h2>
						<div class="join">
							<form action="../memberupdate.do" method="post" id="insertform">
								<fieldset>
									<legend>아이디, 비밀번호</legend>
									<p class="field birth">
									<label for="user-birth">아이디</label> <input type="text"
										id="user-confirm" class="inp-field w330" name="id" value=${id} readonly="readonly">
								</p>
									<p class="field">
										<label for="user-pass" class="blind">비밀번호</label> <input
											type="password" id="pw" placeholder="비밀번호" class="inp-field"
											name="pw">
									</p>
									<p class="field">
										<label for="user-pass2" class="blind">비밀번호 재확인</label> <input
											type="password" id="checkpw" placeholder="비밀번호 재확인"
											class="inp-field"> <span class="ico pass2"
											id="checkpwimg"></span>
									<h6 id="checkpwtd"></h6>
									</p>

								</fieldset>

								<fieldset>
									<legend>개인정보</legend>
									<p class="field">
										<label for="user-name" class="blind">이름</label> <input
											type="text" id="name" placeholder="이름" class="inp-field w458"
											name="name">
									</p>

									<p class="field birth">
										<input type="text" id="email" placeholder="이메일"
											class="inp-field w205" name="email"> <label
											for="user-birth">@</label> <span class="field-wall"></span> <select
											title="이메일을 선택하세요" name="email">
											<option value="neailro.com">neailro.com</option>
											<option value="naver.com">naver.com</option>
											<option value="daum.net">daum.net</option>
											<option value="gmail.com">gmail.com</option>
										</select>
									</p>
								</fieldset>
								<fieldset>
									<legend>주소</legend>
									<p class="field">
										<label for="user-name" class="blind">주소</label> <input
											type="text" id="address" placeholder="주소"
											class="inp-field w458" name="address" title="주소를 입력하세요">
									</p>
									<legend>전화번호</legend>
									<p class="field">
										<label for="user-name" class="blind">휴대전화번호</label> <input
											type="text" id="tel" placeholder="휴대전화번호"
											class="inp-field w458" name="tel" title="휴대전화번호를 입력하세요">
									</p>
								</fieldset>

								<!--서밋 버튼  -->
								<div class="btn-area">
									<button type="button" class="btn-submit1" id="insertb"></button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="block"></div>
		<div class="body1 po">
			<div class="main">
				<footer></footer>
			</div>
		</div>
	</div>
</body>
</html>