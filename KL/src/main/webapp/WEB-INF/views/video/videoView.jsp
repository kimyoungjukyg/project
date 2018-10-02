<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="modify" method="post">
		<table border="1">
			<input type="hidden" name="exe_Num" value="${videoView.exe_Num}">
			<tr>
				<td>글번호</td>
				<td>${videoView.exe_Num}</td>
			</tr>
			<tr>
				<td>조회 수</td>
				<td>${videoView.exe_Ehits}</td>
			</tr>
			<tr>
				<td>좋아요 수</td>
				<td>${videoView.exe_Likecount}</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>${videoView.id}</td>
			</tr>
			<tr>
				<td>글제목</td>
				<td>${videoView.exe_Name}</td>
			</tr>
			<tr>
				<td>글내용</td>
				<td><iframe width="1280" height="720"
						src="https://www.youtube.com/embed/${videoView.youtube_id}"
						frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
				</td>

			</tr>
			<tr>
				<td colspan="2">
					<!-- <a href="gesipanmodify?Rid=${gesipanview.rid}">수정</a> -->
					&nbsp;&nbsp; <a href="/video">목록보기</a> &nbsp;&nbsp; <a
					href="videoDelete?exe_Num=${videoView.exe_Num}">삭제</a> &nbsp;&nbsp;
					<a
					href="videoLike?exe_Num=${videoView.exe_Num}">좋아요</a>
					
				</td>
			</tr>
		</table>
	</form>
	<%--<h3>댓글을 달아봅시다</h3>
	<form action="Gesipanreply" method="post">
		<table border="1">
			<tr>
				<td>글작성자</td>
				<td><input type="text" name="cwriter" required="required"></td>
			</tr>
			<tr>
				<input type="hidden" name="Rid" value="${gesipanview.rid}">
				<td><input type="text" name="ccontent" required="required"
					style="text-align: center; width: 200px; height: 50px;"
					"placeholder="내용을입력하거라 애송이"></td>
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
			<input type="hidden" name="Cid" value="${reply.cid}">
			<tr>
				<td>글작성자:${reply.cwriter}<a href="ReplyLike?Cid=${reply.cid}">좋아용!</a>:${reply.tolike}
				</td>
			</tr>
			<tr>
				<td>내용:${reply.ccontent}</td>
			</tr>
		</c:forEach>
	</table>
--%>
 <input type="button" value="뒤로가기" class="btn btn-warning" onclick="location.href=history.go(-1)">
</body>
</html>