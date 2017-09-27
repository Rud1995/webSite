<%@ page import="mapping.User" %>
<%@ page import="mapping.Car" %>
<%@ page import="web_src.UserAds" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.apache.commons.fileupload.FileItemFactory" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="org.apache.commons.fileupload.FileItem" %>
<%@ page import="java.io.File" %>
<%@ page import="org.apache.commons.fileupload.FileUploadException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    UserAds userAds = new UserAds();
    request.setCharacterEncoding("utf-8");

    List<String> formData = new ArrayList<>();
    String nameOfImageForDB = null;

    FileItemFactory itemfactory = new DiskFileItemFactory();
    ServletFileUpload upload = new ServletFileUpload(itemfactory);
    try{
        List<FileItem> items = upload.parseRequest(request);
        for(FileItem item:items) {
            if (item.isFormField()) {
                formData.add(item.getString());
            } else if(item.getFieldName().equals("textarea")){
                formData.add(item.getString());
            }else {
                String contentType = item.getContentType();
                if (!contentType.equals("image/png")) {
                    out.println("only png format image files supported");
                } else {
                    int i = 0;
                    String name = item.getName();
                    File file = new File("D:\\9. IntelliJ IDEA Projects\\website1\\web\\webImages\\car\\" + name + "");
                    while (file.exists()) {
                        name = item.getName().replace(".png", i + ".png");
                        file = new File("D:\\9. IntelliJ IDEA Projects\\website1\\web\\webImages\\car\\" + name + "");
                        i++;
                    }
                    item.write(file);
                    nameOfImageForDB = name;
                }
            }
        }
    }catch(FileUploadException e){
        e.getCause();
        e.printStackTrace();
    }

    User user = (User) session.getAttribute("user");
    Car car = new Car(formData.get(0), formData.get(1), formData.get(2), Integer.parseInt(formData.get(3)),
            Integer.parseInt(formData.get(4)), formData.get(5), formData.get(6),
            formData.get(7), Integer.parseInt(formData.get(8)), formData.get(9), formData.get(10), nameOfImageForDB, user);

    //Update an advertisement
    if(formData.get(11).equals("Update")){
        Long id = (Long) session.getAttribute("carId");
        car.setId(id);
        Object object = car;
        userAds.updateAds(object);
        session.removeAttribute("carId");
        File file = new File("D:\\9. IntelliJ IDEA Projects\\website1\\web\\webImages\\car\\"+formData.get(12)+"");
        if(file.exists()){
            file.delete();
        }
%>
<script>
    (function () {
        window.history.back();
        alert("Refresh page to see changes");
    })()
</script>
<%
    }

    //Add an advertisement
    if(formData.get(11).equals("Add")){
        if (userAds.addAds(car)) {
            response.sendRedirect("../myPage.jsp");
        } else {
            out.print("process failed");
        }
    }
%>
</body>
</html>
