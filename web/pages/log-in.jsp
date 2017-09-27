<%@ page import="mapping.User" %>
<%@ page import="web_src.LogRegModel" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Log-in</title>
</head>
<body>
<%
    LogRegModel logRegModel = new LogRegModel();

    String username = request.getParameter("username");
    String password = request.getParameter("password");

    User user = logRegModel.getUser(username, password);

    if(user == null){
        request.setAttribute("user", "existence");
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }else {
        session.setAttribute("user", user);
        session.setAttribute("username", username);
        session.setAttribute("password", password);

        response.sendRedirect("myPage.jsp");
    }
%>
</body>
</html>