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
<!-- <link href="https://code.jquery.com/ui/1.12.1/themes/redmond/jquery-ui.css" rel="stylesheet" type="text/css"> -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


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
				
				<div class="row">
					<div class="col-lg-12">
						<form name="frm" id="frm" method="post">
							<input type="hidden" name="pageNum" id="pageNum" value="${paramDto.pageNum}"/>
							<input type="hidden" name="searchValue" value="${paramDto.searchValue}"/>
							<input type="hidden" name="searchFromDt" value="${paramDto.searchFromDt }"/>					
							<input type="hidden" name="searchToDt" value="${paramDto.searchToDt }"/>					
							<input type="hidden" name="ordersheet_id" id="ordersheet_id" value="${result.ordersheet_id }"/>		
						
							<input type="hidden" name="sample1" id="sample1"/>
							
							<div class="form-group">
								<label for="board_cat">카테고리</label>
								<select name="isample1" id="isample1" class="form-control">
									<option value="sample1">sample1</option>
									<option value="하하하">하하하</option>
									<option value="히히히">히히히</option>
								</select>
							</div>
							
							<div class="form-group">
								<label for="sample2">sample2</label>
								<input type="text" name="sample2" id="sample2" class="form-control" placeholder="sample2" value="${result.sample2 }" />
							</div>
							<div class="form-group">
								<label for="sample3">sample3</label>
								<input type="text" name="sample3" id="sample3" class="form-control" placeholder="sample3" value="${result.sample3 }" />
							</div>
							<div class="form-group">
								<label for="sample4">sample4</label>
								<input type="text" name="sample4" id="sample4" class="form-control" placeholder="sample4" value="${result.sample4 }" />
							</div>
							<div class="form-group">
								<label for="sample5">sample5</label>
								<input type="text" name="sample5" id="sample5" class="form-control" placeholder="sample5" value="${result.sample5 }" />
							</div>
							<div class="form-group">
								<label for="sample6">sample6</label>
								<input type="text" name="sample6" id="sample6" class="form-control" placeholder="sample6" value="${result.sample6 }" />
							</div>
							<div class="form-group">
								<label for="sample7">sample7</label>
								<input type="text" name="sample7" id="sample7" class="form-control" placeholder="sample7" value="${result.sample7 }" />
							</div>
							<div class="form-group">
								<label for="sample8">sample8</label>
								<input type="text" name="sample8" id="sample8" class="form-control" placeholder="sample8" value="${result.sample8 }" />
							</div>
							<div class="form-group">
								<label for="sample9">sample9</label>
								<input type="text" name="sample9" id="sample9" class="form-control" placeholder="sample9" value="${result.sample9 }" />
							</div>
							<div class="form-group">
								<label for="sample10">sample10</label>
<%-- 								<input type="text" name="sample10" id="sample10" class="form-control" placeholder="sample10" value="${result.sample10 }" /> --%>
								<textarea name="sample10" id="sample10" rows="10" cols="100">${result.sample10 }</textarea>
							</div>
<!-- 							<div class="form-group"> -->
<!-- 								<label for="board_nm">내용</label> -->
<%-- 									<textarea name="board_txt" id="board_txt" rows="8" cols="70" style="width:100%;">${result.board_txt }</textarea> --%>
<!-- 							</div> -->
<!-- 							<div class="form-group"> -->
<%-- 								<label>첨부파일<br><c:out value="${result.originalFileName}" /></label> --%>
<!-- 								<input type="file" name="file" id="file" class="form-control" /> -->
<!-- 							</div>							 -->
						</form>
					</div>
				</div>
				<!-- /.row -->

				<!--	S:버튼 -->
				<div class="row">
					<div class="col-lg-12">
						<div class="pull-right">							
							<button type="button" id="btnList" class="btn btn-primary"><i class="fa fa-list "></i>&nbsp;목록</button> 
							<button type="button" id="btnSave" class="btn btn-primary"><i class="fa fa-save "></i>&nbsp;저장</button>
						</div>
					</div>
				</div>
				
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
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<!-- Smart Editor -->
	<script src="/resources/smarteditor2-master/dist/js/service/HuskyEZCreator.js" charset="utf-8"></script>


<script>
var listUrl = "/ordersheet/ordersheetList.do";
var updateUrl = "/ordersheet/ordersheetUpdate.do";
var insertUrl = "/ordersheet/ordersheetInsert.do";


$(function(){
	
	//SmartEditor
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "sample10",
		sSkinURI: "/resources/smarteditor2-master/dist/SmartEditor2Skin.html",
		fCreator: "createSEditor2"
	});
	
	//초기값
	if("${empty result.ordersheet_id}"){
		$("select option:eq(0)").attr("selected", "selected");
	}else{
		$("#isample1").val("${result.sample1}");
	}
	
	
	//목록 이벤트
	$("#btnList").bind("click", function(){
		$("form[name=frm]").attr("action", listUrl);
		$("form[name=frm]").submit();
	});
	
	//등록 이벤트
	$("#btnSave").bind("click", function(){
		
		if(!confirm("등록하시겠습니까?")){
			return false;
		}
		
		var goUrl = "";
		if($("#ordersheet_id").val().length > 0){
			goUrl = updateUrl;
		}else{
			goUrl = insertUrl;
		}

		
		//SmartEditor 에디터의 내용이 textarea에 적용된다.
		oEditors.getById["sample10"].exec("UPDATE_CONTENTS_FIELD", []);
		//SmartEditor 에디터의 내용에 대한 값 검증은 이곳에서
		if ($("#sample10").val() == "") {alert("내용을 입력하세요");	return false;}		
		
		$("#sample1").val($("#isample1 option:selected").val());
// 		$("#frm").attr("action", goUrl);
// 		$("#frm").submit();


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
					alert("저장 되었습니다.");
					$("form[name=frm]").attr("action", data.goUrl);
					$("form[name=frm]").submit();
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
	
	// 폼 데이터 점검
	beforSubmit = function(){
	};

});

</script>

</body>
</html>

