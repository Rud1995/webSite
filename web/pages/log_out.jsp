<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Log out</title>
</head>
<body>
<%
    if(request.getParameter("logout") != null){
        session.invalidate();
        response.sendRedirect("myPage.jsp");
    }
%>
</body>
</html>
