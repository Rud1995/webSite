<%@ page import="web_src.SearchBrain" %>
<%@ page import="java.util.List" %>
<%@ page import="mapping.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="headerTemplate.jsp"%>
<html>
<head>
    <title>Ads Preview</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="../css/indexStyle.css" rel="stylesheet" type="text/css">
    <script src="../js/jquery-3.2.1.min.js"></script>
    <script src="../js/animationsOfLogReg.js"></script>
    <script src="../js/regValidator.js"></script>
</head>
<body>

<%
    int counter = 0;
    String search = request.getParameter("search");
    List<User> users;

    SearchBrain searchBrain = new SearchBrain();
    users = searchBrain.getUsers();
%>

<div id="wrapper" style="position:absolute; left: 315px; top: 50px; height: auto; max-height: 1500px; overflow: hidden; z-index: 1">
    <div id="scroller" style="position:relative; height: auto">
    <%
        for(User user: users){
            for(Apartment apartment: user.getApartments()){
                if(apartment.getTitle().equalsIgnoreCase(search) || apartment.getTitle().contains(search)){
                    counter++;
    %>
    <div class="indexAds">
        <div class="images">
            <img src="../webImages/apartment/<%
    if(apartment.getPhoto() != null){
        out.print(apartment.getPhoto());
    }else{
        out.print("noImage.png");
    }%>" alt="image" width="100px" height="100px"></div>
        <table>
            <tr><th><a href="reviewOfAllAds.jsp?type=allow&index=2&id=<%=apartment.getId()%>" title="review"><%=apartment.getTitle()%></a></th></tr>
            <tr><td><%=apartment.getPrice()%>$</td></tr>
        </table>
    </div>
    <%
            }
        }

        for(Car car: user.getCars()){
            if(car.getTitle().equalsIgnoreCase(search) || car.getTitle().contains(search)){
                counter++;
    %>
    <div class="indexAds">
        <div class="images">
            <img src="../webImages/apartment/<%
    if(car.getPhoto() != null){
        out.print(car.getPhoto());
    }else{
        out.print("noImage.png");
    }%>" alt="image" width="100px" height="100px"></div>
        <table>
            <tr><th><a href="reviewOfAllAds.jsp?type=allow&index=3&id=<%=car.getId()%>" title="review"><%=car.getTitle()%></a></th></tr>
            <tr><td><%=car.getPrice()%>$</td></tr>
        </table>
    </div>
    <%
            }
        }

        for(House house: user.getHouses()){
            if(house.getTitle().equalsIgnoreCase(search) || house.getTitle().contains(search)){
                counter++;
    %>
    <div class="indexAds">
        <div class="images">
            <img src="../webImages/apartment/<%
    if(house.getPhoto() != null){
        out.print(house.getPhoto());
    }else{
        out.print("noImage.png");
    }%>" alt="image" width="100px" height="100px"></div>
        <table>
            <tr><th><a href="reviewOfAllAds.jsp?type=allow&index=1&id=<%=house.getId()%>" title="review"><%=house.getTitle()%></a></th></tr>
            <tr><td><%=house.getPrice()%>$</td></tr>
        </table>
    </div>
    <%
            }
        }
        for(Motorcycle motorcycle: user.getMotorcycles()){
            if(motorcycle.getTitle().equalsIgnoreCase(search) || motorcycle.getTitle().contains(search)){
                counter++;
    %>
    <div class="indexAds">
        <div class="images">
            <img src="../webImages/apartment/<%
    if(motorcycle.getPhoto() != null){
        out.print(motorcycle.getPhoto());
    }else{
        out.print("noImage.png");
    }%>" alt="image" width="100px" height="100px"></div>
        <table>
            <tr><th><a href="reviewOfAllAds.jsp?type=allow&index=4&id=<%=motorcycle.getId()%>" title="review"><%=motorcycle.getTitle()%></a></th></tr>
            <tr><td><%=motorcycle.getPrice()%>$</td></tr>
        </table>
    </div>
    <%
            }
        }
        for(Notebook notebook: user.getNotebooks()){
            if(notebook.getTitle().equalsIgnoreCase(search) || notebook.getTitle().contains(search)){
                counter++;
    %>
    <div class="indexAds">
        <div class="images">
            <img src="../webImages/apartment/<%
    if(notebook.getPhoto() != null){
        out.print(notebook.getPhoto());
    }else{
        out.print("noImage.png");
    }%>" alt="image" width="100px" height="100px"></div>
        <table>
            <tr><th><a href="reviewOfAllAds.jsp?type=allow&index=5&id=<%=notebook.getId()%>" title="review"><%=notebook.getTitle()%></a></th></tr>
            <tr><td><%=notebook.getPrice()%>$</td></tr>
        </table>
    </div>
    <%
            }
        }
        for(Phone phone: user.getPhones()){
            if(phone.getTitle().equalsIgnoreCase(search) || phone.getTitle().contains(search)){
                counter++;
    %>
    <div class="indexAds">
        <div class="images">
            <img src="../webImages/apartment/<%
    if(phone.getPhoto() != null){
        out.print(phone.getPhoto());
    }else{
        out.print("noImage.png");
    }%>" alt="image" width="100px" height="100px"></div>
        <table>
            <tr><th><a href="reviewOfAllAds.jsp?type=allow&index=6&id=<%=phone.getId()%>" title="review"><%=phone.getTitle()%></a></th></tr>
            <tr><td><%=phone.getPrice()%>$</td></tr>
        </table>
    </div>
    <%
            }
        }
        for(Tablet tablet: user.getTablets()){
            if(tablet.getTitle().equalsIgnoreCase(search) || tablet.getTitle().contains(search)){
                counter++;
    %>
    <div class="indexAds">
        <div class="images">
            <img src="../webImages/apartment/<%
    if(tablet.getPhoto() != null){
        out.print(tablet.getPhoto());
    }else{
        out.print("noImage.png");
    }%>" alt="image" width="100px" height="100px"></div>
        <table>
            <tr><th><a href="reviewOfAllAds.jsp?type=allow&index=7&id=<%=tablet.getId()%>" title="review"><%=tablet.getTitle()%></a></th></tr>
            <tr><td><%=tablet.getPrice()%>$</td></tr>
        </table>
    </div>
    <%
                }
            }
        }
        %>
    </div>
            <%
        if(counter < 10){
    %>
<script>
    document.getElementById("wrapper").style.border = "0";
</script>
<%
}else {
%>

<div style="position: absolute; left: 335px; top: -5px; width: 50px">
    <i class="fa fa-angle-double-up" style="font-size:36px" onclick="scrollUp()"></i>
</div>
<div style="position: absolute; left: 325px; top: 1470px; width: 50px">
    <i class="fa fa-angle-double-down" style="font-size:36px" onclick="scrollDown();"></i>
</div>
<script>
    var height = <%=counter*150%>;
    function scrollDown() {
        if(height > 1500) {
            $(document).ready(function () {
                $("#scroller").animate({top: '-=1480px'}, 1500);
            });
            height -= 1500;
        }
    }

    function scrollUp() {
        if(height < 1500) {
            $(document).ready(function () {
                $("#scroller").animate({top: '+=1480px'}, 1500);
            });
            height += 1500;
        }
    }
</script>
<%
    }
%>
</div>
</body>
</html>
