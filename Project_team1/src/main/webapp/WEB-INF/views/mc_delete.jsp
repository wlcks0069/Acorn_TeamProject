<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</head>
<body class="text-center">

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
<body>
<div class="container">
      <div class="input-form-background row">
         <div class="input-form col-md-12 mx-auto">
            <h3 class="mb-3 fw-bold">정말 삭제하시겠습니까?</h3>
   <form action="mcdelete?mc_no=${mc_no }" method="post">
      <input type="submit" class="btn btn-dark btn-md" value="예"/>
      <button type="button" class="btn btn-dark btn-md" id="noBtn" onclick="location.href='cmboard?page=1&&mc_no=${mc_no}&&mc_page=1&&isppmclist=${isppmclist}&&isppcommentlist=${isppcommentlist}'">아니오</button>
   </form>

   
</body>
</html>