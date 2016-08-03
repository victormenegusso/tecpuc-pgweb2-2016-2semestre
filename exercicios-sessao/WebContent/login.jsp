<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
</head>
<body>

<%
	if(request.getSession().getAttribute("login")!=null)
	{
		response.sendRedirect("home.jsp");
	}
%>

<form>
	<label>LOGIN</label><br/>
	
	Login: <input type="text" name="login" value=""/><br/>
	Senha: <input type="text" name="senha" value=""/><br/>
	
	<input type="submit" value="logar" name="btn"/><br/>
</form>

<%
	if(request.getParameter("btn")!=null)
	{
		boolean logado=false;
		
		// obter conexão com o banco //
		String URL = "jdbc:mysql://localhost:3306/exesessao";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(URL,"root","root");
		
		// criação do comando //
		String sql = "select * from usuarios where login = ? and senha = ?";
		PreparedStatement cmd = con.prepareStatement(sql);
		cmd.setString(1, request.getParameter("login"));
		cmd.setString(2, request.getParameter("senha"));
		
		// execução do select 
		ResultSet rs = cmd.executeQuery();
		
		// percorrendo o select
		// dentro da tabela
		while(rs.next())
		{
			request.getSession().setAttribute("login", rs.getString("login"));
			request.getSession().setAttribute("nome", rs.getString("nome"));
			request.getSession().setAttribute("papel", rs.getString("papel"));
			logado = true;
		}
		
		// fechando conexao //
		con.close();
		
		if(logado)
		{
			response.sendRedirect("home.jsp");
		}
		else
		{
			%>
				alert('voce errou o login/senha')
			<%
		}
	}
%>

</body>
</html>