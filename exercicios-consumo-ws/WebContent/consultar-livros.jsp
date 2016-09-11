<%@page import="com.google.gson.reflect.TypeToken"%>
<%@page import="java.lang.reflect.Type"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="trabalhando_json_com_gson.Livro"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>
<%
	try{
		
		// adicionamos a url para obter os livros //
		URL url = new URL("http://localhost:8080/exercicio-rest-servidor-livros/rest/livro");
		
		// montamos a conexão com http get //
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		
		// --- processo para obter a resposta do servidor --- //
		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		
		String output,json="";
		while( (output = br.readLine()) != null)
		{
			json+=output;
		}
		
		conn.disconnect();

		// transformando o JSON em uma 
		// lista de objetos 
		ArrayList<Livro> livros;
		Gson gson = new Gson();
		
		Type tipoLista = new TypeToken<ArrayList<Livro>>() {}.getType();
		livros = gson.fromJson(json, tipoLista);
		
		// percorrer a lista de livros
		// exibindo dentro de uma tabela
		// aqui vai alternar entre java e html //
		
%>
	<table border="1">
		<tr>
			<th>id</th>
			<th>nome</th>
			<th>autor</th>
			<th>descricao</th>
			<th>editora</th>
			<th>genero</th>
			<th>origem</th>
		</tr>
<%
		// cada item da lista vai ser 
		// uma linha na tabela
		for(Livro livro : livros)
		{
%>
		<tr>
			<td><%=livro.getId()%></td>
			<td><%=livro.getNome()%></td>
			<td><%=livro.getAutor()%></td>
			<td><%=livro.getDescricao()%></td>
			<td><%=livro.getEditora()%></td>
			<td><%=livro.getGenero()%></td>
			<td><%=livro.getOrigem()%></td>
		</tr>
<%
		}
%>
	</table>
<%
		
	}
	catch (Exception e) 
	{
		e.printStackTrace();	
	}
%>
</body>
</html>