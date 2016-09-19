<%@page import="aula.dao.ProdutoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
</head>
<body>
 <%
	 // dados a inserir //
	 String nome = "Teste Inserir 1";
	 int quantidade = 1;
	 
	 // criando o objeto dao //
	 ProdutoDAO dao = new ProdutoDAO();
	 
	 // executando o método de inserir //
	 dao.inserir( nome, quantidade);
	 
	 // print //
	 out.print("Inserido com sucesso");
 %>
</body>
</html>