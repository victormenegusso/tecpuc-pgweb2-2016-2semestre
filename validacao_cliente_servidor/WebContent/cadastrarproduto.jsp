<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>

<script type="text/javascript">
	function validar() {
			formcadastro.submit();
		
	}
</script>

</head>
<body>
	<form name="formcadastro" action="cadastrarproduto" >
		
		<label>Nome:</label>
		<input name="nome" /><br/> 
		
		<label>Quantidade:</label> 
		<input name="quantidade" /><br/>
		
		<input type="button" name="btn" value="enviar" onclick="validar()"/>
	</form>
</body>
<c:if test="${not empty erroservidor}">
	${erroservidor}
</c:if>
</html>