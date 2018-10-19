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
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>​
<script>
      jQuery( document ).ready( function( $ ) {
        $( 'iframe[src^="https://www.youtube.com/"]' ).wrap( '<div class="youtubeWrap"></div>' );
      } );
    </script>
    <script>
	function contentCheck(){
		if (confirm("신고를 진행하시겠습니까..?"+$('#num').val()) == true){    //확인
			location.href="gesipanDeclaration?Rid="+$('#num').val();
		}else{   //취소
		    return;
		}
		}
	function numCheck(i){
		document.getElementById('num').value = i;
	}

	</script>
<title>상세보기</title>
<style>
.youtubeWrap {
        position: relative;
        width:  640px;
        height: 400px;
        padding-bottom: 56.25%;
      }
      .youtubeWrap iframe {
        position: absolute;
        width: 100%;
        height: 100%;
      }
</style>
 
<script> 

  
  
function doShow() { 
    if ($('#aa').is(":visible")) { 
        $('#aa').hide(); // id값을 받아서 숨기기 
        $('.bb').hide(); // 클래스값을 받아서 숨기기 
        
        $('#button1').text("댓글가리기"); 
    } else { 
        $('#aa').show(); // id값을 받아서 보이기 
        $('.bb').show(); // 클래스값을 받아서 보이기 
       
        $('#button1').text('댓글보기'); 
    } 
}


</script> 
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
		<input type="hidden" name="cwriter" required="required"  value="<%=session.getAttribute("session_id")%>" readonly>	
	<input type="hidden" name="Rid" value="${gesipanview.rid}"> 
	<input type="hidden" name="rid" value="${gesipanview.rid}">
	<table border="1">
		
		<tr><td style="width: 15%;">글번호</td>
			<td style="width: 20%;">${gesipanview.rid}</td>
			<td style="width: 15%;">글제목</td>
			<td style="width: 50%;">${gesipanview.rtitle}</td>
			
			</tr>
			<tr>
			<td>작성자</td>
			<td>${gesipanview.rname}</td>
		<td>조회수</td>
			<td>${gesipanview.rhit}</td></tr>
		<tr style="height: auto; overflow:auto;"><td>글내용</td>
			<td colspan='3'>${gesipanview.rcontent}</td></tr>
		<tr>
		
		
	
		<tr><td>동영상!</td>
			<td colspan='3'>${gesipanview.videourl}</td>
			
    
			</tr>
		
		<tr>
	
		
			<td colspan="4">
				<input type="hidden" id="num" value="${gesipanview.rid}">
				<%if(session.getAttribute("session_id")==null){ %>
			
			<%}else{ %>
			<input type="button" value="댓글보기" onclick="javascript:doShow()" id="button1" class="byn btn-secondary">
			<input type="button" onclick="numCheck(${gesipanview.rid})"class="btn-secondary" data-toggle="modal" data-target="#myModal" value="신고하기">
			<%} %>
			
	<%if(session.getAttribute("session_id").equals(session.getAttribute("name"))){%>
					<input type="button" onclick="location.href='gesipanmodify?Rid=${gesipanview.rid}'"value="수정">
						<input type="button" onclick="location.href='gesipandelete?Rid=${gesipanview.rid}'"value="삭제">
			<%}%>
				<input type="button" onclick="location.href='board'"value="목록보기">
				
			

  						  
	

			</td>
		</tr>
	</table>
	</form>
	  <div id="aa" style="display:none">
	  <h3>댓글창</h3>
	<table>
	<c:forEach var="reply" items="${replyView}">
	<input type="hidden" name="Cid" value="${reply.cid}">
	<tr>
	<td>글작성자:${reply.cwriter}<a href="ReplyLike?Cid=${reply.cid}&Rid=${reply.rid}" style="text-align:right">좋아요!</a>:${reply.tolike}</td>
	</tr>
	<tr>
	<td>내용:${reply.ccontent}</td>
	</tr>
		</c:forEach>
	</table>
	<h3>댓글을 달아봅시다</h3>
	<form action="Gesipanreply" method ="post">
	<table border="1">
<input type="hidden" name="Cwriter" value="<%=session.getAttribute("session_id") %>">
<input type="hidden" name="Rid"value="${gesipanview.rid }">
	<tr>

	<td><input type="text" name="ccontent" required="required" style=" height:50px;" placeholder="내용을입력하시오"></td>
	<td><input type="submit" value="댓글달기"></td>
	</tr>
	</table>
	</form>
	<br>
	<br>
	<br>
	
	
	
	 </div>
	
    
	 
	 
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
							<%if(session.getAttribute("session_id")==null){%>
  
   <%}else{ %>
  	   <li>
  <c:choose>
  
     <c:when test="${nuMessage == 0}"><%=session.getAttribute("session_id") %> &nbsp; 새쪽지:${nuMessage}  
      </c:when>
      <c:when test="${nuMessage != 0}">
    <%=session.getAttribute("session_id") %>  &nbsp;   새쪽지:${nuMessage} 
     <img src="img/q.png" width="13"height="13"></c:when>
      </c:choose>
      </li>
    <%} %>
				
										<li><a href="testtama">홈</a></li>
									 <%if(session.getAttribute("session_id")==null){%>
										<li><a href="login_join">로그인/회원가입</a></li>
										  <%}else if(session.getAttribute("session_id").equals("admin")){ %>
           									<li><a href="adminpage">관리자</a></li>
          
          									<%}else{ %>
         							 <li> <a  href="mypage">마이페이지</a></li>
          									 <%} %>
          							<%if(session.getAttribute("session_id")==null){%>
          								 <li><a href="videoout">운동영상</a></li>
          								 <%}else{ %>
										<li><a href="video">운동영상</a></li>
									<%} %>
									 <%if(session.getAttribute("session_id")==null){%>
									 <li><a href="videoout">정보 공유</a></li>
          								 <%}else{ %>
										<li>
											<span class="opener">정보 공유</span>
											<ul>
												<li><a href="board">운동법</a></li>
												<li><a href="foodlist">레시피</a></li>
												
											</ul>
										</li>
											<%} %>
									
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
							
					
 			<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">신고하기</h4>
        <button type="button" class="close" data-dismiss="modal" style="height:50px">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        	신고이유는??
        	<br>
        	<br>
        <select name= "Cdeclaration" id="Cdeclaration">
				<option value="1">수준낮음</option>
				<option value="2">불건전닉네임</option>
				<option value="3">댓글도배</option>
				<option value="4">음란물작성</option>
				</select>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <input type="button" class="btn btn-primary" data-dismiss="modal"onClick="contentCheck();" value="신고하기">
        
        <input type="button" class="btn btn-danger" data-dismiss="modal" value="닫기">
      </div>
			</div></div></div>
								
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
​
								 <!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
      
	 
</body>
</html>