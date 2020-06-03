<%@page import="com.jdbc.model.MemberVO"%>
<%@page import="com.jdbc.model.MemberDAO"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String phone1=request.getParameter("phone1");
	String phone2=request.getParameter("phone2");
	String phone3=request.getParameter("phone3");
	String gender=request.getParameter("gender");
	/*
	1. DAO에 update()메서드를 생성
	2. 폼값 update()메서드 전달 후 sql실행
	3. excuteUpdate()가 1을 반환하면 update_success
		0이면 fail
	*/
	
	MemberDAO dao = MemberDAO.getInstance();
	MemberVO vo = new MemberVO(id,null,name,phone1,phone2,phone3,gender);
    int result = dao.update(vo);
	
	if(result == 1){
		response.sendRedirect("update_success.jsp");
	}else{
		response.sendRedirect("update_fail.jsp");
	}
	

	
	/* 
	// DB에 필여한 변수 선언
	String url = "jdbc:oracle:thin:@localhost:1521/XEPDB1";
	String uid = "JSP";
	String upw = "JSP";
	String sql = "update members set phone1=?,phone2=?,phone3=?,gender=?,name=? where id =?";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url,uid,upw);
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, phone1);
		pstmt.setString(2, phone2);
		pstmt.setString(3, phone3);
		pstmt.setString(4, gender);
		pstmt.setString(5, name);
		pstmt.setString(6, id);
		
		int result = pstmt.executeUpdate(); //성공시 1 실패시 0 반환
		
		if(result ==1){ //성공인경우
			response.sendRedirect("update_success.jsp");
		
		}else{ // 실패인경우
			response.sendRedirect("update_fail.jsp");
			
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