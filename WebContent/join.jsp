<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>	
	<h2> 회원가입연습 </h2>
	
	
	<form action = "join_ok.jsp" method = "post">
	아이디:<input type = "text" name = "id" size = "10"><Br>
	비밀번호:<input type = "password" name = "pw" size = "10"><Br>
	이름 :<input type = "text" name = "name" size = "10"><Br>
	전화번호 
	<select name="phone1">
		<option>010</option>
		<option>031</option>
		<option>02</option>
	
	</select>
	-<input type ="text" name = "phone2" size ="10">
	-<input type ="text" name = "phone3" size = "10"> 
	
	<br>
	성별 : 
	<input type = "radio" name = "gender" value ="m">남자
	<input type = "radio" name = "gender" value ="w">여자
	
	<br>
	<input type = "submit" value = "회원가입"><br>
	
	</form>

</body>
</html>