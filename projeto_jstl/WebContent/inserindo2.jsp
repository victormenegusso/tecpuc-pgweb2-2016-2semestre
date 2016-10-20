<%@page import="aula.entidade.Produto"%>
<%@page import="aula.dao.ProdutoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
</head>
<body>
 <%
	 // dados a inserir //
     Produto prod = new Produto();
	 prod.setNome("Teste Inserir 2");
	 prod.setQuantidade(2);
	 
	 // criando o objeto dao //
	 ProdutoDAO dao = new ProdutoDAO();
	 
	 // executando o método de inserir //
	 dao.inserir( prod );
	 
	 // print //
	 out.print("Inserido com sucesso");
 %>
</body>
</html>