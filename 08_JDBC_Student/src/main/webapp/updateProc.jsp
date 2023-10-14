<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
updateForm.jsp => updateProc.jsp<br>

<% request.setCharacterEncoding("UTF-8");%>

<jsp:useBean id="bean" class="myPkg.StudentBean"/>
<jsp:setProperty property="*" name="bean"/>

<jsp:useBean id="dao" class="myPkg.StudentDao"/>

<%
String[] hobby = request.getParameterValues("hobby");
String hobbies = "";
if(hobby == null){
	hobbies = "선택항목 없음";
} else{
	for(int i=0; i<hobby.length; ++i){
		if(i != hobby.length-1){
			hobbies += hobby[i]+", ";
			
		} else{
			hobbies += hobby[i];
		}
	}
}
bean.setHobby(hobbies);

int sum = bean.getC()+bean.getJava()+bean.getJsp();
bean.setSum(sum);

int cnt = dao.updateData(bean); 

if(cnt != -1){
	response.sendRedirect("list.jsp");
} else{%>
	<script>
		location.href = "updateForm.jsp?no=<%= bean.getNum()%>";
	</script>
<%
}
%>