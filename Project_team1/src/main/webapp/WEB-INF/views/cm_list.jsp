<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Comments</title>
<style>
#content {
	height: 500px;
	width: 500px;
	text-align: center;
}
</style>
</head>
<body>
	<h3>comments</h3>
	<table>
		<tr>
			<th colspan="3" id="content" style="background-color: ${color}">${mc_content }</th>
		</tr>
		<c:forEach var="cmcontent" items="${cmcontentslist }">
			<tr>
				<td>${cmcontent.mem_nick }</td>
				<td>${cmcontent.cm_commentcontent }</td>
				<td>${cmcontent.cm_date }</td>
			</tr>
		</c:forEach>
	</table>
	<a href="cmcomment?mc_no=${mc_no }">댓글 쓰기</a>
	<a href="mcboard?page=1">목록 보기</a>
</body>
</html>