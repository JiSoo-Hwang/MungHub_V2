<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<!-- BootStrap 및 jQuery cdn 시작 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<!-- Popper JS -->
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
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
        .kako_talk {
            background-color: #6B8A7A;
        }

        .page_up {
            background-color: #B7B597;
        }

        .page_down {
            background-color: #B7B597;
        }

        .consult {
            background-color: #3C5B6F;
        }

        .contact {
            background-color: #153448;
        }
</style>
<title>Insert title here</title>
</head>
<body>
    <div id="header">
        <div id="header_1">
            <div id="header_1_left">
            </div>
            <div id="header_1_center">
            </div>
            <div id="header_1_right">
	            <c:choose>
		            <c:when test="${!empty loginUser}">
						<label>${loginUser.userId }님 환영합니다</label> &nbsp;&nbsp; 
	                	<a href="logout.me">로그아웃</a>
	                	<a href="mypage.me">마이페이지</a> <a href="">쪽지함</a>
		            </c:when>
		            <c:otherwise>
		                <a href="enter.me">로그인</a>
	                </c:otherwise>
	            </c:choose>
            </div>
        </div>
    </div>
    <nav id="header">
        <nav id="header_1">
            <ul>
                <li><a href="#home">Kindergarten</a></li>
                <li><a href="#news">Petcare</a></li>
                <li><a href="#contact">Wedding</a></li>
                <li><a href="#contact">Board</a></li>
                <li><a href="/pjtMungHub/list.sp">Shop</a></li>
                <li><a href="#contact">Realestate</a></li>
                <li style="float:right"><a class="active" href="#about" style="color: white;">Login</a></li>
            </ul>
        </nav>
        <nav id="header_2">
            <ul>
                <li><a href="">지도보기</a> </li>
                <li><a href="sitter.re">단기돌봄예약</a> </li>
                <li><a href="">하위 메뉴1</a> </li>
                <li><a href="">하위 메뉴1</a> </li>
                <li><a href="">하위 메뉴1</a> </li>
            </ul>
        </nav>
    </nav>
    <script>
        $(function () {
            $("#header_1").hover(function () {
                $("#header_2").show();
            });
        });
    </script>
</body>
</html>