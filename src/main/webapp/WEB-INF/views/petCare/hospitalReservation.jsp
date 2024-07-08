<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>병원 예약 페이지</title>
<!-- fullcalender -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.14/index.global.min.js"></script>
	<style>
	
		body {
            font-family: 'Arial', sans-serif;
            padding: 20px;
        }

        .container {
            background-color: #fff3e0;
            padding: 20px;
            border: 2px solid #ffa726;
            border-radius: 10px;
        }

        .h4, .h5 {
            color: #ef6c00;
            margin-bottom: 20px;
        }

        .sitter-info, .pet-info {
            background-color: #ffecb3;
            padding: 10px;
            border: 1px solid #ffa726;
            border-radius: 5px;
            margin-bottom: 20px;
        }

        .sitterFont {
            font-weight: bold;
            margin-top: 10px;
        }

        .popular-style {
            font-style: italic;
        }

        .str-btn, .petType-btn {
            background-color: #ffecb3;
            border: 1px solid #ffa726;
            color: #ef6c00;
            margin: 5px;
            padding: 10px 20px;
            border-radius: 5px;
        }

        .str-btn:hover, .petType-btn:hover {
            background-color: #ffb74d;
            color: #ffffff;
        }

        .pet-info-all {
            background-color: #fff3e0;
            padding: 10px;
            border: 1px solid #ffa726;
            border-radius: 10px;
        }

        textarea {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ffa726;
        }

        .reservation-btn {
            background-color: #ef6c00;
            border: none;
            padding: 10px 20px;
            color: #ffffff;
            border-radius: 5px;
            margin-top: 20px;
        }

        .reservation-btn:hover {
            background-color: #d84315;
        }

        #preview {
            margin-top: 10px;
            max-width: 100%;
            height: auto;
            border: 1px solid #ffa726;
            border-radius: 5px;
        }

        .calendar-time-container {
            display: flex;
            justify-content: space-between;
        }

        .calendar-container {
            flex: 1;
            margin-right: 20px;
        }

        .time-container {
            flex: 1;
        }
		
		
		
		
		.str-btn.selected {
	        background-color: #28a745;
	        color: white;
	    }
		
		.calendar-container,
	    .sitter-list-container {
	      width: 48%; /* Adjust the width as necessary */
	      margin-left : 5%;
	      margin-right : 5%;
	    }
	    /* 달력 */
	    #calendar {
	    	max-width : 600px;
        	margin : 0 auto;
	    }
	    .fc-daygrid-day:hover {
	        cursor: pointer;
	    }
	    .fc-daygrid-day.fc-day-selected {
	        background-color: skyblue !important;
	    }
	
	    /* 펫크기 버튼 그림조절  */
	    .petType-btn img {
		    width: 100%; 
		    height: 100%; 
		}
		
		/* 펫크기  */
	    .petType-btn-group {
	        display: flex;
	        justify-content: space-around;
	        margin-top: 20px;
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
	    .petType-btn:hover , .str-btn:hover {
	    background-color: #e0e0e0; /* 호버 시 배경색 변경 */
		}
		
		.petType-btn.active {
		    background-color: #c0c0c0; /* 클릭 시 배경색 변경 */
		    border-color: #808080; /* 클릭 시 테두리 색 변경 */
		}
	    .petType-btn.selected {
	        background-color: #007bff;
	        color: white;
	    }
	    .petType-btn span {
	        display: block;
	        font-size: 14px;
	    }
	    .petType-btn.best::after {
	        content: 'BEST';
	        display: block;
	        font-size: 10px;
	        color: #007bff;
	        margin-top: 5px;
	    }
	</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>

	<div class="container">
	    <h4 class="h4">첫진료 접수증</h4>
	    <div class="mb-3">
	        <h5 class="h5">보호자 정보</h5>
	        <div class="sitter-info">
	            <label for="ownerName">성명:</label>
	            <input type="text" id="ownerName" name="ownerName" class="form-control" placeholder="필히 적어주세요." required>
	            <label for="ownerPhone">연락처:</label>
	            <input type="text" id="ownerPhone" name="ownerPhone" class="form-control" placeholder="필히 적어주세요." required>
	        </div>
	        <div class="sitter-info">
	            <h5 class="h5">병원 정보</h5>
	            <label for="hosName">병원 이름:</label>
	            <input type="text" id="hosName" name="hosName" class="form-control" readonly>
	            <label for="hosPhone">연락처:</label>
	            <input type="text" id="hosPhone" name="hosPhone" class="form-control" readonly>
	            <label for="hosAddress">주소:</label>
	            <input type="text" id="hosAddress" name="hosAddress" class="form-control" readonly>
	        </div>
	    </div>
	    
	    <h5 class="h5">방문날짜와 시간을 선택해주세요.</h5>
	    <div class="calendar-time-container mb-3">
	        <div id="calendar" class="calendar-container"></div>
	        <div class="time-container" id="startTime">
	            <h5 class="h5">방문시간을 선택해주세요.</h5>
	            <button type="button" class="str-btn" value="1000">10:00</button>
	            <button type="button" class="str-btn" value="1100">11:00</button>
	            <button type="button" class="str-btn" value="1200">12:00</button>
	            <button type="button" class="str-btn" value="1300">13:00</button>
	            <button type="button" class="str-btn" value="1400">14:00</button>
	            <button type="button" class="str-btn" value="1500">15:00</button>
	            <button type="button" class="str-btn" value="1600">16:00</button>
	            <button type="button" class="str-btn" value="1700">17:00</button>
	        </div>
	    </div>
	    <div class="mb-3">
	        <h5 class="h5">반려동물 정보</h5>
	        <div class="sitter-info">
	            <label for="petName">이름:</label>
	            <input type="text" id="petName" name="petName" class="form-control">
	            <label for="petKind">품종:</label>
	            <input type="text" id="petKind" name="petKind" class="form-control">
	            <label for="birthDate">생년월일:</label>
	            <input type="date" id="birthDate" name="birthDate" class="form-control">
	            <label for="gender">성별:</label>
	            <select id="gender" name="gender" class="form-select">
	                <option value="male">수컷</option>
	                <option value="female">암컷</option>
	            </select>
	            <label for="gender">중성화 여부:</label>
	            <select id="gender" name="gender" class="form-select">
	                <option value="male">O</option>
	                <option value="female">X</option>
	            </select>
				
	            <label for="specialNotes">특이사항:</label>
	            <textarea id="specialNotes" name="specialNotes" rows="3" class="form-control"></textarea>
	        </div>
	    </div>
	    <div class="pet-info-all">
	        <h5 class="h5">반려견 유형을 선택해주세요.</h5>
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
	        <h5 class="h5">증상을 입력해주세요. (사진첨부가능)</h5>
	        <textarea id="symptom" name="symptom" rows="3" class="form-control" placeholder="꼭 기입 해주세요!" required></textarea>
	        <label for="upfile">사진첨부</label>
	        <input type="file" onchange="readURL(this);" name="upfile" id="upfile" class="form-control">
	        <img id="preview" src="#" alt="Image Preview">
	    </div>
    <button type="submit" class="reservation-btn">예약페이지로</button>
	</div>
   
   <!-- 펫시터의 스케줄 필터링 -->
   <c:forEach var="d" items="${disabledPlan }">
		<input type="hidden" class="reservation-id" value="${d.reservationId}">
		<input type="hidden" class="disabled-date" value="${d.visitDate}">
		<input type="hidden" class="disabled-start" value="${d.startTime}">
		<input type="hidden" class="disabled-end" value="${d.endTime}">
	</c:forEach>
	
	<script>
		//첨부파일 미리보기
		function readURL(input){
				//input.files : 선택된 파일을 나타내는 FileList 객체
				//input.files[0] : 첫번째 선택된 파일
			if(input.files && input.files[0]){
				var reader new FileReader(); //파일의 내용을 URL 로 읽음.
				reader.onload = function(e){ //파일 호출이 완료되면 
					document.getElementById('preview').src = e.target.result; //데이터 URL을 나타냄
				};
				//선택된 파일을 데이터URL 로 읽는 메서드,base64 인코딩된 문자열로 표현함
				reader.readAsDataURL(input.files[0]);
			}else{
				document.getElementById('preview').src = "";
			}
		}
	
		$('.reservation-btn').on('click',function(){
			var inputStartTime = parseInt($(".str-btn.selected").val(),10);
			var petTypeNo = $(".petType-btn.selected").val();
			
			if(inputStartTime && plusEndTime && petTypeNo){
				$('#startTime').val(inputStartTime);
				$('#endTime').val(plusEndTime);
				$('#petTypeNo').val(petTypeNo);
			}else{
				event.preventDefault(); //위 사항이 모두 입력되지 않으면 폼제출 방지
				alert('세부사항을 전부 입력해주세요.');
			}
		});
		//============== 달력 ===================
		 $(document).ready(function() {
			    var disabledDates = [];

			    // 예약 정보를 배열에 추가
			    $('.reservation-id').each(function(index) { //index : 현재 반복중인 요소
			      var reservation = {
			        reservationId: $(this).val(),
			        date: $('.disabled-date').eq(index).val(), //동일한 인덱스의 값을 가져옴
			        start: parseInt($('.disabled-start').eq(index).val(), 10),
			        end: parseInt($('.disabled-end').eq(index).val(), 10)
			      };
			      disabledDates.push(reservation); //reservation 객체를 disabledDates [] 에 추가
			    });

			    // FullCalendar 설정
			    var calendarEl = document.getElementById('calendar');
			    var calendar = new FullCalendar.Calendar(calendarEl, {
			      initialView: 'dayGridMonth',
			      locale: 'ko',
			      headerToolbar: {
			          left: '',
			          center: 'title',
			          right: 'prev,next'
			        },
			      dateClick: function(info) {
			        var selectedDate = info.dateStr; //선택된 날짜
			        $('#visitDate').val(selectedDate); // 선택된 값 hidden으로
			        //모든 날짜에 스타일 제거
			        $('.fc-daygrid-day').removeClass('fc-day-selected');
			        
			        // 선택된 날짜에 스타일 추가
			        var selectedDayE1 = document.querySelector('[data-date="' + selectedDate + '"]');
			        if(selectedDayE1){
			        	selectedDayE1.classList.add('fc-day-selected');
			        	//classList 속성 : 클래스 이름추가/제거, 클래스 존재확인
			        	// add,remove,toggle,contains,replace(클래스이름)
			        	// toggle : 이름이 존재하면 제거, 없으면 추가
			        	// contains : 이름이 존재하면 true, 아니면 false 반환
			        }

			        // 선택된 날짜에 예약된 날짜와 동일한지 확인하고 reservations 에 담기
			        var reservations = disabledDates.filter(function(reservation) {
			          return reservation.date === selectedDate;
			        });

			        // 해당 예약 시간 범위 내의 버튼을 비활성화
			        $('.str-btn').removeAttr('disabled'); // 먼저 모든 버튼을 활성화
			        
			        reservations.forEach(function(reservation) {//선택된 날짜의 예약정보 반복문
			        	
			          $('.str-btn').filter(function() {
			            var value = parseInt($(this).val(), 10);
			            return value >= reservation.start && value <= reservation.end;
			          }).attr('disabled', true);
			        });
			      }
			    });
			    
			    setTimeout(function() {
			        calendar.render();
			        
			      //페이지 로드시 오늘날짜 선택
			        	function selectToday(){
			        		// new Date() 형태가 2024-07-01T12:34:56.789Z 와 같이 나오기 때문에
					        // toISOString () 로 위에 값을 문자열로 변환
					        // 'T' 를 기준으로 split 분리한 뒤 0번째 배열에 해당하는 2024-07-01 을 가져옴.
					        var today = new Date().toISOString().split('T')[0];
					        var todayElement = document.querySelector('[data-date="' + today + '"]');
					        if(todayElement){
					        	todayElement.classList.add('fc-day-selected');
					        	//오늘 날짜가 선택되고,dateClick 적용되게 trigger 설정
					        	//dateClick 함수가 date: new Date(), dateStr: today 둘다 사용하기 때문에 둘다 적어야함. (만약의 오류까지 대비)
					        	calendar.trigger('dateClick',{ date: new Date(), dateStr: today });
					        }
			        	}
			    selectToday(); 
			    }, 500);
			    
			  //버튼 클릭시 활성화/비활성화
				$(".str-btn, .petType-btn").on("click", function() {
	                $(this).siblings().removeClass("selected");
	                $(this).addClass("selected");
	            });
		});
		
		
	</script>
</body>
</html>








