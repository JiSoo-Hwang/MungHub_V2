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
					<div class="searchId-body">
						<div class="searchId-data">
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
			</div>

			<div class="search-right">
				<form action="changePw.me" method="post">
					<div class="searchPw-body">
						<div class="searchPw-data">
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
							<label for="password">비밀번호 :</label>
							<input type="password" class="form-control mb-2 mr-sm-2" 
									placeholder="등록할 비밀번호를 입력하세요" id="password" name="password" required>
							<span>비밀번호는 6글자 이상 20자 미만으로, 영어, 숫자 및 특수문자를 반드시 포함하여 구성하셔야 합니다.</span>
							<div class="passwordRule"></div>
							<label for="checkPwd">비밀번호 확인 :</label>
							<input type="password" class="form-control mb-2 mr-sm-2" 
									placeholder="동일한 비밀번호를 입력하세요" id="checkPwd" name="checkPwd" required>
							<div class="passwordCheck"></div>
					</div>
						
					<div class="modal-footer">
						<button type="submit" class="btn btn-danger">비밀번호 변경</button>
						<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
					</div>
				</form>

			</div>
		</div>
	<script>
		$(function(){
			var pwRule=$('.passwordRule');
			$('#password').keyup(function(){
				var regExp= new RegExp();
				var password=$(this).val();
				regExp=/^[a-zA-Z0-9!@#$%^&*]{6,20}$/;
	            if(!regExp.test(password)){
	                pwRule.text("유효하지 않은 비밀번호입니다.").css('color','red')
	            }else{
	                pwRule.text("유효한 비밀번호입니다.").css('color','green')
	            	
	            }
			})
		})
	
		$(function(){
			$('#checkPwd').keyup(function(){
			    if($('#password').val() == $('#checkPwd').val()){
			        $('.passwordCheck').text('비밀번호 일치').css('color', 'green')
			    }else{
			        $('.passwordCheck').text('비밀번호 불일치').css('color', 'red')
			    }
			})
		})
	</script>
</body>
</html>