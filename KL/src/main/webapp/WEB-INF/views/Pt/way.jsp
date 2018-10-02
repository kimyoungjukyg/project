<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
  <head>
    <title>찾아오시는 길</title>
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
  <div><h2>찾아오시는 길</h2></div>
    <div id="map-canvas" style="height: 500px"></div> 
    <div class="container">
    <div class="row">
        <div class="col-md-6" style="float: left; width: 33%;">
			<h4 class="section-title">주소</h4>
				인천 남구 학익동 663-1<br>
            	태승빌딩 5층 <strong>(1층 홈플러스)</strong>
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