<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${kindergarten.kindName}등록상담신청페이지입니다</title>
<style>
#reg_form {
	margin: 50px;
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

		<form method="post" action="reg.do" enctype="multipart/form-data">
			<input type="hidden" name="kindNo" value="${kindergarten.kindNo}">
			<input type="hidden" name="userNo" value="${loginUser.userNo }">
			<ul>
				<li>
					<div class="container mt-3" id="reg_upFile">
						<div class="card img-fluid" style="width: 500px">
							<img class="card-img-top" src="" alt="" style="width: 100%">
							<div class="card-img-overlay">

								<p class="card-text">강아지 사진을 올려주세요!</p>
								<input type="file" name="upFile" id="upFile" onchange="loadImg(this,1);"></input> <label
									for="upFile"><img
									src="/pjtMungHub/resources/uploadFiles/kindergarten/css/dogPhotoIcon.png"
									alt="" style="width: 500px"></label>

							</div>
						</div>
					</div>
				</li>
				<li>
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
								<td><input type="text" name="petAge" value="${pet.petAge }"
									readonly></td>
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
								<th>필수접종여부</th>
								<td>
									<ul style="list-style-type: none">
										<li><input class="form-check-input" type="checkbox"
											id="vac1" value="접종1"> <label
											class="form-check-label" for="vac1">접종1</label></li>
										<li><input class="form-check-input" type="checkbox"
											id="vac1" value="접종2"> <label
											class="form-check-label" for="vac1">접종2</label></li>
										<li><input class="form-check-input" type="checkbox"
											id="vac1" value="접종3"> <label
											class="form-check-label" for="vac1">접종3</label></li>
										<li><input class="form-check-input" type="checkbox"
											id="vac1" value="접종4"> <label
											class="form-check-label" for="vac1">접종4</label></li>
										<li><input class="form-check-input" type="checkbox"
											id="vac1" value="접종5"> <label
											class="form-check-label" for="vac1">접종5</label></li>

									</ul>
								</td>
							</tr>
							<tr>
								<th>방문희망일</th>
								<td><input type="date" name="visitDate"></td>
							</tr>
							<tr>
								<th>소개</th>
								<td><textarea rows="4" cols="50" name="petIntro"></textarea></td>
							</tr>
							<tr>
								<th>특이사항</th>
								<td><textarea rows="4" cols="50" name="petNote"></textarea></td>
							</tr>
							<tr>
								<td></td>
								<td style="text-align: center;">
									<a href="regList.do?userNo=${loginUser.userNo }" class="btn btn-outline-primary">목록으로</a>
									<button type="submit">신청하기</button>
								</td>
							</tr>
						</tbody>

					</table>
				</li>
			</ul>
		</form>
	</div>
	<script>
function loadImg(inputFile,num) {
	if(inputFile.files.length==1){
		var reader = new FileReader();
		reader.readAsDataURL(inputFile.files[0]);
		reader.onload = function (e) {
			switch (num) {
			case 1:
				$("label>img").attr("src",e.target.result);
				break;
			}
		}
	}else{
		switch (num) {
		case 1:
			$("label>img").attr("src","/pjtMungHub/resources/uploadFiles/kindergarten/css/dogPhotoIcon.png");
			break;
		}
	}
}
	</script>
</body>
</html>