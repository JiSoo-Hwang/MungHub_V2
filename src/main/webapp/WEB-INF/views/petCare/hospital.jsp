<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	지역 : 
	<select id="location">
		<option></option>
		<option></option>
		<option></option>
		<option></option>
		<option></option>
		<option></option>
		<option></option>
		<option></option>
		<option></option>
		<option></option>
		<option></option>
		<option></option>
		</select>	
		가평군    :  41820
경기도    :  41000

고양시    :  41280

과천시    :  41290

광명시    :  41210

광주시    :  41610

구리시    :  41310

군포시    :  41410

김포시    :  41570

남양주시  :  41360

동두천시  :  41250

부천시    :  41190

성남시    :  41130

수원시    :  41110

시흥시    :  41390

안산시    :  41270

안성시    :  41550

안양시    :  41170

양주시    :  41630

양평군    :  41830

여주시    :  41670

연천군    :  41800

오산시    :  41370

용인시    :  41460

의왕시    :  41430

의정부시  :  41150

이천시    :  41500

파주시    :  41480

평택시    :  41220

포천시    :  41650

하남시    :  41450

화성시    :  41590

	
	 <div class="container mt-4">
        <h1 class="text-center">Hospital List</h1>
        <button id="test" class="btn btn-primary mb-3">테스트</button>

        <table class="table table-bordered" id="result">
            <thead class="table-dark">
                <tr>
                    <th>번호</th>
                    <th>시군명</th>
                    <th>사업장명</th>
                    <th>영업상태구분코드</th>
                    <th>영업상태명</th>
                    <th>폐업일자</th>
                    <th>소재지시설전화번호</th>
                    <th>소재지우편번호</th>
                    <th>도로명우편번호</th>
                    <th>소재지도로명주소</th>
                    <th>소재지지번주소</th>
                    <th>소재지우편번호</th>
                    <th>WGS84위도</th>
                    <th>WGS84경도</th>
                    <th>X좌표값</th>
                    <th>Y좌표값</th>
                    <th>총종업원수</th>
                </tr>
            </thead>
            <tbody>
                <!-- 병원 리스트가 여기에 삽입됩니다 -->
            </tbody>
        </table>
    </div>


	<script>
		$(function() {
	        $('#test').on('click', function() {
	            $.ajax({
	                url: "hospitalList.ho",
	                type: "GET",
	                dataType: "xml", // 반환 타입을 xml로 지정
	                success: function(result) {
	                    var rows = $(result).find('row'); // XML 응답에서 row 요소를 찾음
	                    var str = "";
	
	                    rows.each(function(index, row) {
	                    	str += "<tr>" 
                                + "<td>" + $(row).find("SIGUN_CD").text() + "</td>"
                                + "<td>" + $(row).find("SIGUN_NM").text() + "</td>"
                                + "<td>" + $(row).find("BIZPLC_NM").text() + "</td>"
                                + "<td>" + $(row).find("BSN_STATE_DIV_CD").text() + "</td>"
                                + "<td>" + $(row).find("BSN_STATE_NM").text() + "</td>"
                                + "<td>" + $(row).find("CLSBIZ_DE").text() + "</td>"
                                + "<td>" + $(row).find("LOCPLC_FACLT_TELNO").text() + "</td>"
                                + "<td>" + $(row).find("LOCPLC_ZIP_CD").text() + "</td>"
                                + "<td>" + $(row).find("ROADNM_ZIP_CD").text() + "</td>"
                                + "<td>" + $(row).find("REFINE_ROADNM_ADDR").text() + "</td>"
                                + "<td>" + $(row).find("REFINE_LOTNO_ADDR").text() + "</td>"
                                + "<td>" + $(row).find("REFINE_ZIP_CD").text() + "</td>"
                                + "<td>" + $(row).find("REFINE_WGS84_LAT").text() + "</td>"
                                + "<td>" + $(row).find("REFINE_WGS84_LOGT").text() + "</td>"
                                + "<td>" + $(row).find("X_CRDNT_VL").text() + "</td>"
                                + "<td>" + $(row).find("Y_CRDNT_VL").text() + "</td>"
                                + "<td>" + $(row).find("TOT_EMPLY_CNT").text() + "</td>"
                                + "</tr>";
	                    });
	
	                    $('#result tbody').html(str); // 결과를 테이블 본문에 삽입
	                    console.log('통신 성공');
	                },
	                error: function() {
	                    console.log('통신 실패 ㅠㅠ');
	                }
	            });
	        });
	    });
			/* json 형태로 받아올 경우
			$('#test').on('click',function(){
				$.ajax({
					url : "hospitalList.ho",
					success : function(result){
						var items = result.reponse.body.items;
						var str = "";
						
						for(var i=0; i<items.length; i++){
							var item = items[i];
							str += "<tr>"
								+ "<td>" + item.BIZPLC_NM + "</td>"
								+ "</tr>"
						}
						$('#result tobdy').html(str);
						console.log('통신성공')
					},
					error : function(){
						console.log('통신실패 ㅠㅠ')
					}
				});
			});
			*/
	</script>
</body>
</html>