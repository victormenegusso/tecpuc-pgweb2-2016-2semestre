<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Preferencias</title>
</head>
<body>

<%
	String tamfonte = request.getSession().getAttribute("tamfonte") == null ? "12" : (String) request.getSession().getAttribute("tamfonte");

	if(request.getParameter("btn")!=null)
	{
		tamfonte = request.getParameter("tamfonte");
		request.getSession().setAttribute("tamfonte", tamfonte);
	}
%>

<form>
	<label>Qual Tamanho de fonte você prefere?</label><br/>
	
	<input type="text" name="tamfonte" value="<%= tamfonte %>"/>px<br/>
	<input type="submit" value="salvar" name="btn"/><br/>
</form>



</body>
</html>