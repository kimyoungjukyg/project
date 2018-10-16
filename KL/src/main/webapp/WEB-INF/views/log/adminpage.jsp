<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html>
<head>
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
<meta charset="UTF-8">
<title>관리자 페이지</title>
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" /></head>
 <!-- Bootstrap core CSS -->

    <!-- Custom styles for this template -->
<body>
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
										<li><a class="icon fa-medium"><span class="label">Medium</span></a></li>
									</ul>
								</header>



<!-- Section -->
								<section>
									<header class="major">
										<h2>admin page</h2>
									</header>
									<div class="features">
										<article>
											
				<div class="content">
		
       <div class="resume-item d-flex flex-column flex-md-row mb-5">
		<section>
									<header class="major">
									
									</header>
									<p>홈페이지 관리자 정보 입니다. 문의할 내용은 해당 정보로 해주시기 바랍니다.</p>
							 		<ul class="contact">
										<li class="fa-envelope-o">kyg7414@gmail.com</li>
										<li class="fa-phone">(010) 0000-0000</li>
										<li class="fa-home">찾아서 머하실라고요<br />
										경기도, TN 00000-0000</li>
									</ul>
								</section>
		
		
		</div>
		  <button type="button" class="byn btn-secondary" onclick="location.href='messageForm?id=<%= session.getAttribute("session_id")%>'">쪽지함</button>
         <button type="button" class="byn btn-secondary" onclick="location.href='email'">회원들에게 메일보네기 </button>
             <button type="button" class="byn btn-secondary" onclick="location.href='memberList'">회원목록보기</button> 
 <button type="button" class="byn btn-secondary" onclick="location.href='logout'">로그아웃 </button>
	
											</div>
										</article>
									
									</div>
								</section>
</div>
	</div>
		<!-- Sidebar -->
					<div id="sidebar">
						<div class="inner">

							<!-- Search -->
								<div style="inherited:no;">
								
<gcse:search></gcse:search>
						</div>

							<!-- Menu -->
								<nav id="menu">
									<header class="major">
										<h2>Menu</h2>
									</header>
									<ul>
							<%if(session.getAttribute("session_id")==null){%>
  
   <%}else{ %>
  <c:choose>
      <c:when test="${nuMessage == 0}">새쪽지:${nuMessage}
      </c:when>
      <c:when test="${nuMessage != 0}">
      새쪽지:${nuMessage}
     <img src="img/q.png" width="13"height="13"></c:when>
      </c:choose>
    <%} %>
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
												<li><a href="board">운동법</a></li>
												<li><a href="foodlist">레시피</a></li>
												
											</ul>
										</li>
										<li>
											<span class="opener">PT</span>
											<ul>
												<li><a href="pton">개설 강의</a></li>
													  <%if(null==session.getAttribute("session_id")){ %>
               <%}else{ %>
												<li><a href="ptoff">등록강의</a></li>
												<%} %>
												
											</ul>
										</li>
										<li><a href="find">찾아오는 길</a></li>
									</ul>
								</nav>

						


							<!-- Footer -->
								<footer id="footer">
									<p class="copyright">&copy; KL create here <a href="https://unsplash.com">Thank you</a> come <a href="https://html5up.net">here</a>.</p>
								</footer>

						</div>
					</div>

 </div>
 <!-- Tocplus 15.1 -->
	<%if(session.getAttribute("session_id")=="admin"||session.getAttribute("session_id")=="null"){%>
<%}else{%>
								<script type="text/javascript">
							
								tocplusTop=1150;
tocplusLeft=5;
tocplusMinimizedImage='img/test.jpg';
tocplusHAlign='right';
tocplusWidth=250;
tocplusHeight=350;
tocplusUserName='${session_id}';
tocplusFrameColor='#ff2d3f';
tocplusFloatingWindow=true;
var tocplusHost = (("https:" == document.location.protocol) ? "https://" : "http://");
document.write(unescape("%"+"3Cscript src='" + tocplusHost + "kr07.tocplus007.com/chatLoader.do?userId=whddus19' type='text/javascript'"+"%"+"3E"+"%"+"3C/script"+"%"+"3E"));

</script>
<%}%>
<!-- End of Tocplus -->
     <!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
     
  
</body>
</html>