<%@page import="com.jdbc.model.MemberVO"%>
<%@page import="com.jdbc.model.MemberDAO"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("utf-8");
	//1. 폼값을 받는다.
	String id =request.getParameter("id");
	String pw =request.getParameter("pw");
	String name =request.getParameter("name");
	String phone1 =request.getParameter("phone1");
	String phone2 =request.getParameter("phone2");
	String phone3 =request.getParameter("phone3");
	String gender =request.getParameter("gender");
	
	// DAO객체생성
	MemberDAO dao = MemberDAO.getInstance();
	MemberVO vo =new MemberVO(id,pw,name,phone1,phone2,phone3,gender);
	int result = dao.join(vo);
	
	if(result == 1){
		response.sendRedirect("join_success.jsp");
		
	}else{
		response.sendRedirect("join_fail.jsp");
	}
/*
	//2. DB연결에 필요한 변수 선언
	String url = "jdbc:oracle:thin:@localhost:1521/XEPDB1";
	String uid = "JSP";
	String upw = "JSP";
	
	String sql = "insert into members values(?,?,?,?,?,?,?)";
	
	Connection conn = null;
	PreparedStatement pstmt = null;

	try {
		//3.드라이버 호출
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		//4. conn 생성
		conn = DriverManager.getConnection(url,uid,upw);
		
		//5.pstmt 생성
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,id);
		pstmt.setString(2,pw);
		pstmt.setString(3,name);
		pstmt.setString(4,phone1);
		pstmt.setString(5,phone2);
		pstmt.setString(6,phone3);
		pstmt.setString(7,gender);
		//6.sql실행
		
		int result = pstmt.executeUpdate(); //성공시 1 , 실패시 0 반환
		
		if(result ==1){
			response.sendRedirect("join_success.jsp");
			
		}else{
			response.sendRedirect("join_fail.jsp");
			
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