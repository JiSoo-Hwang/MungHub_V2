<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
    .certificate-item{
        display: flex;
        align-items: center;
        margin-top: 10px;
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
    .services-list{
        display: flex;
        flex-wrap: wrap; /*한줄에 다 안들어 갈때 다음줄로 이동*/
    }
    .service-item{
        flex: 1;
        min-width: 100px;
        text-align: center;
        margin: 10px;
    }
    .service-item img{
        width: 50px;
        height: 50px;
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

   .pricing-table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    .pricing-table th, .pricing-table td {
        border: 1px solid #ddd;
        padding: 10px;
        text-align: center;
    }

    .pricing-table th {
        background-color: #f1f1f1;
        font-size: 16px;
    }

    .pricing-table td img {
        width: 20px;
        height: 20px;
        margin-right: 5px;
        vertical-align: middle;
    }

    .pricing-table td {
        font-size: 16px;
    }

</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	
	House(houseNo=5, ownerName=한지민, introductionSummary=전통적인 집, houseAddress=서울시 강북구
	, introductionDetailed=전통 한옥 스타일의 집에서 반려동물이 편안하게 지낼 수 있습니다., nearbyHospital=강북동물병원
	, environmentInfo=한적하고 자연 친화적인 환경입니다., supplyGuide=전통 음식과 물 제공, certification=문화재청 인증
	, originName=5.png, filePath=resources/uploadFiles/housePhoto/)
	
	<div class="container">
        <section class="introduction">
            <h2>자기소개</h2>
            <p>${house.introductionDetailed }</p>
        </section>

        <section class="certificate">
            <img src="인증 아이콘 사진" alt="인증사진">
            <img src="인증 아이콘 사진" alt="인증사진">
            <img src="인증 아이콘 사진" alt="인증사진">
            <p>${house.certification }</p>
            <!-- 자세히보기 클릭 시 모달창으로 house 의 certification 의 정보 보여주기 -->
        </section>

        <section class="environment">
            <h2>환경정보</h2>
            <div class="tags">
                <span>환경정보는 테이블을 하나 더 생성, 키워드 컬럼 추가</span>
                <span>#1가정 예약</span>
                <span>#2인이하 가구</span>
                <span>#빌라</span>
                <span>#가정집</span>
                <span>#아파트</span>
                <span>#단독주택</span>
                <span>#테라스가 있어요</span>
                <span>#마당이 있어요</span>
                <span>#산책로가 있어요</span>
                <span>#반려동물의 친구가 있어요</span>
            </div>
        </section>

        <section class="location">
            <h2>하우스 위치</h2>
            <div>맵api 활용</div>
            <p>house 의 houseAdress</p>
        </section>

        <section class="location">
            <h2>인근 병원정보</h2>
            <div>맵api 활용</div>
            <p>house 의 nearbyHospital</p>
        </section>

        <section class="services">
            <div class="services-list">
                <div class="service-item">
                    <img src="아이콘사진" alt="">
                    <p>house 의 suplyGuide</p>
                </div>
                <div class="service-item">
                    <img src="아이콘사진" alt="">
                    <p>house 의 suplyGuide</p>
                </div>
                <div class="service-item">
                    <img src="아이콘사진" alt="">
                    <p>house 의 suplyGuide</p>
                </div>
                <div class="service-item">
                    <img src="아이콘사진" alt="">
                    <p>house 의 suplyGuide</p>
                </div>
            </div>
            
            <div class="calendar">

            </div>

            <!--펫타입 가능 컬럼추가-->
            <section class="pricing">
                <h2>이용 금액</h2>
                <table class="pricing-table">
                    <thead>
                        <tr>
                            <th>숙박일정</th>
                            <th>요금</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach var="p" items="${price}">
                    		<tr>
	                            <td><img src="small_dog.png" alt=""><br> ${p.stayName } </td>
	                            <td>${p.price }</td>
	                        </tr>
                    	</c:forEach>
                    </tbody>
                </table>
            </section>


            <button class="reservation-btn">예약 요청</button>

        </section>
    </div>
	
</body>
</html>