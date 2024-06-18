<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.review-star>svg{
fill: #F2D106;
}
.dl-table-group{
width:100%;
display: table;
table-layout: fixed;
border-top : 1px solid #EDEDED;
margin-top : 20px;
padding-top : 8px;
}
.dl-row{
display: table-row;
}


</style>
</head>
<body>

<%@ include file="../common/header.jsp" %>


<section class="py-5">
	<div class="container px-4 px-lg-5 my-5">
	<div class="row gx-4 gx-lg-5 align-items-center">
	<div class="col-md-6">
		<img class="card-img-top mb-5 mb-md-0" src="/pjtMungHub/resources/shopFile/16-ageing-12-b1-ne.jpg">
	</div>
	<div class="col-md-6">
	<h1 class="display-5 fw-bolder">${p.productName} </h1>
	<div class="fs-5 mb-3 mb-5"><h3><del style="color:gray"><fmt:formatNumber type="number" maxFractionDigits="0" value="${p.price}" />원</del></h3>
	<h2><fmt:formatNumber type="number" maxFractionDigits="0" value="${p.price -(p.price/p.discount)}" />원 
	<strong style="color:rgb(250, 58, 14)">${p.discount }%</strong></h2>
	
	<!-- 별점 -->
	<span class="review-star">
	
<span>(${p.reviewCount })</span>
	<div>
	
	</div>
	</div>
	<div class="d-flex justify-content-end">
	<input class="form-control text-center me-3" id="inputQuantity" type="number" min="1" value="1" style="max-width: 3rem">
	&nbsp;&nbsp;
	<button class="btn btn-outline-dark flex-shrink-0" type="button">
<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bag-plus-fill" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M10.5 3.5a2.5 2.5 0 0 0-5 0V4h5zm1 0V4H15v10a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V4h3.5v-.5a3.5 3.5 0 1 1 7 0M8.5 8a.5.5 0 0 0-1 0v1.5H6a.5.5 0 0 0 0 1h1.5V12a.5.5 0 0 0 1 0v-1.5H10a.5.5 0 0 0 0-1H8.5z"/>
</svg>&nbsp; 장바구니 추가
	</button>
	&nbsp;
	<button class="btn btn-outline-dark flex-shrink-0" type="button">
<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
  <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15"/>
</svg>
	</button>
	</div>
	<div class="dl-table-group">
	<dl class="dl-row">
	<dt>판매량</dt>
	<dd><strong>${p.salesConunt}</strong></dd>
	</dl>
	</div>
	</div>
	</div>
	</div>
</section>


<br> <br>
</body>
</html>