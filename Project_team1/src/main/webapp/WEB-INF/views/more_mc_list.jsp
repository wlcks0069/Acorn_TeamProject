<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:forEach var="maincontent" items="${maincontentslist}">
	<tr>
		<td>${maincontent.mc_no}</td>
		<td><img
			src="https://post-phinf.pstatic.net/MjAxODExMDdfMTg5/MDAxNTQxNTQ3MTI0MzMz.x7pnNMgKFtBCuU2ecu_Kb4fOCqZT_e-FicfgELZus6wg.YJK6ERoqHz5_jqLpZu5Sn8GixQOa17sAUcL1I94ogWQg.JPEG/20181028085129.jpg?type=w1200"
			style="width: 200px" /></td>
		<td>${maincontent.mc_content }</td>
		<td>${maincontent.mem_nick }</td>
		<td>${maincontent.mc_date }</td>
		<td>${maincontent.mc_like }</td>
		<td>${maincontent.mc_comment }</td>
	</tr>
</c:forEach>