<%@ page import="java.io.File" %>
<%@ page import="web_src.UserImageControl" %>
<%@ page import="mapping.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Deleting user avatar</title>
</head>
<body>
<%
    User user = (User) session.getAttribute("user");

    File file = new File("D:\\9. IntelliJ IDEA Projects\\website1\\web\\webImages\\UserImage\\" + user.getAvatar() + "");
    if(file.delete()){
        System.out.println("image deleted");
    }else{
        System.out.println("image not deleted");
    }

    UserImageControl userImageControl = new UserImageControl();
    User delAvatarUser = userImageControl.deletePhoto(user.getId());

    session.removeAttribute("user");
    session.setAttribute("user", delAvatarUser);

    response.sendRedirect("myPage.jsp");
%>
</body>
</html>
