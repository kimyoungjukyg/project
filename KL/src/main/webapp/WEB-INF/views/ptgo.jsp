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

    <title>ex</title>

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
      <a class="navbar-brand js-scroll-trigger" href="textList" >
      
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
      
           <a class="nav-link js-scroll-trigger" href="textList#mypage">마이페이지</a>
      
          </li>
          
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="textList#motion">운동 영상</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="textList#exercise">운동법 공유</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#PT">PT 신청</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="textList#food">음식 레시피</a>
          </li>
         <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="textList#awards">여유공간</a>
          </li>
        </ul>
      </div>
    </nav>
 <hr class="m-0">

      <section class="resume-section p-3 p-lg-5 d-flex flex-column" id="PT">
     
        <div class="my-auto">
       <h2 class="mb-5">PT 신청</h2>


        <div class="resume-item d-flex flex-column flex-md-row mb-5">
         
        
          

    <div class="resume-date text-md-right">
           <table class="table">
           <thead>
           <tr><th>강의 명</th>
           <th>트레이너 명</th>
           <th>시작 시간</th>
           <th>종료 시간</th>
           <th>신청자 수</th>
           <th>신청 버튼</th>
           </tr>
           <thead>
   <c:forEach var="pt" items="${callender}">
   <tr>
   <th>${pt.title}</th>
   <th>${pt.id}</th>
   <th>${pt.starttime }</th>
   <th>${pt.endtime }</th>
   <th>${pt.count}</th>
   <th><button type="submit" class="byn btn-secondary" onclick="location.href='ptr?log=${pt.log}&id=<%=session.getAttribute("session_id") %>'" >신청</button><br></th>
   </tr>   
            </c:forEach>

           
           </table>
        
          
           </div>
      
         </div>
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

    <!--chatting  -->

  </body>

</html>
