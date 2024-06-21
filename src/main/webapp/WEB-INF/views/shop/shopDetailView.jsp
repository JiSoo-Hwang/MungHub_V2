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
.review-star{
display:block;
width:130px;
}

.review-star>i{
color: #F2D106;
}
.detail{
width:150px;
}
.detail>i{
  font-size: 22px;
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
.dl-table-group .dl-row > dt {
    display: table-cell;
    vertical-align: top;
    width: 100px;
    padding: 12px 0;
    color: #666;
}
.dl-table-group .dl-row > dd {
    display: table-cell;
    position: relative;
    vertical-align: top;
    padding: 12px 0;
    color: #333;
}

.review-img-top4{
float: left;
width:100px;
}
.btn-review-all{
float: right;
text-decoration: none;
color: gray;
}
.btn-review-all:hover{
text-decoration: none;
color: gray;
}
tbody{
border:1px solid lightgray;
}
.detail-tag p{padding:10px; margin-right: 10px; color: gray}
.detail-content p{padding:10px; margin-right: 10px}

#review-write{
    float: right;
    border: 0;
}
.progress{
width: 80%;
float: right;
}
.score{
width: 20%;
display: block;
float: left;
}

.qna{
top: 0px;
float: right;
position: relative;
}
.qna a{
font-size:14px;
}

h2{
width:50%;
}

.first{

text-align: center;
}
.first p{
color: orange;
}

.second{

text-align: center;
}
.second p{
color: gray;
}
.question-list>td a{
text-decoration:none;
color: gray;
}

</style>
</head>
<body>

<%@ include file="../common/header.jsp" %>


<section class="py-5">
	<div class="container px-4 px-lg-5 my-5">
	<div class="row gx-4 gx-lg-5 align-items-center">
	<div class="col-md-6">
		<img class="card-img-top mb-5 mb-md-0" src="${p.attachment }">
	</div>
	<div class="col-md-6">
	<h1 class="display-5 fw-bolder">${p.productName} </h1>
	<div class="fs-5 mb-3 mb-5"><h3><del style="color:gray"><fmt:formatNumber type="number" maxFractionDigits="0" value="${p.price}" />원</del></h3>
	<h2><fmt:formatNumber type="number" maxFractionDigits="0" value="${p.price -(p.price/p.discount)}" />원 
	<strong style="color:rgb(250, 58, 14)">${p.discount }%</strong></h2>
	
	<!-- 별점 -->
	<span class="review-star">
<i class="bi bi-star-fill"></i>
<i class="bi bi-star-fill"></i>
<i class="bi bi-star-fill"></i>
<i class="bi bi-star-fill"></i>
<i class="bi bi-star-fill"></i></span>
<span>(<fmt:formatNumber type="number" maxFractionDigits="0" value="${p.reviewCount }" />)</span>
	<div>
	
	</div>
	</div>
	<div class="d-flex justify-content-end">
	<input class="form-control text-center me-3" id="inputQuantity" type="number" min="1" value="1" style="max-width: 3rem">
	&nbsp;&nbsp;
	<button class="btn btn-outline-dark flex-shrink-0" type="button">
	<i class="bi bi-bag-plus-fill"></i>&nbsp; 장바구니 추가
	</button>
	&nbsp;
	<button class="btn btn-outline-dark flex-shrink-0" type="button">
	<i class="bi bi-heart"></i>
	</button>
	</div>
	<div class="dl-table-group">
	<dl class="dl-row">
	<dt>판매량</dt>
	<dd><strong><fmt:formatNumber type="number" maxFractionDigits="0" value="${p.salesConunt}" /></strong></dd>
	</dl>
	<dl class="dl-row">
	<dt>배송안내</dt>
	<dd>
	<div class="div-way-box-v2">
	<h4>무료배송</h4>
	<p>30,000원이상 구매 시 무료 배송(기본배송료 2,500원)</p>
	<h4>추가비용 지역</h4>
	<p>제주도 추가 배송비 1,500원</p>
	</div>
	</dd>
	</dl>
	<dl class="dl-row">
	<dt>적립혜택</dt>
	<dd><strong><fmt:formatNumber type="number" maxFractionDigits="0" value="${(p.price -(p.price/p.discount))/100}" />P</strong> 적립</dd>
	</dl>
	</div>
	</div>
	</div>
	</div>
