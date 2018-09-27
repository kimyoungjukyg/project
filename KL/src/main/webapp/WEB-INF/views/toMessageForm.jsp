<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<title>KL</title>
</head>
<body>
<h2>받은 쪽지함</h2>
새쪽지 : ${nuMessage}
<table border="1">
	<c:forEach items="${mymessage}" var ="me">
	<tr>
		<td>쪽지 번호 : ${me.message_num}</td>
		<td>보낸 사람 : ${me.writer}</td>
		<td>받은 시간 : ${me.message_date}</td>
		<td> <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#content${me.message_num}"
		>쪽지확인</button></td>
		<td><button type="button" class="btn btn-outline-primary" id="deleteOpenModal" data-toggle="modal" 
		data-target="#exampleModal" data-title="data">
		쪽지 삭제</button></td>
		<c:choose>
		<c:when test="${me.checkMessage == 0}">
		</c:when>
		<c:when test="${me.checkMessage != 0}">
		<td><img src="img/check.jpg" width="30" height="30"></td>
		</c:when>
		</c:choose>
	</tr>
	<!-- 쪽지 확인 시작 -->
  <div class="modal fade" id="content${me.message_num}">
    <div class="modal-dialog">
      <div class="modal-content">
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">쪽지 내용</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <!-- Modal body -->
        <div class="modal-body">
          ${me.content}
        </div>
        <!-- Modal footer -->
        <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal" onClick="contentCheck();">확인</button>
          <button type="button" class="btn btn-danger" data-dismiss="modal" onClick="fuckyou();">닫기</button>
        </div>
      </div>
    </div>
  </div>
<!-- 쪽지 확인 끝 -->
<!-- 쪽지 삭제 시작 -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" 
aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">쪽지 삭제 확인!</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="recipient-name" class="col-form-label"><font color="black">쪽지를 삭제하시겠습니까?</font></label>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="delete" onClick="deleteCheck();">삭제</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>

<script>
$('#exampleModal').on('show.bs.modal', function (event) {
  var button = $(event.relatedTarget) // Button that triggered the modal
  var recipient = button.data('whatever') // Extract info from data-* attributes
  var modal = $(this)
  modal.find('.modal-body input')
});
//쪽지 삭제
function deleteCheck()
  {
   location.href="messagedelete?mnum=${me.message_num}";
  } 
  
//쪽지 조회수 증가 시키기
function contentCheck()
	{
	location.href="contentCheck?mnum=${me.message_num}";
	}
	
//쪽지 확인 눌르고 닫기 누른 넘 경고
function fuckyou(){
	alert("'확인'"+"을 안누르고 그냥 닫기하면 읽음 표시 안댐 ㅎ");
}
</script>
<!-- 쪽지 삭제 끝 -->
	</c:forEach>
	 <tr>
		<td colspan="5"><a href="messageWriteForm?id=${session_id}">쪽지 쓰기</a>
		<a href="messageForm?id=${session_id}">보낸 쪽지함</a></td>
	</tr>
</table>
</body>
</html>