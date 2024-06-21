<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${pet.petName }의${registration.visitDate}날등록상담</title>
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
		<form method="post" action="reg.do">
			<input type="hidden" name="kindNo" value="${kindergarten.kindNo}">
			<input type="hidden" name="userNo" value="${loginUser.userNo }">
			<ul>
				<li>
					<div class="container mt-3" id="reg_upFile">
						<div class="card img-fluid" style="width: 500px">
							<img class="card-img-top"
								src="/pjtMungHub/${registration.changeName}" alt=""
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
									<td><input type="text" value="${pet.petName }" readonly>
										<input type="hidden" name="petNo" value="${pet.petNo}"></td>

								</tr>
							</thead>
							<tbody>
								<tr>
									<th>견종</th>
									<td><input type="text" name="breed" value="${pet.breed }"
										readonly></td>
								</tr>
								<tr>
									<th>나이</th>
									<td><input type="text" name="petAge"
										value="${pet.petAge }" readonly></td>
								</tr>
								<tr>
									<th>성별</th>
									<td><c:choose>
											<c:when test="${pet.petGender eq 'F' }">
                                    공주님
                                </c:when>
											<c:otherwise>
                                    왕자님
                                </c:otherwise>
										</c:choose></td>
								</tr>
								<tr>
									<th>몸무게</th>
									<td>${pet.weight }</td>
								</tr>
								<tr>
									<th>방문희망일</th>
									<td><input type="date" name="visitDate"
										value="${registration.visitDate }"></td>
								</tr>
								<tr>
									<th>소개</th>
									<td>${registration.petIntro }</td>
								</tr>
								<tr>
									<th>특이사항</th>
									<td>${registration.petNote }</td>
								</tr>
								<c:choose>
									<c:when test="${registration.approval eq 'N' }">
										<tr>
											<th>승인여부</th>
											<td>승인대기중</td>
										</tr>
									</c:when>
									<c:otherwise>
										<tr>
											<th>승인여부</th>
											<td>승인완료! 상담일날 뵈어요^^</td>
										</tr>
									</c:otherwise>
								</c:choose>
								<tr>
									<td></td>
									<td style="text-align: center;"><br> <br> <br>
										<br> <br> <br>
										<a type="button" class="btn btn-warning" href="regList.do">목록으로</a><c:choose>
											<c:when test="${registration.approval eq 'N' }">
												<button type="button" class="btn btn-outline-info">신청수정</button>
											</c:when>
										</c:choose>
										<button type="button" class="btn btn-secondary" id="cancelBtn">신청서철회</button>
										<!-- 					<button type="submit"  id="submit-btn">신청하기</button>-->
									</td>
								</tr>
							</tbody>

						</table>
					</div>

				</li>

			</ul>



		</form>
	</div>
	<script>
	
	</script>
</body>
</html>