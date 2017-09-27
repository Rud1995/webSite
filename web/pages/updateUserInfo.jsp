<%@ page import="mapping.User" %>
<%@ page import="web_src.LogRegModel" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>update</title>
</head>
<body>
<%
    if(request.getParameter("update") != null) {
        LogRegModel logRegModel = new LogRegModel();

        String nameUpdate = request.getParameter("nameUpdate");
        String surnameUpdate = request.getParameter("surnameUpdate");
        byte ageUpdate = Byte.parseByte(request.getParameter("ageUpdate"));
        String addressUpdate = request.getParameter("addressUpdate");
        int phoneUpdate = Integer.parseInt(request.getParameter("phoneUpdate"));
        String emailUpdate = request.getParameter("emailUpdate");
        String usernameUpdate = request.getParameter("usernameUpdate");

        User userOld = (User) session.getAttribute("user");
        long id = userOld.getId();
        User user = logRegModel.updateUserInfo(id, nameUpdate, surnameUpdate, usernameUpdate, ageUpdate, addressUpdate,
                emailUpdate, phoneUpdate);
        session.removeAttribute("user");
        session.setAttribute("user", user);

%><script>
    (function (){
        window.history.back();
    })();
</script><%
    }
%>
</body>
</html>
