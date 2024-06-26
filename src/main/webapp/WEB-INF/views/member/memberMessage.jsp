<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<%@include file="/WEB-INF/views/member/memberSideBar.jsp" %>
	<div class="msg-main">
		<div class="msg-content" hidden="true">
			<h3>메시지 내용</h3>
			<input type="hidden" id="readMessageNo">
			<label for="">작성자 : </label> <input type="text" id="readSender" readonly>
			<label for="msgDate">작성일자 : </label> <input type="date" id="readMessageDate" readonly>	<br>
			<label for="messageContent">내용 : </label><br>
			<textarea rows="12" cols="60" id="readMessageContent" style="resize:none;" readonly></textarea>
		</div>
		<div class="sendMsg-button">
			<button>메시지 작성</button>
		</div>
		<div class="list-area">
			<h4>받은 메시지 목록</h4>
			<span class="">${pi.currentPage} 페이지</span>
			<c:if test="${not empty msgList}">
				<table class="msg-list">
					<thead>
						<tr>
							<th>작성자</th>
							<th>작성일</th>
							<th>내용</th>
							<th>관리</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${msgList}" var="msg">
							<tr>
								<td hidden="true"><input type="hidden" name="messageNo" value="${msg.messageNo}"></td>
								<td>${msg.sender}</td>
								<td class="msgDate">${msg.messageDate}</td>
								<c:if test="${fn:length(msg.messageContent) gt 15}">
									<td hidden="true">${msg.messageContent}</td>
									<td class="msgCont">${fn:substring(msg.messageContent,0,15)}...</td>
								</c:if>
								<c:if test="${fn:length(msg.messageContent) le 15 }">
									<td class="msgCont">${msg.messageContent}</td>
								</c:if>
								<td><button onclick="deleteMsg(${msg.messageNo});">삭제</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<nav aria-label="Page navigation example" style="text-align: center;">
			        <ul class="pagination justify-content-center">
			        	<c:if test="${pi.currentPage gt 5}">
				            <li class="page-item">
				                <button aria-label="Previous" onclick="prev();">
				                    <span aria-hidden="true">&laquo;</span>
				                    <span class="sr-only" >Previous</span>
				                </button>
				            </li>
			        	</c:if>
			            <c:forEach var="i" begin="${pi.startPage}" end="${pi.endPage}">
			           		<li class="page-item">
			           			<button class="page-link">${i}</button>
			           		</li>
			            </c:forEach>
							<c:if test="${pi.currentPage lt pi.maxPage}">
			           		<li class="page-item">
				                <button aria-label="Next" onclick="next();">
				                    <span aria-hidden="true">&raquo;</span>
				                    <span class="sr-only">Next</span>
				                </button>
				            </li>
			            </c:if>
			        </ul>
			    </nav>
			</c:if>
			<c:if test="${empty msgList}">
				확인할 메시지가 없습니다.
			</c:if>
		</div>
	</div>
	<script>
		$(".msg-list tbody").on("click",".msgCont",function(){
			var msgNo=$(this).siblings().eq(0).children().val();
			var msgSender=$(this).siblings().eq(1).text();
			var msgDate=$(this).siblings().eq(2).text();
			var msgCont=$(this).siblings().eq(3).text();
			$("#readMessageNo").text(msgNo);
			$("#readSender").val(msgSender);
			$("#readMessageDate").val(msgDate);
			$("#readMessageContent").text(msgCont);
			if($(".msg-content").attr("hidden")){
				$(".msg-content").attr("hidden",false);
			}
		})			

		function deleteMsg(messageNo){
			var msgNo=messageNo;
			location.href='deleteMsg.bo?messageNo='+msgNo;
		}
		
		$(".page-link").on("click",function(){
			var pageNo=$(this).text();
			
		})
		function prev(){
			$.ajax({
				
			})
		}
		function next(){
			
			$.ajax({
				
			})
		}
	</script>
</body>
</html>