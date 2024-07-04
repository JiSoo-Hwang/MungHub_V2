<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<meta charset="UTF-8">
<title>MUNGHUBSHOP</title>
<style>



#best {
	cursor:pointer;
}

.dl-table-group {
	width: 100%;
	display: table;
	table-layout: fixed;
	border-top: 1px solid #EDEDED;
	margin-top: 20px;
	padding-top: 8px;
}

.dl-row {
	display: table-row;
}

.dl-table-group .dl-row>dt {
	display: table-cell;
	vertical-align: top;
	width: 100px;
	padding: 12px 0;
	color: #666;
}

.dl-table-group .dl-row>dd {
	display: table-cell;
	position: relative;
	vertical-align: top;
	padding: 12px 0;
	color: #333;
}

.review-img-top4 {
	float: left;
	width: 100px;
}

.btn-review-all {
	float: right;
	text-decoration: none;
	color: gray;
}

.btn-review-all:hover {
	text-decoration: none;
	color: gray;
}

tbody {
	border: 1px solid lightgray;
}

.detail-tag p {
	padding: 10px;
	margin-right: 10px;
	color: gray
}

.detail-content p {
	padding: 10px;
	margin-right: 10px
}

.progress {
	width: 80%;
	float: right;
}

.score {
	width: 20%;
	display: block;
	float: left;
}

.qna {
	top: 0px;
	float: right;
	position: relative;
}

.qna a {
	font-size: 14px;
}

h2 {
	width: 50%;
}

.first {
	text-align: center;
}

.first p {
	color: orange;
}

.second {
	text-align: center;
}

.second p {
	color: gray;
}

.question-list>td a {
	text-decoration: none;
	color: gray;
}
#favor{
 transition : transform 0.3s ease-in-out;
}
#favor:hover{
	transform: scale(1.2);
}

.star-rating {
      display: flex;
    }

    .star {
      appearance: none;
      padding: 1px;
    }

    .star::after {
      content: '☆';
      color: #F2D106;
      font-size: 30px;
    }

    .star:hover::after,
    .star:has(~ .star:hover)::after,
    .star:checked::after,
    .star:has(~ .star:checked)::after {
      content: '★';
    }

    .star:hover ~ .star::after {
      content: '☆';
    }
    
      
    .media-container {
         display: flex;
         overflow-x: auto;
     }
     .media-container img,
     .media-container .embed-responsive {
         flex: 0 0 auto;
         margin-right: 10px;
     }
    
.review-star {width:100px; }
.review-star,.review-star span {display:inline-block; height:24px; overflow:hidden; background:url(/pjtMungHub/resources/uploadFiles/shopFile/productFile/common/star.png)no-repeat; }
.review-star span{background-position:left bottom; line-height:0; vertical-align:top; }

.btn-div button{
margin-right: 10px;
}

