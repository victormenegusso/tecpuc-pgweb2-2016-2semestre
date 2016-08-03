<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Pergunta 1</title>
</head>
<body>

<label>Suas respostas:</label><br/>

<label>
	Pergunta 1: <%= request.getSession().getAttribute("p1")%>
	<% 
		if(request.getSession().getAttribute("p1").equals("e"))
			out.print("certo");
		else
			out.print("errado");
	%>
</label><br/>

<label>
	Pergunta 2: <%= request.getSession().getAttribute("p2")%>
	<% 
		if(request.getSession().getAttribute("p2").equals("a"))
			out.print("certo");
		else
			out.print("errado");
	%>
</label><br/>


<label>
	Pergunta 3: <%= request.getSession().getAttribute("p3")%>
	<% 
		if(request.getSession().getAttribute("p3").equals("b"))
			out.print("certo");
		else
			out.print("errado");
	%>
</label><br/>

</body>
</html>