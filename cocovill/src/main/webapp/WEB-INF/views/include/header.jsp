<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/taglibs.jsp"%>

<spring:eval expression="@config['STATUS_S_CODE']" var="STATUS_S_CODE" />

<script>

		
//로그아웃 이벤트
function logout(){
	var goUrl = "/user/userLogout.do";
	$.ajax({
		type:"post",
		async:true,
		url:goUrl,
		dataType:"json",
		success:function(responseData){
			var data = responseData.resultJson;
			if(data.rCode == "${STATUS_S_CODE}"){
				alert(data.rMsg);
				$(location).attr("href", data.goUrl);
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

}
		
</script>


<!-- S:FILE:header.jsp -->
		<!-- NAV TOP  -->
		<div class="navbar navbar-inverse navbar-fixed-top">
			<div class="adjust-nav">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="/"><img src="/resources/assets/img/logo.png" /></a>
				</div>

				<span class="logout-spn"><a href="javascript:logout()" style="color: #fff;">${sessionScope.USER_ID }님 로그아웃</a></span>
<!-- 				<span class="logout-spn"><a href="javascript:logout()" style="color: #fff;">LOGOUT</a></span> -->
				
			</div>
		</div>
		<!-- /. NAV TOP  -->
		
		<!-- NAV SIDE  -->
		<nav class="navbar-default navbar-side" role="navigation">
			<div class="sidebar-collapse">
				<ul class="nav" id="main-menu">
					<li class="active-link"><a href="/uploadSheet/uploadSheetList.do"><i class="glyphicon glyphicon-upload"></i>엑셀업로드</a></li>
					<li><a href="/ordersheet/ordersheetList.do"><i class="glyphicon glyphicon-download"></i>발주</a></li>
					<li><a href="/ordersheetHistory/ordersheetHistoryList.do"><i class="glyphicon glyphicon-list-alt"></i>발주이력</a></li>
					<li><a href="/alterword/alterwordList.do"><i class="glyphicon glyphicon-retweet"></i>대체어관리</a></li>
					<li><a href="/gift/giftList.do"><i class="glyphicon glyphicon-gift"></i>사은품관리</a></li>
					<li><a href="/user/userList.do"><i class="glyphicon glyphicon-user"></i>회원관리</a></li>
				</ul>
			</div>
		</nav>
		<!-- /. NAV SIDE  -->
<!-- E:FILE:header.jsp -->