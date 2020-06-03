<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    //url로 접근하는것을 막는 코드
    if(session.getAttribute("user_id")==null){
    	response.sendRedirect("login.jsp");
    }
    String id = (String)session.getAttribute("user_id"); 
    
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2><%=id %>님 환영합니다.</h2>
	<a href="logout.jsp">로그아웃</a>
	<a href="update.jsp">정보수정</a>
	<a href="delete_ok.jsp">회원탈퇴</a>
</body>
</html>