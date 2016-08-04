<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Teste</title>
</head>
<body>
<h1>O que será exibido ?</h1>
<h2>Resposta:</h2>
<h3>4</h3>
<h3>Skyrim</h3>
<h3>GTA V</h3>
<h3>Call of Duty</h3>
<h3>Lineage 2</h3>
<%
	ArrayList<String> lista = new ArrayList<String>();
	lista.add("Skyrim");
	lista.add("GTA V");
	lista.add("Call of Duty");
	lista.add("Lineage 2");
		
	out.print( lista.size() );
	out.print("<br/>");
	for(String str : lista)
	{
		out.print( str );
		out.print("<br/>");
	}	
%>
</body>
</html>