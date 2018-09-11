<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script> 
<script> 
function doShow() { 
    if ($('#aa').is(":visible")) { 
        $('#aa').hide(); // id값을 받아서 숨기기 
        $('.bb').hide(); // 클래스값을 받아서 숨기기 
        $('#button1').text('결제취소'); 
    } else { 
        $('#aa').show(); // id값을 받아서 보이기 
        $('.bb').show(); // 클래스값을 받아서 보이기 
        $('#button1').text('결제하기'); 
    } 
} 
</script> 


</head>
<body>
  
      <h2>결제확인</h2>

신청자:<%=session.getAttribute("session_id") %><br>
강의이름: ${ptr.title}<br>

트레이너: ${ptr.id}<br>

시작시간: ${ptr.starttime }<br>

종료시간: ${ptr.endtime }<br>
가격: ${ptr.price }<br>
	



<input type="button" value="결제하기" onclick="javascript:doShow()" id="button1">
    <div id="aa" style="display:none">
    결제방식: 
    <input type="radio" name="paytype" id="paytype1" value="1" onclick="div_OnOff(this.value,'con');">
    <label for="paytype1">카드</label>
     <input type="radio" name="paytype" id="paytype2" value="2" onclick="div_OnOff(this.value,'con');">
    <label for="paytype1">통장 송금</label>
    <div id="con" style="display:none">
    <h2>카드 결제</h2>
      
      <select name="cardlist">
      <option value="" selected>등록카드선택</option>
       <c:forEach var="card" items="${cardread}">
       <option value="${card.cardnum }" >${card.cardnum}</option>
          </c:forEach>
      </select>
       
      <input type="button" onclick="location.href='cardwrite?id=<%=session.getAttribute("session_id") %>'"value="카드등록">
      
    </div>
   <div id="con2" style="display:none">
    <h2>통장결제</h2>
     <select name="caselist">
      <option value="" selected>등록통장</option>
      </select>
    </div>
    
    
    </div>
<script type="text/javascript">
function div_OnOff(v,id){
	if(v=="1"){
		
		document.getElementById(id).style.display="";
		div_OnOff2(v,con2);
	}else{
		
		document.getElementById(id).style.display="none";
		div_OnOff2(v,con2);
	}
	
}
function div_OnOff2(v,con2){
	if(v=="2"){
		
		document.getElementById(con2).style.display="";
		
	}else{
		
		document.getElementById(con2).style.display="none";
		
	}
	
}

</script>
 
 
 
</body>
</html>