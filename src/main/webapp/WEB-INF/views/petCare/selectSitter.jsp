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
<title>MungHub 펫시터 선택페이지</title>
<style>

	/* 시간선택 css */
    .str-btn {
        width: 100px;
        height: 50px;
        border: 2px solid #ccc;
        margin: 5px;
        transition: background-color 0.1s, color 0.1s;
    }
    .str-btn.selected {
        background-color: #28a745;
        color: white;
    }
    /* 펫크기 버튼 그림조절  */
    .petType-btn img {
	    width: 100%; 
	    height: 100%; 
	}
	
	/* 소요시간 / 펫크기  */
    .duration-btn-group ,.petType-btn-group {
        display: flex;
        justify-content: space-around;
        margin-top: 20px;
    }
    .duration-btn{
        width: 80px;
        height: 80px;
        border-radius: 50%;
        border: 2px solid #ccc;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 16px;
        background-color: white;
        transition: background-color 0.3s, color 0.3s;
    }
    .petType-btn {
        width: 130px;
        height: 130px;
        border: 2px solid #ccc;
        border-radius: 5px;
        display: flex;
        align-items: center;
        justify-content: center;
        cursor: pointer;
        background-color: #f9f9f9;
        transition: background-color 0.3s, color 0.3s;
    }
    .petType-btn:hover , .duration-btn:hover , .str-btn:hover {
    background-color: #e0e0e0; /* 호버 시 배경색 변경 */
	}
	
	.petType-btn.active {
	    background-color: #c0c0c0; /* 클릭 시 배경색 변경 */
	    border-color: #808080; /* 클릭 시 테두리 색 변경 */
	}
    .duration-btn.selected , .petType-btn.selected {
        background-color: #007bff;
        color: white;
    }
    .duration-btn span ,.petType-btn span {
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
    .petType-btn.best::after {
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
	
    <!-- 모달창 버튼 -->
	<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
	  여러가지 맞춤 정보를 통해 돌보미를 추천 받아보세요. 
	</button>
	
	<div class="container mt-5">
       <!-- 날짜와 시간 클릭 시 모달영역 -->
		<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="staticBackdropLabel">날짜와 시간선택</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		          <div class="form-group">
                      <label for="visitDate" class="form-label">원하시는 날짜를 골라주세요.</label>
                      <input type="date" class="form-control" id="visitDate" name="visitDate" required min="<%= formattedDate %>">
                      									<%-- 오늘 날짜부터 달력을 클릭하도록 min="<%= formattedDate %>" 로 막아주기--%>
                      <div class="" id="startTime">방문시간을 선택해주세요. 
                       <br> 
                         <button type="button" class="str-btn" value="1000">10:00</button>
                         <button type="button" class="str-btn" value="1100">11:00</button>
                         <button type="button" class="str-btn" value="1200">12:00</button>
                         <button type="button" class="str-btn" value="1300">13:00</button>
                         <button type="button" class="str-btn" value="1400">14:00</button>
                         <button type="button" class="str-btn" value="1500">15:00</button>
                         <button type="button" class="str-btn" value="1600">16:00</button>
                         <button type="button" class="str-btn" value="1700">17:00</button>
                 	  </div>
                 	  <h5>돌봄시간을 선택해주세요.</h5>
                   	  <div class="duration-btn-group" id="duration">
                         <button type="button" class="duration-btn" value="100">60분</button>
                         <button type="button" class="duration-btn" value="200">120분</button>
                         <button type="button" class="duration-btn" value="300">180분</button>
                         <button type="button" class="duration-btn" value="400">240분</button>
                 	  </div>
                 	  <h5>반려견 유형을 선택해주세요.</h5>
                 	  <div class="petType-btn-group" id="petType">
                         <button type="button" class="petType-btn" value="1">
                         	<img alt="소형" src="/pjtMungHub/resources/uploadFiles/sittingSupplies/001.png">
                         </button>
                         <button type="button" class="petType-btn" value="2">
                         	<img alt="중형" src="/pjtMungHub/resources/uploadFiles/sittingSupplies/002.png">
                         </button>
                         <button type="button" class="petType-btn" value="3">
                         	<img alt="대형" src="/pjtMungHub/resources/uploadFiles/sittingSupplies/003.png">
                         </button>
                 	  </div>
                  </div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
		        <button type="reset" class="btn btn-secondary" id="resetBtn">초기화</button>
                <button type="button" class="btn btn-primary" id="sitterSearch">펫시터 검색</button>
		      </div>
		    </div>
		  </div>
		</div>
      </div>
    
    <br>
    <h4>돌보미 리스트</h4>
    <div class="container mt-5"  id="sitterListContainer">
        
    </div>
	
	<script>
		$(function(){
			$(".duration-btn, .str-btn, .petType-btn").on("click", function() {
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
				//펫크기
				var petTypeNo = $(".petType-btn.selected").val();
				
				if(visitDate && startTime && duration && petTypeNo){
					$.ajax({
						url : "selectSitter.re",
						type : "post",
						data : {
							visitDate : visitDate,
							startTime : startTime,
							endTime : endTime,
							petTypeNo : petTypeNo
						},
						success: function (list) {
							 var sitterList = "";
							 for (var i = 0; i < list.length; i++) {
								 sitterList += "<form class='sitter-card' action='short.re' method='get'>" 
				                        + "<div class='sitter-info'>"
				                        + "<h4>" + list[i].petSitterName + "</h4>"
				                        + "<p>" + list[i].introduce + "</p>"
				                        + "<p class='popular-style'>" + list[i].dogKeword + "</p>"
				                        + "<p class='popular-style'>" + list[i].typeKeyword + "</p>"
				                        + "<input type='hidden' name='petSitterNo' value='" + list[i].petSitterNo + "'>"
				                        + "<input type='hidden' name='visitDate' value='" + visitDate + "'>"
				                        + "<input type='hidden' name='startTime' value='" + startTime + "'>"
				                        + "<input type='hidden' name='endTime' value='" + endTime + "'>"
				                        + "<input type='hidden' name='duration' value='" + duration + "'>"
				                        + "<input type='hidden' name='petTypeNo' value='" + petTypeNo + "'>"
				                        + "<button type='submit' class='btn-reserve' id='resBtn'>예약</button>"
				                        + "</div>"
				                        + "<img src='/pjtMungHub/" + list[i].filePath + list[i].originName + "' class='sitter-photo'>"
				                        + "</form>";
							 }
							 $('#sitterListContainer').html(sitterList);
							 console.log('데이터 불러오기 성공!!');
						},
						error : function(){
							console.log('통신오류');
						}
					});
					//값을 보낸 후 모달창 닫아주기
					$("#staticBackdrop").modal('hide'); 
				}else{
					//둘중에 하나라도 비입력시 알림창
					alert('정보를 모두 입력해주세요.')
				}
			});
			//리셋버튼을 누르면 날짜와 시간 비워주기
			$("#resetBtn").click(function(){ 
				$("#visitDate").val('');
				$(".duration-btn").removeClass("selected");
				$(".str-btn").removeClass("selected");
				$(".petType-btn").removeClass("selected");
			});
		});
	</script>
</body>
</html>