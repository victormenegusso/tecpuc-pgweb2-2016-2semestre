<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Pergunta 1</title>
</head>
<body>

<form action="">
	<label>Que ano surgio o Java?</label><br/>
	
	<input type="radio" name="pergunta" value="a"/>A - 1995 <br/>
	<input type="radio" name="pergunta" value="b"/>B - 1990 <br/>
	<input type="radio" name="pergunta" value="c"/>C - 2000 <br/>
	<input type="radio" name="pergunta" value="d"/>D - 2010 <br/>
	<input type="radio" name="pergunta" value="e"/>E - 1890 <br/>
	
	<input type="submit" value="Responder" name="btn"/><br/>
</form>

<%
	if(request.getParameter("btn")!=null)
	{
		String resposta = request.getParameter("pergunta");
		request.getSession().setAttribute("p2", resposta);
	
		response.sendRedirect("qp3.jsp");
	}
%>

</body>
</html>