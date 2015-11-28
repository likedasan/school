	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.sql.*"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel = "stylesheet" href="NewFile.css"/>
<%
	String idt= request.getParameter("idt");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	String tel = request.getParameter("tel");
	
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;


try{
	String jdbcUrl="jdbc:mysql://localhost:3306/jsptest";
	String dbId = "jspid";
	String dbPass= "jsppass";
	
		Class.forName("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection(jdbcUrl,dbId,dbPass);
		
		String sql = "select id, password from member where Id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,"idt");
		rs=pstmt.executeQuery();
		out.println("디비연결 및 쿼리 셀렉트쿼리 실행");
		if(rs.next()){ // rs.next()는 만약 해당 행이 존재하면 true 반환 아니면 false임.
			String rId= rs.getString("id");
			String rPassword = rs.getString("password");
		  if(idt.equals(rId)&&password.equals(rPassword)){
		  sql = "update member set name =?, address=?, tel=? where id=?";
		  pstmt.close();
		  pstmt = conn.prepareStatement(sql);
		  pstmt.setString(1,name);
		  pstmt.setString(2,addr);
		  pstmt.setString(3,tel);
		  pstmt.setString(4,idt);
		  pstmt.executeUpdate();
		  out.println("수정완료");

		  }
		}else{
			out.println("ID가 존재하지 않거나 ID와 비밀번호가 일치하지 않습니다.");			  
		}//else end
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