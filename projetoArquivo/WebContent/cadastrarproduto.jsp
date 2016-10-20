<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<form action="cadastrarproduto" method="post" enctype="multipart/form-data">
	Nome: <input name="nome"/><br/>
	Quantidade: <input name="quantidade"/><br/>
	Foto: <input name="arquivoUpload" type="file"/><br/>
	<input type="submit" name="btn" value="enviar"/>
</form>
</body>
</html>