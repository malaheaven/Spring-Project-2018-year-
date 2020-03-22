<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta charset="utf-8">
<link rel="stylesheet" href="resources/css/reset.css" type="text/css"
	media="all">
<link rel="stylesheet" href="resources/css/layout.css" type="text/css"
	media="all">
<link rel="stylesheet" href="resources/css/style.css" type="text/css"
	media="all">
<title>${imageDTO2.sights}소개</title>
</head>
<body id="page3">
	<div class="extra">
		<div class="main">
			<!-- header -->
			<div class="wrapper">
				<h1>
					<a href="loginmain.jsp" id="logo">내일로</a>
				</h1>
				<div class="wrapper">
					<!-- 메뉴박스 -->
					<nav>
					<ul id="menu">
						<li><a href="searcharea.do?location=수도권" class="nav1">수도권</a></li>
						<li><a href="searcharea.do?location=강원권" class="nav2">강원권</a></li>
						<li><a href="searcharea.do?location=충청권" class="nav3">충청권</a></li>
						<li><a href="searcharea.do?location=경상권" class="nav4">경상권</a></li>
						<li><a href="searcharea.do?location=전라권" class="nav5">전라권</a></li>
						<li><a href="searcharea.do?location=전라권" class="nav6">여행하기</a></li>
					</ul>
					</nav>
				</div>
			</div>
		</div>
		<center>
			<div>
				<img src="resources/locationimage/${locationDTO2.imagename2}"
					width="450px" height="350px">
			</div>
				<img src="resources/locationimage/${locationDTO2.imagename3}"
					width="450px" height="350px"><br>
			<div id="map" style="width: 500px; height: 400px;"></div>
			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b97ab5a6737ac2991d53c2a712879f05&libraries=services"></script>
			<script>
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					mapOption = {
						center : new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
						level : 3 // 지도의 확대 레벨
					};
			
				// 지도를 생성합니다    
				var map = new daum.maps.Map(mapContainer, mapOption);
			
				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new daum.maps.services.Geocoder();
			
				// 주소로 좌표를 검색합니다
				geocoder.addressSearch('${locationDTO2.locationaddress}', function(result, status) {
			
					// 정상적으로 검색이 완료됐으면 
					if (status === daum.maps.services.Status.OK) {
			
						var coords = new daum.maps.LatLng(result[0].y, result[0].x);
			
						// 결과값으로 받은 위치를 마커로 표시합니다
						var marker = new daum.maps.Marker({
							map : map,
							position : coords
						});
			
						// 인포윈도우로 장소에 대한 설명을 표시합니다
						var infowindow = new daum.maps.InfoWindow({
							content : '<div style="width:150px;text-align:center;padding:6px 0;">${locationDTO2.sights}</div>'
						});
						infowindow.open(map, marker);
			
						// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
						map.setCenter(coords);
					}
				});
			</script>
		</center>
		<div class="block"></div>
		<div class="body1 ">
			<div class="main">
				<footer></footer>
			</div>
		</div>
	</div>
</body>
</html>