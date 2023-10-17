<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	String filename = request.getParameter("filename"); //이미지를 가져온게아니라 글자를 가져옴
%>

name : <%=name%><br>
filename : <%=filename%><br>

<%
	String configFolder=""; //웹서버 폴더
	int maxSize = 1024*1024*5;
	String encoding = "UTF-8";
	String saveFolder = "img";
	
	configFolder = config.getServletContext().getRealPath("img");
	//ServletConfig config = new ServletConfig();
	
	System.out.println("configFolder:" + configFolder);
	//configFolder:C:\JSP_ksg\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\15_Upload\img
	MultipartRequest mr = null;
	mr = new MultipartRequest(request,
							  configFolder, //업로드할 위치
							  maxSize,		//파일의 최대크기
							  encoding,		//외국어처리방식
							  new DefaultFileRenamePolicy() //똑같은 파일도 중복해서 올릴수있는 기능 (1, 2등 순서대로 붙어짐)
							  );
	//객체만들때 업로드가 된다.
	
%>

name2 : <%=mr.getParameter("name")%><br>
filename2 : <%=mr.getParameter("filename")%><br>
<%
	String fs_filename = mr.getFilesystemName("filename"); //파일이름 가져오기
	String og_filename = mr.getOriginalFileName("filename"); //원래 파일이름
%>

filename3 : <%=fs_filename%> <br>
filename4 : <%=og_filename%> <br>

<%
	String requestFolder = request.getContextPath()+"/"+saveFolder; //웹서버 폴더 위치 찾기
	System.out.println("requestFolder:" + requestFolder);
	///15_Upload/img
	
	String fullPath = requestFolder+"/"+fs_filename;
	System.out.println("fullPath:" + fullPath);
	//15_Upload/img/eye_bg4.png
%>

<img src="<%=fullPath%>" width="300" height="200"/>



