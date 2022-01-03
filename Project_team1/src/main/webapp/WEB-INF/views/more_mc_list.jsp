<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
						href="cmboard?mc_no=${maincontent.mc_no}&&mc_page=${page}"
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