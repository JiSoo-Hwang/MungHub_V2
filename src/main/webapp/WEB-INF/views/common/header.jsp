<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <!-- BootStrap 및 jQuery cdn 시작 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <!-- BootStrap 및 jQuery cdn 끝 -->
     <!-- alertify css 커스터마이징 시작 -->
    <script src="https://cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/alertify.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/alertify.min.css" rel="stylesheet">


<script>
	alertify.defaults = {
		// dialogs defaults
		autoReset : true,
		basic : false,
		closable : true,
		closableByDimmer : true,
		invokeOnCloseOff : false,
		frameless : true,
		defaultFocusOff : false,
		maintainFocus : true, // <== global default not per instance, applies to all dialogs
		maximizable : true,
		modal : true,
		movable : false,
		moveBounded : false,
		overflow : true,
		padding : true,
		pinnable : true,
		pinned : true,
		preventBodyShift : false, // <== global default not per instance, applies to all dialogs
		resizable : false,
		startMaximized : false,
		transition : 'pulse',
		transitionOff : false,
		tabbable : 'button:not(:disabled):not(.ajs-reset),[href]:not(:disabled):not(.ajs-reset),input:not(:disabled):not(.ajs-reset),select:not(:disabled):not(.ajs-reset),textarea:not(:disabled):not(.ajs-reset),[tabindex]:not([tabindex^="-"]):not(:disabled):not(.ajs-reset)', // <== global default not per instance, applies to all dialogs

		// notifier defaults
		notifier : {
			// auto-dismiss wait time (in seconds)  
			delay : 1,
			// default position
			position : 'bottom-right',
			// adds a close button to notifier messages
			closeButton : true,
			// provides the ability to rename notifier classes
			classes : {
				base : 'alertify-notifier',
				prefix : 'ajs-',
				message : 'ajs-message',
				top : 'ajs-top',
				right : 'ajs-right',
				bottom : 'ajs-bottom',
				left : 'ajs-left',
				center : 'ajs-center',
				visible : 'ajs-visible',
				hidden : 'ajs-hidden',
				close : 'ajs-close'
			}
		},

		// language resources 
		glossary : {
			// dialogs default title
			title : '성공',
			// ok button text
			ok : '확인',
			// cancel button text
			cancel : '취소'
		},

		// theme settings
		theme : {
			// class name attached to prompt dialog input textbox.
			input : 'ajs-input',
			// class name attached to ok button
			ok : 'ajs-ok',
			// class name attached to cancel button 
			cancel : 'ajs-cancel'
		},
		// global hooks
		hooks : {
			// invoked before initializing any dialog
			preinit : function(instance) {
			},
			// invoked after initializing any dialog
			postinit : function(instance) {
			},
		},
	};
</script>
<!-- alertify css 커스터마이징 끝 -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
    @import
	url("https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css");
        #header {
            padding: 10px;
            position: sticky;
        }

        /* 메인 메뉴바 */
        #header_1>ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            overflow: hidden;
            background-color: #F4D3D3;
            /* position: sticky; */
        }

        #header_1 li {
            float: left;
        }

        #header_1 li a {
            display: block;
            color: #492F10;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }

        #header_1 li a:hover {
            background-color: #E8A9A9;
        }

        .active {
            background-color: #090580;
        }

        /* 메인 메뉴바 끝 */
        /* 서브 메뉴바 */
        #header_2 {
            display: none;
        }

        #header_2>ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            overflow: hidden;
            background-color: #FFEAE3;
            /* position: sticky; */
        }

        #header_2 li {
            float: left;
        }

        #header_2 li a {
            display: block;
            color: #492F10;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }

        #header_2 li a:hover {
            border-bottom: #492F10 2px solid;
        }

#header_2:after {
clear: both;
}
</style>
<style>
	.chatTotal{
		z-index: auto;
		position:fixed;
		bottom:10px;
		right:10px;
	}
	.chatList{
		display:none;
	}
