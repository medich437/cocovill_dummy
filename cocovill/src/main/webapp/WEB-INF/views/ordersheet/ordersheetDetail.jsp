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
table tbody tr th{text-align: right; margin-right: 1em;}
table tbody tr td{text-align: left; margin-left: 1em;}
</style>

<!-- E:FILE:style.jsp -->

<!-- S:FILE:script.jsp -->
<!-- E:FILE:script.jsp -->

<spring:eval expression="@config['STATUS_S_CODE']" var="STATUS_S_CODE" />

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
				
				<form id="frm" name="frm" method="post">
					<input type="hidden" name="pageNum" id="pageNum" value="${paramDto.pageNum}"/>
					<input type="hidden" name="searchValue" value="${paramDto.searchValue}"/>
					<input type="hidden" name="searchFromDt" value="${paramDto.searchFromDt }"/>					
					<input type="hidden" name="searchToDt" value="${paramDto.searchToDt }"/>					
					<input type="hidden" name="ordersheet_id" id="ordersheet_id" value="${result.ordersheet_id }"/>					
				</form>	 
				
				<div class="row text-center pad-top">
					<div class="col-lg-12">
					
						<div class="table-responsive">
							<table class="table table-bordered table-hover table-striped">
								<tbody>
									<tr>
										<th class="col-lg-2">순번</th>
										<td>${result.ordersheet_id }</td>
									</tr>
									<tr>
										<th class="col-lg-2">sample1</th>
										<td>${result.sample1 }</td>
									</tr>
									<tr>
										<th class="col-lg-2">sample2</th>
										<td>${result.sample2 }</td>
									</tr>
									<tr>
										<th class="col-lg-2">sample3</th>
										<td>${result.sample3 }</td>
									</tr>
									<tr>
										<th class="col-lg-2">sample4</th>
										<td>${result.sample4 }</td>
									</tr>
									<tr>
										<th class="col-lg-2">sample5</th>
										<td>${result.sample5 }</td>
									</tr>
									<tr>
										<th class="col-lg-2">sample6</th>
										<td>${result.sample6 }</td>
									</tr>
									<tr>
										<th class="col-lg-2">sample7</th>
										<td>${result.sample7 }</td>
									</tr>
									<tr>
										<th class="col-lg-2">sample8</th>
										<td>${result.sample8 }</td>
									</tr>
									<tr>
										<th class="col-lg-2">sample9</th>
										<td>${result.sample9 }</td>
									</tr>
									<tr>
										<th class="col-lg-2">sample10</th>
										<td>${result.sample10 }</td>
									</tr>
									<tr>
										<th class="col-lg-2">등록일시</th>
										<td>${result.in_date }</td>
									</tr>
									<tr>
										<th class="col-lg-2">등록자</th>
										<td>${result.in_user }</td>
									</tr>
									<tr>
										<th class="col-lg-2">등록자 IP</th>
										<td>${result.in_ip }</td>
									</tr>
									<tr>
										<th class="col-lg-2">수정일시</th>
										<td>${result.up_date }</td>
									</tr>
									<tr>
										<th class="col-lg-2">수정자</th>
										<td>${result.up_user }</td>
									</tr>
									<tr>
										<th class="col-lg-2">수정자 IP</th>
										<td>${result.up_ip }</td>
									</tr>
								</tbody>
							</table>
						</div>
						
					</div>
				</div>
				<!-- /. ROW  -->
				
				<!--	S:버튼 -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel pull-right">
							<button type="button" id="btnList" class="btn btn-primary"><i class="fa fa-file "></i>&nbsp;목록</button>
							<button type="button" id="btnUpd" class="btn btn-primary"><i class="fa fa-wrench "></i>&nbsp;수정</button>
							<button type="button" id="btnDel" class="btn btn-primary"><i class="fa fa-trash "></i>&nbsp;삭제</button>
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
var listUrl = "/ordersheet/ordersheetList.do";
var detailUrl = "/ordersheet/ordersheetDetail.do";
var formlUrl = "/ordersheet/ordersheetForm.do";
var deletelUrl = "/ordersheet/ordersheetDelete.do";

$(function(){
	
	//목록 이벤트
	$("#btnList").bind("click", function(){
		$("form[name=frm]").attr("action", listUrl);
		$("form[name=frm]").submit();
	});
	//수정 이벤트
	$("#btnUpd").bind("click", function(){
		$("form[name=frm]").attr("action", formlUrl);
		$("form[name=frm]").submit();
	});
	
	//이전 다음  / 상세 이벤트
	$("#dataTable > tbody > tr").bind("click", function() {
		$("#board_id").val($(this).attr("id"));
		$("form[name=frm]").attr("action", detailUrl);
		$("form[name=frm]").submit();
	});	
	
	//삭제 이벤트
	$("#btnDel").bind("click", function(){
		var goUrl = deletelUrl;
		
 		$.ajax({
			type:"post",
			async:true,
			url:goUrl,
			data:$("form[name=frm]").serialize(),
			dataType:"json",
			beforeSend:beforSubmit,
			success:function(responseData){
				var data = responseData.resultJson;
				if(data.rCode == "${STATUS_S_CODE}"){
					alert("삭제 되었습니다.");
					$("form[name=frm]").attr("action", data.goUrl);
					$("form[name=frm]").submit();
				}else{
					alert(data.rMsg);
					return;
				}	
			},
			error: function (jqXHR, exception){
				alert("["+jqXHR.status+"]오류입니다.\n"+exception);
				return;
			}
		});
	});	
	
	// 폼 데이터 점검
	beforSubmit = function(){
		if(!confirm("삭제하시겠습니까?")){
			return false;
		}
	};		

});
</script>

</body>
</html>

