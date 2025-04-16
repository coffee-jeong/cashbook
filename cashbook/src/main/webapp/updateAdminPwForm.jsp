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

	 body {
	    font-family: Arial, sans-serif;
	    background-color: #f4f4f4;
	    margin: 0;
	    padding: 0;
	    display: flex;
	    flex-direction: column; /* nav와 form을 위아래로 배치 */
	    align-items: center;
	    min-height: 100vh;
	    color: #333;
	}

    .container {
    background-color: #fff;
    padding: 30px;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    width: 300px;
    margin-top: 50px; 
	}

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

    @media (max-width: 600px) {
        .container {
            width: 80%;
        }

        .button {
            font-size: 14px;
            padding: 8px;
        }
    }
    
	.info {
	    width: 100%;
	    display: flex;
	    justify-content: center;
	    background-color: #fff;
	    padding: 15px 0;
	    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
	    z-index: 10;
	    position: sticky;
	    top: 0;
	}
</style>
</head>
<body>
	<div class="info">
		<jsp:include page="/inc/nav.jsp"></jsp:include>
	</div>
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