<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>404에러</title>
</head>
<body>
<%response.setStatus(HttpServletResponse.SC_OK); %>

<font size=20 color="red">404에러입니다. 문서를 찾을 수 없습니다. ㅠㅠㅠㅠㅠㅠ</font>
<img src="http://localhost:8080/SchoolProject/error/error.jsp">


</body>
</html>