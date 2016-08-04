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
<h2>Resposta: samara</h2>
<%
	ArrayList<String> lista = new ArrayList<String>();
	lista.add("victor");
	lista.add("heitor");
	lista.add("samara");
	
	out.print( lista.get(2) );
%>
</body>
</html>