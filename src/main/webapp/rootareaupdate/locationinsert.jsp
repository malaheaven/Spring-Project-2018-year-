<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="./resources/js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="../resources/css/reset.css" type="text/css"
	media="all">
<link rel="stylesheet" href="../resources/css/layout.css" type="text/css"
	media="all">
<link rel="stylesheet" href="../resources/css/style.css" type="text/css"
	media="all">
<link href="../resources/css/naver-style.css" rel="stylesheet">
<script type="text/javascript" src="../resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#sights").keyup(function() {
			var sights = $("#sights").val();
			$.ajax({
				async : true,
				type : "post",
				data : sights,
				url : "../checksights.do",
				dataType : "json",
				contentType : "application/json; charset=UTF-8",
				success : function(data) {
					if (data.checksights == true) {
						$("#checkimg").attr("class", "ico pass4");
					} else {
						$("#checkimg").attr("class", "ico pass3");
					}
				},
			});
		});
		$("#insertb").click(function() {
			var locationaddress = $("#locationaddress").val();
			var sights = $("#sights").val();
			var image1 = $("#image1").val();
			if(locationaddress == ""){
				alert("주소를 입력해주세요") ;
			}else if(sights == ""){
				alert("명소를 등록해주세요");
			}else {
			$.ajax({
				async : true,
				type : "post",
				data : sights,
				url : "../checksights.do",
				dataType : "json",
				contentType : "application/json; charset=UTF-8",
				success : function(data) {
					if (data.checksights == true) {
						alert("이미 등록한 명소입니다.");
					}else if(image1==""){
						alert("대표이미지를 등록해주세요");
					}else{
						 $("#insertform").submit(); 
					}			
					},
			});
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
					<a href="../rootmain.jsp" id="logo">내일로</a>
				</h1>
			</div>
			<nav>
			<ul id="menu">
				<li><a href="../rootareaupdate/locationinsert.jsp" class="nav1">명소등록</a></li>
				<li><a href="../memberselectAll.do" class="nav2">회원관리</a></li>
				<li><a href="../reviewBoard.do" class="nav3">후기관리</a></li>
				<li><a href="../searcharea.do?location=수도권" class="nav4">명소수정</a></li>
			</ul>
			</ul>
			</nav>
			<div id="wrap">
				<div id="container">
					<div id="content">
						<div class="join">
							<form action="../insertarea.do" method="post"
								enctype="multipart/form-data" accept-charset="UTF-8"
								id="insertform">
								<fieldset>
									<p class="field birth">
										<label>지역</label> <span class="field-wall"></span> <select
											title="이메일을 선택하세요" name="location" class="w330" id="location">
											<option value="수도권">수도권</option>
											<option value="충청권">충청권</option>
											<option value="강원권">강원권</option>
											<option value="전라권">전라권</option>
											<option value="경상권">경상권</option>
										</select>
									</p>
									<p class="field birth">
										<label>주소</label> <input type="text" id="locationaddress"
											"
											class="inp-field w330" name="locationaddress">
									</p>
									<p class="field birth">
										<label>명소</label> <input type="text" id="sights"
											class="inp-field w330" name="sights"> <span
											class="ico pass" id="checkimg"></span>
									</p>

								</fieldset>
								<p>
									대표이미지 : <input type="file" name="image1" id="image1"><br>
									상세이미지1 : <input type="file" name="image2" id="image2"><br>
									상세이미지2 : <input type="file" name="image3" id="image3"><br>
								</p>
								<div class="btn-area">
									<button type="button" class="btn-submit1" id="insertb"
										value="등록완료!"></button>
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