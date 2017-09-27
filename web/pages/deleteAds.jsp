<%@ page import="web_src.UserAds" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>delete ads</title>
</head>
<body>
<%=request.getPathInfo()%>
<%
    UserAds userAds = new UserAds();

    long id = Long.parseLong(request.getParameter("id"));
    String adsType = request.getParameter("type");

    if(userAds.deleteAds(id, adsType)){
        response.sendRedirect("myPage.jsp");
    }else {
        out.print("You failed by deleting the ads");
    }
%>
</body>
</html>
