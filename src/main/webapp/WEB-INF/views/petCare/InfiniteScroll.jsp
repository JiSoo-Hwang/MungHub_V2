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

</script>



</body>
</html>