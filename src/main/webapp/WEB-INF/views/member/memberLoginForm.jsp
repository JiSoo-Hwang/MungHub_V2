<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
	<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.7.2/kakao.min.js"
	  integrity="sha384-TiCUE00h649CAMonG018J2ujOgDKW/kVWlChEuu4jK2vxfAAD0eZxzCKakxg55G4" crossorigin="anonymous"></script>
	<script src="https://accounts.google.com/gsi/client" async></script>
	<meta name="google-signin-client_id" content="214727713756-rr8ifm1lva6musaa03n7iasqdssae36q.apps.googleusercontent.com">
	<script src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
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
		<hr>
		<div id="loginAPIArea">
			<img src="./resources/uploadFiles/login/kakao.png" onclick="Kakao.Auth.authorize();">
			<div id="naver_id_login"></div>
			<div id="g_id_onload"
			     data-client_id="214727713756-rr8ifm1lva6musaa03n7iasqdssae36q.apps.googleusercontent.com"
			     data-context="signin"
			     data-ux_mode="popup"
			     data-callback="handleCredentialResponse"
			     data-auto_prompt="false">
			</div>
			<div class="g_id_signin"
			     data-type="standard"
			     data-shape="rectangular"
			     data-theme="outline"
			     data-text="signin_with"
			     data-size="large"
			     data-logo_alignment="left">
			</div>	
		</div>
	</div>
	<script>
		var naver_id_login = new naver_id_login("fx5vZaNv0sDLANZnS_vt", "http://localhost:8887/pjtMungHub/naver.me");
	  	var state = naver_id_login.getUniqState();
	  	naver_id_login.setButton("white", 2,40);
	  	naver_id_login.setDomain();
	  	naver_id_login.setState(state);
	  	naver_id_login.setPopup();
	  	naver_id_login.init_naver_id_login();
	  	
	  	
		function loginUpdate(){
			location.href="loginInfo.me";
		}
		function memberEnroll(){
			location.href="enroll.me";
		}
		function handleCredentialResponse(response) {
	        console.log("Encoded JWT ID token: " + response.credential);
	        const responsePayload = decodeJwtResponse(response.credential);
	 		var email="";
	 		var name="";
	        console.log("ID: " + responsePayload.sub);
	        console.log('Full Name: ' + responsePayload.name);
	        console.log("Email: " + responsePayload.email);
	        console.log("id: " + responsePayload.id);
	        name=responsePayload.name;
	        email=responsePayload.email;
	        location.href="google.me?name="+name+"&&email="+email;
		}

		function decodeJwtResponse (token) {
			var base64Url = token.split('.')[1];
			var base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
			var jsonPayload = decodeURIComponent(window.atob(base64).split('').map(function(c) {
				return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
				}).join(''));
		
			return JSON.parse(jsonPayload);
		}

	</script>
</body>
</html>