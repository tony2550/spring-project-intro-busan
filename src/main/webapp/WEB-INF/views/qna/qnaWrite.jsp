<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
						<a href="/qna/qnaBoard?pageNum=${ pageNum }" class="breadcrumb">핫스팟 목록</a>
						<a href="/qna/write" class="breadcrumb">핫스팟 목록추가</a>
					</div>
				</div>
			</nav>
			<!-- end of Breadcrumbs -->


			<!-- Forms -->
			<div class="row">
				<h4 class="center-align">핫스팟 목록추가 신청</h4>
				<hr style="margin-bottom: 50px;">

				<form class="col s12 l6 offset-l3" action="/qna/write" method="post" >
					<input type="hidden" name="pageNum" value="${ pageNum }">
					<input type="hidden" name="id" value="11<%-- ${ qna.id } --%>">
				
					<div class="row">
						<div class="input-field col s12">
							<i class="material-icons prefix">assignment_ind</i>
							<input type="hidden" id="userId" readonly name="userId" value="${ user.id }">
							<label for="userId">아이디</label>
						</div>
					</div>
					<div class="row">
						<div class="input-field col s12">
							<i class="material-icons prefix">subtitles</i>
							<input type="text" id="title" class="validate" name="title">
							<label for="title">제목</label>
						</div>
					</div>
					<div class="row">
						<div class="input-field col s12">
							<i class="material-icons prefix">subject</i>
							<textarea id="textarea1" class="materialize-textarea" name="content"></textarea>
							<label for="textarea1">내용</label>
						</div>
					</div>
					





					<div class="row center-align">
						<div class="col s12 l8 offset-l2">
							<div class="col s6">
								<button type="submit" class="btn-large waves-effect waves-light">
									<i class="material-icons left">file_upload</i> 새글 등록
								</button>
							</div>
							<div class="col s6">
								<a class="btn-large waves-effect waves-light" href="/board/qnaBoard?pageNum=${ pageNum }">
									<i class="material-icons left">list</i> 글목록
								</a>
							</div>
						</div>
					</div>

					<div class="row">
						<blockquote>
							[새글 등록] 버튼을 눌러서 새 글을 등록해 보세요.<br> 새글쓰기를 하지 않고 글목록으로 가시려면 [글목록] 버튼을 누르세요.
						</blockquote>
					</div>
				</form>
			</div>
			<!-- end of Forms -->


		</div>
		<!-- end of Container -->


		<!-- Footer -->
		<%-- include footer.jsp --%>
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






