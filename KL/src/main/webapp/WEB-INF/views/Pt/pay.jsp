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
    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
    	jQuery.ajax({
    		url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
    		type: 'POST',
    		dataType: 'json',
    		data: {
	    		imp_uid : rsp.imp_uid
	    		//기타 필요한 데이터가 있으면 추가 전달
    		}
    	}).done(function(data) {
    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
    		if ( everythings_fine ) {
    			var msg = '결제가 완료되었습니다.';
 
    			alert(msg);
    			location.href='ptpay?id=<%=session.getAttribute("session_id")%>&tranl=<%=session.getAttribute("id")%>&title=<%=session.getAttribute("title")%>&starttime=<%=session.getAttribute("start")%>&endtime=<%=session.getAttribute("end")%>&price=<%=session.getAttribute("price")%>';
    			
    		} else {
    			//[3] 아직 제대로 결제가 되지 않았습니다.
    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
    		}
    	});
    } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;
        
        alert(msg);
    }
});

</script>


<body id="page-top">
     
<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
								<header id="header">
									<a href="" class="logo"><strong>KL</strong> project</a>
									<ul class="icons">
										<li><a  class="icon fa-twitter"><span class="label">Twitter</span></a></li>
										<li><a  class="icon fa-facebook"><span class="label">Facebook</span></a></li>
										<li><a  class="icon fa-snapchat-ghost"><span class="label">Snapchat</span></a></li>
										<li><a  class="icon fa-instagram"><span class="label">Instagram</span></a></li>
										<li><a  class="icon fa-medium"><span class="label">Medium</span></a></li>
									</ul>
								</header>
									<section>
									<header class="major">
										<h2>결제 확인서</h2>
									</header>
								
		 <div class="resume-item d-flex flex-column flex-md-row mb-5">								
	 <div class="resume-content mr-auto">
              <h3 class="mb-0">신청자:</h3>
            </div>
<div class="resume-date text-md-right">
              <span class="text-primary"><%=session.getAttribute("session_id") %></span>
           
            </div>
           </div>
            <div class="resume-item d-flex flex-column flex-md-row mb-5">
             <div class="resume-content mr-auto">
              <h3 class="mb-0">강의이름:</h3>
            </div>
<div class="resume-date text-md-right">
              <span class="text-primary"><%=session.getAttribute("title") %></span>
       
            </div>
             </div>
            <div class="resume-item d-flex flex-column flex-md-row mb-5">
             <div class="resume-content mr-auto">
              <h3 class="mb-0">트레이너:</h3>
            </div>
<div class="resume-date text-md-right">
              <span class="text-primary"><%=session.getAttribute("id") %></span>
             
            </div>
             </div>
            <div class="resume-item d-flex flex-column flex-md-row mb-5">
             <div class="resume-content mr-auto">
              <h3 class="mb-0">시작시간:</h3>
            </div>
<div class="resume-date text-md-right">
              <span class="text-primary"><%=session.getAttribute("start") %></span>
       
            </div> </div>
            <div class="resume-item d-flex flex-column flex-md-row mb-5">
             <div class="resume-content mr-auto">
              <h3 class="mb-0">종료시간:</h3>
            </div>
<div class="resume-date text-md-right">
              <span class="text-primary"><%=session.getAttribute("end") %></span>
              
            </div> </div> 
            <div class="resume-item d-flex flex-column flex-md-row mb-5">
             <div class="resume-content mr-auto">
              <h3 class="mb-0">가격:</h3>
            </div>
<div class="resume-date text-md-right">
              <span class="text-primary"><%=session.getAttribute("price")+"원" %></span>
              
            </div>
        
             </div>
             <form action="ptpay" method="post">     
            <input type="hidden" name="id" id="id" value="<%=session.getAttribute("session_id") %>">
          <input type="hidden" name="tranl" id="tranl" value="<%=session.getAttribute("id") %>">
                  <input type="hidden" name="title" id="title" value="<%=session.getAttribute("title") %>">
                  <input type="hidden" name="starttime" id="starttime" value="<%=session.getAttribute("start") %>">
                  <input type="hidden" name="endtime" id="endtime" value="<%=session.getAttribute("end") %>">
                   <input type="hidden" name="price" id="price" value="<%=session.getAttribute("price") %>">
     
<input type="submit" class="btn btn-default"  value="등록하기" >
</form>
             </section>
             </div>
             </div>
             	
             </div>
</body>
</html>