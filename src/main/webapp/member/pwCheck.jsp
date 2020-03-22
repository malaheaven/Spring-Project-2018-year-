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
	$("#checkb").click(function(){
			var pw = $("#pw").val();
			if(pw==""){
				alert("비밀번호를 입력해주세요");
			}
		$.ajax({
			async : true,
			type: "post",
			data:pw,
			url:"../checkpw.do",
			dataType:"json",
			contentType : "application/json; charset=UTF-8",
			success:function(data){
			 if(data.checkpw==true){
				var result = confirm("정말 삭제하시겠습니까?"); 
				if(result){
					window.location.href="../memberdelete.do"
				}else{
					window.location.href="../memberselect.do";
				}
			 }else{
				 alert("비밀번호가 일치하지 않습니다.");
			 }
			},
		});
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
				<li><a href="../member/updatemember.jsp" class="nav2">회원정보 수정</a></li>
				<li><a href="../myReview.do" class="nav3">나의 후기</a></li>
				<li><a href="../mytripselect.do" class="nav4">마이 트립</a></li>
			</ul>
			</nav>
			<div id="wrap">
				<div id="container">
					<div id="content">
						<h2 align="center">비밀번호 체크</h2>
						<br> <br>
						<div class="join">
							<form action="" method="post" id="insertform">
								<fieldset>
									<p class="field">
										<label for="user-pass" class="blind">비밀번호</label> <input
											type="password" id="pw" placeholder="비밀번호" class="inp-field"
											name="pw">
									</p>
								</fieldset>
								<!--서밋 버튼  -->
								<div class="btn-area">
									<button type="submit" class="btn-submit1" id="checkb"></button>
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