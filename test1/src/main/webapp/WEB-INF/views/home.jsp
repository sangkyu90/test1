<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
<script>

</script>
</head>
<body>

	<c:set var="mem" value="${paramMap}"></c:set>

	<table border="1">

		<tr>
			<td rowspan="2">이름</td>
			<td>길이 : <c:set var="length" value="${mem.name}" />
				${fn:length(length)}
			</td>
		</tr>

		<tr>
			<td><c:set var="by" value="${mem.name}"/>
			바이트 :${by}
		</tr>
		
		<tr>
			<td>성별</td>
			<td>${mem.gender}</td>
		</tr>

		<tr>
			<td>년도</td>
			<td>
				
			<c:set var="year" value="${mem.year}"/>	
				<fmt:formatNumber value="${fn:substring(year,0,1)}" type="number" var="y" />
				<fmt:formatNumber value="${fn:substring(year,1,2)}" type="number" var="e" />
				<fmt:formatNumber value="${fn:substring(year,2,3)}" type="number" var="a" />
				<fmt:formatNumber value="${fn:substring(year,3,4)}" type="number" var="r" />
			
					${y+e+a+r}
			<br>
			</td>
		</tr>

		<tr>
			<td>선택한 취미</td>
			<td>
			<c:forEach var="vl" items="${mem.hobby}">
			${vl} &nbsp;
			</c:forEach>
			</td>
		</tr>

		<tr>
			<td>낙서장</td>
			<td>
				<c:set var="len" value="${mem.memo}" />
			 	${fn:length(len)}
		   </td>
		</tr>

		<tr>
			<td>전화번호</td>
			<td><c:set var="number" value="${mem.telno1}${mem.telno2}${mem.telno3}" /> 
					<c:forEach var="ph" begin="0" end="${fn:length(number)}" step="1">
				${fn:substring(number, ph, fn:length(number)) }<br>
				</c:forEach>
		   </td>
		</tr>
	</table>


</body>
</html>
