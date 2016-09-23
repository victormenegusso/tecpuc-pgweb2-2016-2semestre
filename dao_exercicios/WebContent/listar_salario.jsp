<%@page import="aula.dao.FuncionarioDAO"%>
<%@page import="aula.entidade.Funcionario"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
</head>
<body>
<form method="get">
	Salario: <input name="salario"/><br/>
	<input value="consultar" name="btn" type="submit"/>
</form>

<%
	if( request.getParameter("btn") != null )
	{
		Double salario = Double.parseDouble( request.getParameter("salario") );
		ArrayList<Funcionario> funcionarios;
	 	FuncionarioDAO dao = new FuncionarioDAO();
	 
	 	// obter os produtos //
	 	funcionarios = dao.listarSalariosMaior(salario);
	 
	 	// iniciar tabela //
%>
	<table border="1">
		<tr>
			<th>cpf</th>
			<th>nome</th>
			<th>setor</th>
			<th>cargo</th>
			<th>salario</th>
		</tr>
<% 
	 	// percorrer e exibir os produtos //
	 	for(Funcionario func : funcionarios)
	 	{
%>
		<tr>
			<td><%= func.getCpf() %></td>
			<td><%= func.getNome() %></td>
			<td><%= func.getSetor() %></td>
			<td><%= func.getCargo() %></td>
			<td><%= func.getSalario() %></td>
		</tr>
<%
	 	} // fecha for
	 
	 }// fecha if
	 
%>
 	</table>
</body>
</html>
<a href="index.html">menu</a>