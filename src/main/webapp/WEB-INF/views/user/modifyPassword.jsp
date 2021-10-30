<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
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
						<a href="/" class="breadcrumb">홈</a> <a href="/member/modify" class="breadcrumb">회원정보수정</a>
					</div>
				</div>
			</nav>
			<!-- end of Breadcrumbs -->


			<!-- Forms -->
			<div class="row">
				<h4 class="center-align">회원정보수정</h4>
				<hr style="margin-bottom: 50px;">

				<form id="frm" class="col s12 l6 offset-l3" action="/user/modifyValid" method="post">
					<div class="row">
						<div class="input-field col s12">
							<i class="material-icons prefix">assignment_ind</i>
							<input type="text" id="username" class="validate" name="username" value="${user.username }" disabled>
							<label for="username">아이디</label>
						</div>
					</div>
					<div class="row">
						<div class="input-field col s12">
							<i class="material-icons prefix">lock</i>
							<input type="password" id="password" class="validate" name="password">
							<label for="password">비밀번호</label>
						</div>
					</div>


					<div class="row center-align">
						<button type="submit" class="btn waves-effect waves-light">
							본인 확인하기 <i class="material-icons right">directions_run</i>
						</button>
					</div>

					<div class="row">
						<blockquote>
							비밀번호 입력하여 본인 인증 후<br> 회원정보 수정이 가능합니다.
						</blockquote>
					</div>

				</form>
			</div>
			<!-- end of Forms -->

		</div>
		<!-- end of Container -->


		<!-- Footer -->
		<%--include footer.jsp --%>
		<jsp:include page="/WEB-INF/views/include/footer.jsp" />
		<!-- end of Footer -->

	</div>
	<!-- end of App -->


	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
	<script>
		const sideNav = document.querySelector('.sidenav');
		M.Sidenav.init(sideNav, {});
	</script>
	
</body>

</html>




















