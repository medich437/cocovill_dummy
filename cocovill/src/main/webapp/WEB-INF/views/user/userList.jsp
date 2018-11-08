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
						<h2>회원관리</h2>
					</div>
				</div>
				<!-- /. ROW  -->
				<hr />
				
				<!--	S:검색조건 -->
				<form id="frm" name="frm" method="post">
					<input type="hidden" name="pageNum" id="pageNum" value="${paramDto.pageNum}"/>
					<input type="hidden" name="user_id" id="user_id"/>					
				
					<div class="row">
						<div class="col-lg-12 ">
							<div class="col-lg-10 col-md-10">
								<input type="text" class="form-control input-lg" name="searchValue" value="${paramDto.searchValue }">
							</div>								
							<div class="col-lg-2 col-md-2">
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
									<th>아이디</th>
									<th>최근로그인일</th>
									<th>최근로그인IP</th>
									<th>탈퇴여부</th>
									<th>등록일</th>
									<th>수정일</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty resultList }">
										<tr><td colspan="6">등록된 내용이 없습니다.</td></tr>
									</c:when>
									<c:otherwise>
										<c:forEach items="${resultList }" var="result">
											<tr id="${result.user_id }">
												<td>${result.user_id }</td>
												<td>
													<fmt:parseDate var="last_login_date" value="${result.last_login_date }" pattern="yyyy-MM-dd HH:mm:ss"/>
													<fmt:formatDate value="${last_login_date }" pattern="yyyy-MM-dd"/>														
												</td>
												<td>${result.last_login_ip }</td>
												<td>
													<c:choose>
														<c:when test="${result.del_yn eq 'N'}">가입</c:when>
														<c:when test="${result.del_yn eq 'Y'}">탈퇴</c:when>
														<c:otherwise>${result.del_yn }</c:otherwise>
													</c:choose>	
												</td>
												<td>
													<fmt:parseDate var="in_date" value="${result.in_date }" pattern="yyyy-MM-dd HH:mm:ss"/>
													<fmt:formatDate value="${in_date }" pattern="yyyy-MM-dd"/>														
												</td>
												<td>
													<fmt:parseDate var="up_date" value="${result.up_date }" pattern="yyyy-MM-dd HH:mm:ss"/>
													<fmt:formatDate value="${up_date }" pattern="yyyy-MM-dd"/>														
												</td>
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

var listUrl = "/user/userList.do";
var detailUrl = "/user/userDetail.do";
var formlUrl = "/user/userForm.do";

$(function(){
	
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
		$("#user_id").val($(this).attr("id"));
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

