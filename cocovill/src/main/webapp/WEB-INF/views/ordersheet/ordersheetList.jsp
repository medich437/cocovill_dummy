<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/include/taglibs.jsp"%>

<%@include file="/WEB-INF/views/include/doctype.jsp"%>
<%@include file="/WEB-INF/views/include/style.jsp"%>
<%@include file="/WEB-INF/views/include/script.jsp"%>


</head>
<body>

	<div id="wrapper">
	
		<!-- S:FILE:header.jsp -->
		<%@include file="/WEB-INF/views/include/header.jsp"%>
		<!-- E:FILE:header.jsp -->
		
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
				
				<!-- S:FILE:paging.jsp -->
				<%@include file="/WEB-INF/views/include/paging.jsp"%>
				<!-- E:FILE:paging.jsp -->
				
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

	<!-- S:FILE:footer.jsp -->
	<%@include file="/WEB-INF/views/include/footer.jsp"%>
	<!-- E:FILE:footer.jsp -->


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

