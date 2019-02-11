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
</head>
<script src = "/search"> </script>
<body>
	<table  border="1">
				<tr>
					<td>순번</td>
					<td>회사명</td>
					<td>등록된 상품수</td>
					<td>비고</td>
					<td>삭제 여부</td>
					<td>전체 건수</td>
				</tr>
			
				<tr>
					<td>${paramMap.start},${paramMap.end}</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					
			</table>
</body>
</html>