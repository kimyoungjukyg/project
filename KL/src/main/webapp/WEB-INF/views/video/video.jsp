<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<head>

<style>
div {
	border-style: solid; 0.1 px;
	width: auto;
	height: auto;
}

.wrap {
	padding: 10px;
	background-color: #def0c2;
	overflow: hidden
}

table {
	border: 1px solid;
}

/* .muscleImage:hover{
	border: 5px solid #f00;
} */
#div111 {
	background-image: url('./resources/images/muscle_front.jpg') no-repeat;
}
</style>

<!-- 이미지 맵핑 -->
<%-- <script type="text/javascript"
	src="<c:url value='/js/jquery.maphilight.min.js'/>"></script> --%>
<script type="text/javascript">
	$(function() {
		$('.map').maphilight();
	});
</script>


<!-- 이미지 맵핑2 -->
<!-- <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js" ></script>
<script type="text/javascript" src="js/jquery.easing.min.js"></script>
<script type="text/javascript" src="http://davidlynch.org/projects/maphilight/jquery.maphilight.min.js"></script>
<script type="text/javascript">
 $(function(){
  $('.map').maphilight();
 });
</script> -->



<script>
	function changeImage(img) {
		if (img == "front") {
			document.getElementById("front").style.display = "";
			document.getElementById("back").style.display = 'none';
		} else {
			document.getElementById("front").style.display = 'none';
			document.getElementById("back").style.display = "";
		}

	}

	function changeModalImage(img) {
		if (img == "front") {
			document.getElementById("modal_front").style.display = "";
			document.getElementById("modal_back").style.display = 'none';
		} else {
			document.getElementById("modal_front").style.display = 'none';
			document.getElementById("modal_back").style.display = "";
		}

	}

	/* function orderVideo(muscle) {
		$.ajax({
			type : "get",
			url : "orderVideo",
			data : {
				"muscle" : muscle,
			},
			//dataType : "json",
			success : function(data) {
				$.each(function(index, item) {
					var result = '';

					result += index + ' : ' + item;
					console.log(result)
					console.log(orderVideo) 

					$("#showOrderVideo").append(Data)
				})
			},
			error : function(request, status, error) {
				alert("code : " + request.status + "\n" + "message : "
						+ request.responseText + "\n" + "error : " + error);
			}
		});
	} */

	function alertSelectCategory() {
		var whatCategory = document.getElementById("selectedCategory");
		if (whatCategory.value == "select") {
			alert('게시판을 선택하세요.');
			document.getElementById("category").focus();
			return false;
		} else {
			return true;
		}
	}
</script>

</head>

