<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
<% request.setCharacterEncoding("utf-8");%>
<%
	String idt= request.getParameter("idt");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	String tel = request.getParameter("tel");
	Timestamp register = new Timestamp(System.currentTimeMillis());
	%>



<%
	Connection conn = null;
	PreparedStatement pstmt=null;
	String str="";
	
	try{
		String jdbcUrl="jdbc:mysql://localhost:3306/jsptest";
		String dbId="root";
		String dbPass="apmsetup";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
		String sql = "insert into member values (?,?,?,?,?,?)"; // 순서에 따라 저장함.
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,idt); // (1=순서,변수)
		pstmt.setString(2,password);
		pstmt.setString(3,name);
		pstmt.setTimestamp(4,register);
		pstmt.setString(5,addr);
		pstmt.setString(6,tel);
		pstmt.executeUpdate();
		
		out.println("member 테이블에 새로운 레코드 추가 완료");
		
	}catch(Exception e){
		e.printStackTrace();
		out.println("레코드 추가 실패");		
	}finally{
		if(pstmt!=null)
			try{pstmt.close();}catch(SQLException sqle){}
		if(conn !=null)
			try{conn.close();}catch(SQLException sqle){}
	}
%>