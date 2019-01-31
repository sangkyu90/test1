<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
<script>
	
</script>
</head>
<body>

<c:set var="name" value="${paramMap}"></c:set>   



		<table border="1">
		
			<tr>
				<td rowspan="2">이름</td>
				<td>길이 : 
					${name.name}<br>
					</td>
			</tr>
			<tr>
				<td>비트 :
					${name.name}</td>
			</tr>
			<tr>
					<td>성별</td>
					<td>
						${name.gender} <br>
						
				</tr>
			
				<tr>
					<td>년도</td>
					<td>yyyy년도의 합 :
						<br>
						
						
				</tr>
			
				<tr>
					<td>선택한 취미</td>
					<c:forEach var="vl" items="${name.hobby}" varStatus="status">
					<td>[코드값/text] 
					${vl} : 
							${vl} <br>
						</c:forEach>
					</td>
				</tr>
			
				<tr>
					<td>낙서장</td>
					<td>
						 <br>
						
						</td>
				</tr>
			
				<tr>
					<td>전화번호</td>
					<td>
						${name.key} : ${name.value }<br>
						${name.key} : ${name.value }<br>
						${name.key} : ${name.value }<br>
						
						</td>
			
				</tr>

		</table>

	
</body>
</html>
