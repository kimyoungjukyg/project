<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Resume - Start Bootstrap Theme</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:500,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Muli:400,400i,800,800i" rel="stylesheet">
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">


    <!-- Custom styles for this template -->
    <link href="css/resume.min.css" rel="stylesheet">
  
  </head>

  <body id="page-top">

    <nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top" id="sideNav">
      <a class="navbar-brand js-scroll-trigger" href="#page-top" >
      
        <span class="d-block d-lg-none" style="height: 80px" > 
        <img  src="img/lo.png" alt="" style="height: 90px">
        </span>                    
         
         
        <span class="d-none d-lg-block">
          <img class="img-fluid img-profile rounded-circle mx-auto mb-2" src="img/test.jpg" alt="" >
        </span>
      </a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav">
       
          <li class="nav-item">
          <%if(session.getAttribute("session_id")==null){%>
            <a class="nav-link js-scroll-trigger" href="#login">로그인/회원가입</a>
          <%}else{ %>
           <a class="nav-link js-scroll-trigger" href="#mypage">마이페이지</a>
           <%} %>
          </li>
          
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#motion">운동 영상</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#exercise">운동법 공유</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#PT">PT 신청</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#food">음식 레시피</a>
          </li>
         <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#awards">여유공간</a>
          </li>
        </ul>
      </div>
    </nav>

    <div class="container-fluid p-0">

      <section class="resume-section p-3 p-lg-5 d-flex d-column" id="home">
        <div class="my-auto">
          <h1 class="mb-0">KL
            <span class="text-primary">프로젝트</span>
          </h1>
          <div class="subheading mb-5">2018-09-03 시작
            <a href="mailto:kyg7414@gmail.com">KL@email.com</a>
          </div>
          <p class="lead mb-5">설명은 생략한다.</p>
          <div class="social-icons">
            <a href="#">
              <i class="fab fa-linkedin-in"></i>
            </a>
            <a href="#">
              <i class="fab fa-naver"></i>
            </a>
            <a href="#">
              <i class="fab fa-apper"></i>
            </a>
            <a href="#">
              <i class="fab fa-facebook-f"></i>
            </a>
            <a href="#">
           <i class="fa fa-camera-retro"></i> 


            </a>
          </div>
        </div>
      </section>
      <%if(session.getAttribute("session_id")==null){ %>
      <section class="resume-section p-3 p-lg-5 d-flex d-column" id="login">
        <div class="my-auto">
          <h1 class="mb-0">Login
            <span class="text-primary">Join</span>
          </h1>
          <div class="subheading mb-5">2018-09-03 시작
       <form action="login" method="post">
       <div class="resume-item d-flex flex-column flex-md-row mb-5">
		<div class="resume-content mr-auto">아이디 :</div>  
		<div class="resume-date text-md-right"><input type="text" name="id">   </div>
		
		</div>
		<div class="resume-item d-flex flex-column flex-md-row mb-5">
		<div class="resume-content mr-auto"> 비밀번호 :</div>
		<div class="resume-date text-md-right"><input type="password" name="password"></div>
		</div>
		 <button type="submit" class="byn btn-secondary">로그인</button>
		 <button type="button" class="byn btn-secondary" onclick="location.href='joinForm'">회원가입</button>
	</form>
          </div>
          
         
          
        </div>
      </section>
      <hr class="m-0">
      <%}else{ %>
 <section class="resume-section p-3 p-lg-5 d-flex d-column" id="mypage">
        <div class="my-auto">
          <h1 class="mb-0">My
            <span class="text-primary">page</span>
          </h1>
          <div class="subheading mb-5">2018-09-03 시작
           
          </div>
          <p class="lead mb-5">마이페이지가 될공간</p>
          <div class="social-icons">
 <button type="button" class="byn btn-secondary" onclick="location.href='logout'">로그아웃 </button>
       
          </div>
        </div>
      </section>
      <hr class="m-0">
<%} %>

      <section class="resume-section p-3 p-lg-5 d-flex flex-column" id="motion">
        <div class="my-auto">
          <h2 class="mb-5">Motion picture</h2>

          <div class="resume-item d-flex flex-column flex-md-row mb-5">
            <div class="resume-content mr-auto">
              <h3 class="mb-0">Senior Web Developer</h3>
              <div class="subheading mb-3">Intelitec Solutions</div>
              <p>Bring to the table win-win survival strategies to ensure proactive domination. At the end of the day, going forward, a new normal that has evolved from generation X is on the runway heading towards a streamlined cloud solution. User generated content in real-time will have multiple touchpoints for offshoring.</p>
            </div>
            <div class="resume-date text-md-right">
              <span class="text-primary">March 2013 - Present</span>
            </div>
          </div>

        
        </div>

      </section>

      <hr class="m-0">

      <section class="resume-section p-3 p-lg-5 d-flex flex-column" id="exercise">
        <div class="my-auto">
          <h2 class="mb-5">Exercise method</h2>

          <div class="resume-item d-flex flex-column flex-md-row mb-5">
            <div class="resume-content mr-auto">
              <h3 class="mb-0">University of Colorado Boulder</h3>
              <div class="subheading mb-3">Bachelor of Science</div>
              <div>Computer Science - Web Development Track</div>
              <p>GPA: 3.23</p>
            </div>
            <div class="resume-date text-md-right">
              <span class="text-primary">August 2006 - May 2010</span>
            </div>
          </div>

          <div class="resume-item d-flex flex-column flex-md-row">
            <div class="resume-content mr-auto">
              <h3 class="mb-0">James Buchanan High School</h3>
              <div class="subheading mb-3">Technology Magnet Program</div>
              <p>GPA: 3.56</p>
            </div>
            <div class="resume-date text-md-right">
              <span class="text-primary">August 2002 - May 2006</span>
            </div>
          </div>

        </div>
      </section>

      <hr class="m-0">

      <section class="resume-section p-3 p-lg-5 d-flex flex-column" id="PT">
     
        <div class="my-auto">
       <h2 class="mb-5">PT</h2>


        <div class="resume-item d-flex flex-column flex-md-row mb-5">
           <div id="aa" style="display:">
           <h3 class="mb-4">PT신청  &amp; 리뷰</h3>
        
           <div class="resume-date text-md-right">
             <%if("1".equals(session.getAttribute("classify"))){%>
               <button type="button" class="byn btn-secondary" onclick="location.href='ptView?id=<%=session.getAttribute("session_id")%>'">자기 강의 만들기</button>     
          <%}else{%>
          
          <%} %>
           </div>

    <div class="resume-date text-md-right">
            <%if(null==session.getAttribute("session_id")){ %>
               
     <button type="button" class="byn btn-secondary" onclick="location.href='#login'">로그인이 필요합니다</button>
            <%}else{ %>
           
   <c:forEach var="member" items="${textList}">
   
          <div class="resume-item d-flex flex-column flex-md-row mb-5">
         <input type="hidden" name="id"value="${member.id}">
            <div class="resume-content mr-auto">
           
              <div class="subheading mb-3">${member.id}</div>
            
            </div>
          
          
          <%if("1".equals(session.getAttribute("classify"))){%>
            
     <%}else { %>
    
    
     <input type="button" class="byn btn-secondary" onclick="location.href='callender?id=${member.id}'" value="강의 신청하기">
      <%} %>
     
       
        <button type="button" class="byn btn-secondary" onclick="ptReview?id=${member.id}">리뷰 보기</button>      
            </div>
          
           
            </c:forEach>
           
            </div>
            <%} %>
          </div> 
                   </div>
      
         
           
            </div> 
           
          
      </section>

      <hr class="m-0">

      <section class="resume-section p-3 p-lg-5 d-flex flex-column" id="food">
        <div class="my-auto">
          <h2 class="mb-5">Food Recipe</h2>
          <p>Apart from being a web developer, I enjoy most of my time being outdoors. In the winter, I am an avid skier and novice ice climber. During the warmer months here in Colorado, I enjoy mountain biking, free climbing, and kayaking.</p>
          <p class="mb-0">When forced indoors, I follow a number of sci-fi and fantasy genre movies and television shows, I am an aspiring chef, and I spend a large amount of my free time exploring the latest technology advancements in the front-end web development world.</p>
        </div>
      </section>

      <hr class="m-0">

      <section class="resume-section p-3 p-lg-5 d-flex flex-column" id="awards">
        <div class="my-auto">
          <h2 class="mb-5">부여된것없는  &amp; 여백의공간</h2>
     

</div>
</section>






    </div>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for this template -->
    <script src="js/resume.min.js"></script>
    <script src="http://code.jquery.com/jquery-latest.js"></script> 
<script> 
function doShow2(){
	 if ($('#cc').is(":visible")) { 
    	 $('#cc').show();
    }else{
    	$('#cc').show();
    }
}
function doShow() { 
    if ($('#aa').is(":visible")) { 
        $('#aa').show();
        $('#bb').hide();
        $('#cc').hide();
        // 클래스값을 받아서 숨기기 
      
    } else { 
        $('#aa').hide();
        $('#cc').show();// id값을 받아서 보이기 
         // 클래스값을 받아서 보이기 
        
    } 
    if ($('#bb').is(":visible")) { 
        $('#aa').show(); // id값을 받아서 숨기기 
        $('#bb').hide(); // 클래스값을 받아서 숨기기 
      
    } else { 
        $('#aa').hide(); // id값을 받아서 보이기 
        $('#bb').show(); // 클래스값을 받아서 보이기 
        
    } 
    if ($('#cc').is(":visible")) { 
    	 $('#cc').hide();
    }
} 
</script> 
    <!--chatting  -->

  </body>

</html>
