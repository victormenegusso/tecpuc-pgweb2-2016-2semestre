<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>

<%
	String tamfonte;
	if(request.getSession().getAttribute("tamfonte") != null)
		tamfonte = (String)request.getSession().getAttribute("tamfonte");
	else
		tamfonte = "12";
%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Preferencias</title>
<style type="text/css">
	.divTexto
	{
		font-size: <%= tamfonte%>px;	
	}
</style>
</head>

<body>




<div class="divTexto">
	Jon Snow é o filho bastardo de Eddard Stark com uma mãe cuja identidade não é conhecida. Jon foi criado por seu pai ao lado dos seus meio-irmãos, mas juntou-se à Patrulha da Noite quando atingiu a idade adulta. É constantemente acompanhado por seu lobo albino Fantasma.
</div>
<%
	if(request.getParameter("btn")!=null)
	{
		tamfonte = request.getParameter("tamfonte");
		request.getSession().setAttribute("tamfonte", tamfonte);
	}
%>

</body>
</html>