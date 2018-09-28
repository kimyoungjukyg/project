<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		

    <!-- Custom fonts for this template -->
    <link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:500,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Muli:400,400i,800,800i" rel="stylesheet">
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">


<title>PT신청</title>
</head>
<body>
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
								<!-- Section -->
								<section>
									<header class="major">
										<h2>PT신청</h2>
									</header>
									<div class="features">
									
											
			
        
          

  
    
           <table class="table">
           <thead>
           <tr><th>강의 명</th>
           <th>트레이너 명</th>
           <th>시작 시간</th>
           <th>종료 시간</th>
           <th>신청자 수</th>
           <th>신청 버튼</th>
           </tr>
           <thead>
   <c:forEach var="pt" items="${callender}">
   <tr>
   <th>${pt.title}</th>
   <th>${pt.id}</th>
   <th>${pt.starttime }</th>
   <th>${pt.endtime }</th>
   <th>${pt.count}</th>
   <th><button type="submit" class="byn btn-secondary" onclick="location.href='ptr?log=${pt.log}&id=<%=session.getAttribute("session_id") %>'" >신청</button><br></th>
   </tr>   
            </c:forEach>

           
           </table>
        
          
        
          
											
										
									
									</div>
								</section>
								
								
								
								
								
								
								</div>
								</div>
									<!-- Sidebar -->
					<div id="sidebar">
						<div class="inner">

							<!-- Search -->
								<section id="search" class="alt">
									<form method="post" action="#">
										<input type="text" name="query" id="query" placeholder="Search" />
									</form>
								</section>

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
          								
										<li>
											<span class="opener">운동영상</span>
											<ul>
												<li><a href="#">Lorem Dolor</a></li>
												<li><a href="#">Ipsum Adipiscing</a></li>
												<li><a href="#">Tempus Magna</a></li>
												<li><a href="#">Feugiat Veroeros</a></li>
											</ul>
										</li>
									
										<li>
											<span class="opener">정보 공유</span>
											<ul>
												<li><a href="board">운동법</a></li>
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
								 <!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
     
</body>
</html>