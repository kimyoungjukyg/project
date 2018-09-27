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
새쪽지:${nuMessage}
<h2>보낸 쪽지함</h2>
<table border="1">
	<c:forEach items="${message}" var ="me">
	<tr>
		<td>쪽지 번호 : ${me.message_num}</td>
		<td>받은 사람 : ${me.reader}</td>
		<td>내용 : ${me.content}</td>
		<td>보낸 시간 : ${me.message_date}</td>
	</tr>
	</c:forEach>
	 <tr>
		<td colspan="5"><a href="messageWriteForm?id=${session_id}">쪽지 쓰기</a></td>
		<td colspan="5"><a href="mymessage?id=${session_id}">받은 쪽지함</a></td>
	</tr>
</table>
</body>
</html>