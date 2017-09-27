<%@ page import="mapping.*" %>
<%@ page import="web_src.CategoryAds" %>
<%@ page import="web_src.SubcategoryAds" %>
<%@ page import="java.util.List" %>
<%@ page import="web_src.SearchBrain" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="headerTemplate.jsp"%>
<html>
<head>
    <title>Review Ads</title>
    <link href="../css/reviewStyle.css" rel="stylesheet" type="text/css">
    <link href="../css/userReview.css" rel="stylesheet" type="text/css">
    <script src="../js/jquery-3.2.1.min.js"></script>
    <script src="../js/animationsOfLogReg.js"></script>
    <script src="../js/regValidator.js"></script>
</head>
<body>
<%
    SubcategoryAds subcategoryAds = new SubcategoryAds();
    int index = Integer.parseInt(request.getParameter("index"));
    int i = 0;
    if(request.getParameter("ads") != null){
        Integer.parseInt(request.getParameter("ads"));
    }

    SearchBrain searchBrain = new SearchBrain();
    long id = 0;
    if(request.getParameter("id") != null){
        id = Long.parseLong(request.getParameter("id"));
    }

    List list;

    if(index == 1){
        House house;
        if(request.getParameter("type") != null){
            house = (House) searchBrain.getAds(new House(), id);
        }else {
            list = subcategoryAds.getAdsBySubcategory(new House(), request.getParameter("checkImage")
                    , request.getParameter("minPrice"), request.getParameter("maxPrice"), request.getParameter("location"));
            house = (House) list.get(i);
        }
%>
<div class="allDataReview">
    <div class="locationPrice">
        <div class="topAlign"><img src="../detailesImages/location.png" alt="location" width="25px" height="25px" style="float: left;">
            <h3><%=house.getLocation()%></h3></div>
        <div class="topAlign"><img src="../detailesImages/price.png" alt="location" width="25px" height="25px" style="float: left;">
            <h3><%=house.getPrice()%>$</h3></div>
    </div>
    <img src="../webImages/house/<%
    if(house.getPhoto() != null){
        out.print(house.getPhoto());
    }else{
        out.print("noImage.png");
    }%>" alt="image" width="300px" height="300px" style="position: relative; left: 25px;">
    <div class="dataInTable">
        <table>
            <tr><th>Title</th><td><%=house.getTitle()%></td></tr>
            <tr><th>Address</th><td><%=house.getAddress()%></td></tr>
            <tr><th>Construction Type</th><td><%=house.getCoustruction_type()%></td></tr>
            <tr><th>Rooms</th><td><%=house.getRooms()%></td></tr>
            <tr><th>Living Space</th><td><%=house.getLiving_space()%></td></tr>
        </table>
        <fieldset>
            <legend>Description</legend>
            <h4><%=house.getDescription()%></h4>
        </fieldset>
    </div>
    <div class="userInfoReview">
        <div class="UserImg"><img src="../webImages/UserImage/<%
    if(house.getUser().getAvatar() != null){
        out.print(house.getUser().getAvatar());
    }else{
        out.print("noImage.png");
    }%>" alt="image" width="100px" height="100px" style="border-radius: 50%"></div>
        <table>
            <tr><th>Name</th><td><%=house.getUser().getName()%></td></tr>
            <tr><th>Surname</th><td><%=house.getUser().getSurname()%></td></tr>
            <tr><th>Phone</th><td>0<%=house.getUser().getPhone()%></td></tr>
        </table>
    </div>
</div>
<%}
    if(index == 2){
        Apartment apartment;
        if(request.getParameter("type") != null){
        apartment = (Apartment) searchBrain.getAds(new Apartment(), id);
        }else {
        list = subcategoryAds.getAdsBySubcategory(new Apartment(), request.getParameter("checkImage")
                , request.getParameter("minPrice"), request.getParameter("maxPrice"), request.getParameter("location"));
        apartment = (Apartment) list.get(i);
    }
%>
<div class="allDataReview">
    <div class="locationPrice">
        <div class="topAlign"><img src="../detailesImages/location.png" alt="location" width="25px" height="25px" style="float: left;">
            <h3><%=apartment.getLocation()%></h3></div>
        <div class="topAlign"><img src="../detailesImages/price.png" alt="location" width="25px" height="25px" style="float: left;">
            <h3><%=apartment.getPrice()%>$</h3></div>
    </div>
    <img src="../webImages/apartment/<%
    if(apartment.getPhoto() != null){
        out.print(apartment.getPhoto());
    }else{
        out.print("noImage.png");
    }%>" alt="image" width="300px" height="300px" style="position: relative; left: 25px;">
    <div class="dataInTable">
        <table>
            <tr><th>Title</th><td><%=apartment.getTitle()%></td></tr>
            <tr><th>Address</th><td><%=apartment.getAddress()%></td></tr>
            <tr><th>Construction Type</th><td><%=apartment.getCoustruction_type()%></td></tr>
            <tr><th>Rooms</th><td><%=apartment.getRooms()%></td></tr>
            <tr><th>Living Space</th><td><%=apartment.getLiving_space()%></td></tr>
            <tr><th>Floor</th><td><%=apartment.getFloor()%></td></tr>
            <tr><th>Floors(Building)</th><td><%=apartment.getFloors_in_the_building()%></td></tr>
        </table>
        <fieldset>
            <legend>Description</legend>
            <h4><%=apartment.getDescription()%></h4>
        </fieldset>
    </div>
    <div class="userInfoReview">
        <div class="UserImg"><img src="../webImages/UserImage/<%
    if(apartment.getUser().getAvatar() != null){
        out.print(apartment.getUser().getAvatar());
    }else{
        out.print("noImage.png");
    }%>" alt="image" width="100px" height="100px" style="border-radius: 50%"></div>
        <table>
            <tr><th>Name</th><td><%=apartment.getUser().getName()%></td></tr>
            <tr><th>Surname</th><td><%=apartment.getUser().getSurname()%></td></tr>
            <tr><th>Phone</th><td>0<%=apartment.getUser().getPhone()%></td></tr>
        </table>
    </div>
</div>
<%}
    if(index == 3){
        Car car;
        if(request.getParameter("type") != null){
            car = (Car) searchBrain.getAds(new Car(), id);
        }else {
            list = subcategoryAds.getAdsBySubcategory(new Car(), request.getParameter("checkImage")
                    , request.getParameter("minPrice"), request.getParameter("maxPrice"), request.getParameter("location"));
            car = (Car) list.get(i);
        }
%>
<div class="allDataReview">
    <div class="locationPrice">
        <div class="topAlign"><img src="../detailesImages/location.png" alt="location" width="25px" height="25px" style="float: left;">
            <h3><%=car.getLocation()%></h3></div>
        <div class="topAlign"><img src="../detailesImages/price.png" alt="location" width="25px" height="25px" style="float: left;">
            <h3><%=car.getPrice()%>$</h3></div>
    </div>
    <img src="../webImages/car/<%
    if(car.getPhoto() != null){
        out.print(car.getPhoto());
    }else{
        out.print("noImage.png");
    }%>" alt="image" width="300px" height="300px" style="position: relative; left: 25px;">
    <div class="dataInTable">
        <table>
            <tr><th>Title</th><td><%=car.getTitle()%></td></tr>
            <tr><th>Make</th><td><%=car.getMake()%></td></tr>
            <tr><th>Model</th><td><%=car.getModel()%></td></tr>
            <tr><th>Year</th><td><%=car.getYear()%></td></tr>
            <tr><th>Milage</th><td><%=car.getMilage()%></td></tr>
            <tr><th>Engine type</th><td><%=car.getEngine_type()%></td></tr>
            <tr><th>Transmission</th><td><%=car.getTransmission()%></td></tr>
            <tr><th>Steering Wheel</th><td><%=car.getSteering_wheel()%></td></tr>
        </table>
        <fieldset>
            <legend>Description</legend>
            <h4><%=car.getDescription()%></h4>
        </fieldset>
    </div>
    <div class="userInfoReview">
        <div class="UserImg"><img src="../webImages/UserImage/<%
    if(car.getUser().getAvatar() != null){
        out.print(car.getUser().getAvatar());
    }else{
        out.print("noImage.png");
    }%>" alt="image" width="100px" height="100px" style="border-radius: 50%"></div>
        <table>
            <tr><th>Name</th><td><%=car.getUser().getName()%></td></tr>
            <tr><th>Surname</th><td><%=car.getUser().getSurname()%></td></tr>
            <tr><th>Phone</th><td>0<%=car.getUser().getPhone()%></td></tr>
        </table>
    </div>
</div>
<%}
    if(index == 4){
        Motorcycle motorcycle;
        if(request.getParameter("type") != null){
            motorcycle = (Motorcycle) searchBrain.getAds(new Motorcycle(), id);
        }else {
            list = subcategoryAds.getAdsBySubcategory(new Motorcycle(), request.getParameter("checkImage")
                    , request.getParameter("minPrice"), request.getParameter("maxPrice"), request.getParameter("location"));
            motorcycle = (Motorcycle) list.get(i);
        }
%>
<div class="allDataReview">
    <div class="locationPrice">
        <div class="topAlign"><img src="../detailesImages/location.png" alt="location" width="25px" height="25px" style="float: left;">
            <h3><%=motorcycle.getLocation()%></h3></div>
        <div class="topAlign"><img src="../detailesImages/price.png" alt="location" width="25px" height="25px" style="float: left;">
            <h3><%=motorcycle.getPrice()%>$</h3></div>
    </div>
    <img src="../webImages/motorcycle/<%
    if(motorcycle.getPhoto() != null){
        out.print(motorcycle.getPhoto());
    }else{
        out.print("noImage.png");
    }%>" alt="image" width="300px" height="300px" style="position: relative; left: 25px;">
    <div class="dataInTable">
        <table>
            <tr><th>Title</th><td><%=motorcycle.getTitle()%></td></tr>
        </table>
        <fieldset>
            <legend>Description</legend>
            <h4><%=motorcycle.getDescription()%></h4>
        </fieldset>
    </div>
    <div class="userInfoReview">
        <div class="UserImg"><img src="../webImages/UserImage/<%
    if(motorcycle.getUser().getAvatar() != null){
        out.print(motorcycle.getUser().getAvatar());
    }else{
        out.print("noImage.png");
    }%>" alt="image" width="100px" height="100px" style="border-radius: 50%"></div>
        <table>
            <tr><th>Name</th><td><%=motorcycle.getUser().getName()%></td></tr>
            <tr><th>Surname</th><td><%=motorcycle.getUser().getSurname()%></td></tr>
            <tr><th>Phone</th><td>0<%=motorcycle.getUser().getPhone()%></td></tr>
        </table>
    </div>
</div>
<%}
    if(index == 5){
        Notebook notebook;
        if(request.getParameter("type") != null){
            notebook = (Notebook) searchBrain.getAds(new Notebook(), id);
        }else {
            list = subcategoryAds.getAdsBySubcategory(new Notebook(), request.getParameter("checkImage")
                    , request.getParameter("minPrice"), request.getParameter("maxPrice"), request.getParameter("location"));
            notebook = (Notebook) list.get(i);
        }
%>
<div class="allDataReview">
    <div class="locationPrice">
        <div class="topAlign"><img src="../detailesImages/location.png" alt="location" width="25px" height="25px" style="float: left;">
            <h3><%=notebook.getLocation()%></h3></div>
        <div class="topAlign"><img src="../detailesImages/price.png" alt="location" width="25px" height="25px" style="float: left;">
            <h3><%=notebook.getPrice()%>$</h3></div>
    </div>
    <img src="../webImages/notebook/<%
    if(notebook.getPhoto() != null){
        out.print(notebook.getPhoto());
    }else{
        out.print("noImage.png");
    }%>" alt="image" width="300px" height="300px" style="position: relative; left: 25px;">
    <div class="dataInTable">
        <table>
            <tr><th>Title</th><td><%=notebook.getTitle()%></td></tr>
        </table>
        <fieldset>
            <legend>Description</legend>
            <h4><%=notebook.getDescription()%></h4>
        </fieldset>
    </div>
    <div class="userInfoReview">
        <div class="UserImg"><img src="../webImages/UserImage/<%
    if(notebook.getUser().getAvatar() != null){
        out.print(notebook.getUser().getAvatar());
    }else{
        out.print("noImage.png");
    }%>" alt="image" width="100px" height="100px" style="border-radius: 50%"></div>
        <table>
            <tr><th>Name</th><td><%=notebook.getUser().getName()%></td></tr>
            <tr><th>Surname</th><td><%=notebook.getUser().getSurname()%></td></tr>
            <tr><th>Phone</th><td>0<%=notebook.getUser().getPhone()%></td></tr>
        </table>
    </div>
</div>
<%}
    if(index == 6){
        Phone phone;
        if(request.getParameter("type") != null){
            phone = (Phone) searchBrain.getAds(new Phone(), id);
        }else {
            list = subcategoryAds.getAdsBySubcategory(new Phone(), request.getParameter("checkImage")
                    , request.getParameter("minPrice"), request.getParameter("maxPrice"), request.getParameter("location"));
            phone = (Phone) list.get(i);
        }
%>
<div class="allDataReview">
    <div class="locationPrice">
        <div class="topAlign"><img src="../detailesImages/location.png" alt="location" width="25px" height="25px" style="float: left;">
            <h3><%=phone.getLocation()%></h3></div>
        <div class="topAlign"><img src="../detailesImages/price.png" alt="location" width="25px" height="25px" style="float: left;">
            <h3><%=phone.getPrice()%>$</h3></div>
    </div>
    <img src="../webImages/phone/<%
    if(phone.getPhoto() != null){
        out.print(phone.getPhoto());
    }else{
        out.print("noImage.png");
    }%>" alt="image" width="300px" height="300px" style="position: relative; left: 25px;">
    <div class="dataInTable">
        <table>
            <tr><th>Title</th><td><%=phone.getTitle()%></td></tr>
            <tr><th>Make</th><td><%=phone.getMake()%></td></tr>
        </table>
        <fieldset>
            <legend>Description</legend>
            <h4><%=phone.getDescription()%></h4>
        </fieldset>
    </div>
    <div class="userInfoReview">
        <div class="UserImg"><img src="../webImages/UserImage/<%
    if(phone.getUser().getAvatar() != null){
        out.print(phone.getUser().getAvatar());
    }else{
        out.print("noImage.png");
    }%>" alt="image" width="100px" height="100px" style="border-radius: 50%"></div>
        <table>
            <tr><th>Name</th><td><%=phone.getUser().getName()%></td></tr>
            <tr><th>Surname</th><td><%=phone.getUser().getSurname()%></td></tr>
            <tr><th>Phone</th><td>0<%=phone.getUser().getPhone()%></td></tr>
        </table>
    </div>
</div>
<%}
    if(index == 7){
        Tablet tablet;
        if(request.getParameter("type") != null){
            tablet = (Tablet) searchBrain.getAds(new Tablet(), id);
        }else {
            list = subcategoryAds.getAdsBySubcategory(new Tablet(), request.getParameter("checkImage")
                    , request.getParameter("minPrice"), request.getParameter("maxPrice"), request.getParameter("location"));
            tablet = (Tablet) list.get(i);
        }
%>
<div class="allDataReview">
    <div class="locationPrice">
        <div class="topAlign"><img src="../detailesImages/location.png" alt="location" width="25px" height="25px" style="float: left;">
            <h3><%=tablet.getLocation()%></h3></div>
        <div class="topAlign"><img src="../detailesImages/price.png" alt="location" width="25px" height="25px" style="float: left;">
            <h3><%=tablet.getPrice()%>$</h3></div>
    </div>
    <img src="../webImages/tablet/<%
    if(tablet.getPhoto() != null){
        out.print(tablet.getPhoto());
    }else{
        out.print("noImage.png");
    }%>" alt="image" width="300px" height="300px" style="position: relative; left: 25px;">
    <div class="dataInTable">
        <table>
            <tr><th>Title</th><td><%=tablet.getTitle()%></td></tr>
            <tr><th>Make</th><td><%=tablet.getMake()%></td></tr>
        </table>
        <fieldset>
            <legend>Description</legend>
            <h4><%=tablet.getDescription()%></h4>
        </fieldset>
    </div>
    <div class="userInfoReview">
        <div class="UserImg"><img src="../webImages/UserImage/<%
    if(tablet.getUser().getAvatar() != null){
        out.print(tablet.getUser().getAvatar());
    }else{
        out.print("noImage.png");
    }%>" alt="image" width="100px" height="100px" style="border-radius: 50%"></div>
        <table>
            <tr><th>Name</th><td><%=tablet.getUser().getName()%></td></tr>
            <tr><th>Surname</th><td><%=tablet.getUser().getSurname()%></td></tr>
            <tr><th>Phone</th><td>0<%=tablet.getUser().getPhone()%></td></tr>
        </table>
    </div>
</div>
<%
    }
%>
</body>
</html>
