<%@ page import="web_src.UserAds" %>
<%@ page import="java.util.List" %>
<%@ page import="mapping.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="headerTemplate.jsp"%>
<html>
<head>
    <meta http-equiv="Cache-Control" content="no-store" />
    <title>My page</title>
    <link href="../css/userPage.css" rel="stylesheet" type="text/css">
    <script src="../js/jquery-3.2.1.min.js"></script>
    <script src="../js/animationOfUserPage.js"></script>
    <style>
        .adsImg{
            border: 0;
        }
        .adsImg img {
            width: 100px;
            height: 100px;
        }
    </style>
</head>
<%
    User u = (User) session.getAttribute("user");
    if(u == null){
        response.sendRedirect("index.jsp");
    }else{
        session.removeAttribute("update");
%>
<body>
<div id="userPage">
    <div id="personalInfo">
        <fieldset style="border: 2px dotted #EDDAF1">
            <legend>Personal info</legend>
            <div id="avatar">
                <%if(u.getAvatar() != null){%>
                <img src="../webImages/UserImage/<%=u.getAvatar()%>" width="100px" height="100px" style="border-radius: 50%">
                <div style="position: absolute; left: 120px; bottom: 137px">
                    <a href="deleteUserAvatar.jsp"><img src="../detailesImages/delete.png"></a>
                </div>
                <%}else {%>
                <form action="saveUserAvatar.jsp" method="post" enctype="multipart/form-data">
                    <input type="file" name="file" id="selectedFile" style="display: none;" />
                    <input type="button" value="Browse..." onclick="document.getElementById('selectedFile').click();" style="margin: 15px 0 10px 15px; border: 1px solid black; height: 25px; background-color: white"/><br>
                    <input type="submit" name="avatarSubmit" value="Save" style="margin-left: 25px; border: 1px solid black; height: 25px; background-color: white">
                </form>
                <%}%>
            </div>
            <div id="infoAboutUser">
                <table border="1">
                    <tr><th colspan="4">Mail: <%=u.getEmail()%></th></tr>
                    <tr><td><%=u.getSurname()%></td><td><%=u.getName()%></td><td colspan="2"><%=u.getAge()%>-Years old</td></tr>
                    <tr><td colspan="2">Number-<%=u.getPhone()%></td><td colspan="2">from-<%=u.getAddress()%></td></tr>
                </table>
            </div>
            <div id="logOut" class="sameDesign"><p><a href="log_out.jsp?logout=true" style="color: black; text-decoration: none">Log out</a></p></div>
            <div id="addAds" class="sameDesign"><p><a href="chooseCategory.jsp" style="color: black; text-decoration: none">add ads</a></p></div>
        </fieldset>
        <div id="settings" onclick="rotate(this)"><img src="../detailesImages/settings.png" alt="image" width="20px" height="20px"></div>
        <div id="updateInfoAboutUser">
            <form action="updateUserInfo.jsp" method="get">
                <h3>Name:</h3><input type="text" name="nameUpdate" placeholder="Name" value="<%=u.getName()%>" required><br>
                <h3>surname:</h3><input type="text" name="surnameUpdate" placeholder="Surname" value="<%=u.getSurname()%>" required><br>
                <h3>age:</h3><input type="number" name="ageUpdate" placeholder="Age" value="<%=u.getAge()%>" required><br>
                <h3>address:</h3><input type="text" name="addressUpdate" placeholder="Address" value="<%=u.getAddress()%>" required><br>
                <h3>phone:</h3><input type="number" name="phoneUpdate" placeholder="Phone" value="<%=u.getPhone()%>" required><br>
                <h3>Email:</h3><input type="email" name="emailUpdate" placeholder="Email" value="<%=u.getEmail()%>" required><br>
                <h3>username:</h3><input type="text" name="usernameUpdate" placeholder="Username" value="<%=u.getUsername()%>" required><br>
                <div style="float: left; width: 70px; height: 30px; margin: 20px 0 0 30px;">
                    <input type="submit" name="update" value="Save" style="width: 70px; height: 30px;"></div>
                <div style="background-color: white; width: 110px; height: 30px; margin: 15px 0 0 130px; padding: 12px 0 0 10px; border: 1px solid #B1DCA8; border-radius: 20px;">
                    <a href="deleteAccount.jsp?id=<%=u.getId()%>" style="text-align: center; color: #000; font-size: 16px; font-weight: 200; text-decoration: none;">Delete account</a></div>
            </form>
        </div>
    </div>
    <div id="userAds">
        <fieldset style="border: 2px dotted #EDDAF1; padding: 0">
            <legend>My ads</legend>
            <%
                UserAds userAds = new UserAds();
                User user = (User) session.getAttribute("user");
                List<Object[]> list = userAds.readAds(user.getId());
                session.setAttribute("listOfAds", list);

                if(list.size() == 0){
                    out.print("<div id='noAds' style='margin: 0 auto;'><h2>No ads</h2>");
                }

                for(int i = 0; i < list.size(); i++){
                    switch(i){
                        case 0:
                            for(int j = 0; j < list.get(i).length; j++){
                                House house = (House) list.get(i)[j];
            %>
            <div class="adsWrapper">
                <div class="adsImg"><img src="../webImages/house/<%if(house.getPhoto() == null){out.print("noImage.png");}else{out.print(house.getPhoto());}%>" alt="image"></div>
                <div class="infoAboutAds">
                    <table>
                        <tr><th><a href="reviewAlterUserAds.jsp?item=0&obj=<%=j%>"><%=house.getDescription()%></a></th></tr>
                        <tr><td><%=house.getPrice()%>$</td></tr>
                    </table>
                </div>
                <a href="deleteAds.jsp?id=<%=house.getId()%>&type=house"><img src="../detailesImages/delete.png"></a>
            </div>
            <%
                    }
                    break;
                case 1:
                    for(int j = 0; j < list.get(i).length; j++){
                        Tablet tablet = (Tablet) list.get(i)[j];
            %>
            <div class="adsWrapper">
                <div class="adsImg"><img src="../webImages/tablet/<%if(tablet.getPhoto() == null){out.print("noImage.png");}else{out.print(tablet.getPhoto());}%>" alt="image"></div>
                <div class="infoAboutAds">
                    <table>
                        <tr><th><a href="reviewAlterUserAds.jsp?item=1&obj=<%=j%>"><%=tablet.getDescription()%></a></th></tr>
                        <tr><td><%=tablet.getPrice()%>$</td></tr>
                    </table>
                </div>
                <a href="deleteAds.jsp?id=<%=tablet.getId()%>&type=tablet"><img src="../detailesImages/delete.png"></a>
            </div>
            <%
                    }
                    break;
                case 2:
                    for(int j = 0; j < list.get(i).length; j++){
                        Apartment apartment = (Apartment) list.get(i)[j];
            %>
            <div class="adsWrapper">
                <div class="adsImg"><img src="../webImages/apartment/<%if(apartment.getPhoto() == null){out.print("noImage.png");}else{out.print(apartment.getPhoto());}%>" alt="image"></div>
                <div class="infoAboutAds">
                    <table>
                        <tr><th><a href="reviewAlterUserAds.jsp?item=2&obj=<%=j%>"><%=apartment.getDescription()%></a></th></tr>
                        <tr><td><%=apartment.getPrice()%>$</td></tr>
                    </table>
                </div>
                <a href="deleteAds.jsp?id=<%=apartment.getId()%>&type=apartment"><img src="../detailesImages/delete.png"></a>
            </div>
            <%
                    }
                    break;
                case 3:
                    for(int j = 0; j < list.get(i).length; j++){
                        Phone phone = (Phone)  list.get(i)[j];
            %>
            <div class="adsWrapper">
                <div class="adsImg"><img src="../webImages/phone/<%if(phone.getPhoto() == null){out.print("noImage.png");}else{out.print(phone.getPhoto());}%>" alt="image"></div>
                <div class="infoAboutAds">
                    <table>
                        <tr><th><a href="reviewAlterUserAds.jsp?item=3&obj=<%=j%>"><%=phone.getDescription()%></a></th></tr>
                        <tr><td><%=phone.getPrice()%>$</td></tr>
                    </table>
                </div>
                <a href="deleteAds.jsp?id=<%=phone.getId()%>&type=phone"><img src="../detailesImages/delete.png"></a>
            </div>
            <%
                    }
                    break;
                case 4:
                    for(int j = 0; j < list.get(i).length; j++){
                        Motorcycle motorcycle = (Motorcycle) list.get(i)[j];
            %>
            <div class="adsWrapper">
                <div class="adsImg"><img src="../webImages/motorcycle/<%if(motorcycle.getPhoto() == null){out.print("noImage.png");}else{out.print(motorcycle.getPhoto());}%>" alt="image"></div>
                <div class="infoAboutAds">
                    <table>
                        <tr><th><a href="reviewAlterUserAds.jsp?item=4&obj=<%=j%>"><%=motorcycle.getDescription()%></a></th></tr>
                        <tr><td><%=motorcycle.getPrice()%>$</td></tr>
                    </table>
                </div>
                <a href="deleteAds.jsp?id=<%=motorcycle.getId()%>&type=motorcycle"><img src="../detailesImages/delete.png"></a>
            </div>
            <%
                    }
                    break;
                case 5:
                    for(int j = 0; j < list.get(i).length; j++){
                        Notebook notebook = (Notebook) list.get(i)[j];
            %>
            <div class="adsWrapper">
                <div class="adsImg"><img src="../webImages/notebook/<%if(notebook.getPhoto() == null){out.print("noImage.png");}else{out.print(notebook.getPhoto());}%>" alt="image"></div>
                <div class="infoAboutAds">
                    <table>
                        <tr><th><a href="reviewAlterUserAds.jsp?item=5&obj=<%=j%>"><%=notebook.getDescription()%></a></th></tr>
                        <tr><td><%=notebook.getPrice()%>$</td></tr>
                    </table>
                </div>
                <a href="deleteAds.jsp?id=<%=notebook.getId()%>&type=notebook"><img src="../detailesImages/delete.png"></a>
            </div>
            <%
                    }
                    break;
                case 6:
                    for(int j = 0; j < list.get(i).length; j++){
                        Car car = (Car) list.get(i)[j];
            %>
            <div class="adsWrapper">
                <div class="adsImg"><img src="../webImages/car/<%if(car.getPhoto() == null){out.print("noImage.png");}else{out.print(car.getPhoto());}%>" alt="image"></div>
                <div class="infoAboutAds">
                    <table>
                        <tr><th><a href="reviewAlterUserAds.jsp?item=6&obj=<%=j%>"><%=car.getDescription()%></a></th></tr>
                        <tr><td><%=car.getPrice()%>$</td></tr>
                    </table>
                </div>
                <a href="deleteAds.jsp?id=<%=car.getId()%>&type=car"><img src="../detailesImages/delete.png"></a>
            </div>
            <%
                            }
                            break;
                    }
                }
            %>
        </fieldset>
    </div>
</div>
<%
    }
%>
</body>
</html>
