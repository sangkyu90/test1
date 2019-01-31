<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />

<title>Insert title here</title>
</head>
<body>	
	<form action="/" method="post">
		<table border="1">
	
				<tr>
					<td>시작일 : <input type="date" name="start">~ 
						종료일 : <input type="date" name="end">
					<td>
				</tr>
	
				<tr>
					<td>회사명 : <input type="checkbox" name="all" value="checkall" />전체선택
						<input type="checkbox" name="company" value="company1" />회사1 
						<input type="checkbox" name="company" value="company2" />회사2 
						<input type="checkbox" name="company" value="company3" />회사3
					</td>
				</tr>
			
				<tr>
					<td>
						비고 : <input type="text">
					</td>
				</tr>
			
				<tr>
					<td>
						삭제여부 : <input type="radio" name="delche" value="del">
							<input type="radio" name="delche" value="nodel">
						<input type="button" value ="검색" onclick="btc_click();">
					</td>
				</tr>
			</table>
			
			<table border="1">
				<tr>
					<td>순번</td>
					<td>회사명</td>
					<td>등록된 상품수</td>
					<td>비고</td>
					<td>삭제여부</td>
					<td>전체건수</td>
					</tr>
					
					<tr>
						<td colspan="6"> 데이터가 존재하지 않습니다 </td>
					</tr>
		</table>
	</form>

</body>
</html>