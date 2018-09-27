<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>쪽지 쓰기폼</h2>
보내는넘 : ${session_id}
<form action="toMessage" method="post">
	<table border="1">
	<tr>
<td>받을사람 </td>
<td><input type="text" name="reader"></td>
</tr>
<td>내용</td>
<td><textarea type="text" style="resize: none;" name="content" rows="25" cols="30"></textarea>
</td>
</table>
<input type="hidden" name="writer" value="${session_id}">
<input type="hidden" name="id" value="${session_id}">
<input type="submit" value="전송">
</form>
</body>
</html>