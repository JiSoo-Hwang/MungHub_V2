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
<title>MungHub 장기돌봄 페이지</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 주소 api -->

<style>
	body {
	    font-family: Arial, sans-serif;
	    margin: 0;
	    padding: 0;
	    background-color: #f5f5f5;
	}
	
	header {
	    background-color: #ffffff;
	    padding: 10px 20px;
	    display: flex;
	    justify-content: space-between;
	    align-items: center;
	    border-bottom: 1px solid #e0e0e0;
	}
	
	.search-bar {
	    display: flex;
	    align-items: center;
	}
	
	.search-bar input {
	    border: 1px solid #cccccc;
	    border-radius: 20px;
	    padding: 5px 10px;
	    margin-right: 10px;
	}
	
	.search-bar button {
	    cursor: pointer;
	}
	
	.settings-btn {
	    font-size: 1.5rem;
	}
	.partner {
	    padding: 20px;
	    background-color: #ffffff;
	}
	
	.partner h2 {
	    display: inline-block;
	    margin: 0;
	}
	
	.sort-btn {
    background-color: #ffffff;
    border: none;
    cursor: pointer;
    float: right;
	}
	
	.container {
	    display: flex;
	    flex-wrap: wrap; 
	    gap: 20px; 
	}
	
	.partner-card {
	    display: flex; 
	    align-items: center;
	    margin: 5% 10% 5% 10%; 
	    border: 1px solid black;
	    border-radius: 10px;
	    overflow: hidden;
	    padding: 10px;
	    cursor: pointer;
	}
	
	.partner-card img {
	    width: 200px;
	    height: auto;
	    margin-right: 20px; /* 이미지와 텍스트 사이의 간격 */
	}
	
	.card-content {
	    padding: 20px;
	}
	
	.card-content .title {
	    font-size: 1.2rem;
	    margin: 0;
	}
	
	.card-content .rating {
	    color: #666666;
	    margin: 10px 0;
	}
	
	.card-content .houseAddress {
	    color: #007bff;
	}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	
	<input type="hidden" id="hiddenAddress" name="address">
	<input type="hidden" id="hiddenStartDate" name="startDate">
	<input type="hidden" id="hiddenEndDate" name="endDate">
	<input type="hidden" id="hiddenDaysNight" name="daysNight">
	
    <header>
    
        <div class="search-bar">
        <!-- Button trigger modal -->
		<button type="button" id="addrBtn" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop1">
		 가까운 장소 찾기
		</button>
		<input type="text" id="inputAddress" style="width:400px;" readonly placeholder="주소입력">
        <!-- 주소 api 모달창으로 -->
        <!-- Modal -->
		<div class="modal fade" id="staticBackdrop1" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="staticBackdropLabel">주소입력창</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <input type="text" id="sample6_postcode" placeholder="우편번호">
				<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
				<input type="text" id="sample6_address" placeholder="주소" style="width:400px;"><br>
				<input type="text" id="sample6_detailAddress" placeholder="상세주소" style="width:300px;">
				<input type="text" id="sample6_extraAddress" placeholder="참고항목">
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
		        <button type="button" class="btn btn-primary" id="resetBtn">초기화</button>
		        <button type="button" class="btn btn-primary" id="inputBtn">입력완료</button>
		      </div>
		    </div>
		  </div>
		</div>
		
		 <!-- Button trigger modal -->
		<button type="button" id="addrBtn" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop3">
		 날짜 및 돌봄 기간정하기
		</button>
		<input type="button" class="btn btn-secondary" id="searchBtn" value="검색">
		<!-- Modal -->
		<div class="modal fade" id="staticBackdrop3" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="staticBackdropLabel">날짜 및 돌봄기간</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
			      <h5>날짜를 지정해주세요.</h5>
			      	<div class="date-container">
				        <input type="date" id="dateInput" required min="<%=formattedDate%>">
			    	</div>
			      <h5>돌봄 기간을 선택해주세요.(5박이상은 관리자에게 문의해주세요.)</h5>
			      	<input type="radio" class="btn-check" name="daysNight" id="day1" autocomplete="off" value="1" checked>
					<label class="btn btn-secondary" for="day1">1박2일</label>
					<input type="radio" class="btn-check" name="daysNight" id="day2" autocomplete="off" value="2">
					<label class="btn btn-secondary" for="day2">2박3일</label>
					<input type="radio" class="btn-check" name="daysNight" id="day3" autocomplete="off" value="3">
					<label class="btn btn-secondary" for="day3">3박4일</label>
					<input type="radio" class="btn-check" name="daysNight" id="day4" autocomplete="off" value="4">
					<label class="btn btn-secondary" for="day4">4박5일</label>
			  </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
		        <button type="button" class="btn btn-primary" id="resetBtn3">초기화</button>
		        <button type="button" class="btn btn-primary" id="inputBtn3">입력완료</button>
		      </div>
		    </div>
		  </div>
		</div>
      </div>
    </header>
    
    <section class="partner">
        <h2>우리집 같은 보금자리</h2>
        <!-- Button trigger modal -->
		<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
		  정렬하기
		</button>
		<!-- Modal -->
		<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="staticBackdropLabel">Modal title</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
			       <div class="radio-btn-group">
						<h5>돌보미의 반려동물 보유</h5>
						<div class="form-check form-switch">
						  <input class="form-check-input" type="checkbox" id="pet">
						  <label class="form-check-label" for="flexSwitchCheckDefault">반려동물 보유</label>
						</div>
						<h5>돌보미의 산책가능 여부</h5>
						<div class="form-check form-switch">
						  <input class="form-check-input" type="checkbox" id="walk">
						  <label class="form-check-label" for="flexSwitchCheckDefault">산책가능여부</label>
						</div>
						<h5>반려동물의 크기를 선택해주세요.</h5>
						    <input type="radio" class="btn-check" name="petType" id="petType1" autocomplete="off" value="1" checked>
							<label class="btn btn-secondary" for="petType1">소형견(7kg미만)</label>
							<input type="radio" class="btn-check" name="petType" id="petType2" autocomplete="off" value="2">
							<label class="btn btn-secondary" for="petType2">중형견(7~15kg)</label>
							<input type="radio" class="btn-check" name="petType" id="petType3" autocomplete="off" value="3">
							<label class="btn btn-secondary" for="petType3">대형견(15kg이상)</label>
				    </div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
		        <button type="button" class="btn btn-primary" id="resetBtn2">초기화</button>
		        <button type="button" class="btn btn-primary" id="inputBtn2">입력완료</button>
		      </div>
		    </div>
		  </div>
		</div>
		
		<div id="pagingArea">
		
        </div>
        
        <div id="houseList">
        
        
        </div>
        
        <div class="partner-card" id="houseList">
            <img src="/pjtMungHub/resources/uploadFiles/housePhoto/2.png" alt="Room Image">
            <div class="card-content">
                <p class="title">아이 휴가는 여기로 보내세요</p>
                <p class="rating">⭐ 5.0 경기 김포시</p>
                <p class="price">산책케어 55,000원/24시 ・ 45,000원/당일</p>
            </div>
        </div>
        
    </section>
    
    <script>
  		//==================== 주소 api ===============================
    	$(function(){
    		$('#inputAddress').on('click',function(){
    			$('#addrBtn').click();
    		});
    	});
		
		function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	            	
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	
	                if(data.userSelectedType === 'R'){
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("sample6_extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("sample6_extraAddress").value = '';
	                }
	                document.getElementById('sample6_postcode').value = data.zonecode;
	                document.getElementById("sample6_address").value = addr; 
	                document.getElementById("sample6_detailAddress").focus();
	                
	               $('#inputBtn').click(function(){
	            	   var fullAddress = addr+'  '+document.getElementById("sample6_detailAddress").value;
	            	   $('#inputAddress').val(fullAddress);
	            	 //값을 보낸 후 모달창 닫아주기
						$("#staticBackdrop1").modal('hide'); 
	               });
	            }
	        }).open();
		}
		//주소 입력창 초기화 버튼  		
		$("#resetBtn").click(function(){ 
			$("#sample6_postcode").val('');
			$("#sample6_address").val('');
			$("#sample6_detailAddress").val('');
			$("#sample6_extraAddress").val('');
		});
		
		//===================== 하우스 리스트 ===================
		$(function(){
			houseList();
			goToPage();
			$(document).on('click','#houseList .partner-card img',function(){
				var houseNo = $(this).next('#houseNo').val();
				console.log(houseNo);
				location.href="detailHouse.re?houseNo="+houseNo;
			});
		});
			
		function houseList(){
			var inputDate = "";
			var daysNight = "";
			var endDate = "";
			$('#inputBtn3').click(function(){//모달창
				inputDate = $('#dateInput').val(); //입력된 날짜
				daysNight = $('input[name="daysNight"]:checked').val(); //몇박몇일
				
				if(inputDate && daysNight){
	    			$("#staticBackdrop3").modal('hide'); //값을 보낸 후 모달창 닫아주기
				}else{
					alert('2가지 요소 모두 입력해주세요.');
				}
			});
			$('#searchBtn').click(function(){
				var address = $("#inputAddress").val(); //주소
				var endDatePlus = parseInt(daysNight);
				//java.util.Date 로 받았기 때문에, controller에서 sql.Date로 변환예정
				endDate = new Date(inputDate);
				endDate.setDate(endDate.getDate() + endDatePlus);
				$.ajax({
					url : "selectHouseList.re",
					data : {
						address : address,
						startDate : inputDate,
						endJavaDate : endDate,
						stayNo : daysNight
					},
					success : function(result){
						
						var list = result.houseList; //map에서 꺼내쓰는 방법
						var pi = result.pi;
						// Hidden input fields 설정
			            $('#hiddenAddress').val(address);
			            $('#hiddenStartDate').val(inputDate);
			            $('#hiddenEndDate').val(endDate);
			            $('#hiddenDaysNight').val(daysNight);
			            
						var houseList = "";
						for (var i = 0; i < list.length; i++) {
							houseList += "<div class='partner-card'>"
		                               + "<img src='/pjtMungHub/" + list[i].filePath + list[i].originName + "' alt='Room Image'>"
		                               + "<input id='houseNo' type='hidden' value='" + list[i].houseNo + "'>"
		                               + "<div class='card-content'>"
		                               + "<p class='title'>" + list[i].introductionSummary + "</p>"
		                               + "<p class='houseAddress'>" + list[i].houseAddress + "</p>"
		                               + "</div>"
		                               + "</div>";
						}
						
						var pagination = "<ul class='pagination'>";
			            // 이전버튼
			            if (pi.currentPage == 1) {
			                pagination += "<li class='page-item disabled'><a class='page-link' href='#'>◀</a></li>";
			            } else {
			                pagination += "<li class='page-item'><a class='page-link' href='#' onclick='goToPage(" + (pi.currentPage - 1) + ")'>◀</a></li>";
			            }
			            // 페이징번호 반복문
			            for (var p = pi.startPage; p <= pi.endPage; p++) {
			                pagination += "<li class='page-item'><a class='page-link' href='#' onclick='goToPage(" + p + ")'>" + p + "</a></li>";
			            }
			            // 다음버튼
			            if (pi.currentPage == pi.maxPage) {
			                pagination += "<li class='page-item disabled'><a class='page-link' href='#'>▶</a></li>";
			            } else {
			                pagination += "<li class='page-item'><a class='page-link' href='#' onclick='goToPage(" + (pi.currentPage + 1) + ")'>▶</a></li>";
			            }
						
						$('#pagingArea').html(pagination);
						$('#houseList').html(houseList);
						console.log('하우스 리스트 불러오기 성공!!');
					},
					erorr : function(){
						console.log('통신실패ㅠㅠ');
					}
				});
				
			});
			
		};
		
		//page 넘버마다 onclick 이벤트를 사용하여 비동기로 페이징이동
		function goToPage(page) {
		    var address = $('#hiddenAddress').val();
		    var startDate = $('#hiddenStartDate').val();
		    var endDate = $('#hiddenEndDate').val();
		    var daysNight = $('#hiddenDaysNight').val();

		    $.ajax({
		        url: "selectHouseList.re",
		        data: {
		            address: address,
		            startDate: startDate,
		            endJavaDate: endDate,
		            stayNo: daysNight,
		            currentPage: page
		        },
		        success: function(result) {
		            var list = result.houseList;
		            var pi = result.pi;

		            var houseList = "";
		            for (var i = 0; i < list.length; i++) {
		            	houseList += "<div class='partner-card'>"
		                            + "<img src='/pjtMungHub/" + list[i].filePath + list[i].originName + "' alt='Room Image'>"
		                            + "<input id='houseNo' type='hidden' value='" + list[i].houseNo + "'>"
		                            + "<div class='card-content'>"
		                            + "<p class='title'>" + list[i].introductionSummary + "</p>"
		                            + "<p class='houseAddress'>" + list[i].houseAddress + "</p>"
		                            + "</div>"
		                            + "</div>";
		            }

		            var pagination = "<ul class='pagination'>";

		            // 이전버튼
		            if (pi.currentPage == 1) {
		                pagination += "<li class='page-item disabled'><a class='page-link' href='#'>◀</a></li>";
		            } else {
		                pagination += "<li class='page-item'><a class='page-link' href='#' onclick='goToPage(" + (pi.currentPage - 1) + ")'>◀</a></li>";
		            }
		            // 페이징번호 반복문
		            for (var p = pi.startPage; p <= pi.endPage; p++) {
		                pagination += "<li class='page-item'><a class='page-link' href='#' onclick='goToPage(" + p + ")'>" + p + "</a></li>";
		            }
		            // 다음버튼
		            if (pi.currentPage == pi.maxPage) {
		                pagination += "<li class='page-item disabled'><a class='page-link' href='#'>▶</a></li>";
		            } else {
		                pagination += "<li class='page-item'><a class='page-link' href='#' onclick='goToPage(" + (pi.currentPage + 1) + ")'>▶</a></li>";
		            }
		            pagination += "</ul>";

		            $('#pagingArea').html(pagination);
		            $('#houseList').html(houseList);
		            console.log('하우스 리스트 불러오기 성공!!');
		        },
		        error: function() {
		            console.log('통신실패ㅠㅠ');
		        }
		    });
		}
		
		
		//정렬순 필터 입력값
		$('#inputBtn2').click(function(){
       	    var pet = $('#pet:checked').val(); //펫유무
       	    var walk = $('#walk:checked').val(); //산책여부
       	    var petType = $('input[name="petType"]:checked').val(); //펫크기
       	    
       	    if(pet && walk && petType){
       	    	
       	    	
       	    	
       	   		//값을 보낸 후 모달창 닫아주기
    			$("#staticBackdrop").modal('hide'); 
       	    }else{
       	    	alert('4가지 요소를 모두 입력해주세요.');
       	    }
       	 
         });
		//정렬순 입력창 초기화 버튼  		
		$("#resetBtn2").click(function(){ 
			$("#location").val('');
			$("#pet").val('');
			$("#walk").val('');
			$("#petType").val('');
		});
    </script>

</body>
</html>