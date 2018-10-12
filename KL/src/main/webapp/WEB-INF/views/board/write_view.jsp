<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글등록</title>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
<link rel="stylesheet" href="assets/css/main.css" />
<style type="text/css">


#sub {
	text-align: center;
}
</style>

</head>
<body>
<div id="wrapper">
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
								

	<h2>게시판글등록</h2>
	<form action="Rgesipanwrite" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td>목록분류</td>
				<td>
				<select name= "Rtype" id="Rtype">
				<option value="레시피">레시피</option>
				<option value="운동기구">운동기구</option>
				</select>
				</td>
			</tr>
			<tr>
				<td>글쓴이</td>
				<td><input type="text" name="Rname" value="<%=session.getAttribute("session_id") %>" readonly ></td>
			</tr>
			<tr>
				<td>제 목</td>
				<td><input type="text" name="Rtitle" required="required"></td>
			</tr>
			<tr>
				<td>내 용</td>
				<td>
				<script>
    		$(document).ready(function(){
    			$('#summernote').summernote({
    				placeholder: 'Insert content',
    		        tabsize: 2,
    		        height: 500
    			});
    		});
      			</script>
				
      			<textarea id="summernote" name="Rcontent"  rows="25" cols="30"></textarea>
      			</td>
			</tr>
			<tr>
				<td>파일 첨부</td>
				<td><input type="file" name="rfile"></td>
			</tr>
			<tr>
				<td>동영상 첨부</td>
				<td><input type="text" name="videourl">(유튜브소스복사해서 붙여주세요!)</td>
			</tr>
			<tr>
				<td colspan="2" id="sub"><input type="submit" value="등록">
				 <input type="button" value="뒤로가기" class="btn btn-warning" onclick="location.href=history.go(-1)">
					<input type="reset" value="다시쓰기"></td>
			</tr>
		</table>
		
	</form>
	
	</div>
	</div>
		<div id="sidebar">
						<div class="inner">

							<!-- Search -->
							
								
									<gcse:search></gcse:search>
						

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
										<li><a href="find">Sapien Mauris</a></li>
										<li><a href="serch">Amet Lacinia</a></li>
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
	<!-- Tocplus 15.1 -->
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
<!-- End of Tocplus -->
		<!-- Scripts -->
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
	
	
	

	
</body>