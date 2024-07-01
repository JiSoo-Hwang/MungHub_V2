<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.Date, java.text.SimpleDateFormat"%>
<%
	Date today = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String formattedDate = sdf.format(today);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3dcfbff0a780d5171a2a2f039fc60ac0&libraries=services,clusterer,drawing"></script>
<!-- fullcalender -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.14/index.global.min.js"></script>

<title>장기돌봄 예약페이지</title>
<style>
	@font-face {
        font-family: 'MangoDdobak-B';
        src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2405-3@1.1/MangoDdobak-B.woff2') format('woff2');
        font-weight: 700;
        font-style: normal;
	}
	
	
	body{
        font-family: arial,sans-serif;
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }
    .container{
        padding: 20px;
    }
    h2{
        margin-top: 20px;
        font-size: 24px;
        border-bottom: 2px solid #000;
        padding-bottom: 10px;
    }
    .introduction p{
        font-size: 16px;
    }
    .certificate{
    	display: flex;
        flex-wrap: wrap; /*한줄에 다 안들어 갈때 다음줄로 이동*/
    }
    .certificate-item{
         flex: 1;
        min-width: 100px;
        text-align: center;
        margin: 10px;
    }
    .certificate-item img{
        width: 100px;
        height: auto;
        margin-right: 20px;
    }
    .environment .tags{
        margin-top: 10px;
    }
    .tags span{
        display: inline-block;
        background-color: #f1f1f1;
        padding: 5px 10px;
        margin-right: 10px;
        margin-bottom: 10px;
        border-radius: 5px;
        font-size: 14px;
    }
    .service-list{
        display: flex;
        flex-wrap: wrap; 
    }
    .service-item{
        flex: 1;
        min-width: 100px;
        text-align: center;
        margin: 10px;
    }
    .service-item img{
        width: 100px;
        height: auto;
    }

    .reservation-btn{
        display:block;
        width:100%;
        padding: 10px;
        background-color: #007bff;
        color: #fff;
        border: none;
        font-size: 16px;
        margin-top: 20px;
        cursor: pointer;
    }
    
    .pricing-container {
        display: flex;
        flex-wrap: wrap; 
        justify-content: space-between;
    }
    .pricing-item {
        min-width: 100px;
        text-align: center;
        margin: 10px;
        flex: 1;
        margin-right: 20px;
    }
    .pricing-table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }
    .pricing-table th, .pricing-table td {
        border: 1px solid #ddd;
        padding: 10px;
        text-align: center;
        font-family: 'MangoDdobak-B', sans-serif;
        font-size: 20px;
    }
    .pricing-table td{
    	cursor:pointer;
    }
    .pricing-table th {
        background-color: #f1f1f1;
    }
    .selected-row {
	    background-color: #ffcc00 !important;
	}
    
    #calendar {
        cursor: pointer;
    }
    .fc-daygrid-day:hover {
        cursor: pointer;
    }
    .fc-day-selected {
        background-color: #ffcc00 !important;
    }

