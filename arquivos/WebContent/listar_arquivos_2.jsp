<%@page import="aula.entidade.Arquivo2"%>
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
	ArrayList<Arquivo2> lista = dao.listar2();
%>
<table border="1">
	<tr>
		<th>id</th>
		<th>Nome</th>
		<th>content_type</th>
		<th>tamanho</th>
		<th>link</th>
	</tr>



<%
	for( Arquivo2 arq : lista )
	{
%>
	<tr>
		<td><%= arq.getId() %></td>
		<td><%= arq.getNome() %></td>
		<td><%= arq.getContentType() %></td>
		<td><%= arq.getTamanho() %></td>
		<td>
			<a 
				href="./CarregadorArquivos2?id=<%= arq.getId() %>"
			>baixar</a>
		</td>
	</tr>
<% 
	}
%>
</table>
</body>
</html>