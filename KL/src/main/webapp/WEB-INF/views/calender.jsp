<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<link href='css/fullcalendar.min.css' rel='stylesheet' />
<link href='css/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<script src='js/moment.min.js'></script>
<script src='js/jquery.min.js'></script>
<script src='js/fullcalendar.min.js'></script>
<script>
var curDate = new Date();



  $(document).ready(function() {

    $('#calendar').fullCalendar({
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,basicWeek,basicDay'
      },
      
      defaultDate: curDate,
      navLinks: true, // can click day/week names to navigate views
      editable: true,
      eventLimit: true, // allow "more" link when too many events
      events: dataset
      
    });

  });

</script>
<script type="text/javascript">

var dataset = [
	
	 <c:forEach var="pt" items="${callender}" varStatus="status">
	 <c:if test="${pt.starttime != ''}">
	  {"id":"<c:out value='${pt.id}' />"
	  ,"title":"<c:out value="${pt.title}" />"
	  ,"start":"<c:out value="${pt.starttime}" />"
	  <c:if test="${pt.endtime != ''}">
    ,"end":"<c:out value="${pt.endtime}" />"
</c:if> 
} <c:if test="${!status.last}">,</c:if>
</c:if>
</c:forEach>
	
];
</script>
<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 900px;
    margin: 0 auto;
  }
</style>




</head>
<body>
<div id="wrapper">
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
								

  <div id='calendar'></div>
  </div>
  <div class="inner">
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
  
  
<jsp:include page="side.jsp"  />
</div>
</body>
</html>
