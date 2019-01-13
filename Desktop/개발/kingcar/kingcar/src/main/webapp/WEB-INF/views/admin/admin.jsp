<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../include/header.jsp"%>
<!-- Main content -->

<script src="../../resources/js/main.js" type="text/javascript"></script>
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->

			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title"></h3>
					<button id="deleteCategoryButton"  style="float: right; margin: 3px;">카테고리 삭제</button>   
					<button id="addVideoButton"  style="float: right; margin: 3px;">동영상 추가(자동)</button>
					<button id="manualAddVideoButton"  style="float: right; margin: 3px;">동영상 추가(수동)</button>
					
				</div>      
				<div class="box-body" id="listView" style="overflow-x: hidden; overflow-y: scroll; height: 795px;">
					<div id="search-container"></div>
					<script
						src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
					<script src="/resources/js/auth.js"></script>
					<script src="/resources/js/search.js"></script>
					<script
						src="https://apis.google.com/js/client.js?onload=googleApiClientReady"></script>
				</div>

			</div>
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->



<%@include file="../include/footer.jsp"%>
