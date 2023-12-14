<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="testP.Member"%>
<%@page import="java.util.List"%>
<%@page import="testP.RegisterDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Id 중복체크</title>
</head>
<body>
	<%
		boolean login = false;
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		int book_cnt = Integer.parseInt(request.getParameter("book_cnt"));
		int level = Integer.parseInt(request.getParameter("level"));
	
		RegisterDAO rDao = new RegisterDAO();
	
		List<Member> list = rDao.CheckIdPs();
	
		Iterator<Member> it_list = list.iterator();
	%>	
	
	<% 
		List<String> ilist = new ArrayList<String>();
	
		while(it_list.hasNext()){
			Member member = new Member();
			member = it_list.next();
			
			ilist.add(member.getId());
			
	}
		
		for(int i=0; i<ilist.size(); i++){
			if(id.equals(null)){
				break;
			}
			if(id.equals(ilist.get(i))){
				login = true;
				break;
				
			}
		}
	%>
	
	<%if(login == false){
	%>
		<form action="Register" method="post" id="infoTR">
		<input type="hidden" value=<%= id%> name="id">
		<input type="hidden" value=<%= password%> name="password">
		<input type="hidden" value=<%= name%> name="name">
		<input type="hidden" value=<%= email%> name="email">
		<input type="hidden" value=<%= book_cnt%> name="book_cnt">
		<input type="hidden" value=<%= level%> name="level">
		</form>
		<script type="text/javascript"> 
			alert("회원가입 성공!");
			this.document.getElementById("infoTR").submit(); 
		</script> 
	<%
	
	}else if(login == true){
	%>
	<script>
	alert("이미 사용중인 아이디 입니다. \n 아이디를 다시 입력해주세요.");
	history.back();
	</script>
	<% }%>
	
</body>
</html>










