<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
<div class="container mt-5">
    <div class="card">
        <div class="card-header bg-primary text-white">
            <h4>주문 내역</h4>
        </div>
        <div class="card-body">
            <h5 class="card-title">주문 정보</h5>
            <p class="card-text"><strong>주문 번호:</strong> #123456</p>
            <p class="card-text"><strong>배송 진행 상황:</strong> 배송 중</p>
            <p class="card-text"><strong>결제일:</strong> 2024-06-25</p>
            <p class="card-text"><strong>도착 예정일:</strong> 2024-07-01</p>
            <h5 class="mt-4">주문한 상품 목록</h5>
            <ul class="list-group">
                <li class="list-group-item">
                    <strong>제품명:</strong> 위젯 A<br>
                    <strong>수량:</strong> 2<br>
                    <strong>가격:</strong> 20,000원
                </li>
                <li class="list-group-item">
                    <strong>제품명:</strong> 위젯 B<br>
                    <strong>수량:</strong> 1<br>
                    <strong>가격:</strong> 30,000원
                </li>
            </ul>
            <p class="card-text mt-3"><strong>총 가격:</strong> 50,000원</p>
            <a href="#" class="btn btn-primary">계속 쇼핑하기</a>
        </div>
    </div>
</div>
</body>
</html>