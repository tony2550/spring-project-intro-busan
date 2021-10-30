<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
<c:choose>
	<c:when test="${ isIdDup eq true }">
		<p>아이디 중복, 사용중인 아이디입니다.</p>
	</c:when>
	<c:otherwise>
		<p>사용가능한 아이디입니다.</p>
		<button type="button" id="btnUseId">아이디 사용</button>
	</c:otherwise>
</c:choose>	
	

</body>
</html>























