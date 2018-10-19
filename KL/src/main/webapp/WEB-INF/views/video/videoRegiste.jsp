<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="assets/css/main.css" />
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#div111 {
	width: 600px;
	height: 1000px;
	background-image: url('images/muscle_front.jpg');
	background-repeat: no-repeat;
	background-size: 50% 70%;
	background-position: center;
}

.checks {
	position: relative;
}

.checks input[type="checkbox"] { /* 실제 체크박스는 화면에서 숨김 */
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0
}

.checks input[type="checkbox"]+label {
	display: inline-block;
	position: relative;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
}

.checks input[type="checkbox"]+label:before { /* 가짜 체크박스 */
	content: ' ';
	display: inline-block;
	width: 21px; /* 체크박스의 너비를 지정 */
	height: 21px; /* 체크박스의 높이를 지정 */
	line-height: 21px; /* 세로정렬을 위해 높이값과 일치 */
	margin: -2px 8px 0 0;
	text-align: center;
	vertical-align: middle;
	background: #fafafa;
	border: 1px solid #cacece;
	border-radius: 3px;
	box-shadow: 0px 1px 2px rgba(0, 0, 0, 0.05), inset 0px -15px 10px -12px
		rgba(0, 0, 0, 0.05);
}

.checks input[type="checkbox"]+label:active:before, .checks input[type="checkbox"]:checked+label:active:before
	{
	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05), inset 0px 1px 3px
		rgba(0, 0, 0, 0.1);
}

.checks input[type="checkbox"]:checked+label:before { /* 체크박스를 체크했을때 */
	content: '\2714'; /* 체크표시 유니코드 사용 */
	color: #99a1a7;
	text-shadow: 1px 1px #fff;
	background: #e9ecee;
	border-color: #adb8c0;
	box-shadow: 0px 1px 2px rgba(0, 0, 0, 0.05), inset 0px -15px 10px -12px
		rgba(0, 0, 0, 0.05), inset 15px 10px -12px rgba(255, 255, 255, 0.1);
}
</style>
<script type="text/javascript">
	function alertSelectPart() {
		var result = "";
		var arr = document.getElementsByName("exe_Category");
		for (var i = 0; i < arr.length; i++) {
			//체크된 값을 result변수에 누적(문자열)
			if (arr[i].checked == true) {
				result += document.myform.list[i].value + "\n";
				break;
			}
		}
		if (result == "") {
			alert("부위를 선택해주세요");
			return false;
		}

	}
</script>
</head>

