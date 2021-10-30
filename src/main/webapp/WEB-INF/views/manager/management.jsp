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
							class="breadcrumb">고객관리</a>
					</div>
				</div>
			</nav>
			<!-- end of Breadcrumbs -->


			<!-- Forms -->
			<div class="row">
				<h4 class="center-align">고객관리</h4>
				<hr style="margin-bottom: 50px;">
				<div class="col s12 l6 offset-l3">
					<div class="row">
						<!-- Table -->
						<table class="highlight responsive-table ">
							<thead class="blue white-text">
								<tr>
									<th class="center-align">ID</th>
									<th class="center-align">이름</th>
									<th class="center-align">나이</th>
									<th class="center-align">성별</th>
									<th class="center-align">E-mail</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${users }" var="user">
									<tr onclick="location.href='/manager/manageDetail?username=${user.username}'">
										<td class="center-align">${ user.id }</td>
										<td class="center-align">${ user.username }</td>
										<td class="center-align">${ user.age }</td>
										<td class="center-align">${ user.gender }</td>
										<td class="center-align">${ user.email }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<!-- end of Table -->
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