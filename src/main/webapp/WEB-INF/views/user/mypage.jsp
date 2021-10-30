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
						<a href="/" class="breadcrumb">홈</a> <a href="/member/modify"
							class="breadcrumb">마이페이지</a>
					</div>
				</div>
			</nav>
			<!-- end of Breadcrumbs -->


			<!-- Forms -->
			<div class="row">
				<h4 class="center-align">마이페이지</h4>
				<hr style="margin-bottom: 50px;">
				<div class="col s12 l6 offset-l3">
					<div class="row">
						<div class="card-content">
							<label style="float: left; font-size: 20px;" for="username">아이디&nbsp;</label>
							<p style="font-size: 20px">${user.username }</p>
						</div>
					</div>
					<div class="row">
						<div class="card-content">
							<label style="float: left; font-size: 20px;" for="username">나이&nbsp;</label>
							<p style="font-size: 20px">${user.age }0대</p>
						</div>
					</div>
					<div class="row">
						<div class="card-content">
							<label style="float: left; font-size: 20px;" for="username">성별&nbsp;</label>
							<p style="font-size: 20px">
							<c:choose>
								<c:when test="${user.gender eq 'M'}">
									<p style="font-size: 20px">남성</p>
								</c:when>
								<c:otherwise>
									<p style="font-size: 20px">여성</p>
								</c:otherwise>
							</c:choose>
							</p>
						</div>
					</div>
					<div class="row">
						<div class="card-content">
							<label style="float: left; font-size: 20px;" for="username">email&nbsp;</label>
							<p style="font-size: 20px">${user.email }</p>
						</div>
					</div>
					<div class="row">
						<div class="card-content">
							<p style="font-size: 20px"><a href="/user/modify">회원정보 수정하기</a></p>
						</div>
					</div>
					<div class="row">
						<div class="card-content">
							<p style="font-size: 20px"><a href="/user/loveList">찜한 목록 보러가기</a></p>
						</div>
					</div>
					<div class="row">
						<div class="card-content">
							<p style="font-size: 20px"><a href="/user/remove">회원 탈퇴하기</a></p>
						</div>
					</div>
				</div>
			</div>
			<!-- form태그를 div로 바꿧음 -->

		</div>
		<!-- end of Container -->


		<!-- Footer -->
		<%--include footer.jsp --%>
		<jsp:include page="/WEB-INF/views/include/footer.jsp" />
		<!-- end of Footer -->

	</div>
	<!-- end of App -->



	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
	<script>
		const sideNav = document.querySelector('.sidenav');
		M.Sidenav.init(sideNav, {});

		var textNeedCount = document.querySelectorAll('#member_id, #password');
		M.CharacterCounter.init(textNeedCount);
	</script>
</body>

</html>