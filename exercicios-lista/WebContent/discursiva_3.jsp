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
<h3>heitor</h3>
<h3>samara</h3>
<h3>victor</h3>
<%
	ArrayList<String> lista = new ArrayList<String>();
	lista.add("victor");
	lista.add("heitor");
	lista.add("samara");
	
	out.print( lista.get(1) );
	out.print("<br/>");
	out.print( lista.get(2) );
	out.print("<br/>");
	out.print( lista.get(0) );
%>
</body>
</html>