<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta charset="utf-8">
<link rel="stylesheet" href="./resources/css/reset.css" type="text/css"
	media="all">
<link rel="stylesheet" href="./resources/css/layout.css" type="text/css"
	media="all">
<link rel="stylesheet" href="./resources/css/style.css" type="text/css"
	media="all">

</head>
<body id="page2">
	<div class="extra">
		<div class="main">
			<div class="wrapper">
				<h1> 
					<a href="./rootmain.jsp" id="logo">내일로</a>
				</h1>
			</div>
			<nav>
			<ul id="menu">
				<li><a href="searcharea.do?location=수도권" class="nav1">수도권</a></li>
				<li><a href="searcharea.do?location=강원권" class="nav2">강원권</a></li>
				<li><a href="searcharea.do?location=충청권" class="nav3">충청권</a></li>
				<li><a href="searcharea.do?location=경상권" class="nav4">경상권</a></li>
				<li><a href="searcharea.do?location=전라권" class="nav5">전라권</a></li>
			</ul>
			</nav>

			<form action="locationselect.do" method="post">
				<c:forEach items="${list}" var="list">
					<span class="location imgpo" style="width: 240px;"> <input type="image"
						src="./resources/locationimage/${list.imagename1}"
						value=${list.sights } name="sights" width="235px" height="250px">
						<h2 class="name1">${list.sights}</h2>
					</span>
				</c:forEach>
			</form>
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