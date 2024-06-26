<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="left-sidebar">
	<ul>
		<li><h3>마이페이지</h3></li>
		<li>
			<a href="update.me">개인 정보 확인 / 수정</a>
		</li>
		<li>
			<a href="updatePet.me">반려견 정보 추가 / 수정</a>
		</li>
		<li>
			<a href="">연계 쇼핑몰 주문 이력</a>
		</li>
		<li>
			<a href="msg.me?currentPage=0">쪽지 / 쿠폰함 보기</a>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
		</li>
		<c:if test="${loginUser.userGrade ge 1}">
			<li>		
				<a href="manage.me">회원 관리</a>
			</li>
			<c:if test="${loginUser.userGrade ge 2}">
				<li>
					<a href="manageTeacher.me">선생님 관리</a>
				</li>
				<li>
					<a href="">상담 요청 리스트</a>
				</li>
			</c:if>
		</c:if>
	</ul>
</div>


</body>
</html>