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

<table border="1">
		<tr>
			<th>id</th>
			<th>nome</th>
			<th>quantidade</th>
			<th>tem desconto ?</th>
		</tr>
		<c:forEach var="produto" items="${dao.listar()}">
			<tr>
				<td>${produto.id}</td>
				<td>${produto.nome}</td>
				<td>${produto.quantidade}</td>
				
				<c:if test="${produto.quantidade > 10}">
	                <td>Com desconto</td>
	            </c:if>
	            <c:if test="${produto.quantidade <= 10}">
	                <td>Sem desconto</td>
	            </c:if>
			</tr>
		</c:forEach>
</table>
</body>
</html>