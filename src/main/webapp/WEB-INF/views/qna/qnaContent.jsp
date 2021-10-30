<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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
						<a href="/qna/qnaBoard?pageNum=${ pageNum }" class="breadcrumb">게시판 글목록</a>
						<a href="/qna/content?id=${ qna.id }&pageNum=${ pageNum }" class="breadcrumb">게시판 글내용</a>
					</div>
				</div>
			</nav>
			<!-- end of Breadcrumbs -->



			<div class="row">
				<h4 class="center-align">게시판 글내용</h4>
				<hr style="margin-bottom: 50px;">
			</div>

			<div class="row">
				<div class="col s12 l8 offset-l2">
					<div class="card">
						<div class="card-content">
							<input type="hidden" id="id" name="id" value="${ qna.id }">
							<br />
							<div class="row">
								<div class="input-field col s12">
									<i class="material-icons prefix">assignment_ind</i>
									<input type="text" id="userId" name="userId" value="${ qna.userId }" readonly="readonly" />
									<label for="userId">아이디</label>
								</div>
							</div>
							<br />
							<div class="row">
								<div class="input-field col s12">
									<i class="material-icons prefix">subtitles</i>
									<input type="text" id="title" class="validate" name="title" value="${qna.title}" />
									<label for="title">제목</label>
								</div>
							</div>
							<br />
							<div class="row">
								<div class="input-field col s12">
									<i class="material-icons prefix">subject</i>
									<textarea id="content" class="materialize-textarea" name="content" value="${qna.content}"> ${qna.content}</textarea>
									<label for="content">내용</label>
								</div>
							</div>
						</div>
					</div>
				</div>


				<div class="row center-align">
					<div class="col s12 l8 offset-l2">
					
						<c:if test="${user.username eq qna.userId}">
							<div class="col s6 m3">
								<button type="button" id="btnUpdate" class="btn-large waves-effect waves-light">
									<i class="material-icons left">edit</i> 글수정
								</button>
							</div>
							<div class="col s6 m3">
								<button type="button" id="btnDelete" class="btn-large waves-effect waves-light">
									<i class="material-icons left">delete</i> 글삭제
								</button>
							</div>
						</c:if>


						<div class="col s6 m3">
							<a class="btn-large waves-effect waves-light" href="/qna/qnaBoard?pageNum=${ pageNum }">
								<i class="material-icons left">list</i> 글목록
							</a>
						</div>
					</div>
				</div>
				<br /> <br />



				<div align="right">
					<textarea rows="3" cols="50" id="msg"></textarea>
					<input type="button" value="댓글쓰기" class="btn btn-secondary  btn-sm" id="btnComment">
				</div>
				<hr />
				<div id="replyResult"></div>




				<div class="row">
					<div class="col s12 l8 offset-l2">
						<blockquote>
							[글수정] 버튼을 눌러서 현재 글을 수정할 수 있어요.<br> [글삭제] 버튼을 눌러서 현재 글을 삭제할 수 있어요.<br> [답글쓰기] 버튼을 눌러서 현재 글에 대한 답글을 등록할 수 있어요.<br> 글목록으로 가시려면 [글목록] 버튼을 누르세요.
						</blockquote>
					</div>
				</div>


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

		<script>
		/* 댓글 불러오기 */
		var init = function(){
			$.ajax({
				type:"get",
				url:"/reply/commentList",
				data:{"qnaId": ${qna.id}
			}
			})
			.done(function(resp){
				// Changes XML to JSON
				alert(resp)
				resp=JSON.parse(resp)
				var str = "";
				$.each(resp,function(key,val){

					str +=
					`<table>
						<tr>
							<th>아이디</th>
							<th>내용</th>
							<th>생성일자</th>
						</tr>

						<tr>
					`
											
						
					str += "<td>"+val.userId+"</td>"+" "
					str += "<td>"+val.content+"</td>" + " "
					str += "<td>"+val.regdate+"</td>" + " "
					str += "<td><a href='javascript:fdel("+val.id+")'>삭제</a></td><br/> "
					str += "</table>"
				})
				console.log(str)
				$("#replyResult").html(str);
			})
			
			
			.fail(function(resp){
				alert("실패");
			})
		}		
	
/* 		댓글쓰기 */   

	    $("#btnComment").click(function(){
	    	alert("눌렀음")
	    	/* if(${empty user}){
	    		alert("로그인하세요");
	    		location.href="user/login";
	    		return;
	    	} */
	    	
	    	if($("#msg").val()==""){
	    		alert("댓글을 적으세요");
	    		return;
	    	}
	    	data={
	    		"userId" : "${user.username}", 
	    		"qnaId": ${qna.id},
	    		"content":$("#msg").val()
	    		
	    	}
	    	$.ajax({
	    		type:"POST",
	    		url:"/reply/insert/",
	    		data : JSON.stringify(data),
	    		contentType:"application/json;charset=utf-8"
	    		
	    	})

	    	.done(function(){
	    		alert("댓글 추가 성공");
	    		location.reload();
	 	})
	    	
	    	.fail(function(){
	    		alert("댓글 추가 실패")
	    	})
	    })
		
/* 삭제 */		
    $("#btnDelete").click(function(){
    	/* alert("delete") */
    	alert(${qna.id})
    		$.ajax({
        		type :"DELETE",
        		url :"/qna/delete/"+${qna.id}
        		
        	})//ajax
        	.done(function(resp){
        		alert("성공")
        		location.href="/qna/qnaBoard"
        	})
    })

/* 	수정 */
    $("#btnUpdate").click(function(){
    	alert("update")
    	
    	var dataParam={
    		
    		"id" : $("#id").val(),
    		"title" : $("#title").val(),
    		"content" : $("#content").val()
    	}
    	$.ajax({
    		type :"PUT",
    		url :"/qna/modify",
    		data : JSON.stringify(dataParam),
    		contentType : "application/json;charset=utf-8"
    		
    	})//ajax
    	.done(function(resp){
    		alert("성공")
    		location.href="/qna/qnaBoard"
    		
    	})
    	.fail(function(resp){
    		alert("수정실패")

    	})
    	
    })
    
    //댓글 삭제
function fdel(id){
	//alert(cnum)
	alert(id)

	
	$.ajax({
		type:"delete",
		url:"/reply/delete/"+id
	})	

	.done(function(resp){
		alert(resp +"번 글 삭제 완료")
		init();
	})
	
		
	.fail(function(resp){
	alert("댓글 삭제 실패")
	
	})
}
init();
</script>
</body>

</html>