<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- S:FILE:doctype.jsp -->
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>MAIN</title>
<!-- E:FILE:doctype.jsp -->

<!-- S:FILE:style.jsp -->
<!-- BOOTSTRAP STYLES-->
<link href="/resources/assets/css/bootstrap.css" rel="stylesheet" />
<!-- FONTAWESOME STYLES-->
<link href="/resources/assets/css/font-awesome.css" rel="stylesheet" />
<!-- CUSTOM STYLES-->
<link href="/resources/assets/css/custom.css" rel="stylesheet" />
<!-- GOOGLE FONTS-->
<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
<!-- JQUERY UI -->
<link href="https://code.jquery.com/ui/1.12.1/themes/redmond/jquery-ui.css" rel="stylesheet" type="text/css">


<style>
.pagination {
	display: inline-block;
}

.pagination a {
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
}

.pagination a.active {
	background-color: #4CAF50;
	color: white;
	border-radius: 5px;
}

.pagination a:hover:not (.active ) {
	background-color: #ddd;
	border-radius: 5px;
}

</style>

<!-- E:FILE:style.jsp -->

<!-- S:FILE:script.jsp -->
<!-- E:FILE:script.jsp -->



</head>
<body>



	<div id="wrapper">
	
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
		
		<nav class="navbar-default navbar-side" role="navigation">
			<div class="sidebar-collapse">
				<ul class="nav" id="main-menu">
					<li class="active-link"><a href="/ordersheet/ordersheetList.do"><i class="fa fa-desktop "></i>Dashboard</a></li>
					<li><a href="ui.html"><i class="fa fa-table "></i>UI Elements</a></li>
					<li><a href="blank.html"><i class="fa fa-edit "></i>Blank Page</a></li>
				</ul>
			</div>

		</nav>
		<!-- /. NAV SIDE  -->
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-lg-12">
						<h2>ADMIN DASHBOARD</h2>
					</div>
				</div>
				<!-- /. ROW  -->
				<hr />
				
				<!--	S:검색조건 -->
				<form id="frm" name="frm" method="post">
					<input type="hidden" name="pageNum" id="pageNum" value="${paramDto.pageNum}"/>
					<input type="hidden" name="ordersheet_id" id="ordersheet_id"/>					
				
					<div class="row">
						<div class="col-lg-6 ">
							<div class="col-lg-6 col-md-6">
								<input type="text" class="form-control input-lg" name="searchFromDt" value="${paramDto.searchFromDt }" placeholder="시작일">
							</div>								
							<div class="col-lg-6 col-md-6">
								<input type="text" class="form-control input-lg" name="searchToDt" value="${paramDto.searchToDt }" placeholder="종료일">
							</div>								
						</div>
						<div class="col-lg-6 ">
							<div class="col-lg-6 col-md-6">
								<input type="text" class="form-control input-lg" name="searchValue" value="${paramDto.searchValue }">
							</div>								
							<div class="col-lg-6 col-md-6">
								<button type="button" id="btnSearch" class="btn btn-primary btn-lg btn-block"><i class="fa fa-search"></i>&nbsp;검색</button>
							</div>								
						</div>
					</div>
					<!-- /. ROW  -->
				</form>	 
				<!--	S:검색조건 -->
				<hr />
				<div class="row text-center pad-top">
					<div class="col-lg-12">
					
						<table id="dataTable" class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th>#</th>
									<th>ordersheet_id</th>
									<th>sample1</th>
									<th>sample2</th>
									<th>sample3</th>
									<th>sample4</th>
									<th>sample5</th>
									<th>sample6</th>
									<th>sample7</th>
									<th>sample8</th>
									<th>sample9</th>
									<th>등록일</th>
									<th>등록자</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty resultList }">
										<tr><td colspan="13">등록된 내용이 없습니다.</td></tr>
									</c:when>
									<c:otherwise>
										<c:forEach items="${resultList }" var="result">
											<tr id="${result.ordersheet_id }">
												<td>${result.rowNum }</td>
												<td>${result.ordersheet_id }</td>
												<td>${result.sample1 }</td>
												<td>${result.sample2 }</td>
												<td>${result.sample3 }</td>
												<td>${result.sample4 }</td>
												<td>${result.sample5 }</td>
												<td>${result.sample6 }</td>
												<td>${result.sample7 }</td>
												<td>${result.sample8 }</td>
												<td>${result.sample9 }</td>
												<td>
													<fmt:parseDate var="in_date" value="${result.in_date }" pattern="yyyy-MM-dd HH:mm:ss"/>
													<fmt:formatDate value="${in_date }" pattern="yyyy-MM-dd"/>														
												</td>
												<td>${result.in_user }</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
						
					</div>
				</div>
				<!-- /. ROW  -->
				
				<!-- BEGIN PAGING -->
				<div class="row"> 
					<div class="col-lg-12 pagination container">
								${paging}
					</div>
				</div>	 
				<!-- END PAGING -->
				
				<!--	S:버튼 -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel pull-right">
							<button type="button" id="btnReg" class="btn btn-primary"><i class="fa fa-file"></i>&nbsp;등록</button>
						</div>
					</div>
				</div>
				<!--	E:버튼 -->
				
			</div>
			<!-- /. PAGE INNER  -->
		</div>
		<!-- /. PAGE WRAPPER  -->
	</div>
	<div class="footer">
		<div class="row">
			<div class="col-lg-12">
				&copy; 2014 yourdomain.com | Design by: <a
					href="http://binarytheme.com" style="color: #fff;" target="_blank">www.binarytheme.com</a>
			</div>
		</div>
	</div>


	<!-- /. WRAPPER  -->
	<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
	<!-- JQUERY SCRIPTS -->
	<script src="/resources/assets/js/jquery-1.10.2.js"></script>
	<!-- BOOTSTRAP SCRIPTS -->
	<script src="/resources/assets/js/ordersheet.min.js"></script>
	<!-- CUSTOM SCRIPTS -->
	<script src="/resources/assets/js/custom.js"></script>
	<!-- JQUERY UI -->
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>


