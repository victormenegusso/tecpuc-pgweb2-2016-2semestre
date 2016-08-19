<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Pergunta 1</title>
</head>
<body>

<form action="">
	<label>Quais destas opções é o nome de um compilador Java?</label><br/>
	
	<input type="radio" name="pergunta" value="a"/>A - GCC <br/>
	<input type="radio" name="pergunta" value="b"/>B - Javac <br/>
	<input type="radio" name="pergunta" value="c"/>C - mingw <br/>
	<input type="radio" name="pergunta" value="d"/>D - apache tomcat<br/>
	<input type="radio" name="pergunta" value="e"/>E - qt<br/>
	
	<input type="submit" value="Responder" name="btn"/><br/>
</form>

<%
	if(request.getParameter("btn")!=null)
	{
		String resposta = request.getParameter("pergunta");
		request.getSession().setAttribute("p3", resposta);
	
		response.sendRedirect("qpRespostas.jsp");
	}
%>

</body>
</html>