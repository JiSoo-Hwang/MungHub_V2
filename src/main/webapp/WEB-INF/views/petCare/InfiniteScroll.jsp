<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>







<script>



//========================== 무한 스크롤 연습 =======================================

function feedList(currentPage) {
    $('#loadingSpinner').show(); // 스피너 표시
    $.ajax({
        url: 'your-api-endpoint',
        data: { page: currentPage },
        success: function(response) {
            // 데이터 로드 및 추가
            $('#content').append(response.data);

            // 로딩 상태 업데이트
            isLoading = false;

            // 스피너 숨기기
            $('#loadingSpinner').hide();

            // 최대 페이지에 도달하면 스크롤 이벤트 해제
            if (currentPage >= response.pi.maxPage) {
                $(window).unbind('scroll');
            }
        },
        error: function() {
            console.log('통신실패ㅠㅠ');
            isLoading = false;

            // 스피너 숨기기
            $('#loadingSpinner').hide();
        }
    });
}



$(window).scrollTop() 현재 스클롤된 수직위치
$(documnet).height() 문서의 전체높이
$(window).height() 현재 뷰포트의 높이

$(window).unbind('scroll') 스크롤 이벤트해제
개선여지
1.스크롤감지 정확성 : 조건완화로 하단에 거의 도달 했을때 작동
2.중복요청방지 : var isLoading =false; 를 사용
3.로딩스피너추가

<div id="loadingSpinner" style="display:none;"> none으로 설정(처음 안보여줌)
<img src="사용할gif" alt="Loading...">
</div>





let isLoading = false;

$(window).scroll(function() {
    if ($(window).scrollTop() >= $(document).height() - $(window).height() - 100) {
        if (!isLoading) {
            isLoading = true;
            const currentPage = Math.ceil($('.con').length / 6) + 1;
            feedList(currentPage);
            console.log('다음 페이지 로드: ' + currentPage);
        }
    }
});

function feedList(currentPage) {
    $.ajax({
        url: 'your-api-endpoint',
        data: { page: currentPage },
        success: function(response) {
            // 데이터 로드 및 추가
            $('#content').append(response.data);
            
            // 로딩 상태 업데이트
            isLoading = false;

            // 최대 페이지에 도달하면 스크롤 이벤트 해제
            if (currentPage >= response.pi.maxPage) {
                $(window).unbind('scroll');
            }
        },
        error: function() {
            console.log('통신실패ㅠㅠ');
            isLoading = false;
        }
    });
}



//======================================= 달력 연습 =======================================

/*

$(function() {
//오늘날짜기준
var formattedDate = $('#formattedDate').val(); 

var calendarEl = $('#calendar')[0]; //html에서 첫번째 객체선택

var calendar = new FullCalendar.Calendar(calendarEl, {
    initialView: 'dayGridMonth', //초기 화면을 월간으로 설정
    locale: 'ko', // 한글 로케일 설정
    validRange:{ //선택 가능한 날짜 범위지정
    	start : formattedDate,
    	end : null //종료 날짜를 null로 설정하여 제한 없애기
    },
    selectable: true, //사용자가 날짜 선택 가능하게
    selectAllow: function(info){ //selectInfo : 사용자가 선택한 날짜정보
    	var start = info.startStr;
    	var end = info.endStr;
    	
    	//비활성화 된 목록순회
    	for(var i=0; i<disabledDates.length; i++){
    		if(start <= disabledDates[i] && disabledDates[i] <end){
    			//선택 날짜 범위안에 비활성화된 날짜가 있는경우, 선택허용 X
    			return false;
    		}
    	}
    	return true; //모든 검사가 통과한 날짜만 선택하기
    }
});
setTimeout(function() {
    calendar.render();
}, 1000);
});

*/

//배열로 가져온 disabledDates 를 script에 풀어주기
var disabledDates = [];
var disabledStart = [];
var disabledEnd = [];

$(document).ready(function() {
    $('.disabled-date').each(function() {
        disabledDates.push($(this).val());
    });
	$('.disabled-start').each(function() {
    	disabledStart.push($(this).val(),10);
    });
    $('.disabled-end').each(function() {
    	disabledEnd.push($(this).val(),10);
    });
    
    console.log(disabledStart);
    console.log(disabledEnd);
	
  //시작과 끝나는 시간을 기준으로 시간선택 button 을 비활성화 시켜야 함.
	$('.str-btn').filter(function(){  //return 값을 기준으로 필터링
		
		for(var i=0; i<disabledStart.length; i++){
			(function(startValue, endValue){
				$('.str-btn').filter(function(){
					var value = parseInt($(this).val(),10);
					return value >= startValue && value <= endValue;
				}).attr('disabled',true);
			})(disabledStart[i],disabledEnd[i]);
		}
	}).attr('disabled',true);
});


/*
datesSet : function(){ //특정날짜의 스타일을 변경할때 주로 사용하는 fullCanlendar api의 이벤트
	var dates = calendar.getDate(); //달력의 날짜 가져오기
	//변수 앞 '$' 는 jQuery 변수라는 의미로 관습적으로 사용된다고 함.
	var $dateEls = $('#calendar .fc-daygrid-day'); //.fc-daygrid-day(날짜의 각 셀에 해당함)
	
	$dateEls.each(function(){
		var date = $(this).attr('data-date'); //현재 요소의 data-date 속성값을 가져옴
		
		// disabledDates 배열에 위에서 지정한 date 날짜가 포함 돼 있다면?
		if(disabledDates.includes(date)){
			$(this).addClass('disabled-date'); //해당셀에 비활성화 스타일 적용
		}
	});
}
*/







</script>



</body>
</html>