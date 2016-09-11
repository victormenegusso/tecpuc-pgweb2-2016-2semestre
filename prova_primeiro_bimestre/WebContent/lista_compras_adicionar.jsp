<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>
<form>
	Produto: 
	<input name="nome-produto" /><br/>
	
	<input value="adicionar" name="btn" type="submit"/>
</form>

</body>
</html>
<%
	if(request.getParameter("btn") != null)
	{
		// obtem o nome do produto //
		String nomeProduto = request.getParameter("nome-produto");
		
		// obtem a lista de compras da sessão //
		ArrayList<String> lista = (ArrayList<String>)request.getSession().getAttribute("lista-compras");
		
		// verificamos se a lista é nula
		// pois se é o primeiro acesso
		// não temos a lista em sessão
		if(lista == null)
		{
			// se nula, criamos e adicionamos
			// na sessão 
			lista = new ArrayList<String>();
			request.getSession().setAttribute("lista-compras", lista);
		}
		
		// adicionamos o nome do produto na lista.
		lista.add(nomeProduto);
	}
%>

<a href="lista_compras_menu.jsp"> Voltar prara o Menu </a>