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
		<tr>
			<td>
				회사  <select>회사명
						<option></option>
						<option></option>
						<option></option>
					</select>
				</td>
				</tr>
				
				<tr>
					<td>
						상품명  <input type = "text">
					</td>
					
				</tr>	
					
					<tr>
						<td>
						 비 고 <textarea rows="1" cols="30" id ="remark" ></textarea>
						 </td>
					</tr>
					
					<input type="button" value ="등록" onclick="location.href='/check'"/>
					<input type="button" value ="취소" onclick="location.href='/check'"/>


</body>
</html>
