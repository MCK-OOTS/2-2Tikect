<%@page import="Gwangju.GwangjuDAO"%>
<%@page import="Seats.SeatDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
.main{
   width: 500px;
    height: 600px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    border: 3px solid red;
    border-radius: 5px;
    margin: auto;
}
input{
	display: inline;	
}
</style>
</head>
<body>
	<% 
		String[] seat_det = (String[])request.getAttribute("seat_det"); 
	 	int cnt = 0;

	 	
	 	GwangjuDAO GDAO = new GwangjuDAO();	 	
	 	int BNum = GDAO.BNum();
	 	
	 	if(BNum == 0){
	 		BNum = 1;
	 	}else{
	 		BNum += 1;
	 	}
	 	
	%>
	
	
	
	
	<form action="<%=request.getContextPath()%>/gwangjoo/book_GwangjuDBInsert.jsp" method="post" class="main">
	
	예매좌석 : <c:forEach var="seat_det" items="${seat_det }">
		 	${seat_sec+='-'+=seat_det+='/'}<%cnt++; %></c:forEach>
			<input type="hidden" name="B_seat" value="<c:forEach var="seat_det" items="${seat_det }">
		 											${seat_sec+='-'+=seat_det+='/'}</c:forEach>"> <br>
		 											
	예매 ID : <%=session.getAttribute("id") %><input type="hidden" name="B_id" 
													value="<%= session.getAttribute("id") %>"> <br>
													
	예매자 이름 : <input type="text" name="B_name">
	결제가격 : <%=cnt*10000 %>원<input type="hidden" name="B_price" value="<%=cnt*10000 %>"><br>
	결제방법 : 온라인 결제 <input type="radio" name="B_pay" value="on" checked="checked"><br>
			현장 결제  <input type="radio" name="B_pay" value="off"><br>
	예매번호 : <%=BNum %> <input type="hidden" name="BNum" value="<%=BNum %>">
			<input type="submit" value="예매">
	 
	</form>
	
</body>
</html>