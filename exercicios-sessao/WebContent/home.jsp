<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
</head>
<body>
<%
	if(request.getSession().getAttribute("login")==null)
	{
		response.sendRedirect("login.jsp");
	}
%>

	BEM VINDO <%= request.getSession().getAttribute("nome") %><br/>
	Papel: <%= request.getSession().getAttribute("papel") %><br/> 
	<br/>
	<a href="homeadmin.jsp">adm</a><br/>
	<a href="homeusuario.jsp">usuario</a><br/>
	<a href="logout.jsp">logout</a><br/>
</body>
</html>