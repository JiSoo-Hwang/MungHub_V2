<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="mypage-left">
		<%@include file="/WEB-INF/views/member/memberSideBar.jsp" %>
	</div>
	<div class="petInfo-main">
		<c:if test="${empty petList&&loginUser.petYN eq 'Y'}">
			<div class="newPet-new">
				<%@ include file="/WEB-INF/views/member/memberPetEnrollForm.jsp" %>
			</div>
		</c:if>
		<c:if test="${not empty petList}">
			<h3>기존 반려견 정보 수정하기</h3>
			<div class="info-area">
				<div class="info-left">
					<c:forEach items="${petPhotoList}" var="photo">
						<div class="petPhoto">
						<img src="${photo.filePath}" width="150" height="120">
						</div>
					</c:forEach>
				</div>
				<div class="info-right">
					<c:forEach items="${petList}" var="pet">
						<div class="petInfo">
							<input type="hidden" name="petNo" value="${pet.petNo}">
							<label for="">이름 : ${pet.petName}</label><br>
							<label for="">품종 : ${pet.breed}</label><br>
							<label for="">나이 : ${pet.petAge}</label><br>
							<label for="">성별 : ${pet.petGender eq 'M' ? '왕자님':'공주님'}</label><br>
							<label for="weight">몸무게 : ${pet.weight} kg</label><br>
							<button type="button" data-bs-toggle="modal" data-bs-target="#petModal">수정하기</button>
						</div>						
					</c:forEach>
				</div>
			</div>
		</c:if>
		<c:if test="${not empty petList||loginUser.petYN eq 'N'}">
			<h3 onclick="newPetInput();">지금 새 가족을 등록해 보세요!</h3>
		<div class="newPet-member" hidden="true">
			<%@ include file="/WEB-INF/views/member/memberPetEnrollForm.jsp"%>
		</div>
		</c:if>
	</div>
	<script>
		function newPetInput(){
			if($(".newPet-member").attr("hidden")){				
				$(".newPet-member").attr("hidden",false);
			}
		}
		$(".petInfo>button").on("click",function(){
			var petNo= $(this).siblings("input[type=hidden]").val();
			$.ajax({
				url:"selectPet.me",
				data:{
					petNo:petNo
				},
				success:function(p){
					$(".pet-info>.petName").val(p.petName);
					$(".pet-info>.petAge").val(p.petAge);
					$(".pet-info>.weight").val(p.weight);
					
				}
			})

		})

	</script>
	<div class="modal fade" id="petModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">반려견 정보 수정</h4>
					<button type="button" class="close" data-bs-dismiss="modal">&times;</button>
				</div>		
				<form action="enrollPet.me" method="post" enctype="multipart/form-data">
				<!-- Modal body -->
					<div class="modal-body">
						<div class="pet-photo">
						</div>
						<div class="pet-info">
								<label for="breed">품종</label>
								<select>
									<option value="">비밀(해당하는 품종이 없거나 믹스견인 경우 선택해 주세요)</option>
									<c:forEach items="${breed}" var="b">
										<option value="${b.breedId}">${b.breedName}</option>
									</c:forEach>
								</select><br>
								<input type="hidden" id="ownerNo" name="ownerNo">
								<label for="petName">이름 : </label>
								<input type="text" id="petName" name="petName"><br>
								<label for="">나이 : </label>
								<input type="range" id="petAge" name="petAge" min="0" step="1" max="18"><br>
								<label for="">성별 : </label>
								<input type="radio" id="F" name="petGender" value="M">
								<label for="M">왕자님</label>
								<input type="radio" id="M" name="petGender" value="F">
								<label for="F">공주님</label><br>
								<label for="weight">몸무게 : </label>
								<input type="number" id="weight" name="weight" step="0.1"> kg<br>
								<label for="photo">반려견 사진 자랑(1장만!)</label>
								<input type="file" name="reUpFile" required>
								
						</div>
					</div>	
					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="submit" class="btn btn-danger" disabled>반려견 등록</button>
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>