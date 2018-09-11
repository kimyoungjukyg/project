<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%=session.getAttribute("session_id") %>
<c:forEach var="pt" items="${callender}">
${pt.title},${pt.id},${pt.starttime },${pt.endtime },${pt.count} }
<input type="hidden" name="title" value="${pt.title}">
<input type="hidden" name="id" value="${pt.id}">
<input type="hidden" name="starttime" value="${pt.starttime}">
<input type="hidden" name="endtime" value="${pt.endtime}">
 <button type="submit" class="byn btn-secondary" onclick="location.href='ptr?log=${pt.log}'" >신청</button><br>

</c:forEach>

</body>
</html>