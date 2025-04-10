<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>

<%
    String adminId = request.getParameter("adminId");
    String adminPw = request.getParameter("adminPw");

    System.out.println("adminId :" + adminId);
    System.out.println("adminPw :" + adminPw);
    
    Cashbook cashbook = new Cashbook();
    boolean isLogin = cashbook.login(adminId, adminPw, request, response);
    
    System.out.println("isLogin :" + isLogin);
    
    if (isLogin = true) {
        response.sendRedirect("/cashbook/index.jsp");
    } else {
        response.sendRedirect("/cashbook/loginForm.jsp");
    }
 
%>
