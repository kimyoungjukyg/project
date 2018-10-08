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

<title>상세보기</title>
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
	<form action="modify" method="post">
	<table border="1">
		<input type="hidden" name="rid" value="${gesipanview.rid}">
		<tr><td>글번호</td>
			<td>${gesipanview.rid}</td></tr>
		<tr><td>조회수</td>
			<td>${gesipanview.rhit}</td></tr>
		<tr><td>작성자</td>
			<td>${gesipanview.rname}</td></tr>
		<tr><td>글제목</td>
			<td>${gesipanview.rtitle}</td></tr>
		<tr><td>글내용</td>
			<td>${gesipanview.rcontent}</td></tr>
		<tr>
		
		
		<tr><td>첨부파일</td>
			<td><img src="uploadFile/${gesipanview.rfilename}" width="300"/></td></tr>
		<tr>
		<tr><td>동영상!</td>
			<td>${gesipanview.videourl}</td>
			</tr>
		
		<tr>
	
		
			<td colspan="2">
			<a href="gesipanmodify?Rid=${gesipanview.rid}">수정</a> &nbsp;&nbsp;
			<a href="RgesipanList">목록보기</a> &nbsp;&nbsp;
			<a href="gesipandelete?Rid=${gesipanview.rid}">삭제</a> &nbsp;&nbsp;
			</td>
		</tr>
	</table>
	</form>
	<h3>댓글을 달아봅시다</h3>
	<form action="Gesipanreply" method ="post">
	<table border="1">
	<tr>
	
	<td>글작성자</td>
	<td><input type="text" name="cwriter" required="required"  value="<%=session.getAttribute("session_id")%>" readonly></td>	
	</tr>
	<tr>
	<input type="hidden" name="Rid" value="${gesipanview.rid}">
	<td><input type="text" name="ccontent" required="required" style="text-align:center; width:200px; height:50px;" "placeholder="내용을입력하거라 애송이"></td>
	<td><input type="submit" value="댓글달기"></td>
	</tr>
	</table>
	</form>
	<br>
	<br>
	<br>
	
	
	<h3>댓글창</h3>
	<table>
	<c:forEach var="reply" items="${replyView}">
	<input type="hidden" name="Cid" value="${reply.cid}">
	<tr>
	<td>글작성자:${reply.cwriter}<a href="ReplyLike?Cid=${reply.cid}">좋아용!</a>:${reply.tolike}</td>
	</tr>
	<tr>
	<td>내용:${reply.ccontent}</td>
	</tr>
		</c:forEach>
	</table>
	
	
	 <input type="button" value="뒤로가기" class="btn btn-warning" onclick="location.href=history.go(-1)">
	 
	 
	 
	 </div></div>
	 
	 
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
      <img src="img/q.png" width="20"height="20"></c:when>
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
												<li><a href="board">운동법</a></li>
												<li><a href="foodlist">레시피</a></li>
												
											</ul>
										</li>
										<li>
											<span class="opener">PT</span>
											<ul>
												<li><a href="pton">개설 강의</a></li>
												<li><a href="ptoff">강의 취소</a></li>
												
											</ul>
										</li>
										<li><a href="find">Sapien Mauris</a></li>
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