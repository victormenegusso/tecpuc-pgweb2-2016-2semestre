<%@page import="aula.dao.FuncionarioDAO"%>
<%@page import="aula.entidade.Funcionario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
</head>
<body>

<form action="" method="post">
	CPF: <input name="cpf"/><br/>
	Nome: <input name="nome"/><br/>
	Setor: <input name="setor"/><br/>
	Cargo: <input name="cargo"/><br/>
	Salario: <input name="salario"/><br/>
	
	<input type="submit" name="btn" value="inserir"/>
</form>
<a href="index.html">menu</a>
</body>
</html>

<%
	if(request.getParameter("btn")!=null)
	{
		// dados a inserir //
     	Funcionario func = new Funcionario();
     	func.setCpf( request.getParameter("cpf") );
     	func.setNome( request.getParameter("nome") );
     	func.setSetor( request.getParameter("setor") );
     	func.setCargo( request.getParameter("cargo") );
     	func.setSalario( Double.parseDouble( request.getParameter("salario") ) );
	 
	 	// criando o objeto dao //
	 	FuncionarioDAO dao = new FuncionarioDAO();
	 
	 	// executando o método de inserir //
	 	dao.inserir( func );
	 
%>
	<p>Funcionario:</p>
	<p><%=func.getNome() %></p>
	<p>inserido</p>
<%


	 }
%>