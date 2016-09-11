<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>
<%
 
	// instanciando a lista //
	ArrayList<String> lista = new ArrayList<String>();
	
	// adicionando os textos //
	lista.add("texto 1");
	lista.add("texto 2");
	lista.add("texto 3");
	lista.add("texto 4");
	
	// percorrendo a lista //
	for(int i = 0; i < lista.size(); i++)
	{
		out.print( lista.get(i) );
		out.print("<br/>");
	}	

	// removendo o 3º item da lista
	// como a lista começa na posição 0
	// o 3º é a posição 2
	lista.remove(2);
	
	// percorrendo a lista //
	for(int i = 0; i < lista.size(); i++)
	{
		out.print( lista.get(i) );
		out.print("<br/>");
	}	
	

	
%>

</body>
</html>