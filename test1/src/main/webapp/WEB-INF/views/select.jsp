<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
</head>
<script type="text/javascript">
var selcet = '';
	$.ajax({
		type: "POST",
		url : "/select.do",
		sendDataType:"json",
		async : false,
		success : function(data){
			select = data
		}
		
	});
</script>
<body>
	<table border="1">
		<tr>
			<td>회사  <select id="company" name ="company" onchange="select(this.value)">
					<option value="회사1">회사1</option>
					<option value="회사2">회사2</option>
					<option value="회사3">회사3</option>
			</select>
			</td>
		</tr>
		<tr>
			<td>상품명  <input type="text" />
			</td>
		</tr>
		<tr>
			<td>삭제여부 <input type="radio" name="del"> 삭제 <input
				type="radio" name="nodel"> 미삭제
			</td>
		</tr>
		
		<tr>
			<td>
				비고  <textarea rows="3" cols="20" name="remark" value="" />
				
			</td>
			</tr>
				<tr>
				<td>
					<input type="button" value ="수정" onclick="location.href='/com/check'"/>
					<input type="button" value ="삭제" onclick="location.href='/com/check'"/>
					<input type="button" value ="취소" onclick="location.href='/com/check'"/>

	</table>
</body>
</html>