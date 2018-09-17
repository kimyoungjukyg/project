<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<link href="css/fullcalendar.css"rel="stylesheet" type="text/css">
<link href="css/fullcalendar.min.css" rel="stylesheet" type="text/css">
<link href="css/calendar.css" rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>


<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<script src="js/common.js" type="text/javascript"></script>
<script src="js/fullcalendar.min.js" type="text/javascript"></script>
<script src="js/calendar.js" type="text/javascript"></script>
</head>
<body>
<form id="newScheduleForm" name="newScheduleForm" >
	
		<table id="newScheduleTable">
			<tbody>
				<tr>
			<th scope="row">일정내용</th>
					
				<td colspan="2"><input type="text" id="scheduleContent" name="scheduleContent" size=70 style="width:178.4px; HEIGHT:17.6px"></td>
					<th scope="row">시작일자</th>
					<td colspan="2"><input type="text" id="startDate" name="starttime" style="width:80px; HEIGHT:17.6px"></td>
					<th scope="row">종료일자</th>
					<td colspan="2"><input type="text" id="endDate" name="endtime" style="width:80px; HEIGHT:17.6px">
						
					<input type="hidden" id="employeeNo" name="employeeNo" value="1"></td>

				

					<td colspan="2" id="scheduleButtonTd">
						<button type="button" class="search" id="addScheduleButton" style="width:80px; HEIGHT:17.6px" >추가</button>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	<br>
	<br>

	<div id="calendar"></div>


	

</body>
</html>