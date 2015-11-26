<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>

<h2>jdbc 드라이버 테스트</h2>
<%
	Connection conn = null;
	PreparedStatement pstmt=null;
	ResultSet rs=null
	
	try{
		String jdbcUrl="jdbc:mysql://localhost:3306/jsptest";
		String dbId="jspid";
		String dbPass="jsppass";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
		out.println("제대로 연결되었음.");
	}catch(Exception e){
		e.printStackTrace();
	}
	
	
	
%>
