<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script>
$('#exampleModal').on('show.bs.modal', function (event) {
  var button = $(event.relatedTarget) // Button that triggered the modal
  var recipient = button.data('whatever') // Extract info from data-* attributes
  var modal = $(this)
  modal.find('.modal-body input')
});
</script>
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
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="assets/css/main.css" />
<title>게시판</title>
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
										<h2>리뷰 게시판</h2>
									</header>
									    
           
           <%if(session.getAttribute("session_id")==null){ %>
           <%}else{ %>
         <a href="reviewwrite_view?id=<%=session.getAttribute("session_id")%>">글쓰기</a> 
          <%} %>
        
     									<div class="features">
						   <table class="table">
           <thead>
           <tr><th>제목</th>
           <th>작성자</th>
           <th>평가트레이너</th>
           <th>작성시간</th>
         
           <th>별점</th>
           <th>상세보기</th>
           </tr>
           <thead>			
		<c:forEach var="re" items="${relist}">									
			 <tr>
   
   <th>${re.title}</th>
   <th>${re.id}</th>
   <th>${re.tranl }</th>
   <th><fmt:formatDate value="${re.redate }" pattern="yyyy'년'-MM'월'-dd'일 'HH:mm:ss "/></th>
   <th>${re.star} 점</th>
  <th><button type="button" class="button big" data-toggle="modal" data-target="#content${re.id}"
		>상세보기</button></th>
         <div class="modal fade" id="content${re.id}">
    <div class="modal-dialog">
      <div class="modal-content">
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">상세 내용</h4>
          <button type="button" class="button big" data-dismiss="modal">&times;</button>
        </div>
        <!-- Modal body -->
        <div class="modal-body">
        <label for="recipient-name"><font color="black">  ${re.content}</font></label>
        </div>
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="button big" data-dismiss="modal" onClick="fuckyou();">닫기</button>
        </div>
      </div>
    </div>
  </div>
  
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
<%}%>					 <!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

     
</body>
</html>