<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>
<script src="../../resources/js/main.js" type="text/javascript"></script>
<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">비디오 수정</h3>
				</div>
				<!-- /.box-header -->

<form role="form" method="post">

	<div class="box-body">

		<div class="form-group">
			<label for="Vedeo Id">Video Id</label> <input type="text" required="required" id='videoId' class="form-control"  maxlength="50" value="${vo.videoId}">
		</div>

		<div class="form-group">
			<label for="Vedio Title">Video Title</label> <input type="text" required="required" id='videoTitle' class="form-control" maxlength="100" value="${vo.title}">	
		</div>
		
		<div class="form-group">
			<label for="이미지 경로">이미지 경로</label>
			<input type="text"  id='thumbnailPath' required="required" class="form-control" name="content" maxlength="150" value="${vo.thumbnail}">
		</div>
		
		<div class="form-group">
			<label for="Channel Title">Channel Title</label>
			<input type="text"  id='channelTitle' class="form-control" name="content" maxlength="100" value="${vo.channelTitle}">
		</div>
		
		<div class="form-group">
			<label for="조회수">조회수</label> <input
				type="text"  id='viewCount' name="writer"  class="form-control" maxlength="100" value="${vo.viewCount}">
		</div>
		
		<div class="form-group">
			<label for="카테고리">카테고리</label>    
			<input type="text"  class="form-control"  id = "category" name="content" required="required"   readonly="readonly" value="${vo.category}" maxlength="50">
		</div>
		
	</div>
	<!-- /.box-body -->
</form>


<div class="box-footer">
	<button type="submit"  id = "modifyButton" class="btn btn-primary">수정</button>
	<button type="submit"  id = "cancelButton" class="btn btn-warning">취소</button>
</div>

<script>  
	$(document).ready(function() {

		$("#modifyButton").on("click", function() {
			var category = $("#category").val() 
			var viewCount = $("#viewCount").val() 
			if(isNaN(viewCount)) 
			{
				alert("조회수는 숫자만 입력 가능합니다");
				return;
			}
			
			$.ajax({  
				url : '/insertVideo.do',
				data : {
					videoId : $("#videoId").val(),
					videoTitle : $("#videoTitle").val(),
					thumbnail : $("#thumbnailPath").val(),
					channelTitle : $("#channelTitle").val(),
					viewCount : viewCount,
			 		category : category
				},
				type : 'POST',
				success : function(data) {
					alert("동영상이 저장되었습니다")
					$(":input").val("")
					$("#category").val(category)
				},
				error : function(request,status,error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			})
    
		});

		$("#cancelButton").on("click", function() {
			location.href = "/admin.do"
		});

	});
</script>




			</div>
			<!-- /.box -->
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<%@include file="../include/footer.jsp"%>
