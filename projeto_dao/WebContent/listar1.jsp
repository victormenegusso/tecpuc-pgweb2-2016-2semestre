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
	 
	 // percorrer e exibir os produtos //
	 for(Produto prod : produtos)
	 {
	 
		 out.print(prod.getId());
		 out.print("<br/>");
		 out.print(prod.getNome());
		 out.print("<br/>");
		 out.print(prod.getQuantidade());
		 out.print("<br/>");
	 }
 %>
</body>
</html>