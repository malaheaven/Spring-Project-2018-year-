<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../resources/css/reset.css" type="text/css"
	media="all">
<link rel="stylesheet" href="../resources/css/layout.css"
	type="text/css" media="all">
<link rel="stylesheet" href="../resources/css/style.css" type="text/css"
	media="all">
<script type="text/javascript" src="../resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

$(function() {
    $("#insert").click(function() { 
       var name = $("#input2").val(); 
       var content = $("#content").val(); 
       if (name == "") {
          alert("제목을 입력해주세요.");
       }else if (content == "") {
          alert("글 내용이 없습니다.");   
       }else {                     
          $("#ContactForm").submit();      
       }
    });
    });
</script>
</head>
<body id="page2">
	<%
		try {
			String id = (String) session.getAttribute("id");
			if (id == null) {
				response.sendRedirect("notLoginReviewResult.jsp");
			}
		} catch (Exception e) {
			response.sendRedirect("notLoginReviewResult.jsp");
		}
	%>
	<div class="extra">
		<div class="main">
			<div class="wrapper">
				<h1>
					<a href="../loginmain.jsp" id="logo">내일로</a>
				</h1>
			</div>
			<nav>
			<ul id="menu">
				<li><a href="../neailrointroduce.do" class="nav1">내일로란</a></li>
				<li><a href="../searcharea.do?location=수도권" class="nav2">지역명소</a></li>
				<li><a href="../reviewBoard.do" class="nav3">후기</a></li>
				<li><a href="../mytrip/travelPlanning.jsp" class="nav4">여행하기</a></li>
				<li><a
					href="http://www.letskorail.com/korail/com/login.do?ret_url=/ebizprd/EbizPrdTicketHc11911_i1.do?hidSchdTkKndCd=08"
					class="nav5">티켓발권</a></li>
			</ul>
			</nav>
			<br>
			<center>
				<br>
				<h2>후기글 작성</h2>
				<form id="ContactForm" action="../insertReview.do" method="post"
					enctype="multipart/form-data" accept-charset="UTF-8">
					<table>
						<tr>
							<td>제목</td>
							<td><input type="text" id="input2" class="input2" name="name"></td>
						</tr>

						<tr>
							<td>내용</td>
							<td><textarea id="content" name="content" class="content" cols="1" rows="1"></textarea></td>
						</tr>

						<tr>
							<td></td>
							<td><input class="button" type="file" name="img1">
							</td>
						</tr>

						<tr>
							<td></td>
							<td><input class="button" type="file" name="img2"></td>
						</tr>
					</table>
					<br> <input type="button" class="button" type="submit" id="insert" align="right" value="제출">
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