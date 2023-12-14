<%@page import="Gwangju.Gwangju"%>
<%@page import="Gwangju.GwangjuDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="Seats.Seat"%>
<%@page import="java.util.List"%>
<%@page import="Seats.SeatDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String sector = request.getParameter("seat_section");
		GwangjuDAO GDAO = new GwangjuDAO();
	
		List<Gwangju> list = GDAO.CheckSeats();
		
		Iterator<Gwangju> it_list = list.iterator();
		
		List<String> Slists = new ArrayList<String>();
		List<String> Slists_2 = new ArrayList<String>();

		while(it_list.hasNext()){
			Gwangju gwanju = new Gwangju();
			gwanju = it_list.next();
			Slists.add(gwanju.getSeat());
		}
		
		
		for(int i=0; i<Slists.size(); i++){
			String seat;
			seat = Slists.get(i);
			String[] Sarr = seat.split("/");
			for(int j=0; j<Sarr.length; j++){
				Slists_2.add(Sarr[j].trim());
			}
		}
	%>

 	
<div align="center">
<h3>${seat_sec }</h3>
<h4>원하는 좌석을 선택 해주세요.</h4>
<hr>
<form action="./book_info_check.jsp" method="post">
<b>좌석 배치도</b><br>
&nbsp;&nbsp;
<% for(int i=1; i<=6; i++){ %>
	&nbsp;<small><%=i%></small>&nbsp;
<%} %>
<br>
<% for (char c = 'A'; c<='Z'; c++){%>
	<%= c %>
	<% for(int i=1; i<=6; i++){
		if(Slists_2.contains(sector+"-"+c+"-"+i)){ %>
		<input type="checkbox" name="seat" value="<%=c %>-<%=i%>" disabled="disabled">	
	<%}else{%>
		<input type="checkbox" name="seat" value="<%=c %>-<%=i%>">
	<%} } %>
	<br>
<%} %>
<br>
<input type="hidden" value="gwangju" name="team">
<input type = "submit" value="예매하기">
</form>
</div>
</body>
</html>