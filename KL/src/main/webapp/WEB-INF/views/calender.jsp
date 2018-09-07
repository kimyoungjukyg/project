
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:500,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Muli:400,400i,800,800i" rel="stylesheet">
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">


    <!-- Custom styles for this template -->
    <link href="css/resume.min.css" rel="stylesheet">
    <script type="text/javascript">
var objArr=new List();
$(document).ready(function)(){
	var date=new Date();
	var d=date.getDate();
	var m=date.getMonth();
	var y=date.getFullYear();

}
$.getList();
$('#calendar').fullCalendar({
	theme:true,

	header{
		left:'prev,next,today',
		center:'title',
		right:'meonth,agendaWeek,agendaDay'
	},
	editable:false,
	events;objArr
});
});
</script>
<script type="text/javascript">
$.extend({
	getList:function(){
		$.ajax({
			url:"./member/getProject"
			type:"get",
			dataType:"json",
			asyn:false,
			success:function(data){
				$.each(data.resultList,fuction(idx,result)){
					var obj=new Object();
					obj.title=result.title;
					if(result.starttime!=null){
						obj.start=new Date(result.starttime);
					}
					if(result.endtime !=null){
						obj.end=new Data(result.endtime);
					}
objArr.puch(obj);
				
				});
		console.log(JSON.stringify(objArr));
			},
			error:function(request,status,error){
				console.log("code:"+request.status+"\n"+request.responseText+"\n"+"error:"+error);
			}
		})
	}
})

</script>
</head>
<body>
<div id='calendar'></div>

 <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for this template -->
    <script src="js/resume.min.js"></script>
</body>
</html>