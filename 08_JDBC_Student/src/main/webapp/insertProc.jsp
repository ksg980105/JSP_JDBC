<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
insertForm.jsp => insertProc.jsp<br>
<%
    request.setCharacterEncoding("UTF-8");
%>
    
<jsp:useBean id="sb" class="myPkg.StudentBean"/>
<jsp:setProperty property="*" name="sb"/>
<jsp:useBean id="sdao" class="myPkg.StudentDao"/>
<!-- setHobby("달리기") -->
    
 <%
 
	String [] hobbys = request.getParameterValues("hobby");
	String hobby = "";
	if(hobbys == null){ // 
		hobby = "선택항목 없음";
	}else{
		for(int i=0; i<hobbys.length; i++){
			if (i != hobbys.length-1){
				hobby += hobbys[i] + ","; // 달리기,수영,영화 
			}else{
				hobby += hobbys[i];
			}
		}
	}
	
	sb.setHobby(hobby);
	
	/* int c = Integer.parseInt(request.getParameter("c"));
	int java = Integer.parseInt(request.getParameter("java"));
	int jsp = Integer.parseInt(request.getParameter("jsp")); 
	int sum = c + java + jsp;
	*/
	
	int sum = sb.getC()+ sb.getJava()+sb.getJsp();
	sb.setSum(sum);
	
	int cnt = sdao.insertData(sb); 
	if(cnt!=-1){
		response.sendRedirect("list.jsp");
	}else{
		response.sendRedirect("insertForm.jsp");
	}
 %>   

 
 
 
 