</section>
<hr>
<section class="py-5">
	
	<div class="container">
	<h4>베스트 리뷰 (${p.reviewCount })</h4>
	<a href class="btn-review-all"><span>전체리뷰보기</span><i class="bi bi-caret-right-fill"></i> </a>
	<br>
	<div class="row row-cols-2 align-items-center mt-3 ml-3 mr-3">
	<c:forEach var="index" begin="1" end="4">
		<div class="col-sm-3">
			<img src="${p.attachment }" class="review-img-top4">
			<div class="review-content">
			<small class="text-muted">작성자</small> <br>	
			<span class="review-star">
			<i class="bi bi-star-fill"></i>
			<i class="bi bi-star-fill"></i>
			<i class="bi bi-star-fill"></i>
			<i class="bi bi-star-half"></i>
			<i class="bi bi-star"></i>
			</span><br>
			<small class="text-muted">2024-06-20</small>
			</div>
			<p>
			맛있어서 또 시켜먹었네요 ^^
			</p>
			</div>
	</c:forEach>
			</div>
		</div>
</section>
<section class="py-5">
<div class="container">
<h4>추천상품</h4>

	<div class="row row-cols-2 align-items-center mt-3 ml-3 mr-3">
	
	<c:forEach var="plist" items="${pList }" begin="1" end="4">
	<div class="col-sm-5 my-3 ">
	<div class="card" onclick="location.href='/pjtMungHub/detail.sp/${plist.productNo}'">
	<div>
	<img class="card-img-top" src="${plist.attachment }">
	</div>
	<div class="card-body" style="width:250px;">
		<h5 class="card-title">${plist.productName }</h5>
			<span class="review-star">
			<i class="bi bi-star-fill"></i>
			<i class="bi bi-star-fill"></i>
			<i class="bi bi-star-fill"></i>
			<i class="bi bi-star-half"></i>
			<i class="bi bi-star"></i>
			<span>(<fmt:formatNumber type="number" maxFractionDigits="0" value="${plist.reviewCount }" />)</span>
			</span>
		<br> 
		<del><fmt:formatNumber type="number" maxFractionDigits="0" value="${plist.price}" /></del>
		<fmt:formatNumber type="number" maxFractionDigits="0" value="${plist.price -(plist.price/plist.discount)}" />

		<strong style="color:rgb(250, 58, 14)">${plist.discount }%</strong>
		
	</div> 
	</div>
</div>
	</c:forEach>
	</div>
</div>
</section>

<section class="py-5">
 <div class="container">

<ul class="nav nav-tabs nav-fill">
  <li class="nav-item">
    <a class="nav-link active" aria-current="page" href="#detail-section01">상품상세정보</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#detail-section02">상품리뷰</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#detail-section03">상품문의</a>
  </li>
</ul>
</div> 
</section>

<section class="py-5">
<div class="container" id="detail-section01">
<h4>상품 설명</h4>

<table class="mt-5" align="center">

<tbody>
	<tr>
		<td class="detail-tag">
			<p>품명 및 모델명</p>
		</td>
		<td class="detail-content">
			<p >${p.productName }</p>
		</td>
	</tr>
	<tr>
		<td class="detail-tag">
			<p>인증사항</p>
		</td>
		<td class="detail-content">
			<p>해당없음</p>
		</td>
	</tr>
	<tr>
		<td class="detail-tag">
			<p>제조국 또는 원산지</p>
		</td>
		<td class="detail-content">
			<p>조선인민민주주의공화국</p>
		</td>
	</tr>
		<tr>
		<td class="detail-tag">
			<p>제조자/수입자</p>
		</td>
		<td class="detail-content">
			<p>멍허브</p>
		</td>
	</tr>
	<tr>
		<td class="detail-tag">
			<p>소비자 상담관련 전화번호</p>
		</td>
		<td class="detail-content">
			<p>010-6689-5059</p>
		</td>
	</tr>
	<tr>
		<td class="detail-tag">
			<p>유통기한</p>
		</td>
		<td class="detail-content">
			<p>별도표기</p>
		</td>
	</tr>
	<tr>
		<td class="detail-tag">
			<p>권장연령</p>
		</td>
		<td class="detail-content">
			<p>어덜트</p>
		</td>
	</tr>
	<tr>
		<td class="detail-tag">
			<p>중량</p>
		</td>
		<td class="detail-content">
			<p>9.95kg</p>
		</td>
	</tr>
	<tr>
		<td class="detail-tag">
			<p>원료구성</p>
		</td>
		<td class="detail-content">
			<p>대충 닭이랑 생선이랑 기타 영양성분</p>
		</td>
	</tr>
	<tr>
		<td class="detail-tag">
			<p>성분구성</p>
		</td>
		<td class="detail-content">
			<p>조단백 100% 조지방 100% 칼슘 1%</p>
		</td>
	</tr>
