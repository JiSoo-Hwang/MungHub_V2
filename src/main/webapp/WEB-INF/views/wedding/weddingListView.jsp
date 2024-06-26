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
<title>MUNGHUB 웨딩플래너 페이지입니다</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
<div class="content">
        <p>우리 강아지가 건강하고 행복한 모습으로 새 가족을 맞이할 수 있도록, MUNGHUB가 함께합니다.</p>
        <br>
        <select name="breed" id="breedList">
            <c:forEach var="b" items="${breedList}">
                <option value="${b.breedId}">${b.breedName}</option>
            </c:forEach>
        </select>
        <br><br>
        <c:choose>
        <c:when test="${loginUser.userId eq 'admin' }">
        <a href="admin.wd" class="btn btn-warning">서비스 신청한 강아지 조회하기</a>
        </c:when>
        <c:otherwise>
		<a href="insert.wd" class="btn btn-success">나의 강아지 등록하기</a>
        </c:otherwise>
        </c:choose>
        <br><br>
        <div class="row">
            <c:forEach items="${weddingList }" var="w">
                <div class="card" style="width:400px">
                    <img class="card-img-top" src="/pjtMungHub/${w.changeName }" alt="Card image" style="width:100%">
                    <div class="card-body text-center">
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
                <%-- <div class="col">
                    <img src="/pjtMungHub/${w.changeName }" class="img-thumbnail" alt="강아지사진" width="304" height="236">
                    <p>${w.breed} </p>
                    <p>${w.petName} </p>
                    <c:choose>
                        <c:when test="${w.gender == 'F'}">
                            공주님
                        </c:when>
                        <c:otherwise>
                            왕자님
                        </c:otherwise>
                    </c:choose>
                    <p>${w.gender} </p>
                    <!-- 강아지 사진, 강아지 견종, 강아지 이름, 강아지 성별 -->
        </div> --%>
        <!-- <div class="col">
				<img src="/pjtMungHub/resources/uploadFiles/kindergarten/css/dogPhotoIcon.png" alt="강아지 사진">
			</div>

			<div class="col">
				<img src="/pjtMungHub/resources/uploadFiles/kindergarten/css/dogPhotoIcon.png" alt="강아지 사진">
			</div> -->

<!--         <div class="col">
            <img src="/pjtMungHub/resources/uploadFiles/kindergarten/css/dogPhotoIcon.png" alt="강아지 사진">
        </div> -->
    </div>
    <script>
        $("img").click(function () {
        	var img = $(this);
            console.log(img);
        });
    </script>
</body>
</html>