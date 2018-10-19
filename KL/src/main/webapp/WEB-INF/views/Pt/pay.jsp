<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<meta charset="UTF-8">
<%@ page import="java.util.*" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>결제창</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<script>
	//검색부분
  (function() {
    var cx = '005390764898483465964:ppy_c337lam';
    var gcse = document.createElement('script');
    gcse.type = 'text/javascript';
    gcse.async = true;
    gcse.src = 'https://cse.google.com/cse.js?cx=' + cx;
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(gcse, s);
  })();
</script>
<script>
var IMP = window.IMP; // 생략가능
IMP.init('imp56235192'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

IMP.request_pay({

    pg : 'kakaopay',
    pay_method : 'card',
    merchant_uid : 'merchant_' + new Date().getTime(),
    
    name : '<%=session.getAttribute("title")%>',
    amount : '<%=session.getAttribute("price")%>',
    buyer_email : 'kyg7414@naver.com',
    buyer_name : '<%=session.getAttribute("session_id")%>',
    buyer_tel : '',
    buyer_addr : '',
    buyer_postcode : '123-456'
}, function(rsp) {
    if ( rsp.success ) {
    	var msg = '결제가 완료되었습니다.';
		location.href='ptpay?id=${ptr.id}&tranl=<%=session.getAttribute("id")%>&title=${ptr.title}&starttime=${ptr.starttime}&endtime=${ptr.endtime}&price=${ptr.price}';
		
    
    } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;
        
      
        location.href='pton';
    }
});

</script>


<body id="page-top">
     

</body>
</html>