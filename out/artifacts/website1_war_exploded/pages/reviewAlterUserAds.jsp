<%@ page import="java.util.List" %>
<%@ page import="mapping.*" %>
<%@ page import="web_src.UserAds" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="headerTemplate.jsp"%>
<html>
<head>
    <title>review</title>
    <link href="../css/reviewStyle.css" rel="stylesheet" type="text/css">
    <script src="../js/animationOfReviewPage.js"></script>
</head>
<body onload="select()">
<%
    UserAds userAds = new UserAds();

    int item = Integer.parseInt(request.getParameter("item"));
    int obj = Integer.parseInt(request.getParameter("obj"));

    User user = (User) session.getAttribute("user");
    if(user == null){
        System.out.println("user chka");
        response.sendRedirect("index.jsp");
    }else{
        List<Object[]> list = userAds.readAds(user.getId());

        if(item == 0){
            House house = (House) list.get(item)[obj];
            session.setAttribute("houseId", house.getId());
%>
<div class="allDataReview">
    <div class="settings" id="1" onclick="rotate(this)"><img src="../detailesImages/settings.png" alt="image" width="20px" height="20px">
    </div>
    <div class="updateAdsInfo" id="openSesame1">
        <form action="adsHandlerPages/houseAdsControl.jsp" method="post" enctype="multipart/form-data">
            <h3>location:</h3><input name="location" placeholder="Location" value="<%=house.getLocation()%>"><br>
            <h3>Address:</h3><input name="address" placeholder="Address" value="<%=house.getAddress()%>"><br>
            <script>
                function select() {
                    document.getElementById("houseConsType").value = "<%=house.getCoustruction_type()%>";
                }
            </script>
            <h3></h3><select id="houseConsType" name="selectValue" style="padding-bottom: 5px">
            <option disabled selected>Construction Type</option>
            <option value="stone">Stone</option>
            <option value="panels">Panels</option>
            <option value="Monoliths">Monoliths</option>
            <option value="bricks">Bricks</option>
        </select>
            <h3>Rooms:</h3><input type="number" name="rooms" placeholder="Rooms" value="<%=house.getRooms()%>"><br>
            <h3>Living Space:</h3><input type="number" name="space" placeholder="Living-space" value="<%=house.getLiving_space()%>"><br>
            <h3>Price:</h3><input type="number" name="price" placeholder="Price" value="<%=house.getPrice()%>"><br>
            <h3>Title:</h3><input name="title" placeholder="Title" value="<%=house.getTitle()%>"><br>
            <input id="houseImg" name="file" value="file" type="file" style="display: none">
            <h3>Image:</h3><input type="button" value="Browse..." onclick="document.getElementById('houseImg').click();"><br>
            <h3>Description:</h3><textarea name="textarea" rows="10" cols="25" placeholder="Description" style="width: 200px"><%=house.getDescription()%></textarea><br>
            <input type="submit" value="Update" name="send" style="width: 80px; margin: 20px 0 0 130px; background-color: white">
            <input type="hidden" name="nkar" value="<%=house.getPhoto()%>">
        </form>
    </div>
    <div class="locationPrice">
        <div class="topAlign"><img src="../detailesImages/location.png" alt="location" width="25px" height="25px" style="float: left;">
            <h3><%=house.getLocation()%></h3></div>
        <div class="topAlign"><img src="../detailesImages/price.png" alt="location" width="25px" height="25px" style="float: left;">
            <h3><%=house.getPrice()%>$</h3></div>
    </div>
    <img src="../webImages/house/<%if(house.getPhoto() != null){out.print(house.getPhoto());}else{out.print("noImage.png");}%>" alt="image" width="300px" height="300px" border="1" style="position: relative; left: 25px;">
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
</div>
<%}
    if(item == 1){
        Tablet tablet = (Tablet) list.get(item)[obj];
        session.setAttribute("tabletId", tablet.getId());
%>
<div class="allDataReview">
    <div class="settings" id="2" onclick="rotate(this)"><img src="../detailesImages/settings.png" alt="image" width="20px" height="20px">
    </div>
    <div class="updateAdsInfo"  id="openSesame2">
        <form action="adsHandlerPages/tabletAdsControl.jsp" method="post" enctype="multipart/form-data">
            <h3>location:</h3><input name="location" placeholder="Location" value="<%=tablet.getLocation()%>"><br>
            <h3>Make:</h3><input name="make" placeholder="make" value="<%=tablet.getMake()%>"><br>
            <h3>Price:</h3><input type="number" name="price" placeholder="Price" value="<%=tablet.getPrice()%>"><br>
            <h3>Title:</h3><input name="title" placeholder="Title" value="<%=tablet.getTitle()%>"><br>
            <input id="tabletImg" name="file" value="file" type="file" style="display: none">
            <h3>Image:</h3><input type="button" value="Browse..." onclick="document.getElementById('tabletImg').click();"><br>
            <h3>Description:</h3><textarea name="textarea" rows="10" cols="25" placeholder="Description" style="width: 200px"><%=tablet.getDescription()%></textarea><br>
            <input type="submit" value="Update" name="send" style="width: 80px; margin: 20px 0 0 130px; background-color: white">
            <input type="hidden" name="nkar" value="<%=tablet.getPhoto()%>">
        </form>
    </div>
    <div class="locationPrice">
        <div class="topAlign"><img src="../detailesImages/location.png" alt="location" width="25px" height="25px" style="float: left;">
            <h3><%=tablet.getLocation()%></h3></div>
        <div class="topAlign"><img src="../detailesImages/price.png" alt="location" width="25px" height="25px" style="float: left;">
            <h3><%=tablet.getPrice()%>$</h3></div>
    </div>
    <img src="../webImages/tablet/<%if(tablet.getPhoto() != null){out.print(tablet.getPhoto());}else{out.print("noImage.png");}%>" alt="image" width="300px" height="300px" style="position: relative; left: 25px;">
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
</div>
<%}
    if(item == 2){
        Apartment apartment = (Apartment) list.get(item)[obj];
        session.setAttribute("apartmentId", apartment.getId());
%>
<div class="allDataReview">
    <div class="settings" id="3" onclick="rotate(this)"><img src="../detailesImages/settings.png" alt="image" width="20px" height="20px">
    </div>
    <div class="updateAdsInfo" id="openSesame3">
        <form action="adsHandlerPages/apartmentAdsControl.jsp" method="post" enctype="multipart/form-data">
            <h3>location:</h3><input name="location" placeholder="Location" value="<%=apartment.getLocation()%>"><br>
            <h3>Address:</h3><input name="address" placeholder="Address" value="<%=apartment.getAddress()%>"><br>
            <script>
                function select() {
                    document.getElementById("apartmentConsType").value = "<%=apartment.getCoustruction_type()%>";
                }
            </script>
            <h3></h3><select id="apartmentConsType" name="selectValue" style="padding-bottom: 5px">
            <option disabled selected>Construction Type</option>
            <option value="stone">Stone</option>
            <option value="panels">Panels</option>
            <option value="Monoliths">Monoliths</option>
            <option value="bricks">Bricks</option>
        </select>
            <h3>Rooms:</h3><input type="number" name="rooms" placeholder="Rooms" value="<%=apartment.getRooms()%>"><br>
            <h3>Living Space:</h3><input type="number" name="space" placeholder="Living-space" value="<%=apartment.getLiving_space()%>"><br>
            <h3>Floor:</h3><input type="number" name="floor" placeholder="Floor" value="<%=apartment.getFloor()%>"><br>
            <h3>Floor(Building):</h3><input type="number" name="allFloor" placeholder="Floors-in-the-building" value="<%=apartment.getFloors_in_the_building()%>"><br>
            <h3>Price:</h3><input type="number" name="price" placeholder="Price" value="<%=apartment.getPrice()%>"><br>
            <h3>Title:</h3><input name="title" placeholder="Title" value="<%=apartment.getTitle()%>"><br>
            <input id="apartmentImg" name="file" value="file" type="file" style="display: none">
            <h3>Image:</h3><input type="button" value="Browse..." onclick="document.getElementById('apartmentImg').click();"><br>
            <h3>Description:</h3><textarea name="textarea" rows="10" cols="25" placeholder="Description" style="width: 200px"><%=apartment.getDescription()%></textarea><br>
            <input type="submit" value="Update" name="send" style="width: 80px; margin: 20px 0 0 130px; background-color: white">
            <input type="hidden" name="nkar" value="<%=apartment.getPhoto()%>">
        </form>
    </div>
    <div class="locationPrice">
        <div class="topAlign"><img src="../detailesImages/location.png" alt="location" width="25px" height="25px" style="float: left;">
            <h3><%=apartment.getLocation()%></h3></div>
        <div class="topAlign"><img src="../detailesImages/price.png" alt="location" width="25px" height="25px" style="float: left;">
            <h3><%=apartment.getPrice()%>$</h3></div>
    </div>
    <img src="../webImages/apartment/<%if(apartment.getPhoto() != null){out.print(apartment.getPhoto());}else{out.print("noImage.png");}%>" alt="image" width="300px" height="300px" style="position: relative; left: 25px;">
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
</div>
<%}
    if(item == 3){
        Phone phone = (Phone) list.get(item)[obj];
        session.setAttribute("phoneId", phone.getId());
%>
<div class="allDataReview">
    <div class="settings" id="4" onclick="rotate(this)"><img src="../detailesImages/settings.png" alt="image" width="20px" height="20px">
    </div>
    <div class="updateAdsInfo" id="openSesame4">
        <form action="adsHandlerPages/phoneAdsControl.jsp" method="post" enctype="multipart/form-data">
            <h3>location:</h3><input name="location" placeholder="Location" value="<%=phone.getLocation()%>"><br>
            <h3>Make:</h3><input name="make" placeholder="Make" value="<%=phone.getMake()%>"><br>
            <h3>Price:</h3><input type="number" name="price" placeholder="Price" value="<%=phone.getPrice()%>"><br>
            <h3>Title:</h3><input name="title" placeholder="Title" value="<%=phone.getTitle()%>"><br>
            <input id="phoneImg" name="file" value="file" type="file" style="display: none">
            <h3>Image:</h3><input type="button" value="Browse..." onclick="document.getElementById('phoneImg').click();"><br>
            <h3>Description:</h3><textarea name="textarea" rows="10" cols="25" placeholder="Description" style="width: 200px"><%=phone.getDescription()%></textarea><br>
            <input type="submit" value="Update" name="send" style="width: 80px; margin: 20px 0 0 130px; background-color: white">
            <input type="hidden" name="nkar" value="<%=phone.getPhoto()%>">
        </form>
    </div>
    <div class="locationPrice">
        <div class="topAlign"><img src="../detailesImages/location.png" alt="location" width="25px" height="25px" style="float: left;">
            <h3><%=phone.getLocation()%></h3></div>
        <div class="topAlign"><img src="../detailesImages/price.png" alt="location" width="25px" height="25px" style="float: left;">
            <h3><%=phone.getPrice()%>$</h3></div>
    </div>
    <img src="../webImages/phone/<%if(phone.getPhoto() != null){out.print(phone.getPhoto());}else{out.print("noImage.png");}%>" alt="image" width="300px" height="300px" style="position: relative; left: 25px;">
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
</div>
<%}
    if(item == 4){
        Motorcycle motorcycle = (Motorcycle) list.get(item)[obj];
        session.setAttribute("motorcycleId", motorcycle.getId());
%>
<div class="allDataReview">
    <div class="settings" id="5" onclick="rotate(this)"><img src="../detailesImages/settings.png" alt="image" width="20px" height="20px">
    </div>
    <div class="updateAdsInfo" id="openSesame5">
        <form action="adsHandlerPages/motorcycleAdsControl.jsp" method="post" enctype="multipart/form-data">
            <h3>location:</h3><input name="location" placeholder="Location" value="<%=motorcycle.getLocation()%>"><br>
            <h3>Price:</h3><input type="number" name="price" placeholder="Price" value="<%=motorcycle.getPrice()%>"><br>
            <h3>Title:</h3><input name="title" placeholder="Title" value="<%=motorcycle.getTitle()%>"><br>
            <input id="motoImg" name="file" value="file" type="file" style="display: none">
            <h3>Image:</h3><input type="button" value="Browse..." onclick="document.getElementById('motoImg').click();"><br>
            <h3>Description:</h3><textarea name="textarea" rows="10" cols="25" placeholder="Description" style="width: 200px"><%=motorcycle.getDescription()%></textarea><br>
            <input type="submit" value="Update" name="send" style="width: 80px; margin: 20px 0 0 130px; background-color: white">
            <input type="hidden" name="nkar" value="<%=motorcycle.getPhoto()%>">
        </form>
    </div>
    <div class="locationPrice">
        <div class="topAlign"><img src="../detailesImages/location.png" alt="location" width="25px" height="25px" style="float: left;">
            <h3><%=motorcycle.getLocation()%></h3></div>
        <div class="topAlign"><img src="../detailesImages/price.png" alt="location" width="25px" height="25px" style="float: left;">
            <h3><%=motorcycle.getPrice()%>$</h3></div>
    </div>
    <img src="../webImages/motorcycle/<%if(motorcycle.getPhoto() != null){out.print(motorcycle.getPhoto());}else{out.print("noImage.png");}%>" alt="image" width="300px" height="300px" style="position: relative; left: 25px;">
    <div class="dataInTable">
        <table>
            <tr><th>Title</th><td><%=motorcycle.getTitle()%></td></tr>
        </table>
        <fieldset>
            <legend>Description</legend>
            <h4><%=motorcycle.getDescription()%></h4>
        </fieldset>
    </div>
</div>
<%}
    if(item == 5){
        Notebook notebook = (Notebook) list.get(item)[obj];
        session.setAttribute("notebookId", notebook.getId());
%>
<div class="allDataReview">
    <div class="settings" id="6" onclick="rotate(this)"><img src="../detailesImages/settings.png" alt="image" width="20px" height="20px">
    </div>
    <div class="updateAdsInfo" id="openSesame6">
        <form action="adsHandlerPages/notebooksAdsControl.jsp" method="post" enctype="multipart/form-data">
            <h3>location:</h3><input name="location" placeholder="Location" value="<%=notebook.getLocation()%>"><br>
            <h3>Price:</h3><input type="number" name="price" placeholder="Price" value="<%=notebook.getPrice()%>"><br>
            <h3>Title:</h3><input name="title" placeholder="Title" value="<%=notebook.getTitle()%>"><br>
            <input id="notebookImg" name="file" value="file" type="file" style="display: none">
            <h3>Image:</h3><input type="button" value="Browse..." onclick="document.getElementById('notebookImg').click();"><br>
            <h3>Description:</h3><textarea name="textarea" rows="10" cols="25" placeholder="Description" style="width: 200px"><%=notebook.getDescription()%></textarea><br>
            <input type="submit" value="Update" name="send" style="width: 80px; margin: 20px 0 0 130px; background-color: white">
            <input type="hidden" name="nkar" value="<%=notebook.getPhoto()%>">
        </form>
    </div>
    <div class="locationPrice">
        <div class="topAlign"><img src="../detailesImages/location.png" alt="location" width="25px" height="25px" style="float: left;">
            <h3><%=notebook.getLocation()%></h3></div>
        <div class="topAlign"><img src="../detailesImages/price.png" alt="location" width="25px" height="25px" style="float: left;">
            <h3><%=notebook.getPrice()%>$</h3></div>
    </div>
    <img src="../webImages/notebook/<%if(notebook.getPhoto() != null){out.print(notebook.getPhoto());}else{out.print("noImage.png");}%>" alt="image" width="300px" height="300px" style="position: relative; left: 25px;">
    <div class="dataInTable">
        <table>
            <tr><th>Title</th><td><%=notebook.getTitle()%></td></tr>
        </table>
        <fieldset>
            <legend>Description</legend>
            <h4><%=notebook.getDescription()%></h4>
        </fieldset>
    </div>
</div>
<%}
    if(item == 6){
        Car car = (Car) list.get(item)[obj];
        session.setAttribute("carId", car.getId());
%>
<div class="allDataReview">
    <div class="settings" id="7" onclick="rotate(this)"><img src="../detailesImages/settings.png" alt="image" width="20px" height="20px">
    </div>
    <div class="updateAdsInfo" id="openSesame7">
        <form action="adsHandlerPages/carsAdsControl.jsp" method="post" enctype="multipart/form-data">
            <h3>location:</h3><input name="location" placeholder="Location" value="<%=car.getLocation()%>"><br>
            <h3>Make:</h3><input name="make" placeholder="Make" value="<%=car.getMake()%>"><br>
            <h3>Model:</h3><input name="model" placeholder="Model" value="<%=car.getModel()%>"><br>
            <h3>Year:</h3><input name="year" placeholder="Year" value="<%=car.getYear()%>"><br>
            <h3>Milage:</h3><input name="milage" placeholder="Milage" value="<%=car.getMilage()%>"><br>
            <script>
                function select() {
                    document.getElementById("engineType").value = "<%=car.getEngine_type()%>";
                    document.getElementById("transmission").value = "<%=car.getTransmission()%>";
                    document.getElementById("wheel").value = "<%=car.getSteering_wheel()%>";
                }
            </script>
            <h3></h3><select id="engineType" name="engine_type" style="padding-bottom: 5px">
            <option disabled selected>Engine Type</option>
            <option value="gasoline">Gasoline</option>
            <option value="diesel">Diesel</option>
            <option value="natural_gas">Natural Gas</option>
            <option value="hybrid">Hybrid</option>
            <option value="electric">Electric</option>
        </select>
            <h3></h3><select id="transmission" name="transmission" style="padding-bottom: 5px">
            <option disabled selected>Transmission</option>
            <option>Manual</option>
            <option>Automatic</option>
        </select>
            <h3></h3><select id="wheel" name="wheel" style="padding-bottom: 5px">
            <option disabled selected>Steering Wheel</option>
            <option>Left</option>
            <option>Right</option>
        </select>
            <h3>Price:</h3><input type="number" name="price" placeholder="Price" value="<%=car.getPrice()%>"><br>
            <h3>Title:</h3><input name="title" placeholder="Title" value="<%=car.getTitle()%>"><br>
            <input id="carImg" name="file" value="file" type="file" style="display: none">
            <h3>Image:</h3><input type="button" value="Browse..." onclick="document.getElementById('carImg').click();"><br>
            <h3>Description:</h3><textarea name="textarea" rows="10" cols="25" placeholder="Description" style="width: 200px"><%=car.getDescription()%></textarea><br>
            <input type="submit" value="Update" name="send" style="width: 80px; margin: 20px 0 0 130px; background-color: white">
            <input type="hidden" name="nkar" value="<%=car.getPhoto()%>">
        </form>
    </div>
    <div class="locationPrice">
        <div class="topAlign"><img src="../detailesImages/location.png" alt="location" width="25px" height="25px" style="float: left;">
            <h3><%=car.getLocation()%></h3></div>
        <div class="topAlign"><img src="../detailesImages/price.png" alt="location" width="25px" height="25px" style="float: left;">
            <h3><%=car.getPrice()%>$</h3></div>
    </div>
    <img src="../webImages/car/<%if(car.getPhoto() != null){out.print(car.getPhoto());}else{out.print("noImage.png");}%>" alt="image" width="300px" height="300px" style="position: relative; left: 25px;">
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
</div>
<%
        }
    }
%>
</body>
</html>
