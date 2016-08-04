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
<h3>3</h3>
<h3>Metallica</h3>
<h3>Black Label Society</h3>
<h3>Kiss</h3>
<%
	ArrayList<String> lista = new ArrayList<String>();
	lista.add("Metallica");
	lista.add("Black Label Society");
	lista.add("Kiss");
		
	out.print( lista.size() );
	out.print("<br/>");
	for(int i = 0; i < lista.size(); i++)
	{
		out.print( lista.get(i) );
		out.print("<br/>");
	}	
%>
</body>
</html>