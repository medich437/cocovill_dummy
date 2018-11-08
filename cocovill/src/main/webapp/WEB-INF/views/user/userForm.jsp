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
				
				<div class="row">
					<div class="col-lg-12">
						<form name="frm" id="frm" method="post">
							<input type="hidden" name="pageNum" id="pageNum" value="${paramDto.pageNum}"/>
							<input type="hidden" name="searchValue" value="${paramDto.searchValue}"/>
							
							<div class="form-group">
								<label for="user_id">아이디</label>
								<input type="text" name="user_id" id="user_id" class="form-control" placeholder="아이디" value="${result.user_id }" />
							</div>
							<div class="form-group">
								<label for="user_pw">비밀번호</label>
								<input type="password" name="user_pw" id="user_pw" class="form-control" placeholder=비밀번호 value="${result.user_pw }" />
							</div>
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

	<!-- S:FILE:footer.jsp -->
	<%@include file="/WEB-INF/views/include/footer.jsp"%>
	<!-- E:FILE:footer.jsp -->

<script>
var listUrl = "/user/userList.do";
var updateUrl = "/user/userUpdate.do";
var insertUrl = "/user/userInsert.do";


$(function(){
	
	//목록 이벤트
	$("#btnList").bind("click", function(){
		$("form[name=frm]").attr("action", listUrl);
		$("form[name=frm]").submit();
	});
	
	if(${!empty result.user_id}){
		$("#user_id").prop("readonly", true);
	}
	
	//등록 이벤트
	$("#btnSave").bind("click", function(){
		
		if(!confirm("등록하시겠습니까?")){
			return false;
		}
		
		var goUrl = "";
		if(${!empty result.user_id }){
			goUrl = updateUrl;
		}else{
			goUrl = insertUrl;
		}

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
					alert(data.rMsg + "\n" +data.rReason);
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

