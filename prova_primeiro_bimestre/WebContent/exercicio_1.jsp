<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>

<%
	// obtendo os dados da sessão //
	// temos que fazer o cast para String, pois na sessão pode estar armazenado
	// qualquer coisa e para isso é necessário que o getAttribute retorne um Object
    String nome = (String) request.getSession().getAttribute("user-name"); // nome
    String email = (String) request.getSession().getAttribute("user-email"); // emaiil
    
    // imprindo o resultado
    out.println( nome );
    out.println( email );
%>


</body>
</html>