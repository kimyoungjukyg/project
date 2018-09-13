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
            <a class="nav-link js-scroll-trigger" href="#PT">카드 등록</a>
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
       <h2 class="mb-5">카드 등록</h2>

<form action="cardlist" method="POST">
<div class="resume-item d-flex flex-column flex-md-row mb-5">
 <div class="resume-item d-flex flex-column flex-md-row">
            <div class="resume-content mr-auto">
                <h3 class="mb-0">카드번호:</h3>
            </div>
            <div class="resume-date text-md-right">
              <span class="text-primary"><input type="text" class="form-control" name="cardnum" id="cardnum" placeholder="카드번호입력"  maxlength="19" required > </span>
         
            </div>
            <div class="resume-date text-md-right">
             <input type="button" onclick="card()" value="카드형식확인" class="byn btn-secondary">
               </div>
          </div>
          </div>
          <div class="resume-item d-flex flex-column flex-md-row mb-5">
          <div class="resume-item d-flex flex-column flex-md-row">
            <div class="resume-content mr-auto">
                 <h3 class="mb-0">비밀번호:</h3>
            </div>
            <div class="resume-date text-md-right">
              <span class="text-primary"><input type="text" class="form-control" name="password"  placeholder="비밀번호입력" maxlength="4"></span>
            </div>
             <div class="resume-date text-md-right">
  <input type="submit" value="등록" class="byn btn-secondary"></div> 
          </div>
    </div>
          


            <input type="hidden" name="num" value=0>
           <input type="hidden" name="id" value="<%=session.getAttribute("session_id") %>">

 
      </form>

         </div>
           
          
      </section>
   






    

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for this template -->
    <script src="js/resume.min.js"></script>
    <script src="http://code.jquery.com/jquery-latest.js"></script> 

  
<script type="text/javascript">
function card(){
	var pwReg= /(\d{4}\-\d{4}\-\d{4}\-\d{4})/gm;  

	if (!pwReg.test(cardnum)) {
		alert("카드번호는 숫자16자리입니다.");
	    return false;
		
		
		}
	alert("사용가능합니다.");
	return true;


}

function autoHypen(str){
	str=str.replace(/[^0-9]/g,'');
	var tmp='';
	if(str.length<5){
		return str;
	}else if(str.length<9){
		tmp += str.substr(0,4);
		tmp += '-';
		tmp += str.substr(4);
		return tmp;
	}else if(str.length<14){
		tmp += str.substr(0,4);
		tmp += '-';
		tmp += str.substr(4,4);
		tmp += '-';
		tmp += str.substr(8);
		return tmp;
	}else{
	tmp += str.substr(0,4);
	tmp += '-';
	tmp += str.substr(4,4);
	tmp += '-';
	tmp += str.substr(8,4);
	tmp += '-';
	tmp += str.substr(12);
	return tmp;
	}
	
	return str;
} 
var cardnum=document.getElementById('cardnum');
cardnum.onkeyup=function(event){
	event=event || window.event;
	var _val=this.value.trim();
	this.value=autoHypen(_val);
}
</script>
  </body>

</html>
