<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Param"%>
<%@page import="java.util.Iterator"%>
<%@page import="testP.Member"%>
<%@page import="java.util.List"%>
<%@page import="testP.RegisterDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IDPS중복확인</title>
</head>
<body>
	<%
		boolean login = false;
		
		String loginId = request.getParameter("id");
		String loginPass = request.getParameter("password");
		
	
		RegisterDAO rDao = new RegisterDAO();
	
		List<Member> list = rDao.CheckIdPs();
	
		Iterator<Member> it_list = list.iterator();
	%>	

		<% 
		List<String> ilist = new ArrayList<String>();
		List<String> plist = new ArrayList<String>();
		String level;
		
		while(it_list.hasNext()){
			Member member = new Member();
			member = it_list.next();
			
			ilist.add(member.getId());
			plist.add(member.getPassword());
		}
		

		for(int i=0; i<ilist.size(); i++){
			if(loginId.equals(null) || loginPass.equals(null)){
				break;
			}
			if(loginId.equals(ilist.get(i))){
				if(loginPass.equals(plist.get(i))){
					login = true;
					break;
				}
			}
		}
		%>
	
	
	<%if(login){
	%>
	
	<jsp:forward page="main.jsp">
	<jsp:param value="<%=loginId %>" name="id" />
	</jsp:forward>
	<%
	
	}else{
	%>
	<script>
	alert("로그인 실패\n 아이디 비밀번호를 다시 입력해주세요.");
	history.back();
	</script>
	<% }%>
	
		

		
	
</body>
</html>