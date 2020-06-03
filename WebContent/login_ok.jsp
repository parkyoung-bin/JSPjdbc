<%@page import="oracle.net.aso.v"%>
<%@page import="com.jdbc.model.MemberVO"%>
<%@page import="com.jdbc.model.MemberDAO"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
String pw = request.getParameter("pw");

/*
1.DAO에 login 메서드를 만들고 필요한값을 전달합니다.
2.login메서드 안에서는 DB연결작업을 처리하고 결과를 반환합니다
3.결과에 따라서 성공 ,실패페이지로 리다이릭트 
*/

MemberDAO dao = MemberDAO.getInstance();
MemberVO vo =new MemberVO();

int result = dao.login(id,pw);
if(result == 1){
	session.setAttribute("user_id", id);
	response.sendRedirect("login_welcome.jsp");
}else{ response.sendRedirect("login_fail.jsp");

}


/*
//DB연결정보 선언
	String url = "jdbc:oracle:thin:@localhost:1521/XEPDB1";
	String uid = "JSP";
	String upw = "JSP";
	
	String sql = "select * from members where id = ? and pw =?";
	Connection conn = null;
	PreparedStatement pstmt= null;
	ResultSet rs= null;

	try{
		//1. 데이터베이스에서 쿼리문을 전송하고 rs.next()가 있다면, session에 아이디 정보 저장후
		//login_welcome으로 리다이렉트 , rs.next()가 없다면 , login_fail페이지로 리다이렉트
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url,uid,upw);
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,id);
		pstmt.setString(2,pw);
		
		rs=pstmt.executeQuery();
		
		if(rs.next()){
			
		session.setAttribute("user_id", id); //로그인 성공의 인증수단
		
		response.sendRedirect("login_welcome.jsp");
		
		}else{
			response.sendRedirect("login_fail.jsp");
		}
		
	}catch(Exception e){
		e.printStackTrace();
		response.sendRedirect("join.jsp");
	}finally{
		try{
			if(conn!=null) conn.close();
			if(pstmt !=null) pstmt.close();
			
			}catch(Exception e){
				
		}
	}
	*/

%>
