<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet" href="assets/css/main.css" />
<meta charset="UTF-8">
<!-- jQuery CDN--> 
<style type="text/css">
 #data{
    width:500px;  
	height:600px;
    overflow:auto;
     border: 1px solid black;
}

</style>
    <!-- Web socket CDN -->
<script src="http://cdn.sockjs.org/sockjs-0.3.4.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script> 
</head> 
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
										<li><a  class="icon fa-medium"><span class="label">Medium</span></a></li>
									</ul>
								</header>
								
	<br><input type="hidden" value=" ">
	<div class="data" id="data"></div>
	<br>   
	 <div class='col-md-5'> 
    <input type="text"  class="form-control"id="message"placeholder="메시지 입력" />
    <input type="button" id="sendBtn" value="전송" />
    </div>
    
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
	<%if(session.getAttribute("session_id")=="admin" || session.getAttribute("session_id")=="null"){%>
	
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

<script type="text/javascript">
        $(document).ready(function() {
               $("#sendBtn").click(function() {
                       sendMessage();
                       $('#message').val('')
               });

               $("#message").keydown(function(key) {
                       if (key.keyCode == 13) {// 엔터
                              sendMessage();
                              $('#message').val('')
                       }
               });
        });
        // 웹소켓을 지정한 url로 연결한다.

        let sock = new SockJS("<c:url value="/echo"/>");
        sock.onmessage = onMessage;
        sock.onclose = onClose;
        
        // 메시지 전송 
        function sendMessage() {
               sock.send("${session_id} : "+$("#message").val());
		       var elem = document.getElementById('data');
		       elem.scrollTop= elem.scrollHeight+100;
		         window.setInterval(function(){
		    	   if(elem.scrillTop +700 != elem.scollHeight){
		    		   document.getElementById(data).style.display = "none";
		    	   }
		       },0);
        }
        
        // 서버로부터 메시지를 받았을 때
        function onMessage(msg) {
               var data = msg.data;
               $("#data").append(data + "\<br>");
        }

        // 서버와 연결을 끊었을 때
        function onClose(evt) {
               $("#data").append("${session_id} 님이 퇴장하셨습니다.");
        }
</script>
</html>
