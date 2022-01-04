<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage Comment List</title>
</head>
<body>
	<div>
		<h1>MyPage Comment List</h1>
		<p>내가 달아놓은 댓글 리스트</p>
	</div>
	
	<table>
		<tr style="background-color: silver">
		댓글 리스트 확인용 임시 포맷
			<th>번호</th><th>본문 번호</th><th>닉네임</th><th>작성일</th><th>내용</th>
		</tr>
		<c:forEach var="comment" items="${ppcommentlist}">
		<tr>
			<td>${comment.cm_no}</td>
			<td><a href="cmboard?page=1&&mc_no=${comment.mc_no}&&mc_page=1&&isppmclist=true&&isppcommentlist=true">${comment.mc_no }</a></td>
			<td>${comment.mem_nick }</td>
			<td>${comment.cm_date }</td>
			<td>${comment.cm_commentcontent }</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>
