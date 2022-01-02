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
	border-radius: 10%;
	font-size: 1.5rem;
	font-weight: bold;
}

a {
	color: black;
	text-decoration: none;
}
</style>
</head>
<body>
	<h3>comments</h3>
	<table>
		<tr>
			<th colspan="3" id="content" style="background-color: ${color}">${mc_content }</th>
		</tr>
		<tr>
			<td colspan="2"></td>
			<td><a href="like?mc_no=${mc_no }">${like } like</a></td>
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
	<a href="mcboard?page=${mc_page }">목록 보기</a>
	<a href="mcupdate?mc_no=${mc_no }">수정하기</a>
	<a href="mcdelete?mc_no=${mc_no } ">삭제하기</a>

</body>
</html>









