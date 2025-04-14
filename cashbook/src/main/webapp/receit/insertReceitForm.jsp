<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String adminId = (String) session.getAttribute("adminId");
	if(adminId == null) {
		response.sendRedirect("/cashbook/loginForm.jsp");
		return;
	}
	
	int cashNo = Integer.parseInt(request.getParameter("cashNo"));
	System.out.println("cashNo:" +cashNo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<div>
		<jsp:include page="/inc/nav.jsp"></jsp:include>
	</div>
	<form method="post" enctype="multipart/form-data" action="./insertReceitAction.jsp"> 
		<table border="1">
			<tr>
				<th>영수증 등록</th>
				<td>
					<input type="hidden" name="cashNo" value="<%=cashNo%>">
					<input type="text" name="filename" />
					<input type="file" name="file" />
				</td>
			</tr>
		</table>
		<button type="submit">[등록하기]</button>
	</form>
</body>
</html>