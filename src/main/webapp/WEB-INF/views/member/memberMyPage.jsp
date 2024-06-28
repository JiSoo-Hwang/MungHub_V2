<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.left, .right : {
		display: inline-block;
	}
</style>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="mypage-left">
		<%@include file="/WEB-INF/views/member/memberSideBar.jsp" %>
	</div>
	<div class="mypage-main">
		<div class="member-info">
			<h3>${loginUser.userId} 님의 회원 정보입니다.</h3> <br>
			<div class="info-area">
				<label for="name">이름 :</label>
				<input type="text" class="form-control mb-2 mr-sm-2" 
						placeholder="이름을 입력하세요" id="name" name="name" value="${loginUser.name}" readonly>
				<label for="phone">전화번호 :</label>
				<input type="text" class="form-control mb-2 mr-sm-2" 
						placeholder="하이픈(-) 포함 공백없이 입력해 주시기 바랍니다." id="phone" name="phone" value="${loginUser.phone}"readonly>
				<label for="phone">이메일 :</label>
				<input type="email" class="form-control mb-2 mr-sm-2" 
						placeholder="" id="email" name="email" value="${loginUser.email}"readonly>
				<label for="address">주소 :</label>
				<input type="text" class="form-control mb-2 mr-sm-2" 
						placeholder="" id="address" name="address" value="${loginUser.address}" readonly>	
				<button type="button" data-bs-toggle="modal" data-bs-target="#memModal">수정하기</button>
			</div>
		</div>
		<div class="pet-info">
			<c:choose>
				<c:when test="${loginUser.petYN eq 'N'}">
					<h3>현재 등록된 반려견 정보가 없습니다.</h3>
				</c:when>
				<c:otherwise>
					<h3>반려견 정보</h3>
					<div class="info-area">
						<div class="info-left">
							<c:forEach items="${petPhotoList}" var="photo">
								<div class="petPhoto">
								<img src=".${photo.filePath}">
								</div>
							</c:forEach>
						</div>
						<div class="info-right">
							<c:forEach items="${petList}" var="pet">
								<div class="petInfo">
									<label for="">이름 : ${pet.petName}</label><br>
									<label for="">품종 : <c:forEach items="${breed}" var="b">${b.breedId eq pet.breed ? b.breedName:''}</c:forEach>${empty pet.breed ? '비밀':''}</label></label><br>
									<label for="">나이 : ${pet.petAge}</label><br>
									<label for="">성별 : ${pet.petGender eq 'M' ? '왕자님':'공주님' }</label><br>
									<label for="weight">몸무게 : ${pet.weight} kg</label><br>
								</div>						
							</c:forEach>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	
	<div class="modal fade" id="memModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">반려견 정보 수정</h4>
					<button type="button" class="close" data-bs-dismiss="modal">&times;</button>
				</div>		
				<form action="updateMember.me" method="post">
				<!-- Modal body -->
					<div class="modal-body">
						<div class="member-data">
							<input type="hidden" name="userNo" value="${loginUser.userNo}">
							<label for="name">이름 :</label>
							<input type="text" class="form-control mb-2 mr-sm-2" 
									placeholder="이름을 입력하세요" id="name" name="name" value="${loginUser.name}">
							<label for="phone">전화번호 :</label>
							<input type="text" class="form-control mb-2 mr-sm-2" 
									placeholder="하이픈(-) 포함 공백없이 입력해 주시기 바랍니다." id="phone" name="phone" value="${loginUser.phone}">
							<label for="phone">이메일 :</label>
							<input type="email" class="form-control mb-2 mr-sm-2" 
									id="email" name="email" value="${loginUser.email}">
							<c:if test="${loginUser.userGrade gt 0 }">
			                    <label for="kindName">소속 유치원 이름 : </label>
			                    <input type="text" id="kind" name="kind" placeholder="유치원 이름 검색" value="${loginUser.kindName}"><button onclick="searchKind(); return false;">검색</button>
			                    <span class="kindList"></span><br>
							</c:if>
							<label for="address">주소 :</label>
							<input type="text" class="form-control mb-2 mr-sm-2" 
									placeholder="" id="address" name="address" value="${loginUser.address}">
							<label for="">반려견 유무 :</label>
							<div class="petStatus">
								<input type="radio" id="yesPet" value="Y" name="petYN">
								<label for="yesPet">있습니다.</label> &nbsp;&nbsp;
								<input type="radio" id="noPet" value="N" name="petYN">
								<label for="noPet">없습니다.</label> &nbsp;&nbsp;
							</div>
						</div>
					</div>
					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="submit" class="btn btn-danger">개인정보 수정</button>
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script>
		function searchKind(){
	        var kind="%";
	        	kind+=$("#kind").val();
	        	kind+="%";
	        console.log(kind);
	        var tr="<select name='kindName'>";       
	        $.ajax({
	            url : "selectKind.me",
	            data : {
	                kindName : kind
	            },
	            success : function(kList){
	                if(kList.length==0){
	                    $("#kind").val("");
	                }else{
	                    for(var i in kList){
	                        tr+="<option value='"
	                            +kList[i].kindNo+"'>"
	                            +kList[i].kindName
	                            +"</option>"
	                    }
	                    tr+="</select>";
	                
	                $(".kindList").html(tr);
	                }
	            },
	            error : function(){
	                console.log("오류난듯");     
	            }
	        })
	        return false;
	    }
	</script>
</body>
</html>