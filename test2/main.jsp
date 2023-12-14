<%@page import="java.util.Calendar"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="Match.Match"%>
<%@page import="Match.MatchDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="testP.Member"%>
<%@page import="java.util.List"%>
<%@page import="testP.RegisterDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>티켓 사이트</title>
<style type="text/css">
span{
	font-size: xx-large;
	text-align: center;
	
}
img {
	width: 200px;
	height: 200px;
	
}
.Mdiv{
	border: 1px solid #000;
	width: 80%;
}
.btn_book{
	align-content: center;
	align-items: center;
	align-self: center;
	background: gray;
}
body{
	margin: 0;
	padding: 0;
}

#navbar ul{
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	text-align: center;
}
#navbar li{
	float: left;
}
#navbar li{
	test-decoration:none;
	font-weight: bold;
	color: white;
	display: block;
	text-align: center;
	padding: 10px 12px;
}

.lia{
	test-decoration:none;
	font-weight: bold;
	color: white;
	display: block;
	text-align: center;
	padding: 10px 12px;
}
#navbar{
	background-color: #FE2E2E;
	overflow: hidden;
	text-align: center;
}
li a:hover{
	background-color: #DF0101;
	color: black;
}
.lia:hover{
	background-color: #DF0101;
	color: black;
}
.btn_add{
	background-color: #FE9A2E;
	border: 3px solid #FF8000;
	font-size: 20px;
	color: olive;
}
.btn_add:hover{
	border: 5px solid #FF8000;
}



</style>
</head>
<body>

	


	<%
		String id = request.getParameter("id"); 
		session.setAttribute("id", id);
		
		RegisterDAO RDAO = new RegisterDAO();
		int level = RDAO.getLevel(request.getParameter("id"));
	
		MatchDAO MDAO = new MatchDAO();
		
		List<Match> Mlist = MDAO.MatchInfo();
		
		Iterator<Match> iter_Mlist = Mlist.iterator();
		
		List<String> Dlist = new ArrayList<String>();//경기날짜
		List<String> Hlist = new ArrayList<String>();//홈팀
		List<String> Alist = new ArrayList<String>();//원정팀
	
		while(iter_Mlist.hasNext()){
			Match match = new Match();
			match = iter_Mlist.next();
			
			Dlist.add(match.getDate());
			Hlist.add(match.getHome());
			Alist.add(match.getAway());

		}
	%>
	
	<c:set var="level" value="<%=level %>"/>
	<c:set var="id" value="<%=id %>"/>
	
	<div align="center" id="navbar">
		<c:if test="${id == 'admin'}">
			<ul class="navi" style="float: left;">
			<li><button class="btn_add" onclick="NewWinAddMatch();">경기추가</button> </li>
			</ul>
		</c:if>
		<ul class="navi" style="float: right;">
			<li><%=id %> 님 환영합니다.</li>
			<li>현재 내 레벨 : ${level }</li>
			<c:if test="${level == 1}">
				<li>경기 예매는 경기시간 24시간 전부터 가능 합니다. </li>
			</c:if>
			<c:if test="${level == 2}">
				<li>경기 예매는 경기시간 25시간 전부터 가능 합니다. </li>
			</c:if>
			<c:if test="${level == 3}">
				<li>경기 예매는 경기시간 26시간 전부터 가능 합니다. </li>
			</c:if>

			<li><a href="bookingCheck.jsp">예매확인</a></li>
			<li><a href="login.jsp">로그아웃</a></li>
			
		</ul>

	</div>
	
	<script type="text/javascript">
	    var enableTimeFunctions = [];

    	function enableTime(index) {
        	var button = document.getElementById("myButton" + index);
        	button.disabled = false;
    	}

	    window.onload = function () {
	        enableTimeFunctions.forEach(function (func) {
            	func();
        	});
    	};
	</script>
	
	
	<br><br>
	<%
		Calendar currentTime = Calendar.getInstance();
		Calendar activeTime = Calendar.getInstance();
	
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		int list_size = Dlist.size();
		
		
		for(int i = 0; i<Dlist.size(); i++){
			String strMatchInfo = String.valueOf(Dlist.get(i));
			String[] arrMatchInfo = strMatchInfo.split(" ");
			
			
			Date TempTime = sdf.parse(Dlist.get(i));
			activeTime.setTime(TempTime);
			
			long longTime = Math.abs(currentTime.getTimeInMillis() - activeTime.getTimeInMillis()); 
			int difTime = (int)longTime/(60*60*1000);
			
			if (activeTime.before(currentTime)) {
				difTime = difTime * -1;
	            System.out.println(difTime);
	        }
			
			
			if(difTime > 0){
			%>
			
				<section>
				<div class="Mdiv">
				<h3><strong>경기시간:<%=arrMatchInfo[0]%>일 <%=arrMatchInfo[1]%></strong></h3>
					<img alt="로고" src="logo/<%=Hlist.get(i)%>.JPG">
				<span>vs</span>
					<img alt="로고" src="logo/<%=Alist.get(i)%>.JPG">
					  <button id="myButton<%=i%>" class="btn_book" onclick="NewWin<%=Hlist.get(i)%>();" disabled><span>예매하기</span></button>
				</div>
				</section>
			<br>
			<% 	}
			
			
				
				int levelThreshold = 24 + level - 2;
				
				if (difTime <= levelThreshold && difTime > 0) {
				
					%>
					<script type="text/javascript">
					 enableTimeFunctions.push(function () {
						 enableTime(<%=i%>);
			            });
					 
					</script>
				<%} 
				
				}%>
				
	<script type="text/javascript">
	
		function NewWindaejeon(){
			
			window.open("<%=request.getContextPath()%>/daejeon/daejeonSt.jsp", "좌석선택", "width=1500, height=800 ");
			
		}
		function NewWingwangjoo(){
			window.open("<%=request.getContextPath()%>/gwangjoo/gwangjooSt.jsp", "좌석선택", "width=1500, height=800 ");
			
		}
		function NewWinseoul(){
			window.open("<%=request.getContextPath()%>/seoul/seoulSt.jsp", "좌석선택", "width=1500, height=800 ");
			
		}
		

		
		function NewWinAddMatch(){
			window.open("<%=request.getContextPath()%>/addMatch.jsp", "경기추가", "width=900, height=500 ");
		}
		

	</script>
	
	
</body>
</html>







