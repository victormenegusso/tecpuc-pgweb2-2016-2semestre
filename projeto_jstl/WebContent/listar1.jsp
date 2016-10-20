<%@page import="java.util.ArrayList"%>
<%@page import="aula.entidade.Produto"%>
<%@page import="aula.dao.ProdutoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="dao" class="aula.dao.ProdutoDAO"></jsp:useBean>
    
<html>
<head>
</head>
<body>

<c:forEach var="produto" items="${dao.listar()}">
	${produto.id} <br/>
	${produto.nome} <br/>
	${produto.quantidade} <br/>
</c:forEach>

</body>
</html>