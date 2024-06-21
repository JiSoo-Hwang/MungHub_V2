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
			<button onclick="loginUpdate();" >아이디 / 비밀번호 조회</button>
			<button onclick="memberEnroll();">회원가입</button>
		</div>
		
	</div>
	<script>
		function loginUpdate(){
			location.href="loginInfo.me";
		}
		function memberEnroll(){
			location.href="enroll.me";
		}
	</script>
</body>
</html>