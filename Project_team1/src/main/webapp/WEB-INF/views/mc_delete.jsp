<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>정말 삭제하시겠습니까?</h3>
	<form action="mcdelete?mc_no=${mc_no }" method="post">
		<input type="submit" value="예"/>
		<button type="button" id="noBtn" onclick="location.href='cmboard?page=1&&mc_no=${mc_no}'">아니오</button>
	</form>

	
</body>
</html>