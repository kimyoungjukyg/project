<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="cardlist" method="POST">

<input type="hidden" name="id" value="<%=session.getAttribute("session_id") %>">
카드번호:<input type="text" name="cardnum" id="cardnum" required> <button onclick="card()" >카드형식확인</button><br>
비밀번호:<input type="text" name="password"><br>


<input type="submit" value="등록" >

</form>
<script type="text/javascript">
function card(){
	var pwReg = /^(?=.*[a-zA-Z])(?=.*[0-9]).{16,16}$/;

	if (pwReg.test(cardnum)) {
	return true;
	} else {
		alert("카드번호는16자리입니다.")
	    return false;
	}
}
</script>
</body>
</html>