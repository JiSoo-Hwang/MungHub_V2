<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${pet.petName } 댕댕이의 웨딩플래너 신청 페이지입니다.</title>
<style>
#wed_form {
	margin: 50px;
}

#upFile {
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

		<form method="post" action="insert.wd" enctype="multipart/form-data">
<%-- 			<input type="hidden" name="kindNo" value="${kindergarten.kindNo}"> --%>
			<input type="hidden" name="userNo" value="${loginUser.userNo }">
			<ul>
				<li>
					<div class="container mt-3" id="wed_upFile">
						<div class="card img-fluid" style="width: 500px">
							<img class="card-img-top" src="" alt="" style="width: 100%">
							<div class="card-img-overlay">

								<p class="card-text">강아지 사진을 올려주세요!</p>
								<input type="file" name="upFile" id="upFile" onchange="loadImg(this,1);" required></input> <label
									for="upFile"><img
									src="/pjtMungHub/resources/uploadFiles/kindergarten/css/dogPhotoIcon.png"
									alt="" style="width: 500px"></label>

							</div>
						</div>
					</div>
				</li>
				<li>
					<table class="table table-hover" id="wed_form">
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
							<th>혈통 </th>
							<td> <input type="text" name="pedigree">
							<button type="button" class="btn btn-primary" data-bs-toggle="popover" title="이건 뭔가요?" data-bs-content="강아지의 혈통을 적어주세요(모르면 '모름'이라고 적으셔도 무방합니다^^)">?</button>
							</td>
							</tr>
							<tr>
								<th>필수접종여부</th>
								<td>
									<ul style="list-style-type: none">
										<li><input class="form-check-input" type="checkbox"
											id="vac1"> <label
											class="form-check-label" for="vac1" data-bs-toggle="tooltip" title="모든 백신접종이 체크되어야 신청버튼이 활성화됩니다 :)">종합백신</label></li>
										<li><input class="form-check-input" type="checkbox"
											id="vac2"> <label
											class="form-check-label" for="vac2">코로나장염</label></li>
										<li><input class="form-check-input" type="checkbox"
											id="vac3"> <label
											class="form-check-label" for="vac3">켄넬코프</label></li>
										<li><input class="form-check-input" type="checkbox"
											id="vac4"> <label
											class="form-check-label" for="vac4">광견병</label></li>
										<li><input class="form-check-input" type="checkbox"
											id="vac5"> <label
											class="form-check-label" for="vac5">인플루엔자</label>
											</li>

									</ul>
								</td>
							</tr>
							<tr>
							<th>접종 증명서 첨부</th>
							<td> 
							<input type="file" multiple name="vacCert" required>
							</td>
							</tr>
							<tr>
								<th>만남방식</th>
								<td>
								<select name="meetingMethod" required>
									<option value="상대방이 방문">상대방 댕댕이가 방문</option>
									<option value="우리가 방문">우리가 댕댕이를 찾아가기</option>
								</select>
								</td>
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
									<a href="wedList.wd" class="btn btn-outline-primary">목록으로</a>
									<button type="submit" class="btn btn-outline-success" data-bs-toggle="tooltip" title="모든 백신접종이 체크되어야 신청버튼이 활성화됩니다 :)" disabled>신청하기</button>
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
$(function () {
	$("input[class='form-check-input']").on('change', function() {
	var checkNum = $("input[class='form-check-input']:checked").length;
		if(checkNum==5){
			$("button[type='submit']").prop("disabled",false);
		}
	});
});
/* 혈통 관련 안내 팝업 */
var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
  return new bootstrap.Popover(popoverTriggerEl)
})
	</script>
</body>
</html>