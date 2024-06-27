<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div class="mypage-left">
	<%@ include file="/WEB-INF/views/member/memberSideBar.jsp" %>
	</div>
	<div class="mypage-right">
		<div class="manage-main">
			<div class="manage-board">
				<h3>게시글 관리</h3>
			</div>
			<div class="manage-member">
				<h3>회원 관리</h3>
				
				<div class="search-member">
					<h5>회원 검색</h5>
					<input type="text" id="searchUserId" placeholder="찾고 싶은 회원의 아이디를 입력하세요"><button onclick="searchUserId();">검색</button>
					<div class="member-list" hidden="true">
						<table class="search-result" border="1">
							<thead style="border:1;">
								<tr>
									<th>아이디</th>
									<th>이름</th>
									<th>휴대폰 번호</th>
									<th>이메일 주소</th>
									<th>반려견유무</th>
									<th>가입일</th>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		function searchUserId(){
			var userId="%"+$("#searchUserId").val();
			userId+="%";
			$.ajax({
				url:"searchUser.me",
				data:{
					userId:userId
				},
				success:function(result){
					var text="";
					if(result!=null){
						for(var i in result){
							text+="<tr>"
								+"<td>"+result[i].userId+"</td>"
								+"<td>"+result[i].name+"</td>"
								+"<td>"+result[i].phone+"</td>"
								+"<td>"+result[i].email+"</td>"
								+"<td>"+result[i].petYN+"</td>"
								+"<td>"+result[i].joinDate+"</td>"
								+"<tr>";
						}
					}else{
						text+="<tr>"
							+"<td colspan='6'>"+"해당하는 회원이 없습니다."+"</td>"
							+"</tr>";
					}
						$(".search-result tbody").html(text);
				},
				error:function(){
					console.log("통신오류");
				}
			})
			$(".member-list").attr("hidden",false);
		}
	</script>

</body>
</html>