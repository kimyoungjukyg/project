<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
신청자:<%=session.getAttribute("session_id") %><br>
강의이름: ${ptr.title}<br>
트레이너: ${ptr.id}<br>
시작시간: ${ptr.starttime }<br>
종료시간: ${ptr.endtime }<br>
가격: ${ptr.price }<br>
</body>
</html>