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
<script src="//code.jquery.com/jquery.min.js"></script>
<script>
$( document ).ready(function() {
	$("[name='companyall']").on("change",function(){
		check2();
	});
});


	/* 	var checkflag = false;
		function check(field) {
			if (!checkflag) {
				for (i = 0; i < field.length; i++) {
					field[i].checked = true;
				}
				checkflag = true;
				return "companyall";
			} else {
				for (i = 0; i < field.length; i++) {
					field[i].checked = false;
				}
				checkflag = "false";
				return "companyall";
			}
		}
		 */
		
		
		function check2(){
			if($("[name='companyall']").is(":checked")){
				$("[name='company']").each(function(){
					$(this).prop("checked",true);
				});
			}else{
				$("[name='company']").each(function(){
					$(this).prop("checked",false);
				});
			}		
		}
		
		
		function submit(){
			var isSeasonChk = $("input:checkbox[name='company']").is(":checked");
			
			if(!isSeasonChk){
			    alert("회사명을 선택해 주세요.");
			    return false;
			}
			 $("input[name=delche]").attr('disabled', "true");      
			 $("#searchForm").submit();
		}
			
			
</script>

<body>
	<form action="/search.do" id="searchForm" method="post">	
		<table border="1">
		<tbody>
				<tr>
					<td>시작일 : <input type="date" name="start" id="startDate">~ 
						종료일 : <input type="date" name="end" id = "endDate">
					</td>
				</tr>
	
				<tr>
					<td> 회사명 : <input type="checkbox" name="companyall">전체선택 
						<c:forEach items="${comList }" var="list" varStatus="i">
							<input type="checkbox" <c:if test="${list.cd eq 'A' }">checked="checked"</c:if>  name="company" value="${list.companycd}">${list.comName }
						</c:forEach>
					
							<input type= "checkbox" >
						
						<%-- <c:forEach var="list2" begin="1" end="12" step="3">
							${list2 }
						</c:forEach>
						 --%>
					</td>
				</tr>
			
				<tr>
					<td>
						비고 : <input type="text">
					</td>
				</tr>
			
				<tr>
					<td>
						삭제여부 : <input type="radio" name="delche" value="del">삭제
							<input type="radio" name="delche" value="nodel">미삭제
						<input type="button" value ="검색" onclick="javascript:submit();"/>
					</td>
				</tr>
				
			</table>
			
			<table border="1" >
				<tr>
					<th>순번</th>
					<th>회사명</th>
					<th>등록된 상품수</th>
					<th>비고</th>
					<th>삭제여부</th>
					<th>전체건수</th>
					</tr>
				
					<tr>
						<th colspan="6"> 데이터가 존재하지 않습니다 </th>
					</tr>
		</table>
			
	</form>

</body>
</html>