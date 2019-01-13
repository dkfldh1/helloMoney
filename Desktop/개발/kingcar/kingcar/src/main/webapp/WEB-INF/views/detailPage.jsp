<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- <script src="js/jquery-3.2.1.js"></script> -->
<script src="http://code.jquery.com/jquery-1.4.4.min.js"></script>
<style>
.info {
	/* 	position: absolute; */
	/* 	border: 1px solid #ccc; */
	/* 	background: #333; */
	/* 	padding: 5px; */
	/* 	display: none; */
	/* 	color: #fff; */
	font-size: small;
}
</style>
<html>
<head>
<title>Home</title>
</head>
<body>
	<table class="board_view" border="1">
		<colgroup>
			<col width="15%" />
			<col width="35%" />
			<col width="15%" />
			<col width="35%" />
		</colgroup>
		<caption style="background-color: #ccc">게시글 상세</caption>
		<tbody>
			<tr>
				<th scope="row">글 번호</th>
				<td>${detailPage.id}</td>
				<th scope="row">위치</th>
				<td>${detailPage.location}</td>
			</tr>
			<tr>
				<th scope="row">지원대상</th>
				<td>${detailPage.supportedUser}</td>
				<th scope="row">지원유형</th>
				<td>${detailPage.supportedContent }</td>
			</tr>
			<tr>
				<th scope="row">제목</th>
				<td colspan="3">${detailPage.title }</td>
			</tr>
			<tr>
				<td colspan="4" style="border: 1px solid #ccc; height: 100px;">${detailPage.supportedContent }</td>
				<a href = "${detailPage.siteUrl }">${detailPage.siteUrl }</a>
			</tr>
		</tbody>
	</table>
	<a href="#this" class="btn" id="update">수정하기</a>
	<a href="#this" class="btn" id="delete">삭제하기</a>
</body>

</html>