<script>

$.datepicker.setDefaults({
	dateFormat: 'yy-mm-dd',
	prevText: '이전 달',
	nextText: '다음 달',
	monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	showMonthAfterYear: true,
	yearSuffix: '년'
});

var listUrl = "/ordersheet/ordersheetList.do";
var detailUrl = "/ordersheet/ordersheetDetail.do";
var formlUrl = "/ordersheet/ordersheetForm.do";

$(function(){
	$("input[name=searchFromDt], input[name=searchToDt]").datepicker();
	
	//검색어 키업 이벤트발생시 검색버튼 활성화 및 엔터키 이벤트 발생
	$("input[name=searchValue]").bind("keyup", function(e){
		//엔터키 클릭시 검색
		if (e.keyCode == 13){
			$("#pageNum").val("1");
			$("#frm").attr("action", listUrl);
			$("#frm").submit();
		}
	});
	
	//검색어 입력후 엔터키 이벤트
	$("#btnSearch").bind("click", function(e) {
		$("#pageNum").val("1");
		$("#frm").attr("action", listUrl);
		$("#frm").submit();
	});		
	
	//상세 이벤트
	$("#dataTable > tbody > tr").bind("click", function() {
		$("#ordersheet_id").val($(this).attr("id"));
		$("form[name=frm]").attr("action", detailUrl);
		$("form[name=frm]").submit();
	});
	
	//등록 이벤트
	$("#btnReg").bind("click", function(){
		$("form[name=frm]").attr("action", formlUrl);
		$("form[name=frm]").submit();
	});
});

// 페이징
function goPage(pageNo){
	$("#pageNum").val(pageNo);
	$("#searchValue").val("${paramDto.searchValue}");
	$("#frm").attr("action", listUrl);
	$("#frm").submit();
};
</script>

</body>
</html>

