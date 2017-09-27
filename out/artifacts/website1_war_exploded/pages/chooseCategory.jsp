<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="headerTemplate.jsp"%>
<html>
<head>
    <title>Choose Category</title>
    <link href="../css/chooseCategoryStyle.css" rel="stylesheet" type="text/css">
    <script src="../js/jquery-3.2.1.min.js"></script>
    <script src="../js/animationOfUserPage.js"></script>
    <script src="../js/choose.js"></script>
    <style>
        .openRight a {
            text-decoration: none;
            font-size: 18px;
            letter-spacing: 1px;
            color: #000;
            width: 150px;
        }
        .openRight a:active{
            color: #B5DEAC;
        }

        button {
            width: 170px;
        }
        button.blank {
            padding-left: 2px;
            width: 170px;
        }
    </style>
</head>
<body>
<div id="wrapper">
    <div id="chooseCategory">
        <fieldset style="border: 2px dotted #EDDAF1; width: 160px; height: 140px; padding: 0">
            <legend>Choose category</legend>
            <ul>
                <li class="openRight">
                    <button onclick="openSubcategory(this)" name="0"><a href="JavaScript:void(0);">Real Estate</a></button>
                    <div class="sub-content" style="display: block;">
                        <button class="blank" onclick="openBlank(this)" name="0"><a href="JavaScript:void(0);">Houses</a></button>
                        <button class="blank" onclick="openBlank(this)" name="1"><a href="JavaScript:void(0);">Apartments</a></button>
                    </div>
                </li>
                <li class="openRight">
                    <button onclick="openSubcategory(this)" name="1"><a href="JavaScript:void(0);">Vehicle</a></button>
                    <div class="sub-content">
                        <button class="blank" onclick="openBlank(this)" name="2"><a href="JavaScript:void(0);">Passenger Cars</a></button>
                        <button class="blank" onclick="openBlank(this)" name="3"><a href="JavaScript:void(0);">Motorcycles</a></button></button>
                    </div>
                </li>
                <li class="openRight">
                    <button onclick="openSubcategory(this)" name="2"><a href="JavaScript:void(0);">Electronics</a></button>
                    <div class="sub-content">
                        <button class="blank" onclick="openBlank(this)" name="4"><a href="JavaScript:void(0);">Notebooks</a></button>
                        <button class="blank" onclick="openBlank(this)" name="5"><a href="JavaScript:void(0);">Phones</a></button>
                        <button class="blank" onclick="openBlank(this)" name="6"><a href="JavaScript:void(0);">Tablets</a></button>
                    </div>
                </li>
            </ul>
        </fieldset>
    </div>
</div>

