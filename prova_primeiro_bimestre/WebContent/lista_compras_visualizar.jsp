<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>
<%
	// pega a lista da sessão //
	ArrayList<String> lista = (ArrayList<String>) request.getSession().getAttribute("lista-compras");
	if(lista == null)
	{
		out.print("lista vazia");
	}
	else
	{
		// percorre a lista //
		for(String compras : lista)
		{
			out.print(compras);
			out.print("<br/>");
		}
	}
%>
<a href="lista_compras_menu.jsp"> Voltar prara o Menu </a>
</body>
</html>