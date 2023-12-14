<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.main {
    width: 400px;
    height: 400px;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    border: 1px solid lightgrey;
    border-radius: 5px;
    margin: auto;
}
</style>
<title>경기 추가</title>
</head>
<body>
	<form action="MatchAdd.do" class="main" method="post">
MATCH DAY  <input type="date" name="day"><br>
Kick OFF  <input type="time" name="time"><br>
HOME 	<select name="home">
		<option disabled="disabled" selected="selected">홈팀</option>
		<option value="daejeon" >대전하나 시티즌</option>
		<option value="seoul">서울FC</option>
		<option value="gwangjoo">광주FC</option>
		<option value="ulsan">울산 현대</option>
		<option value="incheon">인천 유나이티드</option>
		</select>
		<br>
AWAY 	<select name="away">
		<option disabled="disabled" selected="selected">원정팀</option>
		<option value="daejeon" >대전하나 시티즌</option>
		<option value="seoul">서울FC</option>
		<option value="gwangjoo">광주FC</option>
		<option value="ulsan">울산 현대</option>
		<option value="incheon">인천 유나이티드</option>
	</select>
	<br>
	<input type="submit" value="경기추가">
	</form>
	
</body>
</html>