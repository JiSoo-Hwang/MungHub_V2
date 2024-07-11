<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅창</title>
</head>
<style>
	.chat-total{
		width:100%;
		height:100%;
		overflow: auto;
	}
	.sitter-photo{
		margin-top:10px;
		margin-left:10px;
		margin-right:20px;
		margin-bottom:10px;
		overflow:hidden;
		border-radius:50%;
		width:150px;
		height:150px;
	}
	.sitter-photo>img{
		height:150px;
		top:50%;
		left:50%;
	}
	.chatHeader{
		height:auto;
		width:100%;
		border-bottom:1px solid gray;
		position:fixed;
		background-color: rgb(218, 253, 255);
	}
	.empty{
		height:180px;
	}
	.chatHeader>div{
		float:left;
	}
	.chat-main{
		background-color: rgb(255,219,244);
		height:100%;
		position:absolute;
		z-index: -15;
		top:0px;
	}
	.chat-main>div{
		display:block;
	}
	.MASTER{
		float:right;
	}
	.SITTER{
		float:left;
	}
	.chatSender{
		border-top:1px solid gray;
		height:auto;
		position:fixed;
		background-color:white;
		bottom:0px;
		left:0px;
	}
	.chatSender>div{
		margin-left:5px;
		margin-top:5px;
		margin-bottom:10px;
		width:80%;
		height:100px;
		float:left;
	}
	.chat-total>div{
		width:100%;
	}
	.userChat{
		margin-bottom:5px;
		overflow:auto;
	}
	.user-chat{
		height:auto;
	}
	.sitter-name{
		margin-top:10px;
		font-size: 18px;
		font-weight: bolder;
	}
	.sitter-introduce{
		margin-top:20px;
		color: gray;
		font-size:15px;
	}
	.exitButton{
		float:right;
		bottom:15px;
		right:20px;
		position:absolute;
	}
	.chat-content{
		padding:3px;
		padding-left:8px;
		padding-right:8px;
		margin:5px;
		font-size:18px;
		display:inline;
		border-radius:10px;
		background-color:white;
	}
	.sendButton{
		width:19%;
		height:115px;;
		border:none;
		background-color: lightGray;
		float:right;
	}
</style>	
<body>
	<div hidden="true">
		<%@include file="/WEB-INF/views/common/header.jsp" %>
	</div>
<div class="chat-total">
	<div class="chatHeader">
		<div class="sitter-left">
			<div class="sitter-photo">
				<img src='/pjtMungHub/${sitterUser.filePath}${sitterUser.originName}'>			
			</div>
		</div>
		<div class="sitter-right">
			<div class="sitter-name">
				${sitterUser.petSitterName} 시터님<br>
			</div>
			<div class="sitter-introduce">
				${sitterUser.introduce}
			</div>
			<c:if test="${not empty loginUser}">
			<button class="exitButton" onclick="disconnect();">나가기</button>
			</c:if>
		</div>
		<br>
	</div>
	<br>
	<div class="chat-main">
		<div class="empty"></div>
		<div class="chatArea">
			<c:if test="${not empty chatList}">
				<c:forEach items="${chatList}" var="chat">
					<div class="userChat">
						<div class="user-chat">
							<div class="chat-content ${chat.chatWriter}">
								${chat.chatContent}
							</div>
						</div>
					</div>
				</c:forEach>
			</c:if>
		</div>
	</div>
	<br>
	<div class="chatSender">
	<textarea id="summernote" class="chat"></textarea>
	<button class="sendButton" onclick="send();">보내기</button>
	</div>
</div>
	
	<script>
		// 웹소켓 접속 함수
		var socket; // 웹소켓을 담아 놓을 변수
		$(function(){
			// 접속 경로를 담아 socket 생성
			var url = "ws://localhost:8887/pjtMungHub/chat";
			socket = new WebSocket(url);
			// 연결이 되었을 때 동작
			socket.onopen = function(){
				console.log("연결 성공");
			}
			// 연결이 끊겼을 때 동작
			socket.onclose = function(){
				console.log("연결 종료");
			}
			// 에러가 발생했을 때 동작
			socket.onerror = function(e){
				console.log("에러 발생");
				console.log(e);
			}
			// 메시지를 수신했을 때
			socket.onmessage = function(message){
				console.log("메시지를 받았습니다.")
				console.log(JSON.parse(message.data));
				var data = JSON.parse(message.data);
				var div = document.getElementById("chatArea");
				var newDiv = document.createElement("div");
				var sender="user-chat "+data.chatWriter;
				var newSpan= document.createElement("span");
				newSpan.textContent = data.chatContent;
				newDiv.appendChild(newSpan).setAttribute("class",sender);
				div.appendChild(newDiv).setAttribute("class","userChat");
				$(".MASTER").prop("style","display:block; float:right; position:relative;");

				var newMsg=window.opener.getElementsById("chatCont");
				var sitterNo=${sitterUser.petSitterNo};
				newMsg.children().eq(0).each(function(){
					if(this.val()=sitterNo){
						$(this).siblings().eq(2).innerText(data.chatContent);
					}
				})

			}
		})
		function disconnect(){
			alert("채팅방을 나갈 시 진행한 대화가 전부 사라집니다. 정말 나가시겠습니까?");
			socket.close();
			window.close();
		}
		$('#summernote').summernote({
			toolbar:[
				['insert',['picture','link','video']]
			]});
		// 메시지 전송 함수
		function send(){
			// 사용자가 입력한 텍스트를 추출하여 웹소켓에 전달하기
			var message = document.getElementById("chat").value;
			var loginUser=${empty loginUser};
			if(loginUser){
				message+='SITTER';
			}else{
				message+='MASTER';
			}
			socket.send(message);
			document.getElementById("chat").value="";
		}
	</script>
</body>
</html>