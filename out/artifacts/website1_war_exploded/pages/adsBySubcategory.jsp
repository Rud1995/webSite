<%@ page import="web_src.SubcategoryAds" %>
<%@ page import="java.util.List" %>
<%@ page import="mapping.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="headerTemplate.jsp"%>
<html>
<head>
    <title>Ads</title>
    <link href="../css/indexStyle.css" rel="stylesheet" type="text/css">
    <script src="../js/adsBySubcategory.js"></script>
    <script src="../js/jquery-3.2.1.min.js"></script>
    <script src="../js/animationsOfLogReg.js"></script>
    <script src="../js/regValidator.js"></script>
</head>
<body onload="colorPage()">

<!--all links bellow role-->
<style>
    a {
        text-decoration: none;
        color: darkslategray;
    }
</style>

<%
    int index = Integer.parseInt(request.getParameter("sc"));
    int pageNumber = Integer.parseInt(request.getParameter("page"));

    SubcategoryAds subcategoryAds = new SubcategoryAds();
    List list;
%>
<div id="wrapper" style="height: auto; max-height: 2100px">
    <%
        if(index == 1){
            list = subcategoryAds.getAdsBySubcategory(new House(), request.getParameter("checkImage")
                    , request.getParameter("minPrice"), request.getParameter("maxPrice"), request.getParameter("location"));
            int size = list.size();
            House house;
            for(int i = (pageNumber-1)*10; i < (pageNumber-1)*10+10; i++){
                if(i < list.size()){
                house = (House) list.get(i);
    %>
    <div class="indexAds">
        <div class="images"><img src="../webImages/house/<%
    if(house.getPhoto() != null){
        out.print(house.getPhoto());
    }else{
        out.print("noImage.png");
    }%>" alt="image" width="100px" height="100px"></div>
        <table>
            <tr><th><a href="reviewOfAllAds.jsp?ads=<%=i%>&index=<%=index%>" title="review"><%=house.getTitle()%></a></th></tr>
            <tr><td><%=house.getPrice()%>$</td></tr>
        </table>
    </div>
    <%}else {
                    break;
    }
    }
        int delta = 11;
        int key = 1;
        if(size > 10){
            for(int j = 1; j < 100; j++){
                if(size - delta < 0){
                    key = j;
                    break;
                }
                delta += 10;
            }
    %>
    <div class="pages" style="width: fit-content; margin: 0 auto">
        <%for(int ej = 1; ej <= key; ej++){
        %>
        <div class="each" style="margin-left: 2px; float: left; height: 30px; width: 30px; border-color: #000; background-color: white; padding: 5px">
            <p style="margin-top: 7px; text-align: center; font-family: 'Times New Roman'"><a href="adsBySubcategory.jsp?sc=1&page=<%=ej%>" style="text-decoration: none; color: #000;"><%=ej%></a></p>
        </div>
        <%}
        %>
    </div>
    <script>
        function colorPage() {
            var arr = document.getElementsByClassName("each");
            for(var x = 0; x < arr.length; x++){
                arr[0].style.backgroundColor = "white";
            }
            arr[<%=request.getParameter("page")%>-1].style.backgroundColor = "green";
        }
    </script>
    <%
            }
    }
        if(index == 2){
            list = subcategoryAds.getAdsBySubcategory(new Apartment(), request.getParameter("checkImage")
                    , request.getParameter("minPrice"), request.getParameter("maxPrice"), request.getParameter("location"));
            int size = list.size();
            Apartment apartment;
            for(int i = (pageNumber-1)*10; i < (pageNumber-1)*10+10; i++){
                if(i < list.size()){
                    apartment = (Apartment) list.get(i);
    %>
    <div class="indexAds">
        <div class="images"><img src="../webImages/apartment/<%
    if(apartment.getPhoto() != null){
        out.print(apartment.getPhoto());
    }else{
        out.print("noImage.png");
    }%>" alt="image" width="100px" height="100px"></div>
        <table>
            <tr><th><a href="reviewOfAllAds.jsp?ads=<%=i%>&index=<%=index%>" title="review"><%=apartment.getTitle()%></a></th></tr>
            <tr><td><%=apartment.getPrice()%>$</td></tr>
        </table>
    </div>
    <%}else {
        break;
    }
    }
        int delta = 11;
        int key = 1;
        if(size > 10){
            for(int j = 1; j < 100; j++){
                if(size - delta < 0){
                    key = j;
                    break;
                }
                delta += 10;
            }
    %>
    <div class="pages" style="width: fit-content; margin: 0 auto">
        <%for(int ej = 1; ej <= key; ej++){
        %>
        <div class="each" style="margin-left: 2px; float: left; height: 30px; width: 30px; border-color: #000; background-color: white; padding: 5px">
            <p style="margin-top: 7px; text-align: center; font-family: 'Times New Roman'"><a href="adsBySubcategory.jsp?sc=2&page=<%=ej%>" style="text-decoration: none; color: #000;"><%=ej%></a></p>
        </div>
        <%}
        %>
    </div>
    <script>
        function colorPage() {
            var arr = document.getElementsByClassName("each");
            for(var x = 0; x < arr.length; x++){
                arr[0].style.backgroundColor = "white";
            }
            arr[<%=request.getParameter("page")%>-1].style.backgroundColor = "green";
        }
    </script>
    <%
            }
        }

        if(index == 3){
            list = subcategoryAds.getAdsBySubcategory(new Car(), request.getParameter("checkImage")
                    , request.getParameter("minPrice"), request.getParameter("maxPrice"), request.getParameter("location"));
            int size = list.size();
            Car car;
            for(int i = (pageNumber-1)*10; i < (pageNumber-1)*10+10; i++){
                if(i < list.size()){
                    car = (Car) list.get(i);
    %>
    <div class="indexAds">
        <div class="images"><img src="../webImages/car/<%
    if(car.getPhoto() != null){
        out.print(car.getPhoto());
    }else{
        out.print("noImage.png");
    }%>" alt="image" width="100px" height="100px"></div>
        <table>
            <tr><th><a href="reviewOfAllAds.jsp?ads=<%=i%>&index=<%=index%>" title="review"><%=car.getTitle()%></a></th></tr>
            <tr><td><%=car.getPrice()%>$</td></tr>
        </table>
    </div>
    <%}else {
        break;
    }
    }
        int delta = 11;
        int key = 1;
        if(size > 10){
            for(int j = 1; j < 100; j++){
                if(size - delta < 0){
                    key = j;
                    break;
                }
                delta += 10;
            }
    %>
    <div class="pages" style="width: fit-content; margin: 0 auto">
        <%for(int ej = 1; ej <= key; ej++){
        %>
        <div class="each" style="margin-left: 2px; float: left; height: 30px; width: 30px; border-color: #000; background-color: white; padding: 5px">
            <p style="margin-top: 7px; text-align: center; font-family: 'Times New Roman'"><a href="adsBySubcategory.jsp?sc=3&page=<%=ej%>" style="text-decoration: none; color: #000;"><%=ej%></a></p>
        </div>
        <%}
        %>
    </div>
    <script>
        function colorPage() {
            var arr = document.getElementsByClassName("each");
            for(var x = 0; x < arr.length; x++){
                arr[0].style.backgroundColor = "white";
            }
            arr[<%=request.getParameter("page")%>-1].style.backgroundColor = "green";
        }
    </script>
    <%
            }
        }

        if(index == 4){
            list = subcategoryAds.getAdsBySubcategory(new Motorcycle(), request.getParameter("checkImage")
                    , request.getParameter("minPrice"), request.getParameter("maxPrice"), request.getParameter("location"));
            int size = list.size();
            Motorcycle motorcycle;
            for(int i = (pageNumber-1)*10; i < (pageNumber-1)*10+10; i++){
                if(i < list.size()){
                    motorcycle = (Motorcycle) list.get(i);
    %>
    <div class="indexAds">
        <div class="images"><img src="../webImages/motorcycle/<%
    if(motorcycle.getPhoto() != null){
        out.print(motorcycle.getPhoto());
    }else{
        out.print("noImage.png");
    }%>" alt="image" width="100px" height="100px"></div>
        <table>
            <tr><th><a href="reviewOfAllAds.jsp?ads=<%=i%>&index=<%=index%>" title="review"><%=motorcycle.getTitle()%></a></th></tr>
            <tr><td><%=motorcycle.getPrice()%>$</td></tr>
        </table>
    </div>
    <%}else {
        break;
    }
    }
        int delta = 11;
        int key = 1;
        if(size > 10){
            for(int j = 1; j < 100; j++){
                if(size - delta < 0){
                    key = j;
                    break;
                }
                delta += 10;
            }
    %>
    <div class="pages" style="width: fit-content; margin: 0 auto">
        <%for(int ej = 1; ej <= key; ej++){
        %>
        <div class="each" style="margin-left: 2px; float: left; height: 30px; width: 30px; border-color: #000; background-color: white; padding: 5px">
            <p style="margin-top: 7px; text-align: center; font-family: 'Times New Roman'"><a href="adsBySubcategory.jsp?sc=4&page=<%=ej%>" style="text-decoration: none; color: #000;"><%=ej%></a></p>
        </div>
        <%}
        %>
    </div>
    <script>
        function colorPage() {
            var arr = document.getElementsByClassName("each");
            for(var x = 0; x < arr.length; x++){
                arr[0].style.backgroundColor = "white";
            }
            arr[<%=request.getParameter("page")%>-1].style.backgroundColor = "green";
        }
    </script>
    <%
            }
        }

        if(index == 5){
            list = subcategoryAds.getAdsBySubcategory(new Notebook(), request.getParameter("checkImage")
                    , request.getParameter("minPrice"), request.getParameter("maxPrice"), request.getParameter("location"));
            int size = list.size();
            Notebook notebook;
            for(int i = (pageNumber-1)*10; i < (pageNumber-1)*10+10; i++){
                if(i < list.size()){
                    notebook = (Notebook) list.get(i);
    %>
    <div class="indexAds">
        <div class="images"><img src="../webImages/notebook/<%
    if(notebook.getPhoto() != null){
        out.print(notebook.getPhoto());
    }else{
        out.print("noImage.png");
    }%>" alt="image" width="100px" height="100px"></div>
        <table>
            <tr><th><a href="reviewOfAllAds.jsp?ads=<%=i%>&index=<%=index%>" title="review"><%=notebook.getTitle()%></a></th></tr>
            <tr><td><%=notebook.getPrice()%>$</td></tr>
        </table>
    </div>
    <%}else {
        break;
    }
    }
        int delta = 11;
        int key = 1;
        if(size > 10){
            for(int j = 1; j < 100; j++){
                if(size - delta < 0){
                    key = j;
                    break;
                }
                delta += 10;
            }
    %>
    <div class="pages" style="width: fit-content; margin: 0 auto">
        <%for(int ej = 1; ej <= key; ej++){
        %>
        <div class="each" style="margin-left: 2px; float: left; height: 30px; width: 30px; border-color: #000; background-color: white; padding: 5px">
            <p style="margin-top: 7px; text-align: center; font-family: 'Times New Roman'"><a href="adsBySubcategory.jsp?sc=5&page=<%=ej%>" style="text-decoration: none; color: #000;"><%=ej%></a></p>
        </div>
        <%}
        %>
    </div>
    <script>
        function colorPage() {
            var arr = document.getElementsByClassName("each");
            for(var x = 0; x < arr.length; x++){
                arr[0].style.backgroundColor = "white";
            }
            arr[<%=request.getParameter("page")%>-1].style.backgroundColor = "green";
        }
    </script>
    <%
            }
        }

        if(index == 6){
            list = subcategoryAds.getAdsBySubcategory(new Phone(), request.getParameter("checkImage")
                    , request.getParameter("minPrice"), request.getParameter("maxPrice"), request.getParameter("location"));
            int size = list.size();
            Phone phone;
            for(int i = (pageNumber-1)*10; i < (pageNumber-1)*10+10; i++){
                if(i < list.size()){
                    phone = (Phone) list.get(i);
    %>
    <div class="indexAds">
        <div class="images"><img src="../webImages/phone/<%
    if(phone.getPhoto() != null){
        out.print(phone.getPhoto());
    }else{
        out.print("noImage.png");
    }%>" alt="image" width="100px" height="100px"></div>
        <table>
            <tr><th><a href="reviewOfAllAds.jsp?ads=<%=i%>&index=<%=index%>" title="review"><%=phone.getTitle()%></a></th></tr>
            <tr><td><%=phone.getPrice()%>$</td></tr>
        </table>
    </div>
    <%}else {
        break;
    }
    }
        int delta = 11;
        int key = 1;
        if(size > 10){
            for(int j = 1; j < 100; j++){
                if(size - delta < 0){
                    key = j;
                    break;
                }
                delta += 10;
            }
    %>
    <div class="pages" style="width: fit-content; margin: 0 auto">
        <%for(int ej = 1; ej <= key; ej++){
        %>
        <div class="each" style="margin-left: 2px; float: left; height: 30px; width: 30px; border-color: #000; background-color: white; padding: 5px">
            <p style="margin-top: 7px; text-align: center; font-family: 'Times New Roman'"><a href="adsBySubcategory.jsp?sc=6&page=<%=ej%>" style="text-decoration: none; color: #000;"><%=ej%></a></p>
        </div>
        <%}
        %>
    </div>
    <script>
        function colorPage() {
            var arr = document.getElementsByClassName("each");
            for(var x = 0; x < arr.length; x++){
                arr[0].style.backgroundColor = "white";
            }
            arr[<%=request.getParameter("page")%>-1].style.backgroundColor = "green";
        }
    </script>
    <%
            }
        }

        if(index == 7){
            list = subcategoryAds.getAdsBySubcategory(new Tablet(), request.getParameter("checkImage")
                    , request.getParameter("minPrice"), request.getParameter("maxPrice"), request.getParameter("location"));
            int size = list.size();
            Tablet tablet;
            for(int i = (pageNumber-1)*10; i < (pageNumber-1)*10+10; i++){
                if(i < list.size()){
                    tablet = (Tablet) list.get(i);
    %>
    <div class="indexAds">
        <div class="images"><img src="../webImages/tablet/<%
    if(tablet.getPhoto() != null){
        out.print(tablet.getPhoto());
    }else{
        out.print("noImage.png");
    }%>" alt="image" width="100px" height="100px"></div>
        <table>
            <tr><th><a href="reviewOfAllAds.jsp?ads=<%=i%>&index=<%=index%>" title="review"><%=tablet.getTitle()%></a></th></tr>
            <tr><td><%=tablet.getPrice()%>$</td></tr>
        </table>
    </div>
    <%}else {
        break;
    }
    }
        int delta = 11;
        int key = 1;
        if(size > 10){
            for(int j = 1; j < 100; j++){
                if(size - delta < 0){
                    key = j;
                    break;
                }
                delta += 10;
            }
    %>
    <div class="pages" style="width: fit-content; margin: 0 auto">
        <%for(int ej = 1; ej <= key; ej++){
        %>
        <div class="each" style="margin-left: 2px; float: left; height: 30px; width: 30px; border-color: #000; background-color: white; padding: 5px">
            <p style="margin-top: 7px; text-align: center; font-family: 'Times New Roman'"><a href="adsBySubcategory.jsp?sc=7&page=<%=ej%>" style="text-decoration: none; color: #000;"><%=ej%></a></p>
        </div>
        <%}
        %>
    </div>
    <script>
        function colorPage() {
            var arr = document.getElementsByClassName("each");
            for(var x = 0; x < arr.length; x++){
                arr[0].style.backgroundColor = "white";
            }
            arr[<%=request.getParameter("page")%>-1].style.backgroundColor = "green";
        }
    </script>
    <%
            }
        }
    %>
</div>
</body>
</html>