<body>
	<div id="wrapper">

		<!-- Main -->
		<div id="main">

			<div class="inner">

				<!-- Header -->
				<header id="header">
					<a href="testtama" class="logo"><strong>KL</strong> project</a>
					<ul class="icons">


						<li><a class="icon fa-twitter"><span class="label">Twitter</span></a></li>
						<li><a class="icon fa-facebook"><span class="label">Facebook</span></a></li>
						<li><a class="icon fa-snapchat-ghost"><span class="label">Snapchat</span></a></li>
						<li><a class="icon fa-instagram"><span class="label">Instagram</span></a></li>
						<li><a class="icon fa-medium"><span class="label">Medium</span></a></li>
					</ul>

				</header>



				게시글 등록
				<!-- 게시글 등록 -->
				<!-- <button type="button" class="btn btn-outline-info"
				style="width: 95%;" id="register" data-toggle="modal"
				data-target="#exe_register">게시글 등록</button> -->
				<div class="wrap">
					<div>
						<form action="exeWrite" method="post" id="exeRegister"
							onsubmit="return alertSelectPart(this)">
							<div id="div111" class="checks">
								<input type="hidden" name=id
									value='<%=session.getAttribute("session_id")%>'>



								<div class="checks"
									style="position: absolute; top: 300px; left: 210px;">
									<input type="checkbox" name="exe_Category" id="ex_chk4"
										value="어깨"> <label for="ex_chk4">어깨</label>
								</div>
								<div class="checks"
									style="position: absolute; top: 320px; left: 260px;">
									<input type="checkbox" name="exe_Category" id="ex_chk3"
										value="가슴"> <label for="ex_chk3">가슴</label>
								</div>
								<div class="checks"
									style="position: absolute; top: 350px; left: 210px;">
									<input type="checkbox" name="exe_Category" id="ex_chk2"
										value="이두"> <label for="ex_chk2">이두</label>
								</div>
								<div class="checks"
									style="position: absolute; top: 410px; left: 290px;">
									<input type="checkbox" name="exe_Category" id="ex_chk1"
										value="복근"> <label for="ex_chk1">복근</label>
								</div>
								<div class="checks"
									style="position: absolute; top: 550px; left: 240px;">
									<input type="checkbox" name="exe_Category" id="ex_chk5"
										value="허벅지"> <label for="ex_chk5">허벅지</label>
								</div>
								<div class="checks"
									style="position: absolute; top: 410px; left: 290px;">
									<input type="checkbox" name="exe_Category" id="ex_chk6"
										value="복근"> <label for="ex_chk6">복근</label>
								</div>


							</div>
							<div id="exe_Name">
								<label for="exe_Name" style="display: inline;">제목</label> <input
									type="text" class="form-control" name="exe_Name" maxlength="30"
									placeholder="게시글 제목을 입력하세요" required>
							</div>

							<div id="video">
								<label for="video_upload">동영상 주소 올리기</label>
								<div id="input_url">
									<input type="text" class="form-control" name="exe_Video"
										placeholder="https://">
								</div>
							</div>
							<button type="submit" class="btn btn-primary">등록</button>
						</form>
					</div>
				</div>
				</div>
			</div>
			<!-- Sidebar -->
			<div id="sidebar">
				<div class="inner">

					<!-- Search -->
					<section id="search" class="alt">
						<form method="post" action="#">
							<input type="text" name="query" id="query" placeholder="Search" />
						</form>
					</section>

					<!-- Menu -->
					<nav id="menu">
						<header class="major">
							<h2>Menu</h2>
						</header>
						<ul>
													<%if(session.getAttribute("session_id")==null){%>
  
   <%}else{ %>
  	   <li>
  <c:choose>
  
      <c:when test="${nuMessage == 0}">새쪽지:${nuMessage}
      </c:when>
      <c:when test="${nuMessage != 0}">
      새쪽지:${nuMessage}
     <img src="img/q.png" width="13"height="13"></c:when>
      </c:choose>
      </li>
    <%} %>
							<li><a href="testtama">홈</a></li>
							<%
								if (session.getAttribute("session_id") == null) {
							%>
							<li><a href="login_join">로그인/회원가입</a></li>
							<%
								} else if (session.getAttribute("session_id").equals("admin")) {
							%>
							<li><a href="adminpage">관리자</a></li>

							<%
								} else {
							%>
							<li><a href="mypage">마이페이지</a></li>
							<%
								}
							%>

							<li><a href="video">운동영상</a></li>
							<li><span class="opener">정보 공유</span>
								<ul>
									<li><a href="board">운동법</a></li>
									<li><a href="foodlist">레시피</a></li>

								</ul></li>
							<li><span class="opener">PT</span>
								<ul>
									<li><a href="pton">개설 강의</a></li>
									<%
										if (null == session.getAttribute("session_id")) {
									%>
									<%
										} else {
									%>
									<li><a href="ptoff">등록강의</a></li>
									<%
										}
									%>


								</ul></li>
							<li><a href="find">찾아오는 길</a></li>
						</ul>
					</nav>



					<!-- Section -->
					<section>
						<header class="major">
							<h2>관리자정보</h2>
						</header>
						<p>홈페이지 관리자 정보 입니다. 문의할 내용은 해당 정보로 해주시기 바랍니다.</p>
						<ul class="contact">
							<li class="fa-envelope-o">kyg7414@gmail.com</li>
							<li class="fa-phone">(010) 0000-0000</li>
							<li class="fa-home">찾아서 머하실라고요<br /> 경기도, TN 00000-0000
							</li>
						</ul>
					</section>

					<!-- Footer -->
					<footer id="footer">
						<p class="copyright">
							&copy; KL create here <a href="https://unsplash.com">Thank
								you</a> come <a href="https://html5up.net">here</a>.
						</p>
					</footer>

				</div>
			</div>

		</div>
		<!-- Scripts -->
		<script src="assets/js/jquery.min.js"></script>
		<script src="assets/js/browser.min.js"></script>
		<script src="assets/js/breakpoints.min.js"></script>
		<script src="assets/js/util.js"></script>
		<script src="assets/js/main.js"></script>
</body>
</html>