</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<input type="hidden" id="formattedDate" value="<%=formattedDate %>">
	
	
	<form action="enrollHouse.re" method="post">
		<input type="hidden" id="houseNo" name="houseNo" value="${house.houseNo }"> <!-- houseNo -->
		<input type="hidden" id="endDate" name="javaDate" value=""> <!-- "endDate" -->
		<input type="hidden" id="stayNo" name="stayNo" value=""> <!-- stayNo -->
		<input type="hidden" id="userId" name="userId" value="${loginUser.userId }"> <!-- userId -->
	
		<div class="container">
	        <section class="introduction">
	            <h2>보금자리 소개</h2>
	            <p>${house.introductionDetailed }</p>
	        </section>
	
		<h2>인증정보</h2>
		<section class="certificate">
			<c:forEach var="c" items="${cer }">
					<div class="certificate-item">
						<img src="${c.filePath }${c.originName}" alt="인증사진">
		            	<p>${c.certificationName }</p>
					</div>
			</c:forEach>
	    </section>
	
	    <section class="environment">
	        <h2>환경정보</h2>
	        <div class="tags">
	        	<c:forEach var="e" items="${env }">
	        		<span>${e.environmentName}</span>
	        	</c:forEach>
	        </div>
	    </section>
	
	    <section class="location">
	        <h2>위치</h2>
	        <p>주소 : ${house.houseAddress }</p>
	        <div id="houseLocation" style="width:100%;height:200px;"></div>
	    </section>
	
	    <section class="location">
	        <h2>인근 병원정보</h2>
	        <p>${house.nearbyHospital }</p>
	        <div id="hospitalLocation" style="width:100%;height:200px;"></div>
	    </section>
	
	    <section class="services">
	    	<h2>지원가능 서비스</h2>
	        <div class="service-list">
	        	<c:forEach var="s" items="${sup }">
	        		<div class="service-item">
		                <img src="${s.filePath }${s.originName}" alt="${s.supplyGuideName }">
		                <p>${s.supplyGuideName }</p>
	            	</div>
	        	</c:forEach>
	        </div>
	    </section>
	        
	        <h2>인증정보</h2>
			<section class="certificate">
				<c:forEach var="c" items="${cer }">
						<div class="certificate-item">
							<img src="${c.filePath }${c.originName}" alt="인증사진">
			            	<p>${c.certificationName }</p>
						</div>
				</c:forEach>
		    </section>
	
	        <section class="pricing">
			    <h2>예약하기</h2>
			    <div class="pricing-container">
			        <div class="pricing-item">
			            <table class="pricing-table">
			            <h5>서비스를 선택해주세요.</h5>
			                <thead>
			                    <tr>
			                        <th>숙박일정</th>
			                        <th>요금</th>
			                    </tr>
			                </thead>
			                <tbody>
			                    <c:forEach var="p" items="${price}">
			                         <tr class="click-row" name="amount" value="${p.price }">
			                            <td>${p.stayName}</td>
			                            <td>${p.price}</td>
			                        </tr>
			                    </c:forEach>
			                </tbody>
			            </table>
			        </div>
			        <div class="pricing-item">
			            <div id="calendar"></div>
			        </div>
		            <div class="pricing-item">
		            <h4>예약확인</h4>
			            견주님 성함 : <input type="text" id="userName" name="petOwnerName" value="${loginUser.name }" style="width:200px;" readonly required> <br>
			            견주님 연락처 : <input type="text" id="phone" name="phone" value="${loginUser.phone }" style="width:200px;" required> <br>
			            돌보미 주소 : <input type="text" id="inputHouseAddress" name="address" value="${house.houseAddress }" style="width:250px;" readonly> <br>
			            예약 날짜 : <input type="text" id="inputDate" name="inputDate" style="width:200px;" readonly required> <br>
			            숙박 일정 : <input type="text" id="inputEndDate"  style="width:200px;" readonly required> <br>
			            예상 요금 : <input type="text" id="inputAmount" name="totalAmount" style="width:200px;" readonly required> <br><br>
			            <h5>*요청사항(필수입력)*</h5> 
			            <textarea name="caution" id="caution" rows="4" cols="60" placeholder="돌봄 유의사항을 꼭!! 적어주세요." style="resize: none;" required></textarea>
			        </div>
			    </div>
			</section>
	        <button type="submit" class="reservation-btn">예약하고 결제페이지로</button>
		</div>
	</form>
      
    
    
    <script>
    
    //=============== 지도 api ========================
	    $(function(){
			implementMap('houseLocation','${house.houseAddress}');
			setTimeout(function(){ 
				implementMap('hospitalLocation','${house.nearbyHospital}');
	        }, 2000);
		});
    
	    function implementMap(containerId,inputAddress){
			var mapContainer = document.getElementById(containerId), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 4 // 지도의 확대 레벨
		    };  
			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
			
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(inputAddress, function(result, status) {
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });
			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var infowindow = new kakao.maps.InfoWindow({
			            content: '<div style="width:150px;font-size:10px;text-align:center;padding:0px 0;">'+inputAddress+'</div>'
			        });
			        infowindow.open(map, marker);
			        setTimeout(function(){ 
			        	map.relayout();
			        	// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				        map.setCenter(coords);
			        }, 1000);
			    }
			});    
			
		};
		
		//============= 요금표 ===================
			
		var stayNo = "";//숙박일정 숫자화
		
		$(function(){
			$('.click-row').on('click',function(){
				$('.click-row').removeClass('selected-row');
				$(this).addClass('selected-row');
				
				var inputEndDate = $(this).children().eq(0).text();
				var inputAmount = parseInt($(this).children().eq(1).text());
				stayNo = parseInt(inputEndDate.substring(0,1));
				$('#inputEndDate').val(inputEndDate);
				$('#inputAmount').val(inputAmount);
				$('#stayNo').val(stayNo);
			});
		});
		
		//============== 달력 ===================
		$(function() {
			var formattedDate = $('#formattedDate').val(); //오늘날짜기준
		    var calendarEl = $('#calendar')[0];
		    var calendar = new FullCalendar.Calendar(calendarEl, {
		        initialView: 'dayGridMonth',
		        locale: 'ko', // 한글 로케일 설정
		        validRange:{ //오늘날짜 이전 막아주기
		        	start : formattedDate
		        },
		        dateClick: function(info) {
		            var inputDate = $('#inputDate').val(info.dateStr);
		            
		            var fullEndDate = new Date(info.dateStr); //fullCanlendar 의 선택한 날짜값을 date 로 형변환
		            fullEndDate.setDate(fullEndDate.getDate() + stayNo); //숙박날짜 더해주기
		            var endDate = fullEndDate.toISOString().split('T')[0]; // 날짜 형태로 바꿔주기
		            $('#endDate').val(endDate);
		    		
		            //스타일
		            $('.fc-daygrid-day').removeClass('fc-day-selected'); //모든셀 표시제거
		            $(info.dayEl).addClass('fc-day-selected'); //클릭된 날짜만 표시
		        }
		    });
		    setTimeout(function() {
		        calendar.render();
		    }, 3000);
		});
    </script>
	
</body>
</html>