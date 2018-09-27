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
  <script> 

  
  
function doShow() { 
    if ($('#aa').is(":visible")) { 
        $('#aa').hide(); // id값을 받아서 숨기기 
        $('.bb').hide(); // 클래스값을 받아서 숨기기 
        
        $('#button1').text('결제취소'); 
    } else { 
        $('#aa').show(); // id값을 받아서 보이기 
        $('.bb').show(); // 클래스값을 받아서 보이기 
       
        $('#button1').text('결제하기'); 
    } 
}


</script> 
  </head>

  <body id="page-top">
 <form action="ptpay" method="post">      
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
          
       <h2 class="mb-5">PT 결제</h2>
<div class="resume-item d-flex flex-column flex-md-row mb-5">
            <div class="resume-content mr-auto">
              <h3 class="mb-0">신청자:</h3>
            </div>
<div class="resume-date text-md-right">
              <span class="text-primary"><%=session.getAttribute("session_id") %></span>
           
            </div>
            </div>
            <div class="resume-item d-flex flex-column flex-md-row mb-5">
             <div class="resume-content mr-auto">
              <h3 class="mb-0">강의이름:</h3>
            </div>
<div class="resume-date text-md-right">
              <span class="text-primary"><%=session.getAttribute("title") %></span>
       
            </div>
             </div>
            <div class="resume-item d-flex flex-column flex-md-row mb-5">
             <div class="resume-content mr-auto">
              <h3 class="mb-0">트레이너:</h3>
            </div>
<div class="resume-date text-md-right">
              <span class="text-primary"><%=session.getAttribute("id") %></span>
             
            </div>
             </div>
            <div class="resume-item d-flex flex-column flex-md-row mb-5">
             <div class="resume-content mr-auto">
              <h3 class="mb-0">시작시간:</h3>
            </div>
<div class="resume-date text-md-right">
              <span class="text-primary"><%=session.getAttribute("start") %></span>
       
            </div> </div>
            <div class="resume-item d-flex flex-column flex-md-row mb-5">
             <div class="resume-content mr-auto">
              <h3 class="mb-0">종료시간:</h3>
            </div>
<div class="resume-date text-md-right">
              <span class="text-primary"><%=session.getAttribute("end") %></span>
              
            </div> </div> 
            <div class="resume-item d-flex flex-column flex-md-row mb-5">
             <div class="resume-content mr-auto">
              <h3 class="mb-0">가격:</h3>
            </div>
<div class="resume-date text-md-right">
              <span class="text-primary"><%=session.getAttribute("price")+"원" %></span>
              
            </div>
             </div>
             
             
         
            <div class="resume-item d-flex flex-column flex-md-row mb-5">

<input type="button" value="결제하기" onclick="javascript:doShow()" id="button1" class="byn btn-secondary">
       
</div> 
   
     <div id="aa" style="display:none">
    결제방식: 
    <input type="radio" name="paytype" id="paytype1" value="1" onclick="div_OnOff(this.value,'con');" class="byn btn-secondary">
    <label for="paytype1">카드</label>
     <input type="radio" name="paytype" id="paytype2" value="2" onclick="div_OnOff(this.value,'con');" class="byn btn-secondary">
    <label for="paytype1">통장 송금</label>
    <div id="con" style="display:none">
    <h3>카드 결제</h3>
     
        
      <select name="cardnum">
       
          <option value="" selected>등록카드선택</option>
           <c:forEach var="card" items="${cardread}">
     
       <option value="${card.cardnum }" >${card.cardnum}</option>
         </c:forEach>
      </select> 
     
      <input type="button" class="byn btn-secondary" onclick="location.href='cardwrite?id=<%=session.getAttribute("session_id") %>'"value="카드등록">      
    <br>비밀번호 : <input type="password" onkeyup="passCheck()" id="pass1"name="password" maxlength="4"  class="form-control"><br>
   
     <input type="button" value="결제" class="byn btn-secondary" data-target="#layerpop" data-toggle="modal">

      
    </div>
   <div id="con2" style="display:none" >
    <h2>통장결제</h2>
     <select name="caselist">
      <option value="" selected>등록통장</option>
      </select>
    </div>
    
    
    </div>
     
          </div>
      
       
           
          
      </section>
   



<div class="modal fade" id="layerpop" >
  <div class="modal-dialog" >
    <div class="modal-content">
      <!-- header -->
      <div class="modal-header">
           <!-- header title -->
      <h4 class="modal-title">경고창안뜨면 결재완료</h4>
        <!-- 닫기(x) 버튼 -->
        <button type="button" class="close" data-dismiss="modal">×</button>
   
        
      </div>
      <!-- body -->
      <div class="modal-body">
         <input type="hidden" name="id" id="id" value="<%=session.getAttribute("session_id") %>">
          <input type="hidden" name="tranl" id="tranl" value="<%=session.getAttribute("id") %>">
                  <input type="hidden" name="title" id="title" value="<%=session.getAttribute("title") %>">
                  <input type="hidden" name="starttime" id="starttime" value="<%=session.getAttribute("start") %>">
                  <input type="hidden" name="endtime" id="endtime" value="<%=session.getAttribute("end") %>">
                   <input type="hidden" name="price" id="price" value="<%=session.getAttribute("price") %>">
            결제중입니다...완료버튼을 눌러주세요.
      </div>
      <!-- Footer -->
      <div class="modal-footer">
      
        <p><input type="submit" class="btn btn-default"  value="완료" ></p>
      </div>
    </div>
  </div>

</div>
     
출처: http://hellogk.tistory.com/37 [IT Code Storage]
    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for this template -->
    <script src="js/resume.min.js"></script>
    <script src="http://code.jquery.com/jquery-latest.js"></script> 

    <!--chatting  -->
<script type="text/javascript">


function div_OnOff(v,id){
	if(v=="1"){
		
		document.getElementById(id).style.display="";
		div_OnOff2(v,con2);
	}else{
		
		document.getElementById(id).style.display="none";
		div_OnOff2(v,con2);
	}
	
}
function div_OnOff2(v,con2){
	if(v=="2"){
		
		document.getElementById(con2).style.display="";
		
	}else{
		
		document.getElementById(con2).style.display="none";
		
	}
	
}

</script>
 </form> 
  </body>

</html>
