<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글등록</title>
<style type="text/css">
td, tr {
	text-align: left;
	border: 1px solid black;
}

#sub {
	text-align: center;
}
</style>
</head>
<body>
	<h2>게시판글등록</h2>
	<form action="Rgesipanwrite" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td>목록분류</td>
				<td>
				<select name= "Rtype" id="Rtype">
				<option value="레시피">레시피</option>
				<option value="운동기구">운동기구</option>
				</select>
				</td>
			</tr>
			<tr>
				<td>글쓴이</td>
				<td><input type="text" name="Rname" value="<%=session.getAttribute("session_id") %>" readonly ></td>
			</tr>
			<tr>
				<td>제 목</td>
				<td><input type="text" name="Rtitle" required="required"></td>
			</tr>
			<tr>
				<td>내 용</td>
				<td><textarea rows="20" cols="50" name="Rcontent"
						required="required"></textarea></td>
			</tr>
			<tr>
				<td>파일 첨부</td>
				<td><input type="file" name="rfile"></td>
			</tr>
			<tr>
				<td>동영상 첨부</td>
				<td><input type="text" name="videourl">(유튜브소스복사해서 붙여주세요!)</td>
			</tr>
			<tr>
				<td colspan="2" id="sub"><input type="submit" value="등록">
				 <input type="button" value="뒤로가기" class="btn btn-warning" onclick="location.href=history.go(-1)">
					<input type="reset" value="다시쓰기"></td>
			</tr>
		</table>
	</form>
</body>