<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<h2>jdbc 드라이버 테스트</h2>
<%
	Connection conn = null;
	
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
