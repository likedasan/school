	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.sql.*"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel = "stylesheet" href="NewFile.css"/>
<table>
<tr class = "label">
<td> 아이디
<td> 비밀번호
<td> 이름
<td> 가입일자
<td> 주소
<td> 전화번호


<%
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;


try{
	String jdbcUrl="jdbc:mysql://localhost:3306/jsptest";
	String dbId = "jspid";
	String dbPass= "jsppass";
	
		Class.forName("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection(jdbcUrl,dbId,dbPass);
		
		String sql = "select*from member";
		pstmt = conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		
		
		while(rs.next()){
			String id = rs.getString("id");
			String password = rs.getString("password");
			String name = rs.getString("name");
			Timestamp register = rs.getTimestamp("reg_date");
			String address = rs.getString("address");
			String tel = rs.getString("tel");
			out.println("db get");
%>		
	    <tr>
		<td><%=id%>
		<td><%=password%>
		<td><%=name%>
		<td><%=register.toString()%>
		<td><%=address%>
		<td><%=tel%>
		
<% }
 }catch(Exception e){
	 e.printStackTrace();
	 out.println("db non get");
	 
 }finally{
	 if(rs!=null)
		 try{rs.close();}catch(SQLException sqle){}
	 if(pstmt!=null)
		 try{pstmt.close();}catch(SQLException sqle){}
	 if(conn != null)
		 try{conn.close();}catch(SQLException sqle){}
 }

%>

</table>
