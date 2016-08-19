<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Pergunta 1</title>
</head>
<body>

<form>
	<label>Quem descobriu o Brasil?</label><br/>
	
	<input type="radio" name="pergunta" value="a"/>A - Chuck Norris <br/>
	<input type="radio" name="pergunta" value="b"/>B - Peppa <br/>
	<input type="radio" name="pergunta" value="c"/>C - Stalone <br/>
	<input type="radio" name="pergunta" value="d"/>D - Shuazneguer <br/>
	<input type="radio" name="pergunta" value="e"/>E - Pedro Alvares Cabral<br/>
	
	<input type="submit" value="Responder" name="btn"/><br/>
</form>

<%
	if(request.getParameter("btn")!=null)
	{
		String resposta = request.getParameter("pergunta");
		request.getSession().setAttribute("p1", resposta);
	
		response.sendRedirect("qp2.jsp");
	}
%>

</body>
</html>