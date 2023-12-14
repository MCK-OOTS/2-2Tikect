<%@page import="Seats.Seat"%>
<%@page import="Seats.SeatDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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
		//홈팀에 따른 DB 선택
		request.setCharacterEncoding("UTF-8");
		
		
		String[] seat_det = request.getParameterValues("seat");
		String team = request.getParameter("team");
		
		
		
		request.setAttribute("seat_det", seat_det);
	%>
	
	<c:set var="team" value="<%=team %>"/>
	${team }
	<c:if test="${team == 'daejeon' }">
	${team }
		<jsp:forward page="/daejeon/book_info_DaejeonInsert.jsp"/>
	</c:if>
	<c:if test="${team == 'gwangju'}">
		<jsp:forward page="/gwangjoo/book_info_GwangjuInsert.jsp"/>
	</c:if>
	
</body>
</html>