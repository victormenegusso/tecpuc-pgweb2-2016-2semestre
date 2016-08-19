<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home Usuario</title>
</head>
<body>
<%
	if(request.getSession().getAttribute("login")==null)
	{	
		response.sendRedirect("login.jsp");
	}
	else
	{
		String papel = (String) request.getSession().getAttribute("papel");
		if(!papel.equals("admin") && !papel.equals("usuario"))
		{
			response.sendRedirect("erropermissao.jsp");
		}
	}
%>

	BEM VINDO Usuário<br/>
</body>
</html>