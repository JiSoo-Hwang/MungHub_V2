<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@ include file="../common/header.jsp" %>

<div class="container-fluid">
        <div class="row">
            <!-- 사이드바 -->
            <nav id="sidebar" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
                <div class="position-sticky">
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#">
                                대시보드
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                주문 관리
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                상품 관리
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                고객 관리
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                보고서
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                통합 관리
                            </a>
                        </li>
                    </ul>
                </div>
            </nav>

            <!-- 메인 콘텐츠 -->
            <main class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <h1 class="h2">대시보드</h1>
                </div>

                <!-- 사이트 정보 수정 양식 -->
                <h2>사이트 정보</h2>
                <form>
                    <div class="form-group">
                        <label for="siteName">사이트 이름</label>
                        <input type="text" class="form-control" id="siteName" placeholder="사이트 이름을 입력하세요">
                    </div>
                    <div class="form-group">
                        <label for="siteDescription">사이트 설명</label>
                        <textarea class="form-control" id="siteDescription" rows="3" placeholder="사이트 설명을 입력하세요"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="siteEmail">연락 이메일</label>
                        <input type="email" class="form-control" id="siteEmail" placeholder="연락 이메일을 입력하세요">
                    </div>
                    <div class="form-group">
                        <label for="sitePhone">연락 전화번호</label>
                        <input type="tel" class="form-control" id="sitePhone" placeholder="연락 전화번호를 입력하세요">
                    </div>
                    <button type="submit" class="btn btn-primary">변경 사항 저장</button>
                </form>
            </main>
        </div>
    </div>



</body>
</html>