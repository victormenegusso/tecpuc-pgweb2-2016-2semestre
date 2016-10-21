<%@page import="aula.entidade.Arquivo1"%>
<%@page import="java.util.ArrayList"%>
<%@page import="aula.dao.ArquivoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>

<%
	ArquivoDAO dao = new ArquivoDAO();
	ArrayList<Arquivo1> lista = dao.listar();
%>
<table border="1">
	<tr>
		<th>Codigo</th>
		<th>Nome</th>
		<th>content_type</th>
		<th>tamanho</th>
		<th>link</th>
	</tr>



<%
	for( Arquivo1 arq : lista )
	{
%>
	<tr>
		<td><%= arq.getCodigo() %></td>
		<td><%= arq.getNome() %></td>
		<td><%= arq.getContentType() %></td>
		<td><%= arq.getTamanho() %></td>
		<td>
			<a 
				href="./CarregadorArquivos1?c=<%= arq.getCodigo() %>&ct=<%= arq.getContentType() %>"
			>baixar</a>
		</td>
	</tr>
<% 
	}
%>
</table>
</body>
</html>