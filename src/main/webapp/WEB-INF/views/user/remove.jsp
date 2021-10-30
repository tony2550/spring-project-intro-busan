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
						<a href="/" class="breadcrumb">홈</a> 
						<a href="/member/remove" class="breadcrumb">회원탈퇴</a>
					</div>
				</div>
			</nav>
			<!-- end of Breadcrumbs -->


			<!-- Forms -->
			<div class="row">
				<h4 class="center-align">회원탈퇴</h4>
				<hr style="margin-bottom: 50px;">

				<form id="frm" class="col s12 l6 offset-l3" action="/user/remove" method="post" >
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
							회원탈퇴하기 <i class="material-icons right">directions_run</i>
						</button>
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
	<script>
		var frm = document.querySelector('#frm'); // 한 개의 폼 태그를 오브젝트로 리턴
		
		 // 자바스크립트에선 함수 정의 자체가 값이 될 수 있음
		frm.addEventListener('submit', function(event){ // submit 버튼이 눌러지면 함수가 호출됨
			// 기본동작이 있는 대표적인 태그 2개 : a태그, form태그
			event.preventDefault();// 기본동작 막기(사용자에게 물어보고 탈퇴를 진행하기 위함)
			
			var isRemove = confirm('정말 회원탈퇴 하시겠습니까?'); // true면 삭제
			
			if(!isRemove){ // isRemove == false
				return; // 삭제 안하겠다면 그냥 종료
			}
			
			frm.submit();
		}); 
	</script>
</body>

</html>




















