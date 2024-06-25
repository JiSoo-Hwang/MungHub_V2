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
			<input type="hidden" name="userNo" value="${loginUser.userNo }">
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
								
								<tr> 
								<td> </td>
								<td class="text-end"> 
								<br> <br> <br> <br> <br> <br>
																<c:choose>
										<c:when test="${loginUser.userGrade ne 2 }">
										<a type="button" class="btn btn-warning" href="wedList.wd">목록으로</a>
										</c:when>
										<c:when test="${loginUser.userGrade eq 2 }">
										<a type="button" class="btn btn-warning" href="wedList2.wd">목록으로</a>
										</c:when>
										</c:choose>
								</td>
								</tr>
<%-- 								<c:choose>
									<c:when test="${registration.approval eq 'N' }">
										<tr>
											<th>승인여부</th>
											<td>승인대기중</td>
										</tr>
									</c:when>
									<c:when test="${registration.approval eq 'R' }">
										<tr>
											<th>승인여부</th>
											<td>상담이 거절되었습니다...</td>
										</tr>
										<tr> 
											<th>거절 사유</th>
											<td>${registration.reason}</td>
										</tr>
									</c:when>
									<c:otherwise>
										<tr>
											<th>승인여부</th>
											<td>승인완료! 상담일날 뵈어요^^</td>
										</tr>
									</c:otherwise>
								</c:choose> --%>
							</tbody>
						</table>
					</div>
				</li>
			</ul>
	</div>	
</body>
</html>