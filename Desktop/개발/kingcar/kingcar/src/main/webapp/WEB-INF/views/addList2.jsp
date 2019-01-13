<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<link href="/resources/css/style.css" rel='stylesheet' type='text/css' />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="/resources/css/main.css">

<c:forEach items="${resultView}" var="parentResult" varStatus="parentStatus">
<c:if test="${parentStatus.index==0 || parentStatus.index==1 }">    
	<ul class="tiles" style="padding-bottom: 8em; z-index: 5; " >
</c:if>
<c:if test="${parentStatus.index > 1 }">
	<ul class="tiles" style="padding-bottom: 8em; " >
</c:if>
		<c:forEach items="${parentResult}" var="content" varStatus="status">
			<li style = "top:50px; position: relative;" class = "myContent"  >
				<c:if test="${(status.index %12 == 0 ) || (status.index == 0 ) }">
					<h4 onclick="return false;" class = "categoryTitle"  id = "${content.category}" style = "top : -60px; position: relative ; font: 400 28px/28px 'Open Sans', sans-serif; line-height: 0;">${content.category}</h4>
				</c:if> 
				<a href="#"  ><img width="235" height="130" src="${content.thumbnail }"id = "${content.id }" class = "myThumbnail" ></a>
					<div class="post-infod">
							<div class="post-basic-info">
								<h3>
									<a href="#" style = "height:27px; text-overflow: ellipsis; white-space: nowrap;overflow: hidden" id = "${content.id }" class = "myThumbnail" >${content.title}</a>
								</h3>  
								<p style = "height:27px; text-overflow: ellipsis; white-space: nowrap;overflow: hidden"><b>조회수</b> ${content.viewCount}</p>
								<p style = "height:27px; text-overflow: ellipsis; white-space: nowrap;overflow: hidden"><b>채널</b> ${content.channelTitle}</p>
							</div>
					</div>
			</li>   

		</c:forEach>
	
	</ul>   
</c:forEach>

<script>


</script>



