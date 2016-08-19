<%@page import="tecpuc.lista.Campeao"%>
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
<h1>Exibir apenas os nomes</h1>

<%
	/*
	ArrayList<Campeao> lista = new ArrayList<Campeao>();
	Campeao c;
	
	c = new Campeao();
	c.setNome("Ashe");
	c.setTipo("Atirador");
	lista.add( c );
	
	c = new Campeao();
	c.setNome("Viktor");
	c.setTipo("Mago");
	lista.add( c );
		
	out.print( lista.size() );
	out.print("<br/>");
	for(Campeao cmp : lista)
	{
		out.print( cmp );
		out.print("<br/>");
	}
	*/	
%>

<%
	ArrayList<Campeao> lista = new ArrayList<Campeao>();
	Campeao c;
	
	c = new Campeao();
	c.setNome("Ashe");
	c.setTipo("Atirador");
	lista.add( c );
	
	c = new Campeao();
	c.setNome("Viktor");
	c.setTipo("Mago");
	lista.add( c );
		
	out.print( lista.size() );
	out.print("<br/>");
	for(Campeao cmp : lista)
	{
		out.print( cmp.getNome() );
		out.print("<br/>");
	}	
%>


</body>
</html>