<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String adminId = (String) session.getAttribute("adminId");
	if(adminId == null) { // 로그인 상태
		response.sendRedirect("/cashbook/loginForm.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 수정</title>
<style>
    /* 전체 페이지 스타일 */
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: flex-start; /* 변경: 상단 정렬 */
        height: 100vh;
        color: #333;
    }

    /* 로그인 폼 컨테이너 스타일 */
    .container {
        background-color: #fff;
        padding: 30px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        width: 300px;
        margin-top: 20px; /* 제목 아래 여백 */
    }

    /* 테이블 스타일 */
    .table {
        width: 100%;
        margin-bottom: 20px;
    }

    .table th {
        padding: 10px;
        text-align: left;
        font-weight: normal;
    }

    .table input {
        width: 100%;
        padding: 8px;
        font-size: 14px;
        margin-top: 5px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }

    /* 버튼 스타일 */
    .button {
        width: 100%;
        padding: 10px;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 4px;
        font-size: 16px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .button:hover {
        background-color: #45a049;
    }

    .button:active {
        background-color: #3e8e41;
    }

    /* 반응형 디자인 */
    @media (max-width: 600px) {
        .container {
            width: 80%;
        }

        .button {
            font-size: 14px;
            padding: 8px;
        }
    }
</style>
</head>
<body>

	<form class="container" action="/cashbook/updateAdminPwAction.jsp" method="post">
		<table class="form">
			<tr class="id">
				<th>아이디</th>
				<td><%=adminId%></td>
			</tr>
			<tr class="pw">
				<th>이전 비밀번호</th>
				<td><input type="password" name="beforPassword"></td>
			</tr>
			<tr class="pw">
				<th>변경 비밀번호</th>
				<td><input type="password" name="newPassword"></td>
			</tr>
		</table>
		<button class="button" type="submit">[변경하기]</button>
	</form>
</body>
</html>