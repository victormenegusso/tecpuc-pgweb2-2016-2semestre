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
			URL url = new URL("http://localhost:8080/aula-rest-servidor/webapi/usuario");
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.set
			conn.setRequestMethod("POST");
			if (conn.getResponseCode() != 200) {
				out.print("deu erro... HTTP error code : " + conn.getResponseCode());
			}
	
			BufferedReader br = new BufferedReader(new InputStreamReader((conn.getInputStream())));
	
			String output,json="";
			while ((output = br.readLine()) != null) {
				json+= output;
			}
	
			conn.disconnect();
		}
	%>
	
<body>
	<form action="webapi/usuario" method="post">


		Nome: <input name="nome" /><br> 
		Email: <input name="email" /><br>
		Senha: <input name="senha" /><br> 
		Papel: <input name="papel" /><br>

		<input type="submit" value="enviar" name="enviar"/>
	</form>
</body>
	

</html>