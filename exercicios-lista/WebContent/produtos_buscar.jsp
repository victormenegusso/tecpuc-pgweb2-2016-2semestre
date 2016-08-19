<%@page import="tecpuc.lista.Produto"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Buscar Produto</title>
</head>
<body>
<H1>Buscar Produto</H1>	
<form>
	Nome Produto: <input name="nome" /><br/>
	<input value="buscar" name="btn" type="submit"/>
</form>

<a href="produtos_menu.jsp"> voltar menu </a><br/>

</body>
</html>
<%
	if(request.getParameter("btn") != null)
	{
		String nome = request.getParameter("nome");
		ArrayList<Produto> lista = (ArrayList<Produto>)request.getSession().getAttribute("produtos-lista");
		
		// verifica se não existe a lista
		if(lista == null)
		{
			out.print("nao encontrado");
		}
		else
		{
			Produto produtoEncontrado = null;
			for(Produto produto : lista)
			{
				if( produto.getNome().equals(nome) )
				{
					produtoEncontrado = produto;
				}
			}
			
			if(produtoEncontrado != null)
			{
			
				out.print(produtoEncontrado.getNome());
				out.print("<br/>");
				out.print(produtoEncontrado.getDescricao());
			}
			else
				out.print("nao encontrado");
		}
	}
%>