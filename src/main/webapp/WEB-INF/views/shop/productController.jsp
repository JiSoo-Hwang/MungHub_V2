<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대시보드</title>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
   <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
        }
        .sidebar {
            height: 100vh;
            background-color: #343a40;
            color: white;
            padding-top: 20px;
            position: fixed;
            width: 220px;
        }
        .sidebar a {
            color: white;
            padding: 15px;
            text-decoration: none;
            display: block;
            font-weight: bold;
        }
        .sidebar a:hover {
            background-color: #495057;
        }
        .main-content {
            margin-left: 240px;
            padding: 20px;
        }
        .card-custom {
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-bottom: 20px;
        }
        .card-header-custom {
            background-color: #5a67d8;
            color: white;
            padding: 10px;
            border-radius: 8px 8px 0 0;
        }
        .chart {
            height: 300px;
        }
        .stat-icon {
            font-size: 1.5rem;
        }
        .stat-icon.positive {
            color: green;
        }
        .stat-icon.negative {
            color: red;
        }
    </style>
</head>
<body>
<%@include file="../common/header.jsp" %>
    <div class="sidebar">
        <h4 class="text-center">물품관리</h4>
        <a href="/pjtMungHub/adminPage/dashBoard">대시보드</a>
        <a href="/pjtMungHub/adminPage/orderControll">주문 관리</a>
        <a href="/pjtMungHub/adminPage/productControll">제품 관리</a>
        <a href="/pjtMungHub/adminPage/customerControll">고객 관리</a>
    </div>

    <div class="main-content">
       <div align="center" class="py-5">
	<h1>주문 관리</h1>
	</div>
    <div class="container">
    
    <div align="center">
    <button class="btn btn-outline-secondary btn-lg mx-3">상품준비중()</button>
    <button class="btn btn-outline-secondary btn-lg mx-3">배송중()</button>
    <button class="btn btn-outline-secondary btn-lg mx-5">배송완료()</button>
    
    <div class="btn-group" role="group" aria-label="Basic outlined example">
    <button class="btn btn-outline-secondary btn-lg">취소요청()</button>
    <button class="btn btn-outline-secondary btn-lg">교환요청()</button>
    <button class="btn btn-outline-secondary btn-lg">환불요청()</button>
    </div>
    </div>
    
    
    <table class="table caption-top py-5">
  <caption id="list">List of users</caption>
  <thead>
    <tr>
   	 <th>선택</th>
       <th scope="col">주문번호</th>
		 <th scope="col">결제및배달진행상황</th>
		 <th scope="col">주문목록</th>
		 <th scope="col">주문수량</th>
		 <th scope="col">총결제액</th>
		 <th scope="col">유저번호</th>
		 <th scope="col">결제일</th>
		 <th scope="col">요구사항</th>
		 <th scope="col">주소</th>
		 <th scope="col">수취인</th>
		 <th scope="col">전화번호 </th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row"><input type="checkbox"></th>
      <td>주문번호</td>
		 <td>결제및배달진행상황</td>
		 <td>주문목록</td>
		 <td>주문수량</td>
		 <td>총결제액</td>
		 <td>유저번호</td>
		 <td>결제일</td>
		  <td>요구사항</td>
		 <td>주소</td>
		 <td>수취인</td>
		 <td>전화번호 </td>
    </tr>
    <tr>
      <th scope="row"><input type="checkbox"></th>
       <td>주문번호</td>
		 <td>결제및배달진행상황</td>
		 <td>주문목록</td>
		 <td>주문수량</td>
		 <td>총결제액</td>
		 <td>유저번호</td>
		 <td>결제일</td>
		  <td>요구사항</td>
		 <td>주소</td>
		 <td>수취인</td>
		 <td>전화번호 </td>
    </tr>
    <tr>
      <th scope="row"><input type="checkbox"></th>
        <td>주문번호</td>
		 <td>결제및배달진행상황</td>
		 <td>주문목록</td>
		 <td>주문수량</td>
		 <td>총결제액</td>
		 <td>유저번호</td>
		 <td>결제일</td>
		  <td>요구사항</td>
		 <td>주소</td>
		 <td>수취인</td>
		 <td>전화번호 </td>
    </tr>
  </tbody>
</table>
    
    </div>
</div>

</body>
</html>