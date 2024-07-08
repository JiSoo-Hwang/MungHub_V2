<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${loginUser.name }님의 댕댕이 웨딩플래너 신청 페이지입니다.</title>
<style>
#wed_form {
	margin: 50px;
}

#reupFile {
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

		<form method="post" action="update.wd" enctype="multipart/form-data">
			<input type="hidden" name="weddingNo" value="${wedding.weddingNo }">
			<input type="hidden" name="weddingNo" value="${wedding.petNo }">
			<ul>
				<li>
					<div class="container mt-3" id="wed_reupFile">
						<div class="card img-fluid" style="width: 500px">
							<img class="card-img-top" src="" alt="" style="width: 100%">
							<div class="card-img-overlay">

								<p class="card-text">강아지 사진을 올려주세요!</p>
								<input type="file" name="reupFile" id="reupFile" onchange="loadImg(this,1);" required></input> <label
									for="reupFile"><img
									src="/pjtMungHub/${wedding.changeName }"
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
								<td>${pet.petName }</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th>견종</th>
								<td><input name="breed" id="breed" value="${pet.breed }" readonly></td>
							</tr>
							<tr>
								<th>나이</th>
								<td><input name="petAge" id="petAge" value="${pet.petAge }" readonly></td>
							</tr>
							<tr>
								<th>성별</th>
								<td><input name="gender" id="gender" value="" readonly></td>
							</tr>
							<tr>
								<th>몸무게</th>
								<td><input name="weight" id="weight" value="${pet.weight }" readonly></td>
							</tr>
							<tr> 
							<th>혈통 </th>
							<td> <input type="text" name="pedigree" value="${wedding.pedigree }">
							<button type="button" class="btn btn-primary" data-bs-toggle="popover" title="이건 뭔가요?" data-bs-content="강아지의 혈통을 적어주세요(모르면 '모름'이라고 적으셔도 무방합니다^^)">?</button>
							</td>
							</tr>
							<tr>
							<tr>
								<th>만남방식</th>
								<td>
								<select name="meetingMethod" id="meetingMethod" required>
									<option>만남방식을 선택해주세요</option>
									<option value="상대방이 방문">상대방 댕댕이가 방문</option>
									<option value="우리가 방문">우리가 댕댕이를 찾아가기</option>
								</select>
								</td>
							</tr>
							<tr>
								<th>소개</th>
								<td><textarea rows="4" cols="50" name="petIntro">${wedding.petIntro}</textarea></td>
							</tr>
							<tr>
								<th>특이사항</th>
								<td><textarea rows="4" cols="50" name="petNote">${wedding.petIntro}</textarea></td>
							</tr>
							<tr>
								<td></td>
								<td style="text-align: center;">
									<a href="wedList.wd" class="btn btn-outline-primary">목록으로</a>
									<button type="submit" class="btn btn-outline-success">신청하기</button>
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
	var gender = "${pet.petGender}";
	switch (gender) {
	case 'M':
		$("#gender").val('왕자님');
		break;
	case 'F':
		$("#gender").val('공주님');
		break;
	}
	$("#meetingMethod").val("${wedding.meetingMethod}").prop("selected",true);
});

/* 혈통 관련 안내 팝업 */
var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
  return new bootstrap.Popover(popoverTriggerEl)
})
	</script>
</body>
</html>