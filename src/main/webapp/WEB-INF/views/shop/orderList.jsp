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
    <h2>주문 내역</h2>
    <table class="table table-striped">
        <thead>
            <tr>
                <th scope="col">주문 번호</th>
                <th scope="col">결제일</th>
                <th scope="col">배송 진행 상황</th>
                <th scope="col">총 가격</th>
                <th scope="col">상세 보기</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <th scope="row">#123456</th>
                <td>2024-06-25</td>
                <td>배송 중</td>
                <td>50,000원</td>
                <td><a href="#" class="btn btn-info btn-sm">상세 보기</a></td>
            </tr>
            <tr>
                <th scope="row">#123457</th>
                <td>2024-05-15</td>
                <td>배송 완료</td>
                <td>30,000원</td>
                <td><a href="#" class="btn btn-info btn-sm">상세 보기</a></td>
            </tr>
            <tr>
                <th scope="row">#123458</th>
                <td>2024-04-10</td>
                <td>취소됨</td>
                <td>20,000원</td>
                <td><a href="#" class="btn btn-info btn-sm">상세 보기</a></td>
            </tr>
            <!-- 추가 주문 내역을 여기에 추가 -->
        </tbody>
    </table>
    <a href="#" class="btn btn-primary">계속 쇼핑하기</a>
</div>
</body>
</html>