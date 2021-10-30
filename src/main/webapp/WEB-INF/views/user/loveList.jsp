<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
</head>

<body>
	<!-- App -->
	<div id="app">

		<%-- include header.jsp --%>
		<jsp:include page="/WEB-INF/views/include/header.jsp" />


		<div class="container">
			<!-- Breadcrumbs -->
			<nav>
				<div class="nav-wrapper cyan">
					<div class="col s12">
						<a href="/" class="breadcrumb">홈</a> 
						<a href="/user/loveList" class="breadcrumb">내가 좋아요한 목록</a>
					</div>
				</div>
			</nav>
			<!-- end of Breadcrumbs -->


			<div class="row">
				<h4 class="center-align">내가 좋아요한 목록</h4>
				<hr style="margin-bottom: 50px;">
				<div class="col s12 l6 offset-l3">
					<div class="row">
						<div class="card-content">
							<c:choose>
								<c:when test="${not empty loveList}">
									<c:forEach items="${loveList}" var="love">
										<label style="float: left; font-size: 20px;" for="love">🤍&nbsp;</label>
										<p style="font-size: 20px">
											<a href="/restaurant/detail/${love.rid }">${love.name}</a>
											<button type="button" style="float: right;" onclick="location.href='/user/deleteFromList/${love.rid}'">삭제</button>
										</p>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<p align="center" style="font-size: 20px;">좋아요 내역이 없습니다.</p>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
			<!-- end of Container -->
		</div>

		<!-- Footer -->
		<%--include footer.jsp --%>
		<jsp:include page="/WEB-INF/views/include/footer.jsp" />
		<!-- end of Footer -->

	</div>
	<!-- end of App -->



	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
	
		
	<script>
		const sideNav = document.querySelector('.sidenav');
		M.Sidenav.init(sideNav, {});

		var textNeedCount = document.querySelectorAll('#member_id, #password');
		M.CharacterCounter.init(textNeedCount);
	</script>
</body>

</html>