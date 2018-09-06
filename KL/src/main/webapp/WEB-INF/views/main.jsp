<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	main.jsp
	<h3>세션 아이디 : ${sessionScope.session_id}</h3>
	<!-- MemberService -->
	<h3>${loginMember.id}로로그인하셨습니다.</h3>
	<a href="logout">로그아웃</a>
	<br>
	<c:if test="${loginMember.id eq 'admin'}">
		<a href="memberList">관리자모드 접속(회원 목록 보기)</a>
		<br>
	</c:if>

</body>
</html>