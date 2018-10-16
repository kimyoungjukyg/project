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
    <title>찾아오시는 길</title>
    <link rel="stylesheet" href="assets/css/main.css" />
    <meta charset="UTF-8">
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAcRqlIq1yJEhd5k_4FbQLutx8novMGC8M&callback=initMap"
    async defer></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAcRqlIq1yJEhd5k_4FbQLutx8novMGC8M&libraries=geometry">
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAcRqlIq1yJEhd5k_4FbQLutx8novMGC8M&libraries=geometry,places">
</script>
    <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 100%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
    </style>
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
								
								
								
  <div><h2>찾아오시는 길</h2></div>
  
  
  
    <div id="map-canvas" style="height: 500px"></div> 
    
     
    <div class="container">
    <div class="row">
    
        <div class="col-md-6" style="float: left; width: 53%;">
			<h4 class="section-title">주소</h4>
			<ul class="list-unstyled three_cols">
			<li>	인천 남구 학익동 663-1</li>
            	<li>		태승빌딩 5층 <strong>(1층 홈플러스)</strong></li>
            	</ul>
			 
			<h4 class="section-title">연락처</h4>
				<strong>Tel :</strong> 123-4567-890 <br>
				<strong>Fax :</strong> 031) 123-4567 <br>
				<strong>E-mail :</strong> <a href="mailto:whddus19@naver.com">whddus19@naver.com</a>
				<h4 class="section-title">근무시간</h4>
			<strong>월~토 :</strong> 09시 ~ 18시
		</div>
		<div class="col-md-6" style="float: left; width: 33%;">
			<h4 class="section-title">주변정류장</h4>
			<ul class="list-unstyled three_cols">
				<li>영남아파트</li>
				<li>신동아아파트</li>
				<li>신동아 3차 아파트 후문</li>
				<li>신동아아파트3차</li>
            </ul>
			<h4 class="section-title">시내버스노선</h4>
			<ul class="list-unstyled three_cols">
				<li>518번</li>
				<li>4번</li>
				<li>780번</li>
				<li>65번</li>
            </ul>
		</div>    
    </div>
</div> <!-- container -->
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
<%}%>
								 <!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
    
    
    
    
    <script type="text/javascript">
function initialize() {
        var myLatlng;
        var map;
        var marker;


        <!-- 구글맵에서 좌표값을 얻고 입력해주세요.  -->
        myLatlng = new google.maps.LatLng(37.439021, 126.674802);  

       
var mapOptions = {
                    zoom: 17, <!--지도 확대, 축소 정도 설정 -->
                    center: myLatlng,
                    mapTypeId: google.maps.MapTypeId.ROADMAP,
                    scrollwheel: false, <!-- 마우스 스크롤 false -->
                    draggable: false<!-- 마우스 드레그(클릭) false -->
        };

        map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
        
        <!-- 위치정보이름 및 위치정보주소 입력하세요. -->
        var contentString ='<p style="line-height: 20px;">KL헬스장</p><p>인천 남구 학익동 663-1 태승빌딩 5층 (1층 홈플러스)</p>'; 

        var infowindow = new google.maps.InfoWindow({
                content: contentString
        });

        marker = new google.maps.Marker({
                position: myLatlng,
                map: map,
                title: 'Marker'
        });

        infowindow.open(map, marker);

        google.maps.event.addListener(marker, 'click', function () {
                infowindow.open(map, marker);
        });
}

google.maps.event.addDomListener(window, 'load', initialize);
</script>

  </body>
</html>