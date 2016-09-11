<%@page import="com.google.gson.Gson"%>
<%@page import="trabalhando_json_com_gson.InformacaoCEP"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form >
		CEP : <input name="fcep"/><br/>
		<input type="submit" name="btn" value="buscar"/>
	</form>
	<%
		if( request.getParameter("btn") != null )
		{
			try {
				// --- configurando a conexao http 
				URL url = new URL("http://correiosapi.apphb.com/cep/"+ request.getParameter("fcep") );
				
				HttpURLConnection conn = (HttpURLConnection) url.openConnection();
				conn.setRequestMethod("GET");
				
				// --- lendo o retorno
				BufferedReader br = new BufferedReader(new InputStreamReader((conn.getInputStream())));
				
				String output, json = "";
				while ((output = br.readLine()) != null) {
					json += output;
				}
				
				// --- desconectar 
				conn.disconnect();
				
				// --- mostrar a resposta
				InformacaoCEP infoCEP;
				Gson gson = new Gson();
				infoCEP = gson.fromJson(json, InformacaoCEP.class);
				
				%>
					<h1>Estado</h1>
					<h1><%= infoCEP.getEstado() %></h1>
					<h1>Cidade</h1>
					<h1><%= infoCEP.getCidade() %></h1>
					<h1>Rua</h1>
					<h1><%= infoCEP.getLogradouro() %></h1>
				<%
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	%>

</body>
</html>