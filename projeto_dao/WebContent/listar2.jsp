<%@page import="java.util.ArrayList"%>
<%@page import="aula.entidade.Produto"%>
<%@page import="aula.dao.ProdutoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
</head>
<body>
<%
	 ArrayList<Produto> produtos;
	 ProdutoDAO dao = new ProdutoDAO();
	 
	 // obter os produtos //
	 produtos = dao.listar();
	 
	 // iniciar tabela //
%>
	<table border="1">
		<tr>
			<th>id</th>
			<th>nome</th>
			<th>quantidade</th>
		</tr>
<% 
	 // percorrer e exibir os produtos //
	 for(Produto prod : produtos)
	 {
%>
		<tr>
			<td><%= prod.getId() %></td>
			<td><%= prod.getNome() %></td>
			<td><%= prod.getQuantidade() %></td>
		</tr>
<%
	 }
%>
 	</table>
</body>
</html>