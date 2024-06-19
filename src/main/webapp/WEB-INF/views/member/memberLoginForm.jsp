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
	<div id="loginArea">
		<h2 align="center">로그인</h2>
		<form action="login.me" method="post">
				아이디 : <input type="text" id="userId" name="userId" required placeholder="아이디"> <br>
				비밀번호 : <input type="password" id="password" name="password" required placeholder="비밀번호">
			<button type="submit">로그인</button>
		</form>
		
		<div id="loginServiceArea">
			<input type="checkbox" id="rememberID"><label for="rememberID">아이디 기억하기</label> <br>
			<button data-toggle="modal" data-target="#searchModal" >아이디 / 비밀번호 조회</button>
			<button onclick="memberEnroll();">회원가입</button>
		</div>
		
	</div>
	<script>
		function loginUpdate(){
			location.href="/WEB-INF/views/member/memberLoginUpdate.jsp";
		}
		function memberEnroll(){
			location.href="enroll.me";
		}
	</script>
	
			<!-- 회원 로그인 정보 조회시 사용될 모달영역 -->
	<div class="modal fade" id="searchModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">로그인 정보 조회</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- 회원 정보 조회 요청 처리할 form태그 -->
				<form action="searchId.me" method="post">
					<!-- Modal body -->
					<div class="searchId-body">
						<div class="member-data">
							<label for="name">이름 :</label>
							<input type="text" class="form-control mb-2 mr-sm-2" 
									placeholder="이름을 입력하세요" id="name" name="name" required>
							<label for="phone">전화번호 :</label>
							<input type="text" class="form-control mb-2 mr-sm-2" 
									placeholder="하이픈(-) 포함 공백없이 입력해 주시기 바랍니다." id="phone" name="phone" required>
						</div>
					</div>
					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="submit" class="btn btn-danger">아이디 조회</button>
					</div>
				</form>
				<form action="changePw.me" method="post">
					<!-- Modal body -->
					<div class="changePw-body">
						<div class="member-data">
							<label for="userId">아이디 :</label>
							<input type="text" class="form-control mb-2 mr-sm-2" 
									placeholder="아이디를 입력하세요" id="userId" name="userId" required>
							<label for="name">이름 :</label>
							<input type="text" class="form-control mb-2 mr-sm-2" 
									placeholder="이름을 입력하세요" id="name" name="name" required>
							<label for="phone">전화번호 :</label>
							<input type="text" class="form-control mb-2 mr-sm-2" 
									placeholder="하이픈(-) 포함 공백없이 입력해 주시기 바랍니다." id="phone" name="phone" required>
						</div>
					</div>
					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="submit" class="btn btn-danger">비밀번호 변경</button>
					</div>
				</form>
						<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>

			</div>
		</div>
	</div>
</body>
</html>