</style>
</head>
<body>

	<%@ include file="../common/header.jsp"%>
	
	<section class="py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="row gx-4 gx-lg-5 align-items-center">
				<div class="col-md-6">
					
					<div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
  <div class="carousel-indicators">
  <c:forEach items="${atList }" var="at" varStatus="status">
    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="${status.index }" <c:if test="${status.index eq 0 }">class="active" aria-current="true"</c:if> aria-label="Slide ${status.count }"></button>
  </c:forEach>
  </div>
					  <div class="carousel-inner" style="height:800px;">
  <c:forEach items="${atList }" var="at" varStatus="status">
					    <div class="carousel-item <c:if test="${status.index eq 0 }">active</c:if>"  data-bs-interval="10000">
					    	<input type="hidden" value="${status.index }">
					      <img src="${at.filePath }${at.changeName}" class="d-block w-100" style="height: 100%; width:100%">
					    </div>
				</c:forEach>
					  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
				<c:if test="${loginUser.userGrade >0 }">
				<button type="button" class="btn btn-outline-danger" id="deleteSlide"><i class="bi bi-trash3"></i>현재 슬라이드 삭제</button>
				
				<script>
				$(function(){
					$("#deleteSlide").click(function(){
						var currentSlide = $(".active").children("input:hidden").val();
						if(currentSlide!=0){
							
						
 						$.ajax({
							url : "/pjtMungHub/deleteAttachment.sp",
 							type : "post",
							data : {productNo : ${p.productNo},
 									fileLev : currentSlide},
 							success: function(result){
 								alert("삭제가 완료되었습니다.");
 								location.href="/pjtMungHub/detail.sp/"+${p.productNo};
 							},
 							error: function(){
 								console.log("통신오류");
 							}
 						});
						}else{
							alert("첫번째 슬라이드는 지울 수 없습니다.");
						}
					});
				});
				
				</script>
				
				</c:if>
				
				
				
				</div>
				<div class="col-md-6">
					<h1 class="display-5 fw-bolder">${p.productName}</h1>
					<div class="fs-5 mb-3 mb-5">
						<h3>
							<del style="color: gray">
								<fmt:formatNumber type="number" maxFractionDigits="0"
									value="${p.price}" />
								원
							</del>
						</h3>
						<h2>
							<fmt:formatNumber type="number" maxFractionDigits="0"
								value="${p.price -(p.price/p.discount)}" />
							원 <strong style="color: rgb(250, 58, 14)">${p.discount }%</strong>
						</h2>

						<!-- 별점 -->
				<div class="wrap-star">
			    <div class='review-star'>
			        <span style ="width: <fmt:formatNumber type="number" maxFractionDigits="0" value="${p.reviewTScore * 20}" />%"></span>
			    </div>
				</div>
				 <span>(<fmt:formatNumber
								type="number" maxFractionDigits="0" value="${p.reviewCount }" />)
						</span>
						<div></div>
					</div>
					<div class="d-flex justify-content-end">
						<input class="form-control text-center me-3" id="inputQuantity"
							type="number" min="1" value="1" style="max-width: 3rem">
						&nbsp;&nbsp;
						<button class="btn btn-outline-dark flex-shrink-0" id="addCart" type="button">
							<i class="bi bi-bag-plus-fill"></i>&nbsp; 장바구니 추가
						</button>
						&nbsp;
						<button class="btn btn-outline-dark flex-shrink-0" type="button" id="favor">
							<i class="bi bi-heart"></i>
						</button>
					</div>
	<c:choose>
	<c:when test="${not empty loginUser }">

	<div class="toast-container position-fixed p-5 bottom-0 end-0">
	  <div id="liveToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true" data-bs-autohide="false">
	    <div class="toast-header">
	    <i class="bi bi-cart-plus-fill" style="color:blue"></i>&nbsp;
	      <strong class="me-auto"> 장바구니 담기 성공</strong>
	      <small>11 mins ago</small>
	      <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
	    </div>
	    <div class="toast-body">
	     	장바구니로 이동하시겠습니까?
	     	 <div class="mt-2 pt-2 border-top">
      <button type="button" class="btn btn-primary btn-sm" onclick="location.href='/pjtMungHub/cart.sp'">바로가기</button>
      <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="toast">닫기</button>
    </div>
	    </div>
	  </div>
	</div>
	
	<script>
	
	
	function selectFavor(){
		
		$.ajax({
			url : "/pjtMungHub/selectFavorite.sp",
			data : { userNo:${loginUser.userNo},
					 productNo : ${p.productNo}},
			success : function (result){
				console.log(result);
				if(result){
				$("#favor").html("<i class='bi bi-heart-fill' style='color:red'></i>");
				
				}else{
					$("#favor").html("<i class='bi bi-heart'></i>");
					
				}
			},
			error:function(){
				console.log("통신오류");
			}
			
		});
		}
	
	$(function(){
			
		selectFavor();
		
	 $("#favor").click(function(){
		 
			 $.ajax({
				 url : "/pjtMungHub/subscribe.sp",
				 type : "post",
				 data : { userNo:${loginUser.userNo},
					 	  productNo : ${p.productNo}},
				success : function(result){
					selectFavor();
					console.log("통신성공 subscribe");
				},
				error : function(){
					console.log("통신오류");
				}
			 });
		
		 
		 
	 });
		
		$("#addCart").click(function(){
			
			
			
			var productNo =  "${p.productNo}";
			var amount = $("#inputQuantity").val();
			var userNo = "${loginUser.userNo}";
			
	$.ajax({
		url : "/pjtMungHub/addCart.sp",
		type : "post",
		 data: {
				productNo : "${p.productNo}"
				,amount : $("#inputQuantity").val()
				,userNo : "${loginUser.userNo}"
		},
		success: function(result){
			
			
			const toast = new bootstrap.Toast($('#liveToast'));
			toast.show();
			  
			
			
		},
		error: function(){
			console.log("통신실패");
		}
	 });
	});
		

	});	

	
	</script>
	</c:when>
	<c:otherwise>
	<script type="text/javascript">
	$(function(){
		
		 $("button").click(function(){
			 alert("로그인 이후에 이용해 주세요");
		 });
	});
	</script>
	</c:otherwise>
	</c:choose>
	

					<div class="dl-table-group">
						<dl class="dl-row">
							<dt>판매량</dt>
							<dd>
								<strong><fmt:formatNumber type="number"
										maxFractionDigits="0" value="${p.salesConunt}" /></strong>
							</dd>
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
							<dd>
								<strong style="color:red"><fmt:formatNumber type="number"
										maxFractionDigits="0"
										value="${(p.price -(p.price/p.discount))/200}" />P</strong> 적립
							</dd>
						</dl>
					</div>
				</div>
			</div>
		<div align="right">
		
		<c:if test="${loginUser.userGrade > 0 }">
		<form action="/pjtMungHub/stopPost.sp" method="post">
		<input type="hidden" value="${p.productNo }" name="productNo">
		<c:if test="${p.status eq 'Y' }">
		<input type="hidden" value="N" name="justifying">
		<button type="submit" class="btn btn-danger">상품게시중단</button>
		</c:if>
		<c:if test="${p.status eq 'N' }">
		<input type="hidden" value="Y" name="justifying">
		<button type="submit" class="btn btn-primary">상품게시</button>
		<button type="button" class="btn btn-danger" id="delete">상품정보삭제</button>
		<script type="text/javascript">
			$(function(){
				$("#delete").click(function(){
					
						if(confirm("해당 물품 데이터와 연결된 장바구니,주문내역 데이터도 사라집니다.\n 정말 삭제하시겠습니까?")){
				$.ajax({
					url: "/pjtMungHub/delete.sp",
					type: "post",
					data : {productNo : ${p.productNo}},
					success : function(result){
					
								alert("물품삭제완료");
								location.href="/pjtMungHub/notPosted.sp";
							
					},
					error : function(){
						console.log("통신실패");
					
					}
						});
					}
					});
				});
			
		</script>
		</c:if>
		</form>
		<a class="btn btn-info" href="/pjtMungHub/update.sp/${p.productNo }">상품 정보 업데이트</a>
		</c:if>
		</div>
		</div>
			
	</section>
	<hr>
	<section class="py-5">

		<div class="container">
			<h4>베스트 리뷰 (${p.reviewCount })</h4>
			<a href="#detail-section02" class="btn-review-all"><span>전체리뷰보기</span><i
				class="bi bi-caret-right-fill"></i> </a> <br>
			<div class="row row-cols-2 align-items-center mt-3 ml-3 mr-3">
				<c:forEach items="${best4Review}" var="r" varStatus="i">
					<div id="best" class="col-sm mx-3" onclick="location.href='/pjtMungHub/reviewDetail.sp/${r.reviewNo}'">
						<div class="review-content">
						<c:forEach items="${rAtList[i.index] }" var="rAt">
						<img src="${rAt.filePath }${rAt.changeName}" class="img-fluid">
						</c:forEach>
							<div class="wrap-star">
						    <div class='review-star'>
						        <span style ="width: ${r.score*20}%"></span>
						    </div>
							</div>
							<br> <small class="text-muted">${r.userName }</small> <small
								class="text-muted">${r.createDate }</small>
						</div>
						<p>${r.reviewContent }</p>
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
						<div class="card"
							onclick="location.href='/pjtMungHub/detail.sp/${plist.productNo}'">
							<div>
								<img class="card-img-top" src="${plist.attachment }">
							</div>
							<div class="card-body" style="width: 250px;">
								<h5 class="card-title">${plist.productName }</h5>
								<span class="review-star"> <i class="bi bi-star-fill"></i>
									<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
									<i class="bi bi-star-half"></i> <i class="bi bi-star"></i> <span>(<fmt:formatNumber
											type="number" maxFractionDigits="0"
											value="${plist.reviewCount }" />)
								</span>
								</span> <br>
								<del>
									<fmt:formatNumber type="number" maxFractionDigits="0"
										value="${plist.price}" />
								</del>
								<fmt:formatNumber type="number" maxFractionDigits="0"
									value="${plist.price -(plist.price/plist.discount)}" />

								<strong style="color: rgb(250, 58, 14)">${plist.discount }%</strong>

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
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="#detail-section01">상품상세정보</a></li>
				<li class="nav-item"><a class="nav-link"
					href="#detail-section02">상품리뷰</a></li>
				<li class="nav-item"><a class="nav-link"
					href="#detail-section03">상품문의</a></li>
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
							<p>${p.productName }</p>
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
				<li class="nav-item"><a class="nav-link"
					href="#detail-section01">상품상세정보</a></li>
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="#detail-section02">상품리뷰</a></li>
				<li class="nav-item"><a class="nav-link"
					href="#detail-section03">상품문의</a></li>
			</ul>
		</div>
	</section>

	<div class="container" id="detail-section02">
		<h2>구매후기</h2>
		<div align="right">
		<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#reviewModal">후기쓰기</button>
		</div>
		
		
		<c:if test="${not empty loginUser }">
		
		<div class="modal fade" id="reviewModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="staticBackdropLabel">리뷰 쓰기</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		          <div class="mb-3">
	            <label for="review_writer" class="col-form-label">작성자:</label>
	            <p>${loginUser.name }</p>
	          </div>
	          <div class="mb-3">
	          <div class="star-rating">
			    <input type="radio" class="star" name="rate" value="1">
			    <input type="radio" class="star" name="rate" value="2">
			    <input type="radio" class="star" name="rate" value="3">
			    <input type="radio" class="star" name="rate" value="4">
			    <input type="radio" class="star" name="rate" value="5" checked>
			  </div>
	       
          	</div>
	          <div class="mb-3">
	            <label for="content" class="col-form-label">후기내용 :</label>
	            <textarea class="form-control" id="content"></textarea>
	            <label for="fileFlag" class="col-form-label">파일 첨부여부</label>
	            <input type="checkbox" id="fileFlag">
          </div>
				<script>
				
				$(function(){
					$("#file-insert").hide();
					
					$("#fileFlag").click(function(){
						
						if($("#fileFlag").is(":checked")){
							$("#file-insert").show();
						}else{
							$("#file-insert").hide();
						}
					});
				});
				
				
					
				
				</script>          
           <div class="mb-3" id="file-insert">
          <ul class="nav nav-tabs nav-fill">
			  <li class="nav-item">
			    <button class="nav-link active" aria-current="page" id="insertPhoto">사진</button>
			  </li>
			  <li class="nav-item">
			    <button class="nav-link" aria-current="page" id="insertVideo">동영상</button>
			  </li>
			  </ul>
		  
		  	<div id="file">
		  		<img onclick='photo()' src="/pjtMungHub/resources/uploadFiles/common/css/MUNGHUB_logo.png" width="100%" id='loadedFile'>
				<input type='file' accept='image/*' id="uploadFile" onchange='loadFile(this)'>		  	
		  		<input type='hidden' value='picture' id='type'>
		  	</div>
		  	</div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
		        <button type="button" class="btn btn-primary" id="review-write">작성하기</button>
		      </div>
		    </div>
		  </div>
		</div>
		
		
		<script>
		function photo(){
			$("#uploadFile").click();
		}
		
		function loadFile(inputFile){
			if(inputFile.files.length==1){
				var reader = new FileReader();
				
				reader.readAsDataURL(inputFile.files[0]);
				
				reader.onload =function(e){
						$("#loadedFile").attr("src",e.target.result);
						$("#loadedFile").removeAttr("poster");
					}
				}else{
					$("#loadedFile").attr("src",null);
			}
		}	
		
		$(function(){
			var str="";
			$("#insertVideo").click(function(){
				$("#insertVideo").attr("class","nav-link active");
				$("#insertPhoto").attr("class","nav-link");
				str+="<video src='...' poster='/pjtMungHub/resources/uploadFiles/common/css/MUNGHUB_logo.png' width='100%' id='loadedFile' controls></video>";
				str+="<input type='file' accept='video/*' id='uploadFile' onchange='loadFile(this)'>";
				str+="<input type='hidden' value='video' id='type'>"
				$("#file").html(str);
				str="";
			});
			
			$("#insertPhoto").click(function(){
				$("#insertPhoto").attr("class","nav-link active");
				$("#insertVideo").attr("class","nav-link");
				str+="<img onclick='photo()' src='/pjtMungHub/resources/uploadFiles/common/css/MUNGHUB_logo.png' width='100%' id='loadedFile'>";
				str+="<input type='file' accept='image/*' id='uploadFile' onchange='loadFile(this)'>";
				str+="<input type='hidden' value='picture' id='type'>"
				$("#file").html(str);
				str="";
			});
			
			
			
			$("#review-write").click(function(){
				

				    var requestData = {userNo : ${loginUser.userNo},
							productNo : ${p.productNo},
							reviewContent : $("#content").val(),
							score : $("input[name='rate']:checked").val(),
							type : $("#type").val()}

				    var formData = new FormData();
				    formData.append("uploadFile", $("#uploadFile")[0].files[0]);
				    formData.append("review", new Blob([JSON.stringify(requestData)], {type: "application/json"}));
				
				
				$.ajax({
					url : "/pjtMungHub/insertReview.sp",
					type : "post",
					contentType: false, // 필수 : x-www-form-urlencoded로 파싱되는 것을 방지
				    processData: false,  // 필수: contentType을 false로 줬을 때 QueryString 자동 설정됨. 해제
					data : formData,
					success : function(result){
						$('#reviewModal').modal('hide');
						alertify
						  .alert("작성이 완료되었습니다.", function(){
						    alertify.success('마일리지가 적립되었습니다. 150P+');
						  });
					},error : function(){
						console.log("통신 오류");
					}
					
					
				});
			});
		});
		
		
		</script>
		
		</c:if>
		

		<div class="py-5" align="center">
			<div class="row row-cols-2 align-items-center mt-3 ml-3 mr-3">
				<div class="col-sm-5">
					<h2>
						<fmt:formatNumber type="number" maxFractionDigits="1"
							value="${p.reviewTScore}" />
					</h2>
					<div class="star-wrap">
					<div class="review-star" align="left">
					<span style="width: ${p.reviewTScore*20}%"></span>
					</div>
					</div>
					
					 <span>총 <fmt:formatNumber type="number"
							maxFractionDigits="0" value="${p.reviewCount }" />건
					</span><br> <span style="color: gray">만족도 ${percent[4]+percent[3]}%</span>
				</div>
				<div class="col-sm-5">
					<div class="score">5점</div>
					<div class="progress my-1">
						<div class="progress-bar bg-warning" role="progressbar"
							style="width: ${percent[4]}%" aria-valuenow="75" aria-valuemin="0"
							aria-valuemax="100"></div>
					</div>
					<br>
					<div class="score">4점</div>
					<div class="progress my-1">
						<div class="progress-bar bg-warning" role="progressbar"
							style="width: ${percent[3]}%" aria-valuenow="75" aria-valuemin="0"
							aria-valuemax="100"></div>
					</div>
					<br>
					<div class="score">3점</div>
					<div class="progress my-1">
						<div class="progress-bar bg-warning" role="progressbar"
							style="width: ${percent[2]}%" aria-valuenow="75" aria-valuemin="0"
							aria-valuemax="100"></div>
					</div>
					<br>
					<div class="score">2점</div>
					<div class="progress my-1">
						<div class="progress-bar bg-warning" role="progressbar"
							style="width: ${percent[1]}%" aria-valuenow="75" aria-valuemin="0"
							aria-valuemax="100"></div>
					</div>
					<br>
					<div class="score">1점</div>
					<div class="progress my-1">
						<div class="progress-bar bg-warning" role="progressbar"
							style="width: ${percent[0]}%" aria-valuenow="75" aria-valuemin="0"
							aria-valuemax="100"></div>
					</div>
				</div>
			</div>
		</div>
		<h4>
			전체후기 <span><fmt:formatNumber type="number"
					maxFractionDigits="0" value="${p.reviewCount }" />건</span>
		</h4>

		<hr>
		
		<script type="text/javascript">
		
		$(function(){
			selectReview();
		});
		
		function selectReview(){
			var str="";
			$.ajax({
				url: "/pjtMungHub/reviewList.sp",
				data : {productNo : ${p.productNo},
						justifying : $("input[name='orderBy']:checked").val(),
						star : 0,
						amount : 10
						},
					
			success : function(result){
					
					console.log(result);
					for (var i = 0; i < result.length; i++) {
					var img=""
						for (var k = 0; k < result[i].atList.length; k++) {
						if(result[i].atList[k].type=='video'){
						img+="<video src='"+result[i].atList[k].filePath+result[i].atList[k].changeName+"' style='max-height: 300px;' controls/>"	
						}else{
							
				 		img+="<img src='"+result[i].atList[k].filePath+result[i].atList[k].changeName+"' class='img-fluid' style='max-height: 300px;'>";
						}
				 			
						}
					str+="<div class='col-8 mb-4'>"
	                +"<div class='card'>"
	                +"<div class='media-container p-3'>"
	                +img
	                +"</div>"
	                +"<div class='card-body'>"
	                +"<h5 class='card-title'>"+result[i].userName+"</h5>"
	                +"<div class='wrap-star'>"
				    +"<div class='review-star'>"
				    +"<span style ='width: "+(result[i].score*20)+"%'></span>"
				    +"</div>"
					+"</div>"
	                +"<h6 class='card-subtitle mb-2 text-muted'>"+result[i].createDate+"</h6>"
	                +"<p class='card-text'>"+result[i].reviewContent+"</p>"
	                +"<div class='btn-div' align='right'>"
	                +"<button class='btn btn-primary'><i class='bi bi-hand-thumbs-up'></i>Like</button>"
	                +"<button class='btn btn-secondary'>Comment</button>"
	                +"</div>"
	                +"</div>"
	                +"</div>"
		            +"</div>"
					+"</div>";
					
					}
					$("#review_area").html(str);
				},
				error: function(){
					console.log("통신오류");
				}
			});
				
			
		};
			
		
		
		</script>
	<div class="container mt-5">
	<div align="right">
	<label for="topRate">추천순</label><input type="radio" id="topRate" name="orderBy" value="topRate" checked onclick="selectReview()">
	<label for="latest">최신순</label><input type="radio" id="latest" name="orderBy" value="latest" onclick="selectReview()">
	</div>
	<div class='row justify-content-center mt-3' id='review_area'>
	</div>
	<div align="center">
	<a class="btn btn-info">전체 리뷰보기</a>
	</div>
	</div>
</div>
	<section class="py-5">
		<div class="container" id="detail-section03">

			<ul class="nav nav-tabs nav-fill">
				<li class="nav-item"><a class="nav-link"
					href="#detail-section01">상품상세정보</a></li>
				<li class="nav-item"><a class="nav-link"
					href="#detail-section02">상품리뷰</a></li>
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="#detail-section03">상품문의</a></li>
			</ul>
		</div>


	</section>

	<div class="container" id="detail-section03">
		<h2>
			상품문의 <span style="color: gray; font-size: 16px;">(4,666개)</span>
		</h2>

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


	<br>
	<br>
</body>
</html>