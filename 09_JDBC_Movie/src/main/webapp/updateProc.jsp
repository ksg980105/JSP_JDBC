<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>

<jsp:useBean id="mb" class="myPkg.MovieBean"/>
<jsp:setProperty property="*" name="mb"/>
<jsp:useBean id="mdao" class="myPkg.MovieDao"/>

<%
	String[] genres = request.getParameterValues("genre");
	String genre = "";
	if(genres == null){
		genre = "선택항목 없음";
	}else{
		for(int i=0; i<genres.length; i++){
			if (i != genres.length-1){
				genre += genres[i] + ",";
			}else{
				genre += genres[i];
			}
		}	
	}
	mb.setGenre(genre);
	
	String msg, url;
	int cnt = mdao.updateData(mb);
	
	if(cnt != -1){
		msg = "수정 성공";
		url = "list.jsp";
	}else{
		msg = "수정 실패";
		url = "updateForm.jsp?num="+mb.getNum();
	}
%>

<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>