</style>
</head>
<body>
<c:if test="${!empty loginUser }">
<span style="float: right; margin: 10px; ">${loginUser.userId} 님 환영합니다&ensp;|&ensp;<a href="myPage.me" style="text-decoration: none; color: black;">마이페이지</a></span>
</c:if>
<br clear="all">
    <nav id="header">
        <nav id="header_1">
            <ul>
                <li class="menu"><a href="map.do">Kindergarten</a></li>
                <li class="menu"><a href="#news">Petcare</a></li>
                <li class="menu"><a href="wedList.wd">Wedding</a></li>
                <li class="menu"><a href="/pjtMungHub/list.bo">Board</a></li>
                <li class="menu"><a href="/pjtMungHub/list.sp">Shop</a></li>
				<li style="float: right">
					<c:choose>
						<c:when test="${empty loginUser}">
							<a class="active" href="/pjtMungHub/enter.me"
							style="color: white;">Login</a>
						</c:when>
						<c:otherwise>
							<a class="active" href="/pjtMungHub/logout.me"
							style="color: white;">Logout</a>
						</c:otherwise>
					</c:choose>
				</li>
            </ul>
        </nav>
        <nav id="header_2">
            <ul>
				<!-- <li><a href="map.do">지도보기</a></li> -->
				<c:choose>
                <c:when test="${loginUser.userGrade == 2 }">
				<li><a href="regList2.do?userNo=${loginUser.userNo}">상담예약내역</a></li>
                </c:when>
                <c:otherwise>
				<li><a href="regList.do?userNo=${loginUser.userNo}">상담예약내역</a></li>
                </c:otherwise>
                </c:choose>
                <li><a href="sitter.re">단기돌봄예약</a> </li>
                <li><a href="hospital.ho">동물병원정보</a> </li>
                <!-- <li><a href="wedList.wd">웨딩플래너</a> </li> -->
                <li><a href="houseList.re">장기돌봄예약</a> </li>
            </ul>
        </nav>
    </nav>
    <script>
        $(function () {
            $(".menu").hover(function () {
                $("#header_2").show();
            });
            $("#header_2").mouseleave(function () {
            	$("#header_2").hide();
			});
        });
    </script>
    
    <!-- 알림창 -->
    <c:if test="${not empty alertMsg}">
	    <script>
	        alertify.alert("${alertMsg}");
	    </script>
    	<c:remove var="alertMsg"/>
	</c:if>
	<c:if test="${not empty loginUser}">
	    <div class="chatTotal">
			<div class="chatArea">
				<button type="button">채팅</button>
			</div>
			<div class="chatList">
				<div class="chatTitle">
					<span>채팅 목록</span>
				</div>
				<div class="chatCont">
					<input type="hidden" value="2">
					<span style="font-weight:bold;">userId</span><br>
					<span>마지막 채팅 내용</span>
				</div>
			</div>
		</div>
	</c:if>
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
			console.log(JSON.parse(message.data))
			var data = JSON.parse(message.data);
			var div = document.getElementById("chatArea");
			var newDiv = document.createElement("div");
			newDiv.textContent = "["+data.id+"]"+data.message;
			div.appendChild(newDiv);
			var newMsg=window.opener.document.getElementsById("chatCont");
//				newMsg.each(function(){
//					if(${code})
//				})
		}
	})
	
		$(".chatArea").on("click",function(){
			if($(".chatList").css("display")=="none"){
				$(".chatList").slideDown(250);
			}else{
				$(".chatList").slideUp();
			}
		})
		$(".chatCont").on("click",function(){
			var userNo= $(this).children().eq(0).val();
			var code='';
			if("${loginUser.userNo}" > userNo){
				code=userNo+'n'+"${loginUser.userNo}";
			}else{
				code="${loginUser.userNo}"+'n'+userNo;
			}
			var chatRoom=window.open('http://localhost:8887/pjtMungHub/chat/'+code,'chatpop','titlebar=1,location=no,status=no, resizable=1, scrollbars=yes, width=600, height=550');
		})
	</script>
</body>
</html>