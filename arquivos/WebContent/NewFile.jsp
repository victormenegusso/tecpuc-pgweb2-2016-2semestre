<%@page import="java.sql.Blob"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="" method="post" enctype="application/x-www-form-urlencoded">
	<input name="atr1" value="valor1"/>
	<input name="atr2" value="valor2"/>
	<input name="atr3" value="valor3"/>
	<input name="btn" value="application/x-www-form-urlencoded" type="submit"/>
</form>

<form action="" method="post" enctype="multipart/form-data">
	<input name="atr1" value="valor1"/>
	<input name="atr2" value="valor2"/>
	<input name="atr3" value="valor3"/>
	<input name="btn" value="application/x-www-form-urlencoded" type="submit"/>
</form>

<%=  request.getAuthType()%><br/>
<%=  request.getCharacterEncoding()%><br/>
<%=  request.getContentLength()%><br/>
<%=  request.getContentLengthLong()%><br/>
<%=  request.getContentType()%><br/>
<%=  request.getContextPath()%><br/>
<%=  request.getLocalAddr()%><br/>
<%=  request.getLocalName()%><br/>
<%=  request.getLocalPort()%><br/>
<%=  request.getMethod()%><br/>
<%=  request.getPathInfo()%><br/>
<%=  request.getPathTranslated()%><br/>
<%=  request.getProtocol()%><br/>
<%=  request.getQueryString()%><br/>
<%=  request.getRemoteAddr()%><br/>
<%=  request.getRemoteHost()%><br/>
<%=  request.getRemotePort()%><br/>
<%=  request.getRemoteUser()%><br/>
<%=  request.getRequestedSessionId()%><br/>
<%=  request.getRequestURI()%><br/>
<%=  request.getScheme()%><br/>
<%=  request.getHeaderNames()%><br/>
------------------------------------------------------------<br/>
<%
	Enumeration headerNames = request.getHeaderNames();
	while(headerNames.hasMoreElements()) {
  		String headerName = (String)headerNames.nextElement();
  		out.println("Header Name - " + headerName + ", Value - " + request.getHeader(headerName)+"<br/>");
	}
%>
------------------------------------------------------------<br/>
<%

	BufferedReader rd = request.getReader();
String line = "";
while((line = rd.readLine()) != null){
	out.print(line);
} 
%>
</body>
</html>