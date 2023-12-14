<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
	String seat_1 = request.getParameter("seat_section"); 
	String team = request.getParameter("team");
	session.setAttribute("seat_sec", seat_1);
	//char seat_2 = seat_1.charAt(0);
	%>
	
	<c:set var="team" value="<%=team %>"/>
	<c:set var="seat" value="<%=seat_1%>"/>
	<jsp:forward page="/${team}/${seat}.jsp">
	<jsp:param value="${seat}" name="seat"/>
	</jsp:forward>
	
</body>
</html>