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
	<div class="mypage-left">
		<%@include file="/WEB-INF/views/member/memberSideBar.jsp" %>
	</div>
	<div class="mypage-main">
		<div class="member-info">
			<h3>${loginUser.userId} 님의 회원 정보입니다.</h3> <br>
			<div class="info-area">
				<label for="name">이름 :</label>
				<input type="text" class="form-control mb-2 mr-sm-2" 
						placeholder="이름을 입력하세요" id="name" name="name" value="${loginUser.name}" readonly>
				<label for="phone">전화번호 :</label>
				<input type="text" class="form-control mb-2 mr-sm-2" 
						placeholder="하이픈(-) 포함 공백없이 입력해 주시기 바랍니다." id="phone" name="phone" value="${loginUser.phone}"readonly>
				<label for="phone">이메일 :</label>
				<input type="email" class="form-control mb-2 mr-sm-2" 
						placeholder="" id="email" name="email" value="${loginUser.email}"readonly>
				<label for="address">주소 :</label>
				<input type="text" class="form-control mb-2 mr-sm-2" 
						placeholder="" id="address" name="address" value="${loginUser.address}" readonly>	
			</div>
		</div>
		<div class="pet-info">
			<c:choose>
				<c:when test="${loginUser.petYN eq 'N'}">
					<h3>현재 등록된 반려견 정보가 없습니다.</h3>
				</c:when>
				<c:otherwise>
					<h3>반려견 정보</h3>
					<div class="info-area">
						<div class="info-left">
							<c:forEach items="${petPhotoList}" var="photo">
								<div class="petPhoto">
								<img src="${photo.filePath}">
								</div>
							</c:forEach>
						</div>
						<div class="info-right">
						<c:forEach items="${pList}" var="pet">
							<div class="petInfo">
								<label for="">이름 : ${pet.petName}</label>
								<label for="">품종 : ${pet.breed}</label>
								<label for="">나이 : ${pet.petAge}</label>
								<label for="">성별 : ${pet.petGender eq 'M' ? '왕자님':'공주님' }</label>
								<label for="weight">몸무게 : ${pet.weight}</label>
							</div>						
						</c:forEach>
					</div>					
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</body>
</html>