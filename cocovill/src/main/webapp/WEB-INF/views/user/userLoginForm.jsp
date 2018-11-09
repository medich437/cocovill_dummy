<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/include/taglibs.jsp"%>

<%@include file="/WEB-INF/views/include/doctype.jsp"%>
<%@include file="/WEB-INF/views/include/style.jsp"%>
<%@include file="/WEB-INF/views/include/script.jsp"%>


<style type="text/css">
body#LoginForm {
	background-image:
		url("/resources/img/blur-26347-27038-hd-wallpapers.jpg");
	background-repeat: no-repeat;
/* 	background-position: center; */
	background-size: cover;
	padding: 10px;
	margin-top:100px;
}

.form-heading {
	color: #fff;
	font-size: 23px;
}

.panel h2 {
	color: #444444;
	font-size: 18px;
	margin: 0 0 8px 0;
}

.panel p {
	color: #777777;
	font-size: 14px;
	margin-bottom: 30px;
	line-height: 24px;
}

.login-form .form-control {
	background: #f7f7f7 none repeat scroll 0 0;
	border: 1px solid #d4d4d4;
	border-radius: 4px;
	font-size: 14px;
	height: 50px;
	line-height: 50px;
}

.main-div {
	background: #ffffff none repeat scroll 0 0;
	border-radius: 2px;
	margin: 10px auto 30px;
	max-width: 38%;
	padding: 50px 70px 70px 71px;
}

.login-form .form-group {
	margin-bottom: 10px;
}

.login-form {
	text-align: center;
}

.forgot a {
	color: #777777;
	font-size: 14px;
	text-decoration: underline;
}

.login-form  .btn.btn-primary {
	background: #f0ad4e none repeat scroll 0 0;
	border-color: #f0ad4e;
	color: #ffffff;
	font-size: 14px;
	width: 100%;
	height: 50px;
	line-height: 50px;
	padding: 0;
}

.forgot {
	text-align: left;
	margin-bottom: 30px;
}

.botto-text {
	color: #ffffff;
	font-size: 14px;
	margin: auto;
}

.login-form .btn.btn-primary.reset {
	background: #ff9900 none repeat scroll 0 0;
}

.back {
	text-align: left;
	margin-top: 10px;
}

.back a {
	color: #444444;
	font-size: 13px;
	text-decoration: none;
}
</style>


</head>

<body id="LoginForm">
	<div class="container">
<!-- 		<h1 class="form-heading">로그인</h1> -->
		<div class="login-form">
			<div class="main-div">
				<div class="panel">
					<h2>관리자 로그인</h2>
					<p>아이디와 비밀번호를 입력해 주세요.</p>
				</div>
				<form id="Login" name="frm">
					<div class="form-group">
						<input type="text" class="form-control" name="user_id" placeholder="아이디">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" name="user_pw" placeholder="비밀번호">
					</div>
					<button type="button" id="btnLogin" class="btn btn-primary">로그인</button> 
				</form>
			</div>
<!-- 			<p class="botto-text">cocovill</p> -->
		</div>
	</div>

<spring:eval expression="@config['STATUS_S_CODE']" var="STATUS_S_CODE" />
<script>

//검색어 키업 이벤트발생시 검색버튼 활성화 및 엔터키 이벤트 발생
$("input[name=user_id], input[name=user_pw]").on("keyup", function(e){
	//엔터키 클릭시 검색
	if (e.keyCode == 13){
		$("#btnLogin" ).trigger("click" );
	}
});

//로그인 이벤트
$("#btnLogin").bind("click", function(){
	var goUrl = "/user/userLogin.do";
	
	if(!$("input[name=user_id]").val() || !$("input[name=user_pw]").val()){
		alert("아이디, 비밀번호를 입력하세요");
		return false;
	}
	
	$.ajax({
		type:"post",
		async:true,
		url:goUrl,
		data:$("form[name=frm]").serialize(),
		dataType:"json",
		success:function(responseData){
			var data = responseData.resultJson;
			if(data.rCode == "${STATUS_S_CODE}"){
				alert(data.rMsg);
				$(location).attr("href", "/");
			}else{
				alert(data.rMsg);
				return;
			}	
		},
		error: function (jqXHR, exception) {
			alert("["+jqXHR.status+"]오류입니다.\n"+exception);
			var msg = '';
			if (jqXHR.status === 0) {
				msg = 'Not connect.\n Verify Network.';
			} else if (jqXHR.status == 404) {
				msg = 'Requested page not found. [404]';
			} else if (jqXHR.status == 500) {
				msg = 'Internal Server Error [500].';
			} else if (exception === 'parsererror') {
				msg = 'Requested JSON parse failed.';
			} else if (exception === 'timeout') {
				msg = 'Time out error.';
			} else if (exception === 'abort') {
				msg = 'Ajax request aborted.';
			} else {
				msg = 'Uncaught Error.\n' + jqXHR.responseText;
			}
			console.log(msg)
			return;
		}
	});

});	
</script>

</body>
</html>
