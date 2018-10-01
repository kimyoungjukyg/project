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

  <div id='calendar'></div>

</body>
</html>
