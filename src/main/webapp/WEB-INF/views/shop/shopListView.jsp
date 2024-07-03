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
<c:if test="${not empty loginUser }">



<a class="btn btn-outline-dark position-relative me-2" href="cart.sp"><i class="bi bi-cart3">
</i> 장바구니 
<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger" 
id="cart-count"></span></a>

<script>
$(function(){
	$.ajax({
		url : "cartCount.sp",
		data : {userNo : ${loginUser.userNo}},
		success : function(result){
				
			$("#cart-count").text(result)
		},
		error : function(){
			console.log("통신오류")
		}
	});
});
</script>


<a href="/pjtMungHub/orderList/${loginUser.userNo }" class="btn btn-secondary">주문 내역 보기</a>


<c:if test="${loginUser.userGrade > 0 }">
<div id="adminMenu" align="right">
<a class="btn btn-info" href="/pjtMungHub/">관리자 페이지</a>
<a class="btn btn-primary" href="/pjtMungHub/insert.sp">상품등록</a>
<c:choose>
<c:when test="${empty notPostList}">
<a class="btn btn-warning" href="/pjtMungHub/notPosted.sp">상품게시중단목록</a>
</c:when>
<c:otherwise>
<a class="btn btn-secondary" href="/pjtMungHub/list.sp">상품게시목록</a>
</c:otherwise>
</c:choose>
</div>
</c:if>
</c:if>
<div class="row align-items-center">
<c:forEach items="${pList }" var="p">
<div class="col-lg-3 my-3 ">
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