<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tours</title>
<meta charset="utf-8">
<link rel="stylesheet" href="./resources/css/reset.css" type="text/css" media="all">
<link rel="stylesheet" href="./resources/css/layout.css" type="text/css" media="all">
<link rel="stylesheet" href="./resources/css/style.css" type="text/css" media="all">
</head>
<body id="page3">
	<div class="extra">
		<div class="main">
			<!-- header -->
			<div class="wrapper">
			
				<h1>
					<a href="./loginmain.jsp" id="logo">내일로</a>
				</h1>
				<!-- 메뉴박스 -->
				<div class="wrapper">
				<nav>
				<ul id="menu">
					<li><a href="./loginmain.jsp" class="nav1">Home</a></li>
					<li><a href="searcharea.do?location=수도권" class="nav2">지역명소</a></li>
					<li><a href="./reviewBoard.do" class="nav3">후기</a></li>
					<li><a href="./mytrip/travelPlanning.jsp" class="nav4">여행하기</a></li>
				</ul>
				</nav>
				</div>
			</div>
			
		</div>
		<div>
		<center>
	<!-- 크롤링 한 이미지 받아오기 -->
		<c:forEach items="${list}" var="img">
		<img src="${img}">
		</c:forEach>
		</center>
		</div>
		<div class="block"></div>
		<div class="body1 ">
			<div class="main">
				<footer></footer>
			</div>
		</div>
	</div>

</body>


</html>