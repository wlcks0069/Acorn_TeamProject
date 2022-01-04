<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
   crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="./resources/css/searchIdPwd.css" />
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
   integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
   crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
</script>
<style type="text/css">
body {
  display: flex;
  align-items: center;
  padding-top: 40px;
  padding-bottom: 40px;
  background-color: #f5f5f5;
}
</style>
</head>
<body class="text-center">

<div class="container">
   <div class="input-form-background row">
      <div class="input-form col-md-12 mx-auto">
         <h2 class="mb-3 fw-bold">GP Project ${infobox[1] } 찾기</h2>
         <h5 class="fw-bold">당신의 ${infobox[1] }는 다음과 같습니다 : ${infobox[0] }</h5>
   

<hr>
   <a class="fw-bold" href="index.jsp">로그인</a>&nbsp;&nbsp;
   <a class="fw-bold" href="gpid_search">ID 찾기</a>&nbsp;&nbsp;
   <a class="fw-bold" href="gppw_search">PW 찾기</a>   
</body>
</html>