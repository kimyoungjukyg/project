<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="assets/css/main.css" />
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
<title>Insert title here</title>
</head>
<body>
<div id="wrapper">
		<div id="main"> 
			<div class="inner">

				<!-- Header -->
				<header id="header">
					<a href="testtama" class="logo"><strong>KL</strong> project</a>
					<ul class="icons">
						<li><a class="icon fa-twitter"><span class="label">Twitter</span></a></li>
						<li><a class="icon fa-facebook"><span class="label">Facebook</span></a></li>
						<li><a class="icon fa-snapchat-ghost"><span class="label">Snapchat</span></a></li>
						<li><a class="icon fa-instagram"><span class="label">Instagram</span></a></li>
						<li><a class="icon fa-medium"><span class="label">Medium</span></a></li>
					</ul>
				</header>

				<form action="modify" method="post">
					<table border="1">
						<input type="hidden" name="exe_Num" value="${videoView.exe_Num}">
						<tr>
							<td>글번호</td>
							<td>${videoView.exe_Num}</td>
						</tr>
						<tr>
							<td>조회 수</td>
							<td>${videoView.exe_Ehits}</td>
						</tr>
						<tr>
							<td>좋아요 수</td>
							<td>${videoView.exe_Likecount}</td>
						</tr>
						<tr>
							<td>작성자</td>
							<td>${videoView.id}</td>
						</tr>
						<tr>
							<td>글제목</td>
							<td>${videoView.exe_Name}</td>
						</tr>
						<tr>
							<td>글내용</td>
							<td><iframe width="640" height="400"
									src="https://www.youtube.com/embed/${videoView.youtube_id}"
									frameborder="0" allow="autoplay; encrypted-media"
									allowfullscreen></iframe></td>

						</tr>
						<tr>
							<td colspan="2"><a
								href="videoLike?exe_Num=${videoView.exe_Num}">좋아요</a>
								&nbsp;&nbsp; <a href="#"
								onClick="history.back(); return false ; ">목록보기</a> &nbsp;&nbsp;
								<%if(session.getAttribute("session_id").equals(session.getAttribute("vie"))){ %>
								<a href="videoDelete?exe_Num=${videoView.exe_Num}">삭제</a>
							<%}else{ %>
							<%} %>
								&nbsp;&nbsp;</td>
						</tr>
					</table>
				</form>

				<h3>댓글을 달아봅시다</h3>

				<form action="videoReply" method="post">
					<table border="1">
						<tr>
							<td>글작성자</td>
							<td><input type="text" name="cwriter"
								value="<%=session.getAttribute("session_id")%>" readonly>
							</td>
						</tr>
						<tr>
							<td><input type="hidden" name="Rid"
								value="${videoView.exe_Num}"></td>
							<td><textarea rows="4" cols="50" name="ccontent" required="required"
								
								"placeholder="댓글을 입력해주세요"></textarea></td>
							<td><input type="submit" value="댓글달기"></td>
						</tr>
					</table>
				</form>
				<br> <br> <br>


				<h3>댓글창</h3>
				<%=session.getAttribute("vie") %>
				<table>
					<c:forEach var="reply" items="${replyView}">
<c:set var="today" value="<%=new java.util.Date()%>"/>
<c:set var="day" value="${reply.cdate}"/>
<fmt:formatDate var="now" type="date" value="${today}" pattern=" hh:ss"/>
<fmt:formatDate var="ter" type="date" value="${day}" pattern="yyyy-MM-dd hh:mm"/>

						<tr>
							<td>글작성자 : ${reply.cwriter}</td>
							<td>작성시간 : ${ter}</td>
						</tr>
						<tr style="margin-bottom: 10px;">
							<td colspan="2">내용 : ${reply.ccontent}</td>
						</tr>
						<!-- <tr bgcolor="#ffffff"><td bgcolor="#ffffff"></td></tr> --> 
					</c:forEach>
				</table>
 <input type="button" value="뒤로가기" class="btn btn-warning" onclick="location.href=history.go(-1)">
</div>
		</div>

		<!-- Sidebar -->
		<div id="sidebar">
			<div class="inner">

				<!-- Search -->


				<div style="inherited: no;">

					<gcse:search id="serch" name="serch"></gcse:search>
				</div>

				<!-- Menu -->
				<nav id="menu">
					<header class="major">
						<h2>Menu</h2>
					</header>
					<ul>
										<%if(session.getAttribute("session_id")==null){%>
  
   <%}else{ %>
  	   <li>
  <c:choose>
  
      <c:when test="${nuMessage == 0}">새쪽지:${nuMessage}
      </c:when>
      <c:when test="${nuMessage != 0}">
      새쪽지:${nuMessage}
     <img src="img/q.png" width="13"height="13"></c:when>
      </c:choose>
      </li>
    <%} %>
						<li><a href="testtama">홈</a></li>
						<%
							if (session.getAttribute("session_id") == null) {
						%>
						<li><a href="login_join">로그인/회원가입</a></li>
						<%
							} else if (session.getAttribute("session_id").equals("admin")) {
						%>
						<li><a href="adminpage">관리자</a></li>

						<%
							} else {
						%>
						<li><a href="mypage">마이페이지</a></li>
						<%
							}
						%>

						<li><a href="video">운동영상</a></li>

						<li><span class="opener">정보 공유</span>
							<ul>
								<li><a href="board">운동법</a></li>
								<li><a href="foodlist">레시피</a></li>

							</ul></li>
						<li><span class="opener">PT</span>
							<ul>
								<li><a href="pton">개설 강의</a></li>
								<%
									if (null == session.getAttribute("session_id")) {
								%>
								<%
									} else {
										%>
										<li><a href="ptoff">등록강의</a></li>
										<%
											}
										%>

									</ul></li>
						<li><a href="find">찾아오는 길</a></li>
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
						<li class="fa-home">찾아서 머하실라고요<br /> 경기도, TN 00000-0000
						</li>
					</ul>
				</section>

				<!-- Footer -->
				<footer id="footer">
					<p class="copyright">
						&copy; KL create here <a href="https://unsplash.com">Thank you</a>
						come <a href="https://html5up.net">here</a>.
					</p>
				</footer>

			</div>
		</div>

	</div>
	<!-- Tocplus 15.1 -->
	<script type="text/javascript">
		tocplusTop = 1150;
		tocplusLeft = 5;
		tocplusMinimizedImage = 'img/test.jpg';
		tocplusHAlign = 'right';
		tocplusWidth = 250;
		tocplusHeight = 350;
		tocplusUserName = '${session_id}';
		tocplusFrameColor = '#ff2d3f';
		tocplusFloatingWindow = true;
		var tocplusHost = (("https:" == document.location.protocol) ? "https://"
				: "http://");
		document
				.write(unescape("%"
						+ "3Cscript src='"
						+ tocplusHost
						+ "kr07.tocplus007.com/chatLoader.do?userId=whddus19' type='text/javascript'"
						+ "%" + "3E" + "%" + "3C/script" + "%" + "3E"));
	</script>
	<!-- End of Tocplus -->
	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

</body>
</html>