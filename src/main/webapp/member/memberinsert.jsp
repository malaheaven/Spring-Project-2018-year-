<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../resources/css/naver-style.css" rel="stylesheet">
<title>회원가입</title>
<script type="text/javascript" src="../resources/js/jquery-3.3.1.min.js"></script>
</head>
<script type="text/javascript">
	$(function() {
		//아이디 중복확인
		$("#id").keyup(function() {
			var id = $("#id").val();
			$.ajax({
				async : true,
				type : "post",
				data : id,
				url : "../checkid.do",
				dataType : "json",
				contentType : "application/json; charset=UTF-8",
				success : function(data) {
					if (data.checkId == true) {
						$("#checkidimg").attr("class", "ico pass4");
					} else {
						$("#checkidimg").attr("class", "ico pass3");
					}
				},
			});
		});
		//패스워드 확인
		$("#checkpw").keyup(function() { //check pw 키보드 업하면 
			var pw = $("#pw").val(); // pw 값
			var checkpw = $("#checkpw").val(); //checkpw 값
			if (pw == checkpw) { //pw 값이랑 checkpw값이랑 같으면
				$("#checkpwimg").attr("class", "ico pass3");
			} else { //같지않으면
				$("#checkpwimg").attr("class", "ico pass2");
			}
		});

		//공백처리
		$("#insertb").click(function() {
			var id = $("#id").val();
			var pw = $("#pw").val();
			var checkpw = $("#checkpw").val();
			var name = $("#name").val();
			var gender = $("input[name=gender]:checked").val();
			var email = $("#email").val();
			var address = $("#address").val();
			var tel = $("#tel").val();
			$.ajax({
				async : true,
				type : "post",
				data : id,
				url : "../checkid.do",
				dataType : "json",
				contentType : "application/json; charset=UTF-8",
				success : function(data) {
					if (data.checkId == true) {
						alert("사용할수 없는 아이디입니다.")
					} else if (id == "") {
						alert("아이디를 입력헤주세요.");
					} else if (pw == "") {
						alert("비밀번호를 입력헤주세요.");
					} else if (pw != checkpw) {
						alert("비밀번호가 같지않습니다.")
					} else if (name == "") {
						alert("이름을 입력해주세요.");
					} else if (gender == null) {
						alert("성별을 선택해주세요.");
					} else if (email == "") {
						alert("이메일을 입력해주세요.");
					} else if (address == "") {
						alert("주소를 입력해주세요.");
					} else if (tel == "") {
						alert("전화번호를 입력해주세요");
					} else {
						$("#insertform").submit();
					}
				},
			});
		});
	});
</script>
<body>
	<div id="wrap">
		<!-- header -->
		<div id="header">
			<h1 class="logo">
				<a href="../loginmain.jsp" id="logo">내일로</a>
			</h1>
		</div>
		<!-- //header -->
		<!-- container -->
		<div id="container">
			<!-- content -->
			<div id="content">
				<h2 class="blind">내일로 회원가입</h2>
				<div class="join">
					<form action="../memberinsert.do" method="post" id="insertform">
						<fieldset>
							<legend>아이디, 비밀번호</legend>
							<p class="field confirm">
								<label for="user-id" class="blind">아이디</label> <input
									type="text" id="id" placeholder="아이디" class="inp-field"
									name="id"> <span class="ico pass" id="checkidimg"></span>
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
							<p class="field btn-radio">
								<label for="male" class="btn-label male on">남자</label> <input
									type="radio" id="male" name="gender" value="남자"> <label
									for="female" class="btn-label female on">여자</label> <input
									type="radio" id="female" name="gender" value="여자">
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
							<button type="button" class="btn-submit" id="insertb"></button>
						</div>
					</form>
				</div>
			</div>
			<!-- //content -->
		</div>
		<!-- //container -->
		<!-- footer -->
	 	<div id="footer">
		</div> 
		<!-- //footer -->
	</div>

</body>
</html>
