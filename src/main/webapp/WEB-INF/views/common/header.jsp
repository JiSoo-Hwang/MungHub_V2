<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<style>
        /* 네비바 */
        div {
            box-sizing: border-box;
        }

        #header {
            width: 80%;
            height: 100px;
            padding-top: 20px;
            margin: auto;
        }

        #header>div {
            width: 100%;
            margin-bottom: 10px;
        }

        #header_1 {
            height: 40%;
        }

        #header_2 {
            height: 60%;
        }

        #header_1>div {
            height: 100%;
            float: left;
        }

        #header_1_left {
            width: 30%;
            position: relative;
        }

        #header_1_center {
            width: 30%;
        }

        #header_1_right {
            width: 30%;
        }

        #header_1_center>img {
            height: 80%;
            position: relative;
            margin: auto;
            top: 0px;
            bottom: 0px;
            right: 0px;
            left: 0px;
        }

        #header_1_right {
            text-align: center;
            line-height: 35px;
            font-size: 70%;
            text-indent: 35px;
        }

        #header_1_right>a {
            margin: 5px;
        }

        #header_1_right>a:hover {
            cursor: pointer;
        }

        #header_2 {
            clear: left;
        }

        #header_2>ul {
            width: 100%;
            height: 100%;
            list-style-type: none;
            margin: auto;
            padding: 0;
        }

        #header_2>ul>li {
            float: left;
            /* border: 1px dotted; */
            width: 15%;
            height: 100%;
            line-height: 55px;
            text-align: center;
        }

        #header_2>ul>li a {
            text-decoration: none;
            color: black;
            font-size: 100%;
            font-weight: 900;
        }

        #header_2>ul>li a:hover {
            color: #153448;
            font-size: 16px;
        }

        #header_2>ul>li>ul {
            list-style-type: none;
            padding: 0px;
        }
/*  지금 서브 메뉴 호버 기능 작업중입니다^^,,,
        #header_2>ul>li:hover {
            display: block;
        }
        #header_2>ul>li>ul:hover {
            display: block;
        }
        #header_2>ul>li a:hover+ul {
            display: block;
            border: dotted 1px black;
        }
 */

        #header_2 {
            border-top: 1px solid lightgray;
            border-bottom: 1px solid lightgray;
        }

        #header a {
            text-decoration: none;
            color: black;
        }

        /* 사이드바 */
        .quick_menu {
            text-align: center;
            float: right;
            margin-right: 50px;
        }

        .quick_menu li {
            list-style-type: none;
            padding: 30px 10px 30px 10px;
        }

        .quick_menu a {
            text-decoration: none;
            color: white;
        }

        .bar_open {
            background-color: #254336;
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
                <a href="">로그인</a>
                <a href="">마이페이지</a>
            </div>
        </div>
        <div id="header_2">
            <ul>
                <li><a href="">kindergarten</a>
                    <!-- 메인메뉴 하위 요소 -->
                    <ul>
                        <li><a href="">메뉴1</a> </li>
                        <li><a href="">메뉴2</a> </li>
                        <li><a href="">메뉴3</a> </li>
                        <li><a href="">메뉴4</a> </li>
                    </ul>
                </li>
                <li><a href="">pet care</a>
                    <!-- 메인메뉴 하위 요소 -->
                    <ul>
                        <li><a href=""></a> </li>
                        <li><a href=""></a> </li>
                        <li><a href=""></a> </li>
                        <li><a href=""></a> </li>
                    </ul>
                </li>
                <li><a href="">wedding</a>
                    <!-- 메인메뉴 하위 요소 -->
                    <ul>
                        <li><a href=""></a> </li>
                        <li><a href=""></a> </li>
                        <li><a href=""></a> </li>
                        <li><a href=""></a> </li>
                    </ul>
                </li>
                <li><a href="">board</a>
                    <!-- 메인메뉴 하위 요소 -->
                    <ul>
                        <li><a href=""></a> </li>
                        <li><a href=""></a> </li>
                        <li><a href=""></a> </li>
                        <li><a href=""></a> </li>
                    </ul>
                </li>
                <li><a href="/pjtMungHub/list.sp">shop</a>
                    <!-- 메인메뉴 하위 요소 -->
                    <ul>
                        <li><a href=""></a> </li>
                        <li><a href=""></a> </li>
                        <li><a href=""></a> </li>
                        <li><a href=""></a> </li>
                    </ul>
                </li>
                <li><a href="">realestate</a>
                    <!-- 메인메뉴 하위 요소 -->
                    <ul>
                        <li><a href=""></a> </li>
                        <li><a href=""></a> </li>
                        <li><a href=""></a> </li>
                        <li><a href=""></a> </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
    <div class="quick_menu">
        <ul>
            <li class="bar_open"><a href="">퀵메뉴</a></li>
            <li class="kako_talk"><a href="">채팅상담</a></li>
            <li class="page_up">
                <a href="">▲</a>
            </li>
            <li class="page_down"><a href="">▼</a></li>
            <li class="consult"><a href="">상담문의</a></li>
            <li class="contact"><a href="">대표전화</a></li>
        </ul>
    </div>
    <br clear="both">
    <script>
        // 화면이 일정 크기로 축소되면 메뉴 구성이 바뀜 (아직 진행중, 편의상 주석처리)
        // $(window).on("resize", function () {
        //     var innerWidth = $(window).innerWidth();
        //     if (innerWidth <= 750) {
        //         $(".quick_menu").css("display", "none");
        //         $("#header").css("display","none");
        //     } else {
        //         $(".quick_menu").css("display", "");
        //         $("#header").css("display","");

        //     }
        
        // });
        
    </script>
    <div class="content">
    </div>
</body>
</html>