<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>여행 계획 수립</title>
<meta charset="utf-8">
<link rel="stylesheet" href="../resources/css/reset.css" type="text/css"
	media="all">
<link rel="stylesheet" href="../resources/css/layout.css"
	type="text/css" media="all">
<link rel="stylesheet" href="../resources/css/style.css" type="text/css"
	media="all">

</head>
<body id="page2">
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
			<li><a href="http://info.korail.com/mbs/www/subview.jsp?id=www_020110010000"
				class="nav4">기차 노선도/시간표</a></li>
		</ul>
		</nav>
	</div>
	<div id="map"
		style="width: 64%; height: 450px; margin-right: auto; margin-left: auto;"></div>
	<script type="text/javascript"
		src="../resources/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#send").click(function() {
				var idresult = $("input[id=id1]:checked").val();
				var myidresult = $("#myid").val();
				var myidnull = "null";
				/* 스트링 null로 준 이유는 type hidden 자체에  string값으로 null이 들어가는데 이 null이 null과 달라서 객체에 "null"을 
				변수로 만들어 준것*/
				if (idresult == null) {
					alert("day1을 선택해 주세요!");
				} else if (myidresult == myidnull) {
					alert("로그인을 안하셨습니다 로그인을 해주신후 여행을 등록 하세요!");
				} else {
					$("#form_1").submit();
				}
			});
	
		});
	</script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b97ab5a6737ac2991d53c2a712879f05"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
			mapOption = {
				center : new daum.maps.LatLng(36.973549, 128.343584), // 지도의 중심좌표
				level : 13 // 지도의 확대 레벨
			};
	
		var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
		// 마커를 표시할 위치와 title 객체 배열입니다 
		var positions = [
			{
				content : '<div>서울역</div>',
				latlng : new daum.maps.LatLng(37.553129, 126.972662)
			},
			{
				content : '<div>대곡역</div>',
				latlng : new daum.maps.LatLng(37.632229, 126.810264)
			},
			{
				content : '<div>가평역</div>',
				latlng : new daum.maps.LatLng(37.814710, 127.510672)
			},
			{
				content : '<div>천안역</div>',
				latlng : new daum.maps.LatLng(36.809211, 127.146567)
			}
			,
			{
				content : '<div>단양역</div>',
				latlng : new daum.maps.LatLng(36.973549, 128.343584)
			}
			,
			{
				content : '<div>공주역</div>',
				latlng : new daum.maps.LatLng(36.387109, 127.091186)
			}
			,
			{
				content : '<div>민둥산역</div>',
				latlng : new daum.maps.LatLng(37.243921, 128.773650)
			}
			,
			{
				content : '<div>충주역</div>',
				latlng : new daum.maps.LatLng(36.976132, 127.909151)
			}
			,
			{
				content : '<div>전주역</div>',
				latlng : new daum.maps.LatLng(35.850057, 127.161873)
			}
			,
			{
				content : '<div>광주역</div>',
				latlng : new daum.maps.LatLng(35.165615, 126.909200)
			}
			,
			{
				content : '<div>영주역</div>',
				latlng : new daum.maps.LatLng(36.562950, 128.732912)
			}
			,
			{
				content : '<div>대구역</div>',
				latlng : new daum.maps.LatLng(35.876306, 128.596039)
			}
			,
			{
				content : '<div>구미역</div>',
				latlng : new daum.maps.LatLng(36.129379, 128.330556)
			}
			,
			{
				content : '<div>부산역</div>',
				latlng : new daum.maps.LatLng(35.115424, 129.042313)
			}
			,
			{
				content : '<div>울산역</div>',
				latlng : new daum.maps.LatLng(35.551856, 129.138518)
			}
			,
			{
				content : '<div>밀양역</div>',
				latlng : new daum.maps.LatLng(35.474766, 128.771210)
			}
	
		];
	
		// 마커 이미지의 이미지 주소입니다
		var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
	
		for (var i = 0; i < positions.length; i++) {
	
			// 마커 이미지의 이미지 크기 입니다
			var imageSize = new daum.maps.Size(24, 35);
	
			// 마커 이미지를 생성합니다    
			var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize);
	
	
	
			// 마커를 생성합니다
			var marker = new daum.maps.Marker({
				map : map, // 마커를 표시할 지도
				position : positions[i].latlng, // 마커를 표시할 위치
				title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
				image : markerImage // 마커 이미지 
	
			});
	
			// 마커에 표시할 인포윈도우를 생성합니다 
			var infowindow = new daum.maps.InfoWindow({
				content : positions[i].content // 인포윈도우에 표시할 내용
			});
	
			// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
			// 이벤트 리스너로는 클로저를 만들어 등록합니다 
			daum.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
			daum.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
	
			function makeOverListener(map, marker, infowindow) {
				return function() {
					infowindow.open(map, marker);
				};
			}
	
			// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
			function makeOutListener(infowindow) {
				return function() {
					infowindow.close();
				};
			}
	
		}
	</script>
	<div align="center">

		<form style="color: black;" id="form_1" action="../mytripinsert.do"
			method="post">
			<input type="hidden" name="id" id="myid"
				value=<%=session.getAttribute("id")%>>
			<%
				for (int i = 1; i <= 7; i++) {
			%>
			<label>day<%=i%></label> <input type="checkbox" name="day<%=i%>"
				id="id<%=i%>" value="서울역">서울역 <input type="checkbox"
				name="day<%=i%>" id="id<%=i%>" value="대곡역">대곡역 <input
				type="checkbox" name="day<%=i%>" id="id<%=i%>" value="가평역">가평역
			<input type="checkbox" name="day<%=i%>" id="id<%=i%>" value="천안역">천안역
			<input type="checkbox" name="day<%=i%>" id="id<%=i%>" value="단양역">단양역
			<input type="checkbox" name="day<%=i%>" id="id<%=i%>" value="공주역">공주역
			<input type="checkbox" name="day<%=i%>" id="id<%=i%>" value="민둥산역">민둥산역
			<input type="checkbox" name="day<%=i%>" id="id<%=i%>" value="충주역">충주역
			<input type="checkbox" name="day<%=i%>" id="id<%=i%>" value="전주역">전주역
			<input type="checkbox" name="day<%=i%>" id="id<%=i%>" value="영주역">영주역
			<input type="checkbox" name="day<%=i%>" id="id<%=i%>" value="광주역">광주역
			<input type="checkbox" name="day<%=i%>" id="id<%=i%>" value="대구역">대구역
			<input type="checkbox" name="day<%=i%>" id="id<%=i%>" value="구미역">구미역
			<input type="checkbox" name="day<%=i%>" id="id<%=i%>" value="부산역">부산역
			<input type="checkbox" name="day<%=i%>" id="id<%=i%>" value="울산역">울산역
			<input type="checkbox" name="day<%=i%>" id="id<%=i%>" value="밀양역">밀양역<br>
			<%
				}
			%>
			<br>
			<button type="button" id="send" class="button" style="margin-right: 700px;">등록</button>
		</form>
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
</body>
</html>