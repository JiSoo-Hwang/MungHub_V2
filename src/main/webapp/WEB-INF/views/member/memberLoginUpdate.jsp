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

	
	<div class="search-Area">
					<h4 class="modal-title">로그인 정보 조회</h4>
			<div class="search-left">

				<!-- 아이디 조회 요청 처리할 form태그 -->
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
					<div class="searchId-btn">
						<button type="submit" class="btn btn-primary">아이디 조회</button>
					</div>
				</form>
				

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
						<div class="searchId-btn">
							<button type="submit" class="btn btn-primary" data-toggle="modal" data-target="#changeModal">비밀번호 변경</button>
						</div>
					</div>

		</div>
	</div>
	
			<!-- 비밀번호 조회 시 사용될 모달영역 -->
	<div class="modal fade" id="changeModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">비밀번호 변경</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- 회원 가입 요청 처리할 form태그 -->
				<form action="join.me" method="post">
					<!-- Modal body -->
					<div class="modal-body">
						<div class="member-data">
							<label for="userId">아이디 :</label>
							<input type="text" class="form-control mb-2 mr-sm-2" 
									placeholder="아이디를 입력하세요" id="userId" name="userId" required>
							<div class="idCheck"></div>		
							<label for="userPwd">비밀번호 :</label>
							<input type="password" class="form-control mb-2 mr-sm-2" 
									placeholder="등록할 비밀번호를 입력하세요" id="password" name="password" required>
							<span>비밀번호는 6글자 이상 20자 미만으로, 영어, 숫자 및 특수문자를 반드시 포함하여 구성하셔야 합니다.</span>
							<div class="passwordRule"></div>
							<label for="checkPwd">비밀번호 확인 :</label>
							<input type="password" class="form-control mb-2 mr-sm-2" 
									placeholder="동일한 비밀번호를 입력하세요" id="checkPwd" name="checkPwd" required>
							<div class="passwordCheck">
							</div>
							<label for="name">이름 :</label>
							<input type="text" class="form-control mb-2 mr-sm-2" 
									placeholder="이름를 입력하세요" id="name" name="name" required>
							<label for="phone">전화번호 :</label>
							<input type="text" class="form-control mb-2 mr-sm-2" 
									placeholder="하이픈(-) 포함 공백없이 입력해 주시기 바랍니다." id="phone" name="phone" required>
							<label for="phone">이메일 :</label>
							<input type="email" class="form-control mb-2 mr-sm-2" 
									placeholder="" id="email" name="email" >
							<label for="address">주소 :</label>
							<input type="text" class="form-control mb-2 mr-sm-2" 
									placeholder="" id="address" name="address" >
						</div>
							<label for="">반려견 유무 :</label>
							<div class="petStatus">
								<input type="radio" id="yesPet" value="Y" name="petYN">
								<label for="yesPet">있습니다.</label> &nbsp;&nbsp;
								<input type="radio" id="noPet" value="N" name="petYN">
								<label for="noPet">없습니다.</label> &nbsp;&nbsp;
								<div class="pet-data">
								<button>추가하기</button>
								</div>
							</div>
								
					</div>
					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="submit" class="btn btn-danger">회원가입</button>
						<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
					</div>
				</form>

			</div>
		</div>
	</div>
</body>
</html>