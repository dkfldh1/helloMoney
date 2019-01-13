<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<link href="/resources/css/style.css" rel='stylesheet' type='text/css' />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="/resources/css/main.css">

<c:forEach items="${resultView}" var="resultView" varStatus="status">
	<ul class="tiles" style="padding-bottom: 8em">
		<c:forEach items="${list }" var="list" varStatus="status">
			<li style = "top:50px" class = "myContent">
				<c:if test="${status.index == 1 }">   
					<h4 id = "categoryTitle" style = "top : -60px; position: relative ; font: 400 28px/28px 'Open Sans', sans-serif; line-height: 0;">- ${category[0]}</h4>
				</c:if>    
				<img width="230" height="130" src="${list.thumbnail }">
					<div class="post-infod">							<div class="post-basic-info">
								<h3>
									<a href="#" style = "height:27px; text-overflow: ellipsis; white-space: nowrap;overflow: hidden">${list.title}</a>
								</h3>
								<p style = "height:27px; text-overflow: ellipsis; white-space: nowrap;overflow: hidden"><b>조회수</b> ${list.viewCount}</p>
								<p style = "height:27px; text-overflow: ellipsis; white-space: nowrap;overflow: hidden"><b>채널</b> ${list.channelTitle}</p>
							</div>
					</div>
			</li>   
		</c:forEach>
	</ul>   
</c:forEach>