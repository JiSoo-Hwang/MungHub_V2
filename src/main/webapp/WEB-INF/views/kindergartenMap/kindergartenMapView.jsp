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
<div id="map" style="width:100%;height:350px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5f03a94e13e0d87e2f283fa6a04ddd8d"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(37.533809, 126.896876), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 
// 마커를 표시할 위치와 title 객체 배열입니다 

/* var mapList = ${mapList};
for(var i in mapList){
	title : mapList[i].kindName,
	latlng: new kakao.maps.LatLng(mapList[i].)
} */
var positions = [
    {
        title: '왈왈스쿨', 
        latlng: new kakao.maps.LatLng(37.5302334, 127.1320619)
    },
    {
        title: '펫도그 애견스쿨', 
        latlng: new kakao.maps.LatLng(37.4832778, 127.1262065)
    },
    {
        title: '퍼피스쿨', 
        latlng: new kakao.maps.LatLng(37.5136773, 127.0618982)
    },
    {
        title: '마이댕댕스쿨',
        latlng: new kakao.maps.LatLng(37.5478131, 126.8496339)
    }
];

// 마커 이미지의 이미지 주소입니다
var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
    
for (var i = 0; i < positions.length; i ++) {
    
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(24, 35); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage // 마커 이미지 
    });
}
</script>
</body>
</html>