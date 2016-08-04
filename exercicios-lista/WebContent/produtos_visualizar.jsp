<%@page import="tecpuc.lista.Produto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Visualizar Produtos</title>
</head>
<h1>Visualizar Produtos</h1>
<body>
<%
	ArrayList<Produto> lista = (ArrayList<Produto>) request.getSession().getAttribute("produtos-lista");
	if(lista == null)
	{
		out.print("lista vazia");
	}
	else
	{
%>
<table border="1">
	<tr>
		<th>Nome</th>
		<th>Descricao</th>
	</tr>
<%
		for(Produto produto : lista)
		{
		%>
			<tr>
				<td><%=produto.getNome() %></td>
				<td><%=produto.getDescricao() %></td>
			</tr>		
		<%
		}
	
	%>
</table>
	<% 
	}
%>

<a href="produtos_menu.jsp"> voltar menu </a><br/>
</body>
</html>