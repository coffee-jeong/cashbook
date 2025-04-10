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
<title>메인</title>
<style>
        /* 기본 페이지 스타일 */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            color: #333;
            line-height: 1.6;
        }

        /* 정보 영역 */
        .info {
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            border-radius: 5px;
            text-align: center;
            margin: 20px;
        }

        .info a {
            color: white;
            text-decoration: none;
            margin-left: 15px;
        }

        .info a:hover {
            text-decoration: underline;
        }

        /* 제목 스타일 */
        h1 {
            text-align: center;
            color: #333;
            font-size: 36px;
            margin-top: 50px;
        }

        /* 목록 스타일 */
        ol {
            font-size: 18px;
            padding-left: 20px;
            margin-top: 30px;
        }

        ol li {
            margin: 10px 0;
        }

        ol li a {
            text-decoration: none;
            color: #4CAF50;
        }

        ol li a:hover {
            text-decoration: underline;
        }
        
        /* 반응형 디자인 */
        @media (max-width: 600px) {
            .info {
                font-size: 14px;
            }

            ol {
                font-size: 16px;
            }
        }
    </style>
</head>
<body>
	<div class="info">
		<%=adminId%>님 반갑습니다
		<a href="/cashbook/logout.jsp">[로그아웃]</a>
		<a href="/cashbook/updateAdminPwForm.jsp">[비밀번호 변경]</a>
	</div>
	<ol>
		<li><a href="/cashbook/category/insertCategoryForm.jsp">[카테고리 입력하기]</a></li>
		<li><a href="/cashbook/category/categoryList.jsp">[카테고리 리스트]</a></li>
	</ol>
</body>
</html>