<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="org.apache.commons.fileupload.FileItemFactory" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import="org.apache.commons.fileupload.FileItem" %>
<%@ page import="java.io.File" %>
<%@ page import="org.apache.commons.fileupload.FileUploadException" %>
<%@ page import="java.util.List" %>
<%@ page import="web_src.UserImageControl" %>
<%@ page import="mapping.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Image is Uploading</title>
</head>
<body>
<%
    FileItem image = null;

    if(!ServletFileUpload.isMultipartContent(request)){
        out.println("Nothing to upload!!! Go Back and try again");
    }else{
        FileItemFactory itemfactory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(itemfactory);
        try{
            List<FileItem> items = upload.parseRequest(request);
            for(FileItem item:items){
                String contentType = item.getContentType();
                if(!contentType.equals("image/png")){
                    out.println("only png format image files supported");
                }else {
                    File file = new File("D:\\9. IntelliJ IDEA Projects\\website1\\web\\webImages\\UserImage\\"+ item.getName()+"");
                    item.write(file);
                    image = item;
                    break;
                }
            }
        }catch(FileUploadException e){
            out.println("upload fail");
        }catch(Exception ex){
            out.println("can't save");
        }
    }

    UserImageControl userImageControl = new UserImageControl();
    User user = (User) session.getAttribute("user");
    User addAvatarUser = userImageControl.savePhoto(user.getId(), image.getName());

    session.removeAttribute("user");
    session.setAttribute("user", addAvatarUser);
    response.sendRedirect("myPage.jsp");
%>
</body>
</html>
