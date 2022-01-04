<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main Contents</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<style>

body {
	padding-top: 220px;
	background-color: #fff2d6;
	font-family: 'Nanum Brush Script', cursive;
	font-size:larger;
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
	width: 100%;
	background-color: #000000b3;
	font-size: medium;
	color: white;
}

.navBar {
	color: white;
	padding-bottom: 10px;
}

table {
	margin-bottom: 50px;
	margin-left: auto;
	margin-right: auto;
}

a.comment {
	color: black;
}
</style>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap"
	rel="stylesheet">
</head>
<body>
	<nav class="navbar navbar-expand-lg fixed-top">
		<div class="container-fluid fw-bold">
			<a class="navbar-brand" href="mcboard?page=1">Git Pen</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav fw-bold">
					<li class="nav-item"><a class="nav-link active text-white"
						aria-current="page" href="mcwrite">글쓰기</a></li>
					<li class="nav-item"><a class="nav-link active text-white"
						aria-current="page" href="ppboard" method="get" name="currentEmail" value="${idkey}">마이페이지</a></li>
					<li class="nav-item"><a class="nav-link active text-white"
						aria-current="page" href="logout">로그아웃</a></li>
				</ul>
			</div>
			<div>
				<p class="navp mb-0" style="text-align: right">${idkey}님&thinsp;로그인중</p>
			</div>
		</div>
	</nav>
	<div>
		<div id="body">
			<c:forEach var="maincontent" items="${maincontentslist}"
				varStatus="status">
				<div style="float: left; width: 32%; margin-left: 10px;">
					<table>
						<tbody>
							<tr>
								<th colspan="2">작성자 - ${maincontent.mem_nick }</th>
								<th>No.${maincontent.mc_no}</th>
							</tr>
							<tr>
								<td id="content" colspan="3"
									style="background-color: ${maincontent.mc_color }"><a
									href="cmboard?page=1&&mc_no=${maincontent.mc_no}&&mc_page=${page}&&isppmclist=false&&isppcommentlist=false"
									id="letterStyle">${maincontent.mc_content }</a></td>
							</tr>
							<tr>
								<td>${maincontent.mc_date }</td>
								<td class="fw-bold text-dark">${maincontent.mc_comment }<a
									class="comment"
									href="cmboard?page=1&&mc_no=${maincontent.mc_no}&&mc_page=${page}&&isppmclist=false&&isppcommentlist=false">comments
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											fill="currentColor" class="bi bi-vector-pen"
											viewBox="0 0 16 16">
                                <path fill-rule="evenodd"
												d="M10.646.646a.5.5 0 0 1 .708 0l4 4a.5.5 0 0 1 0 .708l-1.902 1.902-.829 3.313a1.5 1.5 0 0 1-1.024 1.073L1.254 14.746 4.358 4.4A1.5 1.5 0 0 1 5.43 3.377l3.313-.828L10.646.646zm-1.8 2.908-3.173.793a.5.5 0 0 0-.358.342l-2.57 8.565 8.567-2.57a.5.5 0 0 0 .34-.357l.794-3.174-3.6-3.6z" />
                                <path fill-rule="evenodd"
												d="M2.832 13.228 8 9a1 1 0 1 0-1-1l-4.228 5.168-.026.086.086-.026z" />
                              </svg>
								</a></td>
								<td class="fw-bold">${maincontent.mc_like }&thinsp;likes<svg
										xmlns="http://www.w3.org/2000/svg" width="16" height="16"
										fill="currentColor" class="bi bi-hand-thumbs-up-fill"
										viewBox="0 0 16 16">
                                <path
											d="M6.956 1.745C7.021.81 7.908.087 8.864.325l.261.066c.463.116.874.456 1.012.965.22.816.533 2.511.062 4.51a9.84 9.84 0 0 1 .443-.051c.713-.065 1.669-.072 2.516.21.518.173.994.681 1.2 1.273.184.532.16 1.162-.234 1.733.058.119.103.242.138.363.077.27.113.567.113.856 0 .289-.036.586-.113.856-.039.135-.09.273-.16.404.169.387.107.819-.003 1.148a3.163 3.163 0 0 1-.488.901c.054.152.076.312.076.465 0 .305-.089.625-.253.912C13.1 15.522 12.437 16 11.5 16H8c-.605 0-1.07-.081-1.466-.218a4.82 4.82 0 0 1-.97-.484l-.048-.03c-.504-.307-.999-.609-2.068-.722C2.682 14.464 2 13.846 2 13V9c0-.85.685-1.432 1.357-1.615.849-.232 1.574-.787 2.132-1.41.56-.627.914-1.28 1.039-1.639.199-.575.356-1.539.428-2.59z" />
                              </svg>
								</td>
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