<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅창</title>
</head>
<style>
</style>	
<body>
	<h1>기본 채팅 서버 확인</h1>
	
	<button onclick="connect();">접속</button>
	<button onclick="disconnect();">종료</button>
	<hr>
	
	<input type="text" id="chat">
	<button onclick="send();">전송</button>
	
	<div id="chatArea">
	
	</div>
	
	<script>
		function disconnect(){
			socket.close();
		}
		// 메시지 전송 함수
		function send(){
			// 사용자가 입력한 텍스트를 추출하여 웹소켓에 전달하기
			var message = document.getElementById("chat").value;
			socket.send(message);
			document.getElementById("chat").value="";
		}
	</script>
</body>
</html>