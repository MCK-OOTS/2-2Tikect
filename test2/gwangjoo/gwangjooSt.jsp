<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>광주 경기장</title>
<style type="text/css">
img{
	float: left;
	white-space: nowrap;
	border: 1px solid #000;
}
div{
	white-space: nowrap;
	
}
</style>
</head>
<body>
	<img alt="경기장" 
	src="Gwangjoo_Stadium.JPG" 
	width="70%" height="80%" >
	<h3>좌석 선택</h3>

		<form action="../seat.jsp" method="post">
		<input type="hidden" name="team" value="gwangjoo">
		<input type="radio" name="seat_section" value="B3">B3
		<input type="radio" name="seat_section" value="B2">B2
		<input type="radio" name="seat_section" value="B1">B1
		<input type="radio" name="seat_section" value="A4">A4
		<input type="radio" name="seat_section" value="A3">A3
		<input type="radio" name="seat_section" value="A2">A2
		
		<br><br>
		<input type="radio" name="seat_section" value="C2">C2
		<input type="radio" name="seat_section" value="C3">C3
		<input type="radio" name="seat_section" value="C4">C4
		<input type="radio" name="seat_section" value="C5">C5

		<br><br>
		<input type="radio" name="seat_section" value="F5">F5
		<input type="radio" name="seat_section" value="F4">F4
		<input type="radio" name="seat_section" value="F3">F3
		<input type="radio" name="seat_section" value="F2">F2
		<br><br>
		<input type="radio" name="seat_section" value="D3">D3
		<input type="radio" name="seat_section" value="D4">D4
		<input type="radio" name="seat_section" value="D5">D5
		<input type="radio" name="seat_section" value="E1">E1
		<input type="radio" name="seat_section" value="E2">E2
		<input type="radio" name="seat_section" value="E3">E3
		<br>
		<input type="submit" value="다음">
	</form>
</body>
</html>