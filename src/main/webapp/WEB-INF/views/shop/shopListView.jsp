<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<meta charset="UTF-8">
<title>MUNGHUBSHOP</title>
<style>
@import url("https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css");

.review-star>i{
color: #F2D106;
}
.card{
cursor: pointer;
}

.card-img-top{
position : relative;
 display: block;
 height: 300px; 
 width: 200px;
 filter: brightness(1);
 transition: 0.3s;
}
.card-img-top:hover{
 filter: brightness(0.7);
}


</style>
</head>
<body>

<%@ include file="../common/header.jsp" %>

<div class="container">
<div class="jumbotron">
<h1>애견용품</h1>
</div>
<c:if test="${!empty loginUser }">
<a class="btn btn-outline-dark" href="cart.sp"><i class="bi bi-cart3"></i> 장바구니</a>
<a class="btn btn-primary" href="insert.sp">상품등록</a>
<a href="/pjtMungHub/orderList/${loginUser.userNo }" class="btn btn-secondary">주문 내역 보기</a>
</c:if>
<div class="row row-cols-2 align-items-center">
<c:forEach items="${pList }" var="p">
<div class="col-sm-3 my-3 ">
	<div class="card" onclick="location.href='detail.sp/${p.productNo}'">
	<div>
	<img class="card-img-top img-fluid" src="${p.attachment }">
	</div>
	<div class="card-body" style="width:250px;">
		<h5 class="card-title">${p.productName }</h5>
			<span class="review-star">
			<i class="bi bi-star-fill"></i>
			<i class="bi bi-star-fill"></i>
			<i class="bi bi-star-fill"></i>
			<i class="bi bi-star-half"></i>
			<i class="bi bi-star"></i>
			<span>(<fmt:formatNumber type="number" maxFractionDigits="0" value="${p.reviewCount }" />)</span>
			</span>
		<br> 
		<del><fmt:formatNumber type="number" maxFractionDigits="0" value="${p.price}" /></del>
		<fmt:formatNumber type="number" maxFractionDigits="0" value="${p.price -(p.price/p.discount)}" />

		<strong style="color:rgb(250, 58, 14)">${p.discount }%</strong>
		
	</div> 
	</div>
</div>
</c:forEach>
</div>
</div>


<br> <br>
</body>
</html>