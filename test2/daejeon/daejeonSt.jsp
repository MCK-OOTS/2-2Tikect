<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대전 경기장</title>
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
	src="Daejeon_Stadium.JPG" 
	width="70%" height="80%" >
	<h3>좌석 선택</h3>

		<form action="../seat.jsp" method="post">
		<input type="hidden" name="team" value="daejeon">
		<input type="radio" name="seat_section" value="W22">W22
		<input type="radio" name="seat_section" value="W23">W23
		<input type="radio" name="seat_section" value="W24">W24
		<input type="radio" name="seat_section" value="W25">W25
		<br><br>
		<input type="radio" name="seat_section" value="S22">S22
		<input type="radio" name="seat_section" value="S23">S23
		<input type="radio" name="seat_section" value="S24">S24
		<br><br>
		<input type="radio" name="seat_section" value="N22">N22
		<input type="radio" name="seat_section" value="N23">N23
		<input type="radio" name="seat_section" value="N24">N24
		<br><br>
		<input type="radio" name="seat_section" value="E22">E22
		<input type="radio" name="seat_section" value="E22">E23
		<input type="radio" name="seat_section" value="E24">E24
		<input type="radio" name="seat_section" value="E22">E25
		<input type="radio" name="seat_section" value="E26">E26
		<br>
		<input type="submit" value="다음">
	</form>
</body>
</html>