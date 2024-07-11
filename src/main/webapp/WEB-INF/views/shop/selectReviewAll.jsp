<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

.progress {
	width: 80%;
	float: right;
}

.score {
	width: 20%;
	display: block;
	float: left;
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
.review-star {width:100px; }
.review-star,.review-star span {display:inline-block; height:24px; overflow:hidden; background:url(/pjtMungHub/resources/uploadFiles/shopFile/productFile/common/star.png)no-repeat; }
.review-star span{background-position:left bottom; line-height:0; vertical-align:top; }
</style>
</head>
<body>

	<%@include file="../common/header.jsp" %>
	<div class="container py-5">
		<h2>구매후기</h2>
		<h3>${p.productName }</h3>
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
						</span><br> <span style="color: gray">만족도 ${percent[0].percent}%</span>
				</div>
				<div class="col-sm-5">
				<c:forEach begin="0" end="4" varStatus="index">
				
					<div class="score">${5-index.index }점</div>
					<div class="progress my-1">
					<c:forEach begin="0" end="4" varStatus="i">
					<c:if test="${5-index.index eq percent[i.index].score }">
						<div class="progress-bar bg-warning" role="progressbar"
							style="width: ${percent[i.index].percent }%" aria-valuenow="75" aria-valuemin="0"
							aria-valuemax="100"></div>
					</c:if>
					</c:forEach>
					</div>
					<br>
				</c:forEach>
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
						star : $("#starSelect option:selected").val(),
						currentPage : ${currentPage}
						
				},
					
			success : function(result){
					
					for (var i = 0; i < result.length; i++) {
					var img=""
						for (var k = 0; k < result[i].atList.length; k++) {
						if(result[i].atList[k].type=='video'){
						img+="<video src='"+result[i].atList[k].filePath+result[i].atList[k].changeName+"' style='max-height: 300px;' controls/>"	
						}else{
							
				 		img+="<img src='"+result[i].atList[k].filePath+result[i].atList[k].changeName+"' class='img-fluid' style='max-height: 300px;'>";
						}
				 			
						}
					str+="<div class='col-10 mb-4'>"
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
	<div>
	<select id="starSelect" onchange="selectReview()">
	<option value="0" selected>별점선택</option>
	<option value="5">5점</option>
	<option value="4">4점</option>
	<option value="3">3점</option>
	<option value="2">2점</option>
	<option value="1">1점</option>
	</select>
	</div>
	<label for="topRate">추천순</label><input type="radio" id="topRate" name="orderBy" value="topRate" checked onclick="selectReview()">
	<label for="latest">최신순</label><input type="radio" id="latest" name="orderBy" value="latest" onclick="selectReview()">
	</div>
	<div class='row justify-content-center mt-3' id='review_area'>
	</div>
	<div align="center">
		<nav>
		  <ul class="pagination justify-content-center">
		  <c:choose>
		  <c:when test="${pi.currentPage eq 1 }">
		  </c:when>
		  <c:otherwise>
		   <li class="page-item"><a class="page-link" href="/pjtMungHub/reviewListAll.sp/${p.productNo }?currentPage=${pi.currentPage-1}">Previous</a></li>
		  </c:otherwise>
		  </c:choose>
		  <c:forEach begin="${pi.startPage }" end="${pi.endPage }" var="page">
		  <c:choose>
		  <c:when test="${pi.currentPage eq page }">
		  <li class="page-item disabled"><a class="page-link" href="/pjtMungHub/reviewListAll.sp/${p.productNo }?${page}">${page}</a></li>
		  </c:when>
		  <c:otherwise>
		    <li class="page-item"><a class="page-link" href="/pjtMungHub/reviewListAll.sp/${p.productNo }?${page}">${page}</a></li>
		  </c:otherwise>
		  </c:choose>
		  </c:forEach>
		  <c:choose>
		  <c:when test="${pi.currentPage eq pi.maxPage }">
		  </c:when>
		  <c:otherwise>
		    <li class="page-item"><a class="page-link" href="/pjtMungHub/reviewListAll.sp/${p.productNo }?currentPage=${pi.currentPage+1}">Next</a></li>
		  </c:otherwise>
		  </c:choose>
		  </ul>
		</nav>
	</div>
	</div>
	
</div>
</body>
</html>