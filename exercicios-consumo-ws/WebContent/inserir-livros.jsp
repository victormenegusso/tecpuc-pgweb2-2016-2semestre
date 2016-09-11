<%@page import="java.io.OutputStream"%>
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
	<form method="post">
		nome:
		<input name="nome">
		<br/>
		
		autor:
		<input name="autor">
		<br/>
		
		descricao:
		<input name="desc">
		<br/>
		
		editora:
		<input name="edit">
		<br/>
		
		genero:
		<input name="gen">
		<br/>

		origem:
		<input name="org">
		<br/>
		
		<input type="submit" name="btn" value="cadastrar">
	</form>
</body>
</html>


<%
	if(request.getParameter("btn")!= null)
	{
		try
		{
			// criamos o livro //
			Livro livro = new Livro();
			livro.setNome( request.getParameter("nome") );
			livro.setAutor( request.getParameter("autor") );
			livro.setDescricao( request.getParameter("desc") );
			livro.setEditora( request.getParameter("edit") );
			livro.setGenero( request.getParameter("gen") );
			livro.setOrigem( request.getParameter("org") );
			
			// adicionamos a url para inserir os livros //
			URL url = new URL("http://localhost:8080/exercicio-rest-servidor-livros/rest/livro");
			
			// montamos a conexão com http post //
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setDoOutput(true);
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Type", "application/json");
	
			// adicionamos o json para ser enviado //
			Gson gson = new  Gson();
			String input = gson.toJson(livro);
			System.out.println(input);
			OutputStream os = conn.getOutputStream();
			os.write(input.getBytes());
			os.flush();
	
			// pegamos a resposta do servidor...
			// essa parte não é obrigatoria..
			BufferedReader br = new BufferedReader(new InputStreamReader((conn.getInputStream())));
			String output;
			System.out.println("Output from Server .... \n");
			while ((output = br.readLine()) != null) {
				System.out.println(output);
			}
	
			// fechamos coneaxo //
			conn.disconnect();
			out.print("deu certo");	
		}
		catch (Exception e) 
		{
			e.printStackTrace();	
		}
	}
%>