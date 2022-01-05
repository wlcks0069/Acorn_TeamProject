<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage Comment List</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
body {
	height: 100vh;
	padding-top: 220px;
	background-color: #fff2d6;
	font-family: 'Nanum Brush Script', cursive;
	font-size: larger;
	align-items: center;
	text-align: center;
}
table {
	font-size: larger;
}
.box {
	border:2px solid black; padding:10px;
	text-align: left;
	font-size: 18px;
	background: white;
	background-size: cover;
	height: 24	0px;
	align-items: center;
	text-align: center;
}
</style>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap"
	rel="stylesheet">
</head>
<body>
	<div class="box">
		<div style="margin-left: auto; margin-right: auto;">
			<h1 style="font-size: 100px">GitPen</h1>
			<p style="font-size: 30px">내가 남긴 코멘트</p>
		</div>

		<table style="margin-left: auto; margin-right: auto;">
			<tr style="background-color: silver">
				<th>번호</th>
				<th>본문 번호</th>
				<th>닉네임</th>
				<th>작성일</th>
				<th>내용</th>
			</tr>
			<c:forEach var="comment" items="${ppcommentlist}">
				<tr>
					<td>${comment.cm_no}</td>
					<td><a
						href="cmboard?page=1&&mc_no=${comment.mc_no}&&mc_page=1&&isppmclist=true&&isppcommentlist=true">${comment.mc_no }</a></td>
					<td>${comment.mem_nick }</td>
					<td>${comment.cm_date }</td>
					<td>${comment.cm_commentcontent }</td>
				</tr>
			</c:forEach>
		</table>
		<br>
		<div style="text-align: center;">
			<input id="listBtn" type="button" class="btn btn-dark btn-md"
				style="font-size: 24px;" value="마이페이지로 돌아가기"
				onclick="location.href='ppboard'">
		</div>
	</div>
</body>
</html>