<div id="allBlanks" style="display: block;">
    <!--Houses form field-->
    <div id="form0" class="property" style="display: block;">
        <form action="adsHandlerPages/houseAdsControl.jsp" method="post" enctype="multipart/form-data">
        <input name="location" placeholder="Location" required><br>
        <input name="address" placeholder="Address" required><br>
            <select name="selectValue" required>
                <option disabled selected>Construction Type</option>
                <option value="stone">Stone</option>
                <option value="panels">Panels</option>
                <option value="Monoliths">Monoliths</option>
                <option value="bricks">Bricks</option>
            </select>
        <input type="number" name="rooms" placeholder="Rooms" required><br>
        <input type="number" name="space" placeholder="Living-space" required><br>
        <input type="number" name="price" placeholder="Price" required><br>
        <input name="title" placeholder="Title" required><br>
        <input id="houseImg" name="file" type="file" style="display: none;"><br>
        <input type="button" value="Browse for image..." onclick="document.getElementById('houseImg').click();"><br>
            <textarea name="textarea" rows="10" cols="25" placeholder="Description" style="width: 200px" required></textarea><br>
            <input type="submit" value="Add" name="send" style="width: 80px; margin: 20px 0 0 65px; background-color: white">
        </form>
    </div>

    <!--Apartment form field-->
    <div id="form1" class="property">
        <form action="adsHandlerPages/apartmentAdsControl.jsp" method="post" enctype="multipart/form-data">
        <input name="location" placeholder="Location" required><br>
        <input name="address" placeholder="Address" required><br>
            <select name="selectValue" required>
                <option disabled selected>Construction Type</option>
                <option value="stone">Stone</option>
                <option value="panels">Panels</option>
                <option value="Monoliths">Monoliths</option>
                <option value="bricks">Bricks</option>
            </select>
        <input type="number" name="rooms" placeholder="Rooms" required><br>
        <input type="number" name="space" placeholder="Living-space" required><br>
        <input type="number" name="floor" placeholder="Floor" required><br>
        <input type="number" name="allFloor" placeholder="Floors-in-the-building" required><br>
        <input type="number" name="price" placeholder="Price" required><br>
        <input name="title" placeholder="Title" required><br>
            <input id="apartmentImg" name="file" type="file" style="display: none;"><br>
            <input type="button" value="Browse for image..." onclick="document.getElementById('apartmentImg').click();"><br>
            <textarea name="textarea" rows="10" cols="25" placeholder="description" style="width: 200px" required></textarea><br>
            <input type="submit" value="Add" name="send" style="width: 80px; margin: 20px 0 0 65px; background-color: white">
        </form>
    </div>

    <!--Passenger Cars form field-->
    <div id="form2" class="property">
        <form action="adsHandlerPages/carsAdsControl.jsp" method="post" enctype="multipart/form-data">
        <input name="location" placeholder="Location" required><br>
        <input name="make" placeholder="Make" required><br>
        <input name="model" placeholder="Model" required><br>
        <input type="number" name="year" placeholder="Year" required><br>
        <input type="number" name="milage" placeholder="Milage" required><br>
                <select name="engine_type" required>
                    <option disabled selected>Engine Type</option>
                    <option value="gasoline">Gasoline</option>
                    <option value="diesel">Diesel</option>
                    <option value="natural_gas">Natural Gas</option>
                    <option value="hybrid">Hybrid</option>
                    <option value="electric">Electric</option>
                </select>

                <select name="transmission" required>
                    <option disabled selected>Transmission</option>
                    <option>Manual</option>
                    <option>Automatic</option>
                </select>

                <select name="wheel" required>
                    <option disabled selected>Steering Wheel</option>
                    <option>Left</option>
                    <option>Right</option>
                </select>
        <input type="number" name="price" placeholder="Price" required><br>
        <input name="title" placeholder="Title" required><br>
            <input id="carImg" name="file" type="file" style="display: none;"><br>
            <input type="button" value="Browse for image..." onclick="document.getElementById('carImg').click();"><br>
            <textarea name="textarea" rows="10" cols="25" placeholder="Description" style="width: 200px" required></textarea><br>
            <input type="submit" value="Add" name="send" style="width: 80px; margin: 20px 0 0 65px; background-color: white">
        </form>
    </div>

    <!--Motorcycle form field-->
    <div id="form3" class="property">
        <form action="adsHandlerPages/motorcycleAdsControl.jsp" method="post" enctype="multipart/form-data">
        <input name="location" placeholder="Location" required><br>
        <input type="number" name="price" placeholder="Price" required><br>
        <input name="title" placeholder="Title" required><br>
            <input id="motorcycleImg" name="file" type="file" style="display: none;"><br>
            <input type="button" value="Browse for image..." onclick="document.getElementById('motorcycleImg').click();"><br>
            <textarea name="textarea" rows="10" cols="25" placeholder="Description" style="width: 200px" required></textarea><br>
            <input type="submit" value="Add" name="send" style="width: 80px; margin: 20px 0 0 65px; background-color: white">
        </form>
    </div>
    <!--Notebooks form field-->
    <div id="form4" class="property">
        <form action="adsHandlerPages/notebooksAdsControl.jsp" method="post" enctype="multipart/form-data">
        <input name="location" placeholder="Location" required><br>
        <input type="number" name="price" placeholder="Price" required><br>
        <input name="title" placeholder="Title" required><br>
            <input id="notebookImg" name="file" type="file" style="display: none;"><br>
            <input type="button" value="Browse for image..." onclick="document.getElementById('notebookImg').click();"><br>
            <textarea name="textarea" rows="10" cols="25" placeholder="Description" style="width: 200px" required></textarea><br>
            <input type="submit" value="Add" name="send" style="width: 80px; margin: 20px 0 0 65px; background-color: white">
        </form>
    </div>

    <!--Phones form field-->
    <div id="form5" class="property">
        <form action="adsHandlerPages/phoneAdsControl.jsp" method="post" enctype="multipart/form-data">
        <input name="location" placeholder="Location" required><br>
        <input name="make" placeholder="Make" required><br>
        <input type="number" name="price" placeholder="Price" required><br>
        <input name="title" placeholder="Title" required><br>
            <input id="phoneImg" name="file" type="file" style="display: none;"><br>
            <input type="button" value="Browse for image..." onclick="document.getElementById('phoneImg').click();"><br>
            <textarea name="textarea" rows="10" cols="25" placeholder="Description" style="width: 200px" required></textarea><br>
            <input type="submit" value="Add" name="send" style="width: 80px; margin: 20px 0 0 65px; background-color: white">
        </form>
    </div>

    <!--Tablets form field-->
    <div id="form6" class="property">
        <form action="adsHandlerPages/tabletAdsControl.jsp" method="post" enctype="multipart/form-data">
        <input name="location" placeholder="Location" required><br>
        <input name="make" placeholder="Make" required><br>
        <input type="number" name="price" placeholder="Price" required><br>
        <input name="title" placeholder="Title" required><br>
            <input id="tabletImg" name="file" type="file" style="display: none;"><br>
            <input type="button" value="Browse for image..." onclick="document.getElementById('tabletImg').click();"><br>
            <textarea name="textarea" rows="10" cols="25" placeholder="Description" style="width: 200px" required></textarea><br>
            <input type="submit" value="Add" name="send" style="width: 80px; margin: 20px 0 0 65px; background-color: white">
        </form>
    </div>
</div>
</body>
</html>
