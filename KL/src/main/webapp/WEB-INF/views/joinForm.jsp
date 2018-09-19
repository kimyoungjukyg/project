<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- ajax를 이용한 아이디 중복확인 기능 -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script>
	//JSON : JavaScript Object Notation

	$(function(){
		$("#joinForm").submit(function(){
			 if ($("#pass1").val().length < 5) {
				alert("비밀번호는 5자 이상으로 설정해야 합니다.");
				$("#pass1").val("").focus();
				return false;
			}else if($.trim($("#pass1").val()) !== $("#pass1").val() || $.trim($("#email").val()) !== $("#email").val() || $.trim($("#id").val()) !== $("#id").val()){
				alert("공백은 입력이 불가능합니다.");
				return false;
			}
		});
		/* $("#id").keyup(function() {
			$.ajax({
				url : "./check_id.do",
				type : "POST",
				data : {
					id : $("#id").val()
				},
				success : function(result) {
					if (result == 1) {
						$("#id_check").html("중복된 아이디가 있습니다.");
						$("#joinBtn").attr("disabled", "disabled");
					} else {
						$("#id_check").html("");
						$("#joinBtn").removeAttr("disabled");
					}
				},
			})
		});
		
		$("#email").keyup(function(){
			$.ajax({
				url : "./check_email.do",
				type : "POST",
				data : {
					email : $("#email").val()
				},
				success : function(result) {
					if (result == 1) {
						$("#email_check").html("중복된 이메일이 있습니다.");
					} else {
						$("#email_check").html("");
					}
				},
			})
		});  */
	})


	

	 //전화번호 유효성 검사
	$(function(){

	    $(".phone-number-check").on('keydown', function(e){
	       // 숫자만 입력받기
	        var trans_num = $(this).val().replace(/-/gi,'');
		var k = e.keyCode;
					
		if(trans_num.length >= 11 && ((k >= 48 && k <=126) || (k >= 12592 &&  k<= 12687 || k==32 || k==229 || (k>=45032 && k<=55203)) ))
		{
	  	    e.preventDefault();
		}
	    }).on('blur', function(){ // 포커스를 잃었을때 실행합니다.
	        if($(this).val() == '') return;

	        // 기존 번호에서 - 를 삭제합니다.
	        var trans_num = $(this).val().replace(/-/gi,'');
	      
	        // 입력값이 있을때만 실행합니다.
	        if(trans_num != null && trans_num != '')
	        {
	            // 총 핸드폰 자리수는 11글자이거나, 10자여야 합니다.
	            if(trans_num.length==11 || trans_num.length==10) 
	            {   
	                // 유효성 체크
	                var regExp_ctn = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/;
	                if(regExp_ctn.test(trans_num))
	                {
	                    // 유효성 체크에 성공하면 하이픈을 넣고 값을 바꿔줍니다.
	                    trans_num = trans_num.replace(/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?([0-9]{3,4})-?([0-9]{4})$/, "$1-$2-$3");                  
	                    $(this).val(trans_num);
	                }
	                else
	                {
	                    alert("유효하지 않은 전화번호 입니다.");
	                    $(this).val("");
	                    $(this).focus();
	                }
	            }
	            else 
	            {
	                alert("유효하지 않은 전화번호 입니다.");
	                $(this).val("");
	                $(this).focus();
	            }
	      }
	  });  
	});
	
	// 비밀번호 체크
function passCheck() {
		var pass1 = $("#pass1").val();
		var pass2 = $("#pass2").val();
		if(pass1 != pass2) {
			$("#passCheckMessage").html("비밀번호가 일치하지 않습니다.");
			$("#pass1").addClass("warn");
			$("#pass2").addClass("warn")
		} else {
			$("#passCheckMessage").html("");
			$("#pass1").removeClass("warn");
			$("#pass2").removeClass("warn");
		}
		
	}
	
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if(data.userSelectedType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('sample6_address').value = fullAddr;

            // 커서를 상세주소 필드로 이동한다.
            document.getElementById('sample6_address2').focus();
        }
    }).open();
}


</script>
</head>

<body>
 <form action="join" method="post" name="frm" id="joinForm" enctype="multipart/form-data">
 
		<table border="1">
		 <tr>
            <th>이미지 </th>
             <td>
                <input type="file" name="uploadFile" id="uploadFile" />
                <input type="hidden" name="profile_img" value="">
            </td>
        </tr>


			<tr>
				<td>아이디 : <input class="w3-input" type="text" id="id" name="id" required> 
						<span id="id_check" class="w3-text-red"></span>
				</td>
			</tr>
			<tr>
				<td>비밀번호 : <input type="password" name="password" id="pass1"
					onkeyup="passCheck()" placeholder="비밀번호를 입력해 주세요."></td>
			</tr>
			<tr>
				<td>비밀번호 재확인 : <input type="password" id="pass2"
					onkeyup="passCheck()" placeholder="한번 더  입력해 주세요." />
				<td>
			</tr>
			<tr>
				<td>
					<p style="color: red;" id="passCheckMessage"></p>
				</td>
			</tr>
			<tr>
				<td>이름 : <input type="text" name="name"></td>
			</tr>
			<tr>
				<td>성별 : <select name="gender">
						<option value="남자" selected="selected">남자</option>
						<option value="여자">여자</option>
						<option value="중성">중성</option>
				</select></td>
			</tr>
			<tr>
				<td>전화번호 : <input type="text" class="phone-number-check" name = "phone_number"></td>
			</tr>
			<tr>
				<td><input type="text" id="sample6_postcode" placeholder="우편번호">
					<input type="button" onclick="sample6_execDaumPostcode()"
					value="우편번호 찾기"></td>
			</tr>
			<tr>
				<td><input type="text" id="sample6_address" name="address" placeholder="주소"><input
					type="text" id="sample6_address2" placeholder="상세주소"></td>

			</tr>
			<tr>
				<td>이메일 : 	<input type="text" id="email" name="email" class="w3-input" required placeholder="이메일 인증 후 로그인이 가능합니다.">
						<span id="email_check" class="w3-text-red"></span>
				
				<span id="email_check" class="w3-text-red"></span>

				</td>
			</tr>
			<tr>
				<td>회원 분류 : <select name="classify" id="classify">
						<option value="0" selected="selected" id="classify">일반 회원</option>
						<option value="1" id="classify">트레이너</option>
				</select></td>
			</tr>
		</table>
		<button type="submit" value="가입 " id="joinBtn">가입</button>
	</form> 
	
</body>
</html>	
			
