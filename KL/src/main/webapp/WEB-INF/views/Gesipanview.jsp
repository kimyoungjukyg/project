<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="modify" method="post">
	<table border="1">
		<input type="hidden" name="rid" value="${gesipanview.rid}">
		<tr><td>글번호</td>
			<td>${gesipanview.rid}</td></tr>
		<tr><td>조회수</td>
			<td>${gesipanview.rhit}</td></tr>
		<tr><td>작성자</td>
			<td>${gesipanview.rname}</td></tr>
		<tr><td>글제목</td>
			<td>${gesipanview.rtitle}</td></tr>
		<tr><td>글내용</td>
			<td>${gesipanview.rcontent}</td></tr>
		<tr>
			<td colspan="2">
			<a href="gesipanmodify?Rid=${gesipanview.rid}">수정</a> &nbsp;&nbsp;
			<a href="RgesipanList">목록보기</a> &nbsp;&nbsp;
			<a href="gesipandelete?Rid=${gesipanview.rid}">삭제</a> &nbsp;&nbsp;
			</td>
		</tr>
	</table>
	</form>
	<h3>댓글을 달아봅시다</h3>
	<form action="Gesipanreply" method ="post">
	<table border="1">
	<tr>
	<td>글작성자</td>
	<td><input type="text" name="cwriter" required="required"></td>	
	</tr>
	<tr>
	<input type="hidden" name="Rid" value="${gesipanview.rid}">
	<td><input type="text" name="ccontent" required="required" style="text-align:center; width:200px; height:50px;" "placeholder="내용을입력하거라 애송이"></td>
	<td><input type="submit" value="댓글달기"></td>
	</tr>
	</table>
	</form>
	<br>
	<br>
	<br>
	
	
	<h3>댓글창</h3>
	<table>
	<c:forEach var="reply" items="${replyView}">
	<tr>
	<td>글작성자:${reply.cwriter}</td>
	</tr>
	<tr>
	<td>내용:${reply.ccontent}</td>
	</tr>
	</c:forEach>
	</table>
	
	
	
</body>
</html>