<body>
	<div class="wrap">
		<div style="overflow: auto;">
			<div>
				<input type="button" value="전면" onclick="changeImage('front')">
				<input type="button" value="후면" onclick="changeImage('back')">
			</div>
			<div class="muscleImage">
				<img class="map" id="front"
					src="images/muscle_front.jpg" width="20%" height="20%"
					usemap="#front">
				<map name="front">
					<area onclick="location='orderVideo?exe_Category=상완삼두근'"
						title="상완삼두근" shape="rect" coords="24,58,114,144" />
				</map>


				<img class="map" id="back" style="display: none;"
					src="images/muscle_back.jpg" width="20%" height="20%"
					usemap="#back">
				<map name="back">
					<area onclick="location='orderVideo?exe_Category=back'" title="등"
						shape="rect" coords="24,58,114,144" />
				</map>

			</div>
		</div>
		<div style="float: left;">
			<div>
				<!-- 게시글 등록 -->
				<button type="button" class="btn btn-outline-info"
					style="width: 95%;" id="register" data-toggle="modal"
					data-target="#exe_register">게시글 등록</button>

				<form action="exeWrite" method="post" id="exeRegister"
					onsubmit="return alertSelectCategory()">
					<div class="modal fade" id="exe_register">
						<div class="modal-dialog modal-lg">
							<div class="modal-content">

								<!-- Modal Header -->
								<input type="hidden" name=id value="id">
								<!-- value 값 수정 필요 -->
								<div class="modal-header">
									<h4 class="modal-title">게시물 등록</h4>
									<button type="button" class="close" data-dismiss="modal">&times;</button>
								</div>

								<!-- Modal body -->
								<div class="modal-body">
									<div class="form-group" id="category">
										<label for="category" style="display: inline;">분류</label>
										<div>
											<input type="button" value="전면"
												onclick="changeModalImage('front')"> <input
												type="button" value="후면" onclick="changeModalImage('back')">
										</div>
										<!-- <img src="./resources/images/muscle_front.jpg" alt="front"
											style="position: relative; z-index: 1; height: 30%; width: 30%;"> -->
										<div id="div111">
											<!-- <img class="map" id="modal_front"
												src="./resources/images/muscle_front.jpg" width="30%"
												height="30%" usemap="#modal_front" style="z-index: 0;">
											<img class="map" id="modal_back" style="display: none;"
												src="./resources/images/muscle_back.jpg" widtzh="30%"
												height="30%" usemap="#modal_back"> -->
											<input
												style="position: relative; z-index: 2; top: 00px; left: 0px;"
												type="checkbox" name="exe_Category" id="상완이두근" value="상완이두근">상완이두근<br>
											<input
												style="position: relative; z-index: 2; top: 10px; left: 10px;"
												type="checkbox" name="exe_Category" id="상완이두근" value="상완삼두근">상완삼두근<br>
											<input type="checkbox" name="exe_Category" value="전완근">전완근<br>
										</div>
									</div>

									<%-- <input type=hidden name="ID"
										value="${loginInfo.getMEMBER_ID()}"> --%>

									<div id="exe_Name">
										<label for="exe_Name" style="display: inline;">제목</label> <input
											type="text" class="form-control" name="exe_Name"
											maxlength="30" placeholder="게시글 제목을 입력하세요" required>
									</div>

									<div id="video">
										<label for="video_upload">동영상 주소 올리기</label>
										<div id="input_url">
											<input type="text" class="form-control" name="exe_Video"
												placeholder="https://">
										</div>
									</div>

									<!-- Modal footer -->
									<div class="modal-footer">
										<button type="submit" class="btn btn-primary">등록</button>
										<!-- data-dismiss="modal" -->
									</div>

								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
			<div>
				<h2>인기 동영상</h2>
			</div>

			<div>
				<h2>추천 동영상</h2>
			</div>

			<div>
				<h2>맞춤 동영상</h2>
				<table id="orderVideo" style="overflow: auto;">
					<tr>
						<td>제목</td>
						<td>영상</td>
						<td>등록날짜</td>
					</tr>
					<c:forEach var="orderVideo" items="${orderVideo}">
						<tr align=center>
							<td>${orderVideo.exe_Name}</td>
							<td><img class="btn-img"
								src="https://img.youtube.com/vi/${orderVideo.youtube_id}/mqdefault.jpg"
								onclick="location.href='videoView?exe_Num=${orderVideo.exe_Num}'">

							</td>
							<td>${orderVideo.exe_Date}</td>
						</tr>
					</c:forEach>


					<%-- <c:forEach var="board" items="${boardlist}" varStatus="status">
						<c:if test="${i%j == 0 }">
							<tr>
						</c:if>
						<td>
							<div class="card" id="card" style="height: 260px">
								<div class="card-body text-center">
									<div class="videoplay">
										<img class="btn-img"
											src="https://img.youtube.com/vi/${board.BOARD_YOUTUBE_ID}/0.jpg"
											style="width: 200px; height: 120px;"
											onclick="viewCount('id0${status.count}', ${board.BOARD_NUM})">
										<div>
											<span class="writer" style="color: blueviolet;">${board.MEMBER_ID}</span>
											<span class="videotitle">${board.BOARD_SUBJECT}</span>
										</div>
										<div>
											<span class="videoCategory" style="color: lightpink">분류:${board.BOARD_CATEGORY}</span>
											<span class="videoLike" style="color: blue"><img
												src="./images/like.png">${board.BOARD_LIKECOUNT}</span> <span
												class="videoReadCount"><img src="./images/view.jpg">${board.BOARD_READCOUNT}</span>
										</div>
										<div>
											<span class="videoUptime">${board.BOARD_DATE}</span> <span
												class="videoTag" style="color: cadetblue"><img
												src="./images/tag.png">${board.BOARD_TAG}</span>
										</div>
									</div>
								</div>
							</div>
						</td>

						<c:if test="${i%j == j-1 }">
							</tr>
						</c:if>
						<c:set var="i" value="${i+1 }" />
					</c:forEach> --%>
				</table>
			</div>

		</div>
	</div>
</body>

</html>