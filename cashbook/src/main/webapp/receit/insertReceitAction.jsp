<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.nio.file.*" %>
<%@ page import="java.util.*" %>
<%@ page import="dao.*" %>
<%
	String adminId = (String) session.getAttribute("adminId");
	if(adminId == null) {
		response.sendRedirect("/cashbook/loginForm.jsp");
		return;
	}
	
	int cashNo = Integer.parseInt(request.getParameter("cashNo"));
	System.out.println("cashNo:" +cashNo);

	String filename = request.getParameter("filename"); // 업로드시 이름 불러오기
	System.out.println("filename:" + filename);
	
	Part part = request.getPart("file"); // 파일 받어오기
	
	String originalName = part.getSubmittedFileName(); // 업로드 파일 이름 받어오기
	
	String ext = originalName.substring(originalName.lastIndexOf("."));  // 업로드 파일의 확장자명 추출
	
	String txt = (UUID.randomUUID().toString()).replace("-", ""); // 파일 저장시 중복을 방지하기 위해 UUID 유틸 클래스 사용
	String saveName = txt+ext; // UUDI로 생성된 이름뒤에 .확장자 추가
	System.out.println(saveName);
	
	
	String uploadPath = request.getServletContext().getRealPath("upload"); // 현재 프로젝트의 톰켓안으로 지정 하여 upload폴더에 저장
	System.out.println(uploadPath);
	
	File file = new File(uploadPath, saveName);
	InputStream inputStream = part.getInputStream(); // part객체안에 파일의 메모리는 불러옴
	OutputStream outputStream = Files.newOutputStream(file.toPath()); // 메모리로 불러온 파일을 저장
	inputStream.transferTo(outputStream);
	
	ReceitDAO receitDao = new ReceitDAO();
	receitDao.insertReceit(cashNo, saveName);
	
	response.sendRedirect("/cashbook/month/monthList.jsp");
%>