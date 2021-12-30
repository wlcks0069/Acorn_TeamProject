<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload = function() {
		let btnAdd = document.querySelector("#btnAdd");
		btnAdd.addEventListener("click", checkData);
	}
	function checkData() {
		if (mr.mc_comment.value === "") {
			alert("내용를 입력하세요.");
			mr.mc_comment.focus();
			return;
		}
		
		mr.submit();
	}
</script>
</head>
<body>
	<h3>댓글 달기</h3>
	<form action="mccomment" method="post" name="mr">
		<table>
			<tr>
				<td>닉네임</td>
				<td><input type="text" name="mem_nick" value="${usernick}" disabled></td>
			</tr>
			<tr>
				<td>댓글 내용</td>
				<td><textarea rows="5" name="mc_comment"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;">
				<input type="button" value="등록" id="btnAdd"> 
				<input id="listBtn"	type="button" value="목록" onclick="location.href='mcboard'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>