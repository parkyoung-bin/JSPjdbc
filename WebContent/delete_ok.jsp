<%@page import="com.jdbc.model.MemberVO"%>
<%@page import="com.jdbc.model.MemberDAO"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*
1.필요한 값을 (id)얻기
2.excuteUpdate() 구문으로 실행을 시키고 탈퇴성공시 , 세션을 삭제하고 , login 페이지로 리다이렉트
탈퇴 실패시 login_welcome페이지로 리다이렉트
*/
String id = (String)session.getAttribute("user_id");

MemberDAO dao = MemberDAO.getInstance();
MemberVO vo = new MemberVO();


int result =dao.delete(id);
if(result ==1){
	session.invalidate();
	response.sendRedirect("login.jsp");
}else{
	response.sendRedirect("login_welcome.jsp");
}


/* //DB에 필여한 변수 선언
	String url = "jdbc:oracle:thin:@localhost:1521/XEPDB1";
	String uid = "JSP";
	String upw = "JSP";
	
String sql = "delete from members where id =?";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url,uid,upw);
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		int result = pstmt.executeUpdate();
		
		if(result ==1){ //성공인경우
		session.removeAttribute("id");
		response.sendRedirect("login.jsp");
		}else{ // 실패인경우
		response.sendRedirect("login_welcome.jsp");
		
	}
	
}catch(Exception e){
	e.printStackTrace();
}finally{
	try{
		if(conn !=null) conn.close();
		if(pstmt !=null) pstmt.close();
	}catch(Exception e){
		
	}
} */

%>