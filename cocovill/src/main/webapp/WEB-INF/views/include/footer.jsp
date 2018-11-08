<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- S:FILE:footer.jsp -->
	<div class="footer">
		<div class="row">
			<div class="col-lg-12">
				&copy; 2018 cocovill.com | Design by: <a
					href="http://binarytheme.com" style="color: #fff;" target="_blank">www.binarytheme.com</a>
			</div>
		</div>
	</div>
		<!-- loading -->
	<div id="wait" style="display:none;width:69px;height:89px;position:absolute;top:50%;left:50%;padding:2px;"><img src='/resources/img/demo_wait.gif' width="64" height="64" /><br>Loading..</div>
<!-- E:FILE:footer.jsp -->

<script>

	$(document).ajaxStart(function(){
		$("#wait").css("display", "block");
	});
	$(document).ajaxComplete(function(){
		$("#wait").css("display", "none");
	});
</script>	