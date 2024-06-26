<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
        .content {
            margin: 70px;
        }
        .card {
            margin: 20px;
        }
        img {
			width: 300px;
		}
</style>
<title>${loginUser.name}님의 댕댕이 웨딩플랜 신청 내역입니다</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
<div class="content">
        <div class="row">
            <c:forEach items="${weddingList }" var="w">
                <div class="card" style="width:400px">
                    <img class="card-img-top" src="/pjtMungHub/${w.changeName }" alt="Card image" style="width:100%">
                    <div class="card-body">
                        <h4 class="card-title">${w.petName}</h4>
                        <p class="card-text">${w.breed}</p>
                        <c:choose>
                            <c:when test="${w.gender == 'F'}">
                                <p>공주님 </p>
                            </c:when>
                            <c:otherwise>
                                <p>왕자님 </p>
                            </c:otherwise>
                        </c:choose>
                        <a href="detail.wd?weddingNo=${w.weddingNo }" class="btn btn-primary">상세보기</a>
                    </div>
                </div>
        </c:forEach>
        </div>
    </div>
    <script>
        $("img").click(function () {
        	var img = $(this);
            console.log(img);
        });
    </script>
</body>
</html>