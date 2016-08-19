<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Visualizar Seriados</title>
</head>
<h1>Visualizar Seriados</h1>
<body>
<%
	ArrayList<String> lista = (ArrayList<String>) request.getSession().getAttribute("seriados-lista");
	if(lista == null)
	{
		out.print("lista vazia");
	}
	else
	{
		for(String seriado : lista)
		{
			out.print(seriado);
			out.print("<br/>");
		}
	}
%>
<a href="seriados_menu.jsp"> voltar menu </a>
</body>
</html>