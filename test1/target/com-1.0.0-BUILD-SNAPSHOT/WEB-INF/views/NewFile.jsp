
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
<script>

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
</head>
<body>
	<form action="send" method="post" >
		<table border="1">

			<tr>
				<td >이름 : <input type="text" name="name" size="20" id="a"></td>
			</tr>

			<tr>
				<td>성별 : <input type="radio" name="gender" value="men" id="a">남
					<input type="radio" name="gender" value="woman">여
				</td>
			</tr>

			<tr>
				<td>연도 : <select name="year" id="year" onchange="year()">
						<option value=""></option> 
						<option value="2010">2010</option>
						<option value="2011">2011</option>
						<option value="2012">2012</option>
						<option value="2013">2013</option>
						<option value="2014">2014</option>
						<option value="2015">2015</option>
						<option value="2016">2016</option>
						<option value="2017">2017</option>
						<option value="2018">2018</option>
						<option value="2019">2019</option>
						<option value="2020">2020</option>
				</select>
				</td>
			</tr>

			<tr>
				<td>취미 : <input type="checkbox" name="Check All" onClick="this.value=check(this.form.hobby)"/>전체선택 
				<input type="checkbox" name="hobby"  value="soccer">축구 
				<input type="checkbox" name="hobby"  value="baseball">야구 
				<input type="checkbox" name="hobby"  value="basketball">농구
				</td>
			</tr>

			<tr>
				<td>낙서장: <textarea rows="1" cols="30" name="memo" >
				</textarea>
				</td>
			</tr>

			<tr>
				<td>전화번호 : <input name="telno1" maxlength="3" >-
					<input name="telno2" maxlength="4">- <input
					name="telno3" maxlength="4" >
				</td>
			</tr>

			<tr>
				<td><input type="submit" value="전송"></td>
			</tr>
			
			
		</table>
	</form>

</body>
</html>