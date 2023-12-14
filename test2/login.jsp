<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
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

.logo {
    margin-top: 0px;
    margin-bottom: 40px;
}

#login {
    width: 100%;
    height: 25%;
    background-color: red;
    border-color: transparent;
    color: white;
}

.account {
    display: block;
    margin-bottom: 3px;
    padding: 3px;
    border: 1px solid lightgray;
    border-radius: 3px;
}

#alert {
    border-color: transparent;
}




</style>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>

	<div class="main" >
	<form action="infoCheck.jsp" method="post" target="_self">
		<h1 class="logo"> Ticket Site</h1>
		<input type="text" placeholder="ID" id="id" class="account" name="id">
		<input type="password" placeholder="Password" id="password" class="account" name="password">
		<input type="submit" value="Login" id="login" class="log">
	</form>
	<p><a href="memberRegister.jsp" target="_blank">회원가입</a></p>
	<p id="alert" class="account"></p>
	</div>

</body>
</html>