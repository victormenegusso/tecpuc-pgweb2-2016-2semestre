<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<h1>problema: 'The local variable lista may not have been initialized'</h1>
<%
	/*
	ArrayList<String> lista;
	lista.add("a");
	lista.add("b");
	lista.add("c");
	*/
%>

<%
	// a lista não tinha sido instanciada
	ArrayList<String> lista = new ArrayList<String>();
	lista.add("a");
	lista.add("b");
	lista.add("c");
%>

</body>
</html>