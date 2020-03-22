<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
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
</head>
<body id="page1">
	<div class="extra">
		<div class="main">
			<!-- header -->
			<header>
			<div class="wrapper">
				<h1>
					<a href="rootmain.jsp" id="logo">내일로</a>
				</h1>
				<div class="right">
				</div>
			</div>
			
			<nav>
			<ul id="menu">
				<li><a href="./rootareaupdate/locationinsert.jsp" class="nav1">명소등록</a></li>
				<li><a href="./memberselectAll.do" class="nav2">회원관리</a></li>
				<li><a href="./reviewBoard.do" class="nav3">후기관리</a></li>
				<li><a href="./searcharea.do?location=수도권" class="nav4">명소수정</a></li>
			</ul>
			</nav>
<h2 align="center">회원 정보</h2>
<table border="1">
	<c:forEach items="${list}" var="list">
	<tr>
		<td>ID :${list.id}</td>
		<td>PW :${list.pw}</td>
		<td>이름:${list.name}</td>
		<td>전화번호 :${list.tel}</td>
		<td>주소 :${list.address}</td>
		<td>이메일 :${list.email}</td>
		<td>성별 :${list.gender}</td>
	</tr>
	</c:forEach>

</table>
</body>
</html>