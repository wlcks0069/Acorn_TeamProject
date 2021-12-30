<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main Contents</title>
</head>
<body>
	<div>
		<h1>Main Content List</h1>
		<p>리스트</p>
		<a href="mcwrite">글쓰기</a>
	</div>
	
	<table>
		<tr style="background-color: silver">
		리스트 확인용 임시 포맷
			<th>번호</th><th>본문(test는 짧게 해주세요)</th><th>닉네임</th><th>작성일</th><th>좋아요</th><th>댓글</th>
		</tr>
		<c:forEach var="maincontent" items="${maincontentslist}">
		<tr>
			<td>${maincontent.mc_no}</td>
			<td>${maincontent.mc_content }</td>
			<td>${maincontent.mem_nick }</td>
			<td>${maincontent.mc_date }</td>
			<td>${maincontent.mc_like }</td>
			<td>${maincontent.mc_comment }</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>