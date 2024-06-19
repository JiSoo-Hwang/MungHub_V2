<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WELCOME TO MUNGHUB!</title>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div>
<a href="map2.do">두번째 지도로</a>
</div>
	<div id="map" style="width: 100%; height: 350px;"></div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5f03a94e13e0d87e2f283fa6a04ddd8d"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		mapOption = {
			center : new kakao.maps.LatLng(37.533809, 126.896876), // 지도의 중심좌표
			level : 10
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		// 마커를 표시할 위치와 title 객체 배열입니다 
		var mapList = ${mapList};

		var positions = [];
		for ( var i in mapList) {
			positions.push({
				title : mapList[i].kindName,
				address : mapList[i].kindAddress,
				latlng : new kakao.maps.LatLng(mapList[i].placeY,
						mapList[i].placeX)
			});
		}

		// 마커 이미지의 이미지 주소입니다
		var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

		for (var i = 0; i < positions.length; i++) {

			// 마커 이미지의 이미지 크기 입니다
			var imageSize = new kakao.maps.Size(24, 35);

			// 마커 이미지를 생성합니다    
			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				map : map, // 마커를 표시할 지도
				position : positions[i].latlng, // 마커를 표시할 위치
				title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
				image : markerImage	// 마커 이미지 
			});
			
			
			var iwContent = '<div style="width: 300px; height: 150px; padding:5px;">'+'<b>'+positions[i].title+'</b><br><br>'+positions[i].address+'<br><br>'+'<a href="reg.do" style="color:blue" target="_blank">등록상담하기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    			iwPosition = positions[i].latlng; //인포윈도우 표시 위치입니다

			// 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({
   			 position : iwPosition, 
    		content : iwContent,
   			 removable : true
			});
			
			
			// 마커에 표시할 인포윈도우를 생성합니다 
		    /* var infowindow = new kakao.maps.InfoWindow({
		        content: positions[i].title, // 인포윈도우에 표시할 내용
		        removable : true
		    }); */

		    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
		    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
		    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
		    kakao.maps.event.addListener(marker, 'click', makeOverListener(map, marker, infowindow));
		    /* kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow)); */
		}
		// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
		function makeOverListener(map, marker, infowindow) {
		    return function() {
		    	console.log(this);
		        infowindow.open(map, marker);
		    };
		}

/* 		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		function makeOutListener(infowindow) {
		    return function() {
		        infowindow.close();
		    };
		} */
	</script>
</body>
</html>