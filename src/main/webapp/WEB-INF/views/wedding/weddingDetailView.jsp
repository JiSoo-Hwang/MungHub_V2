<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${wedding.petName }의 상세페이지입니다</title>
<style>
.form_area {
	margin: 100px;
}

#reg_form {
	margin: 100px;
}

input {
	border: none;
}

input[type=file] {
	display: none;
}

textarea {
	width: 70%;
	resize: none;
}

ul {
	list-style: none;
}

li {
	float: left;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="form_area">
			<input type="hidden" name="kindNo" value="${wedding.weddingNo}">
			<input type="hidden" name="userNo" value="${wedding.userNo }">
			<ul>
				<li>
					<div class="container mt-3" id="reg_upFile">
						<div class="card img-fluid" style="width: 500px">
							<img class="card-img-top"
								src="/pjtMungHub/${wedding.changeName}" alt=""
								style="width: 100%">
							<div class="card-img-overlay"></div>
						</div>
					</div>
				</li>
				<li>
					<div class="input_area">
						<table class="table table-hover" id="reg_form">
							<thead>
								<tr>
									<th>이름</th>
									<td><input type="text" value="${wedding.petName }" readonly>

								</tr>
							</thead>
							<tbody>
								<tr>
									<th>견종</th>
									<td><input type="text" name="breed" value="${wedding.breed }"
										readonly></td>
								</tr>
								<tr>
									<th>나이</th>
									<td><input type="text" name="petAge"
										value="${wedding.petAge }" readonly></td>
								</tr>
								<tr>
									<th>성별</th>
									<td><c:choose>
											<c:when test="${wedding.gender eq 'F' }">
                                    공주님
                                </c:when>
											<c:otherwise>
                                    왕자님
                                </c:otherwise>
										</c:choose></td>
								</tr>
								<tr>
									<th>몸무게</th>
									<td>${wedding.weight }</td>
								</tr>
 								<tr>
									<th>만남방식</th>
									<td><input type="text" name="meetingMethod"
										value="${wedding.meetingMethod }"></td>
								</tr>
								<tr>
									<th>소개</th>
									<td>${wedding.petIntro }</td>
								</tr>
								<tr>
									<th>특이사항</th>
									<td>${wedding.petNote }</td>
								</tr>
 								<c:choose>
									<c:when test="${wedding.approval eq 'N' }">
										<tr>
											<th>승인여부</th>
											<td>승인대기중</td>
										</tr>
									</c:when>
									<c:when test="${wedding.approval eq 'R' }">
										<tr>
											<th>승인여부</th>
											<td>상담이 거절되었습니다...</td>
										</tr>
										<tr> 
											<th>거절 사유</th>
											<td>${wedding.reason}</td>
										</tr>
									</c:when>
									<c:otherwise>
										<tr>
											<th>승인여부</th>
											<td>승인완료! 상담일날 뵈어요^^</td>
										</tr>
																		<tr> 
								<td> </td>
								<td class="text-end"> 
								<br> <br> <br> <br> <br> <br>
																<c:choose>
										<c:when test="${loginUser.userId ne 'admin' }">
										<a type="button" class="btn btn-warning" href="wedList.wd">목록으로</a>
										</c:when>
										<c:otherwise>
										<a type="button" class="btn btn-warning" href="admin.wd">목록으로</a>
										</c:otherwise>
										</c:choose>
								</td>
								</tr>
									</c:otherwise>
								</c:choose>
																<tr>
									<td></td>
									<td><br> <br> <br>
										<br> <br> <br>
										<!-- 지금은 상세 신청 내역. 관리자가 보고 부적합한 신청자면 1차적으로 거절할 수 있음
											 나중에는 신청된 리스트에 강아지를 선택해서 만남을 신청하는 기능을 별도로 구현해야 함 -->
										<c:choose>
										<c:when test="${wedding.approval eq 'N' && loginUser.userNo eq wedding.userNo }">
										<a type="button" class="btn btn-outline-info" href="update.wd?weddingNo=${wedding.weddingNo }">신청수정</a>
										<button type="button" class="btn btn-secondary" id="cancelBtn">신청철회</button>
										</c:when>
										<c:when test="${loginUser.userId eq 'admin' && wedding.approval eq 'N' }">
										<button class="btn btn-primary" id="approveBtn">신청승인</button>
  
  <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#myModal">
    신청거절
  </button>

<!-- The Modal -->
<div class="modal fade" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">신청 거절을 선택하셨습니다...</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
		
      <!-- Modal body -->
        <form action="reject.wd" method="post">
      <div class="modal-body">
      	<input type="hidden" name="weddingNo" value="${wedding.weddingNo}">
        <textarea rows="4" cols="50" name="reason" placeholder="견주님 마음 상하지 않게 거절 이유를 친절하게 적어주세요."></textarea>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="submit" class="btn btn-danger">신청 거절하기</button>
        <button class="btn btn-secondary" data-bs-dismiss="modal">창 닫기</button>
      </div>
        </form>

    </div>
  </div>
</div>
										</c:when>
										</c:choose>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</li>
			</ul>
	</div>	
</body>
</html>