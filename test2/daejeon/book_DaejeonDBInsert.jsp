<%@page import="testP.RegisterDAO"%>
<%@page import="testP.Member"%>
<%@page import="Seats.SeatDAO"%>
<%@page import="Seats.Seat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
		String book_seat = request.getParameter("B_seat");
		String book_id = request.getParameter("B_id");
		String book_name = request.getParameter("B_name");
		String price = request.getParameter("B_price");
		String payment = request.getParameter("B_pay");
		int book_num = Integer.parseInt(request.getParameter("BNum"));
		if(book_seat == null || book_id == null || book_name == null || price == null || payment == null){%>
			<script type="text/javascript"> alert("예매실패")</script>
			<jsp:forward page="main.jsp"/>
		<%}
		
		
		Seat seat = new Seat(book_seat, book_id, book_name, price, payment, book_num);
		
		
		SeatDAO sDao = new SeatDAO();
		String result1 = sDao.insert(seat);
		RegisterDAO RDAO = new RegisterDAO();
		String result2 = RDAO.BCntUpdate((String)book_id);
		int cnt = RDAO.cntCheck((String)book_id);
		String result3 = RDAO.levUp(cnt, (String)book_id); 
		
		if(result3.equals("update")){%>
			<script>
				alert("레벨이 업데이트 되었습니다.")
			</script>
		<%}
		
		if(result1.equals("success") && result2.equals("success")){%>
			<script>	
				alert("예매성공");
			</script>
				
			<script>
				window.close();
			</script>
				
			
			
			
		<%}

	%>

</body>
</html>