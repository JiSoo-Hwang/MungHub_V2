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
</head>
<body>
    <nav id="header">
        <nav id="header_1">
            <ul>
                <li class="menu"><a href="#home">Kindergarten</a></li>
                <li class="menu"><a href="#news">Petcare</a></li>
                <li class="menu"><a href="#contact">Wedding</a></li>
                <li class="menu"><a href="#contact">Board</a></li>
                <li class="menu"><a href="/pjtMungHub/list.sp">Shop</a></li>
                <li class="menu"><a href="#contact">Realestate</a></li>
				<li style="float: right">
					<c:choose>
						<c:when test="${empty loginUser}">
							<a class="active" href="enter.me"
							style="color: white;">Login</a>
						</c:when>
						<c:otherwise>
						<span>${loginUser.userId} 님 환영합니다.</span>
							<a class="active" href="logout.me"
							style="color: white;">Logout</a>
						</c:otherwise>
					</c:choose>
				</li>
            </ul>
        </nav>
        <nav id="header_2">
            <ul>
				<li><a href="map.do">지도보기</a></li>
                <li><a href="sitter.re">단기돌봄예약</a> </li>
                <li><a href="">하위 메뉴1</a> </li>
                <li><a href="">하위 메뉴1</a> </li>
                <li><a href="">하위 메뉴1</a> </li>
            </ul>
            <ul>
                <!-- 향후 로그인 아이디에 따라 해당 a 태그 다르게 보이게 설정할 예정 -->
                <c:choose>
                <c:when test="${loginUser.userGrade == 2 }">
				<li><a href="regList2.do?userNo=${loginUser.userNo}">예약내역보기(원장님)</a></li>
                </c:when>
                <c:otherwise>
				<li><a href="regList.do?userNo=${loginUser.userNo}">예약내역보기(견주)</a></li>
                </c:otherwise>
                </c:choose>
                <!-- 향후 로그인 아이디에 따라 해당 a 태그 다르게 보이게 설정할 예정 -->
                <li><a href="">하위 메뉴2</a> </li>
                <li><a href="">하위 메뉴2</a> </li>
                <li><a href="">하위 메뉴2</a> </li>
                <li><a href="">하위 메뉴2</a> </li>
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
    
</body>
</html>