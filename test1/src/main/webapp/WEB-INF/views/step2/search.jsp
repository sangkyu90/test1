<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />

<title>Insert title here</title>
</head>
<script type="text/javascript">
			
			
			var checkflag = "false";
			function check(field) {
				if (checkflag == "false") {
					for (i = 0; i < field.length; i++) {
						field[i].checked = true;
					}
					checkflag = "true";
					return "Check All";
				} else {
					for (i = 0; i < field.length; i++) {
						field[i].checked = false;
					}
					checkflag = "false";
					return "Check All";
				}
			}
		
</script>

<body>
	
		<table border="1">
				<tr>
					<td>시작일 : <input type="date" name="start" id="startDate">~ 
						종료일 : <input type="date" name="end" id = "endDate">
					<td>
				</tr>
	
				<tr>
					<td>회사명 : <input type="checkbox" name="Check All" onClick="this.value=check(this.form.company)" />전체선택
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
			
	

</body>
</html>