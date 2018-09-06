<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border=1>
		<tr align=center>
			<td colspan=2>회원정보</td>
		</tr>
		<tr align=center>
			<td>아이디 : ${viewMember.id}</td>
			<td>비밀번호 : ${viewMember.password}</td>
			<td>이름 : ${viewMember.name}</td>
			<td>나이 : ${viewMember.age}</td>
			<td>성별 : ${viewMember.gender}</td>
			<td>이메일 : ${viewMember.email}</td>
			<a href="memberList">리스트로 돌아가기</a>
		</tr>
	</table>
</body>
</html>