<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style type="text/css">
.main{
   width: 400px;
    height: 600px;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    border: 3px solid red;
    border-radius: 5px;
    margin: auto;
}

</style>
</head>
<body>
	<% request.setCharacterEncoding("UTF-8"); %>
     <h1 align="center">회원 가입</h1>
        <form method="post" action="idCheck.jsp" class="main">
        
            <h2>아이디</h2>
            <div>
                <input type="text" class="input" style="ime-mode:disabled;" placeholder="아이디" name="id" title="아이디" maxlength="10">
            </div>
            
            <h3>비밀번호</h3>
            <div>
                <input type="password" class="input" placeholder="비밀번호" name="password" title="비밀번호" maxlength="20" >
            </div>
            
            <h3>이름</h3>
            <div>
                <input type="text" class="input" placeholder="이름" name="name" title="이름" maxlength="10" >
            </div>
            
            <h3>이메일</h3>
            <div>
                <input type="text" class="input" placeholder="email" name="email" title="이메일" maxlength="15">
            </div>
            	<input type="hidden" value="0" name="book_cnt">
				<input type="hidden" value="1" name="level">

            
            <input type="submit" value="회원가입">
        </form>
	
</body>
</html>