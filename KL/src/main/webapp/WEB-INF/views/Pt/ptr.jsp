<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
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
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">




   
<title>PT결제</title>
</head>
<body id="page-top">
<form action="ptpay" method="post">      
<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
								<header id="header">
									<a href="testtama" class="logo"><strong>KL</strong> project</a>
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
										<h2>PT 결제</h2>
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
             
             
         
            <div class="resume-item d-flex flex-column flex-md-row mb-5">

<input type="button" value="결제하기" onclick="javascript:doShow()" id="button1" class="byn btn-secondary">
       
</div> 
   
     <div id="aa" style="display:none">
    결제방식: 
    <input type="radio" name="paytype" id="paytype1" value="1" onclick="div_OnOff(this.value,'con');" class="byn btn-secondary">
    <label for="paytype1">카드</label>
     <input type="radio" name="paytype" id="paytype2" value="2" onclick="div_OnOff(this.value,'con');" class="byn btn-secondary">
    <label for="paytype1">통장 송금</label>
    <div id="con" style="display:none">
    <h3>카드 결제</h3>
     
        
      <select name="cardnum">
       
          <option value="" selected>등록카드선택</option>
           <c:forEach var="card" items="${cardread}">
     
       <option value="${card.cardnum }" >${card.cardnum}</option>
         </c:forEach>
      </select> 
     
      <input type="button" class="byn btn-secondary" onclick="location.href='cardwrite?id=<%=session.getAttribute("session_id") %>'"value="카드등록">      
    <br>비밀번호 : <input type="password" onkeyup="passCheck()" id="pass1"name="password" maxlength="4"  class="form-control"><br>
     <input type="hidden" name="id" id="id" value="<%=session.getAttribute("session_id") %>">
          <input type="hidden" name="tranl" id="tranl" value="<%=session.getAttribute("id") %>">
                  <input type="hidden" name="title" id="title" value="<%=session.getAttribute("title") %>">
                  <input type="hidden" name="starttime" id="starttime" value="<%=session.getAttribute("start") %>">
                  <input type="hidden" name="endtime" id="endtime" value="<%=session.getAttribute("end") %>">
                   <input type="hidden" name="price" id="price" value="<%=session.getAttribute("price") %>">
     
<input type="submit" class="btn btn-default"  value="결제" >
      
    </div>
   <div id="con2" style="display:none" >
    <h2>통장결제</h2>
     <select name="caselist">
      <option value="" selected>등록통장</option>
      </select>
    </div>
    
    
    </div>
 
     </section>
          </div>
      
      </div>
								
									<!-- Sidebar -->
					<div id="sidebar">
						<div class="inner">

							

							<!-- Menu -->
								<nav id="menu">
									<header class="major">
										<h2>Menu</h2>
									</header>
									<ul>
		<c:choose>
      <c:when test="${nuMessage == 0}">새쪽지:${nuMessage}
      </c:when>
      <c:when test="${nuMessage != 0}">
      새쪽지:${nuMessage}
     <img src="img/q.png" width="13"height="13"></c:when>
      </c:choose>
										<li><a href="testtama">홈</a></li>
									 <%if(session.getAttribute("session_id")==null){%>
										<li><a href="login_join">로그인/회원가입</a></li>
										  <%}else if(session.getAttribute("session_id").equals("admin")){ %>
           									<li><a href="adminpage">관리자</a></li>
          
          									<%}else{ %>
         							 <li> <a  href="mypage">마이페이지</a></li>
          									 <%} %>
          								
										<li><a href="video">운동영상</a></li>
									
										<li>
											<span class="opener">정보 공유</span>
											<ul>
												<li><a href="#">운동법</a></li>
												<li><a href="#">레시피</a></li>
												
											</ul>
										</li>
										<li>
											<span class="opener">PT</span>
											<ul>
												<li><a href="pton">개설 강의</a></li>
												<li><a href="#">강의 취소</a></li>
												
											</ul>
										</li>
										<li><a href="#">Sapien Mauris</a></li>
										<li><a href="#">Amet Lacinia</a></li>
									</ul>
								</nav>

							

							<!-- Section -->
								<section>
									<header class="major">
										<h2>관리자정보</h2>
									</header>
									<p>홈페이지 관리자 정보 입니다. 문의할 내용은 해당 정보로 해주시기 바랍니다.</p>
									<ul class="contact">
										<li class="fa-envelope-o">kyg7414@gmail.com</li>
										<li class="fa-phone">(010) 0000-0000</li>
										<li class="fa-home">찾아서 머하실라고요<br />
										경기도, TN 00000-0000</li>
									</ul>
								</section>

							<!-- Footer -->
								<footer id="footer">
									<p class="copyright">&copy; KL create here <a href="https://unsplash.com">Thank you</a> come <a href="https://html5up.net">here</a>.</p>
								</footer>

						</div>
					</div>
								
								</div>
								
								

</form>  
		 <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for this template -->
    <script src="js/resume.min.js"></script>
    <script src="http://code.jquery.com/jquery-latest.js"></script> 						
								
								
								 <!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
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