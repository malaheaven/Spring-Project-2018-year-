<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/reset.css" type="text/css"
	media="all">
<link rel="stylesheet" href="resources/css/layout.css" type="text/css"
	media="all">
<link rel="stylesheet" href="resources/css/style.css" type="text/css"
	media="all">
	
<script type="text/javascript" src="./resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$.ajax({
			url : "nalci",
			dataType : "json",
			success : function(result) {
				var weather = result.nalci
				$("#d1").html(weather);
			//console.log(weather);
			}
		});

	});
</script>
</head>
<body>
<body id="page1">
	<div class="extra">
		<div class="main">
			<div class="wrapper">
				<h1>
					<a href="loginmain.jsp" id="logo">내일로</a>
				</h1>
			</div>
			<nav>
			<ul id="menu">
				<li><a href="./loginmain.jsp" class="nav1">HOME</a></li>
				<li><a href="./memberselect.do" class="nav2">나의 정보</a></li>
				<li><a href="./member/updatemember.jsp" class="nav3">회원정보수정</a></li>
				<li><a href="./member/pwCheck.jsp" class="nav4">회원탈퇴</a></li>
				<li><a href="./myReview.do" class="nav5">나의 후기</a></li>
			</ul>
			</nav>
			<center>
				<div id="d1"></div>
				<br> <br>
			</center>
		<c:forEach items="${mytripDTO2}" var="mytripDTO2">
            <span class="location imgpo" style="width: 160px;">
               <table border="1">
                  <tr>
                  <td>tripID</td> 
                  <td> ${mytripDTO2.tripid}</td>
                  </tr>
                  <tr>
                     <td>ID</td> 
                     <td> ${mytripDTO2.id}</td>
                  </tr>
                  <tr>
                     <td>day1</td> 
                     <td>${mytripDTO2.day1}</td>
                  </tr>
                  <tr>
                     <td>day2</td>
                     <td> ${mytripDTO2.day2}</td>
                  </tr>
                  <tr>
                     <td>day3</td>
                     <td> ${mytripDTO2.day3}</td>
                  </tr>
                  <tr>
                     <td>day4</td>
                     <td> ${mytripDTO2.day4}</td>
                  </tr>
                  <tr>
                     <td>day5</td>
                     <td>${mytripDTO2.day5}</td>
                  </tr>
                  <tr>
                     <td>day6</td>
                     <td> ${mytripDTO2.day6}</td>
                  </tr>
                  <tr>
                     <td>day7</td>
                     <td> ${mytripDTO2.day7}</td>
                  </tr>
                  <tr>
                     <td>
                  <form id="form1" method="post">
                  <a href="./mytripdelete.do?tripid=${mytripDTO2.tripid}"><input type="button" value="삭제"></a>
                  </form>
                  </td>
                  </tr>
               </table>
            </span>
         </c:forEach>

		</div>
	</div>
	<div class="body1 po">
		<div class="main">
			<footer></footer>
		</div>
	</div>

</body>
</html>