<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8" 
    import="java.util.Date, java.text.SimpleDateFormat" %>
    
<!-- 달력에 오늘 기준으로 이전 날짜는 선택 못하도록 오늘 날짜 가져오기 -->
<%
    Date today = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String formattedDate = sdf.format(today);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	/* 시간선택 css */
    .str-btn {
        width: 100px;
        height: 50px;
        border: 2px solid #ccc;
        margin: 5px;
        transition: background-color 0.3s, color 0.3s;
    }
    .str-btn.selected {
        background-color: #28a745;
        color: white;
    }
	
	/* 소요시간 CSS  */
    .duration-btn-group {
        display: flex;
        justify-content: space-around;
        margin-top: 20px;
    }
    .duration-btn {
        width: 100px;
        height: 100px;
        border-radius: 50%;
        border: 2px solid #ccc;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 16px;
        background-color: white;
        transition: background-color 0.3s, color 0.3s;
    }
    .duration-btn.selected {
        background-color: #007bff;
        color: white;
    }
    .duration-btn span {
        display: block;
        font-size: 14px;
    }
    .duration-btn.best::after {
        content: 'BEST';
        display: block;
        font-size: 10px;
        color: #007bff;
        margin-top: 5px;
    }
    
    /* 펫시터 리스트 css */
    .sitter-card {
        border: 1px solid #ddd;
        padding: 20px;
        margin: 10px 0;
        display: flex;
        align-items: center;
    }
    .sitter-info {
        flex: 1;
    }
    .sitter-photo {
        width: 100px;
        height: 100px;
        border-radius: 50%;
        object-fit: cover;
        margin-left: 20px;
    }
    .popular-style {
        color: #ff4081;
        font-weight: bold;
    }
    .btn-reserve {
        background-color: #007bff;
        color: white;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
    }
    .btn-reserve:hover {
        background-color: #0056b3;
    }
    
</style>

</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	
	<h2>시터선택 페이지</h2>
	
	<!-- 날짜와 시간을 선택 (비동기로 데이터 전달 후 시터 정보 가져오기)
		예약 가능한 시터 리스트 출력
		시터 선택 (선택한 날짜,시간,펫시터 정보 form 으로 전달?)
	 -->	
	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#dateTimeModal">
            날짜와 시간으로 가능한 시터를 검색해보세요.
    </button>
	
	<div class="container mt-5">
       <!-- 날짜와 시간 클릭 시 모달영역 -->
        <div class="modal fade" id="dateTimeModal" tabindex="-1" aria-labelledby="dateTimeModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="dateTimeModalLabel">날짜와 시간 선택</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                          <div class="form-group">
                              <label for="visitDate" class="form-label">방문 날짜</label>
                              <input type="date" class="form-control" id="visitDate" name="visitDate" required min="<%= formattedDate %>">
                              									<%-- 오늘 날짜부터 달력을 클릭하도록 min="<%= formattedDate %>" 로 막아주기--%>
                              <div class="" id="startTime">방문 시간 
                              <br> <!-- 처음 input type=time 으로 시도
                              				분 단위가 너무 세세하게 나눠지기 때문에 명확하지 시간선택이 명확하지 않음
                              				각 시간을 버튼으로 선택하여 숫자처리 -->
                                <button type="button" class="str-btn" value="900">09:00</button>
                                <button type="button" class="str-btn" value="1000">10:00</button>
                                <button type="button" class="str-btn" value="1100">11:00</button>
                                <button type="button" class="str-btn" value="1200">12:00</button>
                                <button type="button" class="str-btn" value="1300">13:00</button>
                                <button type="button" class="str-btn" value="1400">14:00</button>
                                <button type="button" class="str-btn" value="1500">15:00</button>
                                <button type="button" class="str-btn" value="1600">16:00</button>
                                <button type="button" class="str-btn" value="1700">17:00</button>
                         		</div>
                           	<div class="duration-btn-group" id="duration">
                                <button type="button" class="duration-btn" value="100">60분</button>
                                <button type="button" class="duration-btn" value="200">120분</button>
                                <button type="button" class="duration-btn" value="300">180분</button>
                                <button type="button" class="duration-btn" value="400">240분</button>
                         		</div>
                          </div>
                    </div>
                    <div class="modal-footer">
                    	<!-- 모달창 내부에서 초기화 버튼을 만드려면 form 태그에 id 설정, 초기화 버튼에 form="id"를 넣어주면 됨 -->
                        <button type="reset" class="btn btn-secondary" id="resetBtn">초기화</button>
                        <button type="button" class="btn btn-primary" id="sitterSearch">펫시터 검색</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="container mt-5"  id="sitterListContainer">
        
    </div>
	
	<script>
		$(function(){
			$(".duration-btn, .str-btn").on("click", function() {
                $(this).siblings().removeClass("selected");
                $(this).addClass("selected");
            });
			/* 위 코드가 아래 코드를 합친것. siblings()는 선택된 요소의 형제요소를 선택하는 메소드
			
			//버튼 클릭시 활성화/비활성화
			$(".duration-btn").on("click",function(){
				
				// 모든 버튼에서 selected 클래스를 제거하여 비활성화
				$(".duration-btn").removeClass("selected");
				
				// 클릭된 버튼에 selected 클래스를 추가하여 활성화
				$(this).addClass("selected");
			});
			$(".str-btn").on("click",function(){
				$(".str-btn").removeClass("selected");
				$(this).addClass("selected");
			});
			*/
			
			$("#sitterSearch").click(function(){
				//방문날짜
				var visitDate = $("#visitDate").val();
				//방문시간==시작시간 구하기
				var startTime = parseInt($(".str-btn.selected").val(),10);
				//끝나는 시간 구하기
				var duration = parseInt($(".duration-btn.selected").val(),10); //소요시간 버튼 선택된 값
				var endTime = startTime+duration;
				
				if(visitDate && startTime){
					$.ajax({
						url : "selectSitter.re",
						type : "post",
						data : {
							visitDate : visitDate,
							startTime : startTime,
							endTime : endTime
						},
						success: function (list) {
							 var sitterList = "";
							 for (var i = 0; i < list.length; i++) {
								 sitterList += "<div class='sitter-card'>"
                                     + "<div class='sitter-info'>"
                                     + "<h4>" + list[i].petSitterName + "</h4>"
                                     + "<p>" + list[i].introduce + "</p>"
                                     + "<p class='popular-style'>" + list[i].dogKeword + "</p>"
                                     + "<p class='popular-style'>" + list[i].typeKeyword + "</p>"
                                     + "<button class='btn-reserve'>예약</button>"
                                     + "</div>"
                                     + "<img src='/pjtMungHub/" + list[i].filePath + "" + list[i].originName + "' class='sitter-photo'>"
                                     + "</div>";
							 }
							 $('#sitterListContainer').html(sitterList);
							 console.log('데이터 불러오기 성공!!');
						},
						error : function(){
							console.log('통신오류');
						}
					});
					//값을 보낸 후 모달창 닫아주기
					$("#dateTimeModal").modal('hide'); 
				}else{
					//둘중에 하나라도 비입력시 알림창
					alert('날짜,시간 모두 입력해주세요.')
				}
			});
			
			//리셋버튼을 누르면 날짜와 시간 비워주기
			$("#resetBtn").click(function(){ 
				$("#visitDate").val('');
				$(".duration-btn").removeClass("selected");
				$(".str-btn").removeClass("selected");
			});
		});
	
	</script>

</body>
</html>