<%@ page import="web_src.LogRegModel" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete</title>
</head>
<body>
<%
    LogRegModel logRegModel = new LogRegModel();

    long id = Long.parseLong(request.getParameter("id"));
    logRegModel.deleteUser(id);
    request.getRequestDispatcher("index.jsp?account=deleted").forward(request, response);
%>
</body>
</html>
