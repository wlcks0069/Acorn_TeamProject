<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main Contents</title>
<style>
html{
	font-family: 'Nanum Brush Script', cursive;
	font-size:larger;
}

body {
	padding-top: 220px;
	background-color:#fff7eb;
}

#content {
	height: 500px;
	width: 500px;
	text-align: center;
	border-radius: 10%;
	
}

a {
	color: white;
	text-decoration: none;
}

#letterStyle {
	font-size: 1.7rem;
	font-weight: bold;
	color: black;
}

nav {
	position: -webkit-sticky;
	position: fixed;
	top: 0;
	width:100%;
	background-color: #000000b3;
	color: white;
}

.navBar {
	color: white;
	padding-bottom:10px;
}

table {
	margin-bottom: 50px;
	margin-left: auto;
	margin-right: auto;
}
</style>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
</head>
<body>
	<div>
		<nav>
			<div>
				<h1>
					<a href="mcboard?page=1" class="navBar">Git Pen</a>
				</h1>
				<p>${idkey}님로그인중</p>
				<div class="navBar">
					<a href="logout">로그아웃</a> <a href="mcwrite">글쓰기</a>
				</div>
			</div>
		</nav>
		<div id="body">
			<c:forEach var="maincontent" items="${maincontentslist}"
				varStatus="status">
				<div style="float: left; width: 33%;">
					<table>
						<tbody>
							<tr>
								<th colspan="2">작성자 - ${maincontent.mem_nick }</th>
								<th>No.${maincontent.mc_no}</th>
							</tr>
							<tr>
								<td id="content" colspan="3"
									style="background-color: ${maincontent.mc_color }"><a
									href="cmboard?&&mc_no=${maincontent.mc_no}&&mc_page=${page}"
									id="letterStyle">${maincontent.mc_content }</a></td>
							</tr>
							<tr>
								<td>${maincontent.mc_date }</td>
								<td>${maincontent.mc_comment }comments</td>
								<td>${maincontent.mc_like }likes</td>
							</tr>
						</tbody>
					</table>
				</div>
			</c:forEach>
		</div>
	</div>

	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
   
      //페이지가 로딩될 때 1page를 보여주기 때문에 초기값을 1로 지정한다.
      let currentPage=${page};
      //현재 로딩중인지 여부를 관리할 변수
      let isLoading=false;
   
      //웹브라우저의 창을 스크롤 할때 마다 호출되는 함수 등록
      $(window).on("scroll", function(){
         console.log("scrolled");
         //위로 스크롤 된 길이
         let scrollTop=$(window).scrollTop();
         //웹 브라우저 창의 높이
         let windowHeight=$(window).height();
         //문서 전체의 높이
         let documentHeight=$(document).height();
         //바닥까지 스크롤 되었는지 여부를 알아낸다.
         let isBottom=scrollTop+windowHeight+10>=documentHeight;
         //만일 바닥까지 스크롤되고
         if(isBottom){
            console.log("hit!!");
            //만일 현재 페이지가 마지막 페이지이거나 아직 로딩중이라면
            if(currentPage===${totalpage}||isLoading){
               return; //함수를 여기서 끝내기
            }
            //현재 로딩중이라는 상태로 바꿔준다.
            isLoading=true;
            //요청할 페이지 번호를 1 증가시킨다.
            currentPage++;
            //ajax요청을 통해서 추가목록을 받아온다.
            $.ajax({
               url:"moremcboard",
               method:"post",
               data:"page="+currentPage,
               success:function(responseData){
                  //응답된 문자열을 tbody에 추가해서 html로 해석되게 하고
                  $("#body").append(responseData);
                  //로딩이 끝났다고 상태를 바꿔준다.
                  isLoading=false;
               }
            });
         }
      });
      
   </script>
</body>
</html>




