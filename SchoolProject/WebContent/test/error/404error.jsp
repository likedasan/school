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
<img src="http://localhost:8080/SchoolProject/test/error/img_error.jpg">


</body>
</html>