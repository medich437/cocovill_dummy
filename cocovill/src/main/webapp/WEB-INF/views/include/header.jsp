<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/taglibs.jsp"%>

<spring:eval expression="@config['STATUS_S_CODE']" var="STATUS_S_CODE" />

<script>

	$(function(){
		
		//뎁스2단계 드롭다운 열기
		if($("#${depth2}") != ""){
			$("#${depth2}").parent("ul").addClass("in");
			$("#${depth2}").addClass("collapsed");
		}
		
		logout = function(){
// 			alert("세션: ${sessionScope.LOGIN_GBN} \n gbn1: ${login_gbn_01} \n gbn2: ${login_gbn_02}");
			if(confirm("로그아웃 하시겠습니까?")){
				location.href = "/common/logout/logout.do;
			}
		}
		
	});
</script>


<!-- S:FILE:header.jsp -->
		<!-- NAV TOP  -->
		<div class="navbar navbar-inverse navbar-fixed-top">
			<div class="adjust-nav">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#"><img src="/resources/assets/img/logo.png" /></a>
				</div>

				<span class="logout-spn"> <a href="#" style="color: #fff;">LOGOUT</a>

				</span>
				
			</div>
		</div>
		<!-- /. NAV TOP  -->
		
		<!-- NAV SIDE  -->
		<nav class="navbar-default navbar-side" role="navigation">
			<div class="sidebar-collapse">
				<ul class="nav" id="main-menu">
					<li class="active-link"><a href="/ordersheet/ordersheetList.do"><i class="fa fa-desktop "></i>주문서등록</a></li>
					<li><a href="/ordersheet/ordersheetList.do"><i class="glyphicon glyphicon-list-alt"></i>발주이력</a></li>
					<li><a href="/ordersheet/ordersheetList.do"><i class="glyphicon glyphicon-pencil"></i>변경코드관리</a></li>
					<li><a href="/ordersheet/ordersheetList.do"><i class="glyphicon glyphicon-user"></i>회원관리</a></li>
					<li><a href="/uploadSheet/uploadSheetList.do"><i class="glyphicon glyphicon-user"></i>엑셀업로드</a></li>
				</ul>
			</div>
		</nav>
		<!-- /. NAV SIDE  -->
<!-- E:FILE:header.jsp -->