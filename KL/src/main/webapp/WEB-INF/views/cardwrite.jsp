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
카드번호:<input type="text" name="cardnum" id="cardnum" placeholder="카드번호입력"  maxlength="19" required > <input type="button" onclick="card()" value="카드형식확인"><br>
비밀번호:<input type="text" name="password"  placeholder="비밀번호입력" maxlength="4"><br>


<input type="submit" value="등록" >

</form>
<script type="text/javascript">
function card(){
	var pwReg= /(\d{4}\-\d{4}\-\d{4}\-\d{4})/gm;  

	if (!pwReg.test(cardnum)) {
		alert("카드번호는 숫자16자리입니다.");
	    return false;
		
		
		}
	alert("사용가능합니다.");
	return true;


}

function autoHypen(str){
	str=str.replace(/[^0-9]/g,'');
	var tmp='';
	if(str.length<5){
		return str;
	}else if(str.length<9){
		tmp += str.substr(0,4);
		tmp += '-';
		tmp += str.substr(4);
		return tmp;
	}else if(str.length<14){
		tmp += str.substr(0,4);
		tmp += '-';
		tmp += str.substr(4,4);
		tmp += '-';
		tmp += str.substr(8);
		return tmp;
	}else{
	tmp += str.substr(0,4);
	tmp += '-';
	tmp += str.substr(4,4);
	tmp += '-';
	tmp += str.substr(8,4);
	tmp += '-';
	tmp += str.substr(12);
	return tmp;
	}
	
	return str;
} 
var cardnum=document.getElementById('cardnum');
cardnum.onkeyup=function(event){
	event=event || window.event;
	var _val=this.value.trim();
	this.value=autoHypen(_val);
}
</script>
</body>
</html>