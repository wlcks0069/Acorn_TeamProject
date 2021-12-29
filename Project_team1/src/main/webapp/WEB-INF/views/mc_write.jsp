<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MC_Writer</title>
<script type="text/javascript">
	window.onload = function() {
		let btnAdd = document.querySelector("#btnAdd");
		btnAdd.addEventListener("click", checkData);
	}
	function checkData() {
		if (mw.content.value === "") {
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
	<form action="mcwrite" method="post" name="mw">
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
				<td><textarea rows="5" name="content"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;"><input
					type="button" value="등록" id="btnAdd"> <input id="listBtn"
					type="button" value="목록" onclick="location.href='mcboard'">
				</td>opacity
			</tr>
		</table>
		<ul>
			<li>
				<label for="">현재의 기분</label> 
				<select name="color">
						<option value="">==색상==</option>
						<option value="red">기쁨</option>
						<option value="blue">슬픔</option>
						<option value="gray">외로움</option>
						<option value="yellow">심심해</option>
				</select>
			</li>
			<li>
				<label for="">기분의 정도</label> 
				<select name="clear">
						<option value="none">==채도==</option>
						<option value="one">100%</option>
						<option value="two">75%</option>
						<option value="three">50%</option>
						<option value="four">25%</option>
						<option value="five">0%</option>
				</select>
			</li>
		</ul>
	</form>
</body>
</html>