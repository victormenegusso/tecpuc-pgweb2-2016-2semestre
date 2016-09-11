<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

</head>
<body>
<form>
		
	Nome: <input name="nome"/><br/>

	Cidade: <input name="cidade"/><br/>

	Email: <input name="email"/><br/>

	<input type="submit" value="proximo" name="btn"/><br/>
</form>
</body>
</html>

<%
	// valida o se foi enviado o POST //
	if( request.getParameter("btn") != null )
	{
		// obtem o nome //
		String nome = request.getParameter("nome");
		
		// adiciona o nome em sessão com o id 'n'
		request.getSession().setAttribute("n", nome);
		
		// obtem a cidade //
		String cidade = request.getParameter("cidade");
		
		// adiciona a cidade em sessão com o id 'c'
		request.getSession().setAttribute("c", cidade);
		
		// obtem o email //
		String email = request.getParameter("email");
		
		// adiciona o email em sessão com o id 'e'
		request.getSession().setAttribute("e", email);
		
		// vai para outra página //
		response.sendRedirect("candidato_dados_profissionais.jsp");

	}
%>