</tbody>

</table>

</div>
</section>

<section class="py-5">
 <div class="container">

<ul class="nav nav-tabs nav-fill">
  <li class="nav-item">
    <a class="nav-link" href="#detail-section01">상품상세정보</a>
  </li>
  <li class="nav-item">
    <a class="nav-link active" aria-current="page" href="#detail-section02">상품리뷰</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#detail-section03">상품문의</a>
  </li>
</ul>
</div> 
</section>

<div class="container" id="detail-section02">
<h2>구매후기</h2>
<button type="button" id="review-write">후기쓰기</button>
  
  <div class="py-5" align="center">
	 <div class="row row-cols-2 align-items-center mt-3 ml-3 mr-3">
	<div class="col-sm-5">
		<h2><fmt:formatNumber type="number" maxFractionDigits="1" value="${p.reviewTScore}" /></h2>
			<span class="review-star detail">
			<i class="bi bi-star-fill"></i>
			<i class="bi bi-star-fill"></i>
			<i class="bi bi-star-fill"></i>
			<i class="bi bi-star-half"></i>
			<i class="bi bi-star"></i>
			</span> <br>
			<span>총 <fmt:formatNumber type="number" maxFractionDigits="0" value="${p.reviewCount }" />건</span><br>
			<span style="color:gray">만족도 95%</span>
	</div>
	<div class="col-sm-5">
<div class="score">5점</div><div class="progress my-1">
  <div class="progress-bar bg-warning" role="progressbar" style="width: 95%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
</div>
<br>
<div class="score">4점</div><div class="progress my-1">
  <div class="progress-bar bg-warning" role="progressbar" style="width: 2%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
</div>
<br>
<div class="score">3점</div><div class="progress my-1">
  <div class="progress-bar bg-warning" role="progressbar" style="width: 1%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
</div>
<br>
<div class="score">2점</div><div class="progress my-1">
  <div class="progress-bar bg-warning" role="progressbar" style="width: 1%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
</div>
<br>
<div class="score">1점</div><div class="progress my-1">
  <div class="progress-bar bg-warning" role="progressbar" style="width: 1%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
</div>
	</div>
</div>
  </div>
  <h4>전체후기 <span><fmt:formatNumber type="number" maxFractionDigits="0" value="${p.reviewCount }" />건</span></h4>

  <hr>
</div>

<section class="py-5">
 <div class="container" id="detail-section03">

<ul class="nav nav-tabs nav-fill">
  <li class="nav-item">
    <a class="nav-link" href="#detail-section01">상품상세정보</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#detail-section02">상품리뷰</a>
  </li>
  <li class="nav-item">
    <a class="nav-link active" aria-current="page" href="#detail-section03">상품문의</a>
  </li>
</ul>
</div> 


</section>

<div class="container" id="detail-section03">
	<h2>상품문의 <span style="color:gray; font-size: 16px;">(4,666개)</span></h2>
	
	<hr>
	<div class="d-grid gap-2 d-md-block qna">
	<a href="" class="btn btn-outline-secondary flex-shrink-0">1:1 문의하기</a>
	<a href="" class="btn btn-outline-dark flex-shrink-0">상품 문의하기</a>
	</div>
	
	<table class="table table-borderless">
		<tr class="question-list">
			<td class="first"><p>답변완료</p></td>
			<td><a href="#">[상품문의]입니다. <i class="bi bi-lock-fill"></i></a></td>
			<td>작성자</td>
			<td>2024.06.20</td>
		</tr>
		<tr class="question-list">
			<td class="second"><p>답변대기</p></td>
			<td><a href="#">[배송문의]입니다. <i class="bi bi-unlock"></i></a></td>
			<td>작성자</td>
			<td>2024.06.20</td>
		</tr>
	</table>
</div>

<br> <br>
</body>
</html>