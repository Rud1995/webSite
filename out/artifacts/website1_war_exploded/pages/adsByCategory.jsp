<%@ page import="web_src.CategoryAds" %>
<%@ page import="java.util.List" %>
<%@ page import="mapping.*" %>
<%@ page import="javafx.scene.control.Tab" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="headerTemplate.jsp"%>
<html>
<head>
    <title>Ads</title>
    <link href="../css/subCAds.css" rel="stylesheet" type="text/css">
    <script src="../js/jquery-3.2.1.min.js"></script>
    <script src="../js/animationsOfLogReg.js"></script>
    <script src="../js/regValidator.js"></script>
</head>
<body>

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

    CategoryAds categoryAds = new CategoryAds();
    List list;
%>
<div id="wrapper" style="height: auto; max-height: 2100px">
    <%
        /////////////////////////////////////////////////////////
        if(index == 1) {
            list = categoryAds.getCategoryAds(new House());
            int size1 = list.size();
            House house;
            for (int i = (pageNumber-1)*5; i < (pageNumber-1)*5+5; i++) {
                if(i < list.size()){
                    house = (House) list.get(i);
    %>
    <div class="indexAds">
        <div class="images" style="float: left"><img src="../webImages/house/<%
    if(house.getPhoto() != null){
        out.print(house.getPhoto());
    }else{
        out.print("noImage.png");
    }%>" alt="image" width="100px" height="100px"></div>
        <table>
            <tr><th><a href="reviewOfAllAds.jsp?index=1&ads=<%=i%>" title="review"><%=house.getTitle()%></a></th></tr>
            <tr><td><%=house.getPrice()%>$</td></tr>
        </table>
    </div>
    <%}else {
        break;
    }
    }

        list = categoryAds.getCategoryAds(new Apartment());
        int size2 = list.size();
        Apartment apartment;
        for (int i = (pageNumber-1)*5; i < (pageNumber-1)*5+5; i++) {
            if(i < list.size()){
                apartment = (Apartment) list.get(i);
    %>
    <div class="indexAds">
        <div class="images" style="float: left"><img src="../webImages/apartment/<%
    if(apartment.getPhoto() != null){
        out.print(apartment.getPhoto());
    }else{
        out.print("noImage.png");
    }%>" alt="image" width="100px" height="100px"></div>
        <table>
            <tr><th><a href="reviewOfAllAds.jsp?index=2&ads=<%=i%>" title="review"><%=apartment.getTitle()%></a></th></tr>
            <tr><td><%=apartment.getPrice()%>$</td></tr>
        </table>
    </div>
    <%}else {
        break;
    }
    }

        int size = size1 + size2;
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
        <div class="each" style="margin-left: 2px; float: left; height: 30px; width: 30px; border-color: #B5DEAC; background-color: white; padding: 5px">
            <p style="margin-top: 7px; text-align: center; font-family: 'Times New Roman'"><a href="adsByCategory.jsp?sc=1&page=<%=ej%>" style="text-decoration: none; color: #000;"><%=ej%></a></p>
        </div>
        <%}
        %>
    </div>
    <%
            }
        }

        ////////////////////////////////////////////////////////
        if(index == 2) {
            list = categoryAds.getCategoryAds(new Car());
            int size1 = list.size();
            Car car;
            for (int i = (pageNumber-1)*5; i < (pageNumber-1)*5+5; i++) {
                if(i < list.size()){
                    car = (Car) list.get(i);
    %>
    <div class="indexAds">
        <div class="images" style="float: left"><img src="../webImages/car/<%
    if(car.getPhoto() != null){
        out.print(car.getPhoto());
    }else{
        out.print("noImage.png");
    }%>" alt="image" width="100px" height="100px"></div>
        <table>
            <tr><th><a href="reviewOfAllAds.jsp?index=3&ads=<%=i%>" title="review"><%=car.getTitle()%></a></th></tr>
            <tr><td><%=car.getPrice()%>$</td></tr>
        </table>
    </div>
    <%}else {
        break;
    }
    }

        list = categoryAds.getCategoryAds(new Motorcycle());
        int size2 = list.size();
        Motorcycle motorcycle;
        for (int i = (pageNumber-1)*5; i < (pageNumber-1)*5+5; i++) {
            if(i < list.size()){
                motorcycle = (Motorcycle) list.get(i);
    %>
    <div class="indexAds">
        <div class="images" style="float: left"><img src="../webImages/motorcycle/<%
    if(motorcycle.getPhoto() != null){
        out.print(motorcycle.getPhoto());
    }else{
        out.print("noImage.png");
    }%>" alt="image" width="100px" height="100px"></div>
        <table>
            <tr><th><a href="reviewOfAllAds.jsp?index=4&ads=<%=i%>" title="review"><%=motorcycle.getTitle()%></a></th></tr>
            <tr><td><%=motorcycle.getPrice()%>$</td></tr>
        </table>
    </div>
    <%}else {
        break;
    }
    }

        int size = size1 + size2;
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
        <div class="each" style="margin-left: 2px; float: left; height: 30px; width: 30px; border-color: #B5DEAC; background-color: white; padding: 5px">
            <p style="margin-top: 7px; text-align: center; font-family: 'Times New Roman'"><a href="adsByCategory.jsp?sc=1&page=<%=ej%>" style="text-decoration: none; color: #000;"><%=ej%></a></p>
        </div>
        <%}
        %>
    </div>
    <%
            }
        }

        ////////////////////////////////////////////////////////
        if(index == 3) {
            list = categoryAds.getCategoryAds(new Notebook());
            int size1 = list.size();
            Notebook notebook;
            for (int i = (pageNumber-1)*4; i < (pageNumber-1)*4+4; i++) {
                if(i < list.size()){
                    notebook = (Notebook) list.get(i);
    %>
    <div class="indexAds">
        <div class="images" style="float: left"><img src="../webImages/notebook/<%
    if(notebook.getPhoto() != null){
        out.print(notebook.getPhoto());
    }else{
        out.print("noImage.png");
    }%>" alt="image" width="100px" height="100px"></div>
        <table>
            <tr><th><a href="reviewOfAllAds.jsp?index=5&ads=<%=i%>" title="review"><%=notebook.getTitle()%></a></th></tr>
            <tr><td><%=notebook.getPrice()%>$</td></tr>
        </table>
    </div>
    <%}else {
        break;
    }
    }

        list = categoryAds.getCategoryAds(new Phone());
        int size2 = list.size();
        Phone phone;
        for (int i = (pageNumber-1)*4; i < (pageNumber-1)*4+4; i++) {
            if(i < list.size()){
                phone = (Phone) list.get(i);
    %>
    <div class="indexAds">
        <div class="images" style="float: left"><img src="../webImages/phone/<%
    if(phone.getPhoto() != null){
        out.print(phone.getPhoto());
    }else{
        out.print("noImage.png");
    }%>" alt="image" width="100px" height="100px"></div>
        <table>
            <tr><th><a href="reviewOfAllAds.jsp?index=6&ads=<%=i%>" title="review"><%=phone.getTitle()%></a></th></tr>
            <tr><td><%=phone.getPrice()%>$</td></tr>
        </table>
    </div>
    <%}else {
        break;
    }
    }

        list = categoryAds.getCategoryAds(new Tablet());
        int size3 = list.size();
        Tablet tablet;
        for (int i = (pageNumber-1)*2; i < (pageNumber-1)*2+2; i++) {
            if(i < list.size()){
                tablet = (Tablet) list.get(i);
    %>
    <div class="indexAds">
        <div class="images" style="float: left"><img src="../webImages/tablet/<%
    if(tablet.getPhoto() != null){
        out.print(tablet.getPhoto());
    }else{
        out.print("noImage.png");
    }%>" alt="image" width="100px" height="100px"></div>
        <table>
            <tr><th><a href="reviewOfAllAds.jsp?index=7&ads=<%=i%>" title="review"><%=tablet.getTitle()%></a></th></tr>
            <tr><td><%=tablet.getPrice()%>$</td></tr>
        </table>
    </div>
    <%}else {
        break;
    }
    }

        int size = size1 + size2 + size3;
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
        <div class="each" style="margin-left: 2px; float: left; height: 30px; width: 30px; border-color: #B5DEAC; background-color: white; padding: 5px">
            <p style="margin-top: 7px; text-align: center; font-family: 'Times New Roman'"><a href="adsByCategory.jsp?sc=1&page=<%=ej%>" style="text-decoration: none; color: #000;"><%=ej%></a></p>
        </div>
        <%}
        %>
    </div>
    <%
            }
        }
    %>
</div>
</body>
</html>
