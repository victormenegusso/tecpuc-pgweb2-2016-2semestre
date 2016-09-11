<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>	
<form>
	nome do produto: 
	<input name="nome-produto" /><br/>
	
	<input value="remover" name="btn" type="submit"/>
</form>

</body>
</html>
<%
if(request.getParameter("btn") != null)
{
	String nomeProduto = request.getParameter("nome-produto");
	
	// pega a lista da sessão 
	ArrayList<String> lista = (ArrayList<String>)request.getSession().getAttribute("lista-compras");
	
	// verifica se não existe a lista
	if(lista == null)
	{
		out.print("nao encontrado");
	}
	else
	{
		// remove o produto da lista //
		if(lista.remove(nomeProduto))
		{
			out.print(nomeProduto+" removido");
		}
		else
		{
			out.print("nao encontrado");
		}
	}
}
%>
<br/>
<a href="lista_compras_menu.jsp"> Voltar prara o Menu </a>