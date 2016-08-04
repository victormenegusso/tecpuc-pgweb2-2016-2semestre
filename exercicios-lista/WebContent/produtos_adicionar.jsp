<%@page import="tecpuc.lista.Produto"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Adicionar Produto</title>
</head>
<body>
<h1>Adicionar Produto</h1>
<form>
	Nome: <input name="nome" /><br/>
	Descricao: <textarea name="descricao"></textarea><br/>
	<input value="adicionar" name="btn" type="submit"/>
</form>

<a href="produtos_menu.jsp"> voltar menu </a>

</body>
</html>
<%
	if(request.getParameter("btn") != null)
	{
		Produto produto = new Produto();
		produto.setNome( request.getParameter("nome") );
		produto.setDescricao( request.getParameter("descricao") );
		ArrayList<Produto> lista = (ArrayList<Produto>)request.getSession().getAttribute("produtos-lista");
		
		// verifica se não existe a lista
		// caso não exista ela é criada
		// e adicionada a sessão
		if(lista == null)
		{
			lista = new ArrayList<Produto>();
			request.getSession().setAttribute("produtos-lista", lista);
		}
		
		lista.add( produto );
	}
%>