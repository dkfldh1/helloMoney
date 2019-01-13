<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
			<c:forEach items="${list }" var="list" varStatus="status">
				<li style = "top:50px; position: relative;" class = "myContent"  >
					<a href="#"  ><img width="235" height="130" src="${list.thumbnail }"id = "${list.id }" class = "myThumbnail" ></a>
						<div class="post-infod">
								<div class="post-basic-info">
									<h3>
										<a href="#" style = "height:27px; text-overflow: ellipsis; white-space: nowrap;overflow: hidden" id = "${list.id }" class = "myThumbnail" >${list.title}</a>
									</h3>  
									<p style = "height:27px; text-overflow: ellipsis; white-space: nowrap;overflow: hidden"><b>조회수</b> ${list.viewCount}</p>
									<p style = "height:27px; text-overflow: ellipsis; white-space: nowrap;overflow: hidden"><b>채널</b> ${list.channelTitle}</p>
								</div>
						</div>
				</li>
			</c:forEach>
<script>

</script>