<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/reset.css" type="text/css"
	media="all">
<link rel="stylesheet" href="resources/css/layout.css" type="text/css"
	media="all">
<link rel="stylesheet" href="resources/css/style.css" type="text/css"
	media="all">
<script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>
</head>
<body id="page2">
	<div class="extra">
		<div class="main">
			<div class="wrapper">
				<h1>
					<a href="./loginmain.jsp" id="logo">내일로</a>
				</h1>
			</div>
			<nav>
				<ul id="menu">
					<li><a href="../rootareaupdate/locationinsert.jsp"
						class="nav1">명소등록</a></li>
					<li><a href="../memberselectAll.do" class="nav2">회원관리</a></li>
					<li><a href="../reviewBoard.do" class="nav3">후기관리</a></li>
					<li><a href="../searcharea.do?location=수도권" class="nav4">명소수정</a></li>
				</ul>
			</nav>

			<center>
				<br> <br>
				<h2>후기 글</h2>
				<a href="./reviewBoard.do" class="button" style="margin-left: 250px;">후기글 전체목록</a>
				<a
					href="deleteReview.do?totalid=${result.userid},${result.reviewid}"
					class="button" >후기글 삭제</a> <br> <br>
				<br>
				<form id="ContactForm">
					<table border="2">
						<tr>
							<td>작성자 ID</td>
							<td><input type="text" class="input3"
								value="${result.userid}" readonly="readonly"></td>
							<td>작성일</td>
							<td><input type="text" class="input3"
								value="${result.date}" readonly="readonly"></td>
						</tr>

						<tr>
							<td>제목</td>
							<td><input type="text" class="input3"
								value=" ${result.name}" readonly="readonly"></td>
							<td>후기조회수</td>
							<td><input type="text" class="input3"
								value=" ${result.likecount}" readonly="readonly"></td>
						</tr>

						<tr>
							<td>내용</td>
							<td colspan="3"><textarea name="content" class="textarea"
									cols="60" rows="15" readonly="readonly">${result.content}</textarea></td>
						</tr>

						<tr>
							<td colspan="4" align="center"><img
								src="resources/reviewImg/${result.img1}"></td>
						</tr>
						<tr>
							<td colspan="4" align="center"><img
								src="resources/reviewImg/${result.img2}"></td>
						</tr>
					</table>
					<br>
				</form>
			</center>


			<!-- / content -->
			<div class="block"></div>
			<div class="block"></div>
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
