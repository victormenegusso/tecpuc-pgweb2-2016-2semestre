<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Buscar Seriado</title>
</head>
<body>
<H1>Buscar Seriado</H1>	
<form>
	Nome Seriado: <input name="nome-seriado" /><br/>
	<input value="buscar" name="btn" type="submit"/>
</form>

<a href="seriados_menu.jsp"> voltar menu </a><br/>

</body>
</html>
<%
	if(request.getParameter("btn") != null)
	{
		String seriado = request.getParameter("nome-seriado");
		ArrayList<String> lista = (ArrayList<String>)request.getSession().getAttribute("seriados-lista");
		
		// verifica se não existe a lista
		if(lista == null)
		{
			out.print("nao encontrado");
		}
		else
		{
			if(lista.contains(seriado))
				out.print("encontrado");
			else
				out.print("nao encontrado");
		}
	}
%>