<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        
        
        <link rel="apple-touch-icon" sizes="57x57" href="/apple-touch-icon-57x57.png">
		<link rel="apple-touch-icon" sizes="114x114" href="/apple-touch-icon-114x114.png">
		<link rel="apple-touch-icon" sizes="72x72" href="/apple-touch-icon-72x72.png">
		<link rel="apple-touch-icon" sizes="144x144" href="/apple-touch-icon-144x144.png">
		<link rel="apple-touch-icon" sizes="60x60" href="/apple-touch-icon-60x60.png">
		<link rel="apple-touch-icon" sizes="120x120" href="/apple-touch-icon-120x120.png">
		<link rel="apple-touch-icon" sizes="76x76" href="/apple-touch-icon-76x76.png">
		<link rel="apple-touch-icon" sizes="152x152" href="/apple-touch-icon-152x152.png">
		<link rel="icon" type="image/png" href="/favicon-196x196.png" sizes="196x196">
		<link rel="icon" type="image/png" href="/favicon-160x160.png" sizes="160x160">
		<link rel="icon" type="image/png" href="/favicon-96x96.png" sizes="96x96">
		<link rel="icon" type="image/png" href="/favicon-16x16.png" sizes="16x16">
		<link rel="icon" type="image/png" href="/favicon-32x32.png" sizes="32x32">
		<meta name="msapplication-TileColor" content="#2b5797">
		<meta name="msapplication-TileImage" content="/mstile-144x144.png">

        <title> 일정관리</title>

        <link rel="stylesheet" type="text/css" media="screen" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" />
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
        <link href="./css/prettify-1.0.css" rel="stylesheet">
        <link href="./css/base.css" rel="stylesheet">
        <link href="//cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/e8bddc60e73c1ec2475f827be36e1957af72e2ea/build/css/bootstrap-datetimepicker.css" rel="stylesheet">

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
		<script type="text/javascript" src="//code.jquery.com/jquery-2.1.1.min.js"></script>
		<script type="text/javascript" src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
        
        <script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment-with-locales.js"></script>
        
        
        <script src="//cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/e8bddc60e73c1ec2475f827be36e1957af72e2ea/src/js/bootstrap-datetimepicker.js"></script>
        
        
        
</head>
<body>


<div class="container">
    <div class='col-md-5'>

<h3 id="linked-pickers">${reptmake.id} 의 일정</h3>
</div></div>


<div class="container">
<form action="ptremake" method="post">
 <div class='col-md-5'>
    강의 이름:
    <div class="form-group">
         
<input type='text' class="form-control" name="title" id="title" value="${reptmake.title}"required/>

</div>

</div>
<div class='col-md-5'></div>
   <div class='col-md-5'>
        시작일: <div class="form-group">
            <div class='input-group date' id='datetimepicker6'>
                <input type='text' class="form-control" name="starttime" id="starttime" value="${reptmake.starttime}" required/>
                <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
                </span>
            </div>
        </div>
    </div>
<div class='col-md-5'>
          종료일:  <div class="form-group">
            <div class='input-group date' id='datetimepicker7'>
                <input type='text' class="form-control" name="endtime"id="endtime" value="${reptmake.endtime}" required/>
                <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
                </span>
            </div>
        </div>
    </div>
  <div class='col-md-5'>
    강의료:
    <div class="form-group">
         
<input type='text' class="form-control" name="price" id="price" value="${reptmake.price}"required/>원

</div>

</div>
<div class='col-md-5'>

<input type="hidden" name="log" value="${reptmake.log}">
</div>
 


 <div class='col-md-5'>


 <button type="submit" class="byn btn-secondary" onclick="formcheck()" >수정</button>

</div>
 </form>

 
</div>



<script type="text/javascript">
function formcheck(){
	
	var title=document.forms[0].title.value;
	var starttime=document.forms[0].starttime.value;
	var endtime=document.forms[0].endtime.value;
	var price=document.forms[0].price.value;
	if(title==null||title==""){
		alert('강의명을 입력하세요.');
		document.forms[0].redate.focus();
		return false;
	}
	if(starttime==null||starttime==""){
		alert('시작 시간을 입력하세요.');
		document.forms[0].redate.focus();
		return false;
	}
	if(endtime==null||endtime==""){
		alert('종료 시간을 입력하세요.');
		document.forms[0].redate.focus();
		return false;
	}
	if(price.match(/^\d\d\d\d+$/ig)==null){
		alert('가격은 천원부터 입니다.');
		document.forms[0].redate.focus();
		return false;
	}
	
		
		
	}

	

</script>
<script type="text/javascript">
    $(function () {
        $('#datetimepicker6').datetimepicker();
        $('#datetimepicker7').datetimepicker({
            useCurrent: false
       
        });
        $("#datetimepicker6").on("dp.change", function (e) {
            $('#datetimepicker7').data("DateTimePicker").minDate(e.date);
        });
        $("#datetimepicker7").on("dp.change", function (e) {
            $('#datetimepicker6').data("DateTimePicker").maxDate(e.date);
        });
    });
</script>


</body>
</html>