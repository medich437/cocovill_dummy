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
						<h2>Excel 업로드</h2>
					</div>
				</div>
				<!-- /. ROW  -->
				<hr />

				<div class="row text-center pad-top">
					<div class="col-lg-12">
					
						<form id="excelUploadForm" name="excelUploadForm" enctype="multipart/form-data" method="post" action="/uploadSheet/excelUploadAjax.do">
						
						
						
						<div class="row">
							<div class="col-lg-12 col-md-6">
								첨부파일은 한개만 등록 가능합니다.			
							</div>
						</div>
						<div class="row">
							<div class="col-lg-8 ">
								<div class="col-lg-8 col-md-8">
									<input id="excelFile" type="file" name="excelFile" />
								</div>								
								<div class="col-lg-4 col-md-4">
									<button type="button" id="addExcelImpoartBtn" class="btn btn-primary btn-lg btn-block" onclick="check()">
										<i class="glyphicon glyphicon-upload"></i>&nbsp;업로드
									</button>
								</div>								
							</div>
						</div>
						
						</form>

					</div>
				</div>
				<!-- /. ROW  -->
				
				<hr />
				<!-- 업로드 내용 -->
				<div class="row text-center pad-top" id="pop_excel_upload_form">
				</div>
				<!-- /. ROW  -->
				
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

	function checkFileType(filePath) {
		var fileFormat = filePath.split(".");
		if (fileFormat.indexOf("xlsx") > -1) {
			return true;
		} else {
			return false;
		}
	}
	
	function check() {
		var file = $("#excelFile").val();
		if (file == "" || file == null) {
			alert("파일을 선택해주세요.");
			return false;
		} else if (!checkFileType(file)) {
			alert("엑셀 파일만 업로드 가능합니다.");
			return false;
		}
	
		if (confirm("업로드 하시겠습니까?")) {
			$('#pop_excel_upload_form').empty();
			var formData = new FormData($("#excelUploadForm")[0]);
			$.ajax({
				type : 'post',
				url : '/uploadSheet/excelUploadAjax.do',
				data : formData,
				processData : false,
				contentType : false,
				success : function(data) {
					$('#pop_excel_upload_form').html(data);
				},
				error : function(error) {
					alert("파일 업로드에 실패하였습니다.");
					console.log(error);
					console.log(error.status);
				}
			});
		}
	}
</script>

</body>
</html>

