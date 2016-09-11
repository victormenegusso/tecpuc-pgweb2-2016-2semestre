<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>
	<form>
		Formação: 
		<input name="formacao" /><br/>
		
		Descrição: 
		<input name="descricao"/><br/>
		
		<input type="submit" value="proximo" name="btn" />
	</form>
</body>
</html>

<%
	// valida o se foi enviado o POST //
	if (request.getParameter("btn") != null) 
	{
		// obtem a formação //
		String formacao = request.getParameter("formacao");
		
		// adiciona a formação em sessão com o id 'f'
		request.getSession().setAttribute("f", formacao);

		// obtem a descrição //
		String descricao = request.getParameter("descricao");
		
		// adiciona a descrição em sessão com o id 'd'
		request.getSession().setAttribute("d", descricao);

		// vai para proxima página //
		response.sendRedirect("candidato_confirmacao.jsp");
	}
%>