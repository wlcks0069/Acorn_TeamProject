<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MC_Writer</title>
<link rel="stylesheet" type="text/css" href="./resources/css/board.css">
<script type="text/javascript">
	window.onload = function(){
		let btnAdd = document.querySelector("#btnAdd");
		btnAdd.addEventListener("click", checkData);
	}
	function checkData(){
		if(mw.content.value === ""){
			alert("내용를 입력하세요.");
			mw.content.focus();
			return;
		}
		mw.submit()
	}
</script>
</head>
<body>
	<h3>글쓰기</h3>
	<form action=mcwriting method="post" name="mw">
		<table>
			<tr>
				<td>닉네임</td>
				<td><input type="text" name="nick" value="nickname" disabled></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="nick" value="email" disabled></td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea rows="5" name="content"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;">
					<input type="button" value="등록" id="btnAdd">
					<input type="button" value="목록" onclick="location.href='mc_list'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>