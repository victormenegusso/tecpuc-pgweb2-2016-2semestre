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
		URL url = new URL("http://localhost:8080/aula-rest-servidor/webapi/usuario");
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		if (conn.getResponseCode() != 200) {
			out.print("deu erro... HTTP error code : " + conn.getResponseCode());
		}

		BufferedReader br = new BufferedReader(new InputStreamReader((conn.getInputStream())));

		String output,json="";
		while ((output = br.readLine()) != null) {
			json+= output;
		}

		conn.disconnect();
	%>
	
<body>
	<fieldset>
		<legend>Listagem de usuarios</legend>
		<table id="grid" border="1" >
			<tr>
				<th>ID</th>
				<th>Nome</th>
				<th>email</th>
				<th>papel</th>
			</tr>
			
<%
	JsonParser parser = new JsonParser();
	JsonElement jsonElement =  parser.parse(json);
	if(jsonElement.isJsonArray())
	{
		for(int i = 0; i < jsonElement.getAsJsonArray().size(); i++)
		{
			JsonElement jsonElement2 = jsonElement.getAsJsonArray().get(i);
%>
		<tr>
			<td><%=jsonElement2.getAsJsonObject().get("id").getAsString()%></td>
			<td><%=jsonElement2.getAsJsonObject().get("nome").getAsString()%></td>
			<td><%=jsonElement2.getAsJsonObject().get("email").getAsString()%></td>
			<td><%=jsonElement2.getAsJsonObject().get("papel").getAsString()%></td>
		</tr>
<%	
		}
	}
	else
	{	
%>
		<tr>
			<td><%=jsonElement.getAsJsonObject().get("id").getAsString()%></td>
			<td><%=jsonElement.getAsJsonObject().get("nome").getAsString()%></td>
			<td><%=jsonElement.getAsJsonObject().get("email").getAsString()%></td>
			<td><%=jsonElement.getAsJsonObject().get("papel").getAsString()%></td>
		</tr>
<%
	}

%>
			
		</table>
	</fieldset>
</body>
	

</html>