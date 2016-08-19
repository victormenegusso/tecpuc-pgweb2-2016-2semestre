<%@page import="java.io.OutputStream"%>
<%@page import="com.google.gson.JsonParser"%>
<%@page import="com.google.gson.JsonElement"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

	<%
		if(request.getParameter("enviar")!= null)
		{
			try {

				URL url = new URL("http://localhost:8080/aula-rest-servidor/webapi/usuario");
				HttpURLConnection conn = (HttpURLConnection) url.openConnection();
				conn.setDoOutput(true);
				conn.setRequestMethod("POST");
				conn.setRequestProperty("Content-Type", "application/json");
	
				String input = "{\"nome\":\"teste123\",\"senha\":\"teste123\",\"email\":\"teste123\",\"papel\":\"teste123\"}";
				System.out.println(input);
				OutputStream os = conn.getOutputStream();
				os.write(input.getBytes());
				os.flush();
	
				if (conn.getResponseCode() != HttpURLConnection.HTTP_CREATED) {
					out.print("deu erro : HTTP error code : " + conn.getResponseCode());
				}
	
				BufferedReader br = new BufferedReader(new InputStreamReader((conn.getInputStream())));
	
				String output;
				System.out.println("Output from Server .... \n");
				while ((output = br.readLine()) != null) {
					System.out.println(output);
				}
	
				conn.disconnect();
				out.print("deu certo");
	
			} 
			catch (Exception e) {
				out.print("deu erro");
				e.printStackTrace();
			}
		}
	%>
	
<body>
	<form method="post">


		Nome: <input name="nome" /><br> 
		Email: <input name="email" /><br>
		Senha: <input name="senha" /><br> 
		Papel: <input name="papel" /><br>

		<input type="submit" value="enviar" name="enviar"/>
	</form>
</body>
	

</html>