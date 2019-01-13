<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<table class="table table-bordered">
<c:forEach items="${CategoryDetailList}" var="list">
<tr>
	<c:choose>
		<c:when test = "${list.viewFlag eq 'N'}">
			<c:if test = "${keyword eq ''}">
				<td style="width: 10%"><input type = "checkbox"  class = "viewFlagCheck"  id = "${list.id}"></td>
			</c:if>
		</c:when>
		
		<c:when test = "${list.viewFlag eq 'Y'}">
			<c:if test = "${keyword eq ''}">
				<td style="width: 10%"><input type = "checkbox"  checked="checked" class = "viewFlagCheck" id = "${list.id}"/></td>
			</c:if>
		</c:when>
	</c:choose>

		<c:if test = "${keyword ne ''}">
			<td style="width: 10%"><input type = "checkbox"  disabled="disabled"></td>
		</c:if>	
		
		<td style="width: 10%">${list.id}</td>
		<td style="width: 30%"><a href='detailPage.do/?id= ${list.id}'>${list.title}</a></td>
		<td style="width: 20%"> ${list.channelTitle}</td>
		<td style="width: 10%">${list.viewCount}</td>
		<td style="width: 10%" class = "deleteVideo" id = '${list.category },${list.id }' ><a href='#' >삭제</a></td>
		<td style="width: 10%" class = "modifyVideo" id = '${list.category },${list.id }' ><a href='#' >수정</a></td>
</tr>
</c:forEach>
</table>

