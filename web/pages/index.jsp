<%@ page import="web_src.LatestAds" %>
<%@ page import="mapping.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="headerTemplate.jsp"%>
<html>
<head>
  <title>Home page</title>
  <link href="../css/indexStyle.css" rel="stylesheet" type="text/css">
  <script src="../js/jquery-3.2.1.min.js"></script>
  <script src="../js/animationsOfLogReg.js"></script>
  <script src="../js/regValidator.js"></script>
</head>
<body>
<%
  if(request.getAttribute("user") != null){
%><script>
    alert("You ain't user yet ||| Please Register first");
</script> <%
  }
%>

<%
  if(session.getAttribute("user") != null){
    session.invalidate();
  }

  if(request.getParameter("account") != null){
%><script>
    alert("Your account was successfully deleted");
</script><%
  }
%>

<!--all links bellow role-->
<style>
  a {
    text-decoration: none;
    color: darkslategray;
  }
</style>

<!--wrapper-->
<div id="wrapper">
  <div style="margin: 0 auto; width: 80px"><h4 style="margin-top: -25px; color: seagreen;">Latest Ads</h4></div>
  <%
    LatestAds latestAds = new LatestAds();
    /*get each mapping classes out*/
    Apartment apartment = (Apartment) latestAds.getLatestAds(new Apartment());
    if(apartment != null){
  %>
  <div class="indexAds">
    <div class="images"><img src="../webImages/apartment/<%
    if(apartment.getPhoto() != null){
        out.print(apartment.getPhoto());
    }else{
        out.print("noImage.png");
    }%>" alt="image" width="100px" height="100px"></div>
    <table>
      <tr><th><a href="reviewOfIndexAds.jsp?index=2" title="review"><%=apartment.getTitle()%></a></th></tr>
      <tr><td><%=apartment.getPrice()%>$</td></tr>
    </table>
  </div>
  <%
    }
    Car car = (Car) latestAds.getLatestAds(new Car());
    if(car != null){
  %>
  <div class="indexAds">
    <div class="images"><img src="../webImages/car/<%
    if(car.getPhoto() != null){
        out.print(car.getPhoto());
    }else{
        out.print("noImage.png");
    }%>" alt="image" width="100px" height="100px"></div>
    <table>
      <tr><th><a href="reviewOfIndexAds.jsp?index=3" title="review"><%=car.getTitle()%></a></th></tr>
      <tr><td><%=car.getPrice()%>$</td></tr>
    </table>
  </div>
  <%
    }
    House house = (House) latestAds.getLatestAds(new House());
    if(house != null){
  %>
  <div class="indexAds">
    <div class="images"><img src="../webImages/house/<%
    if(house.getPhoto() != null){
        out.print(house.getPhoto());
    }else{
        out.print("noImage.png");
    }%>" alt="image" width="100px" height="100px"></div>
    <table>
      <tr><th><a href="reviewOfIndexAds.jsp?index=1" title="review"><%=house.getTitle()%></a></th></tr>
      <tr><td><%=house.getPrice()%>$</td></tr>
    </table>
  </div>
  <%
    }
    Motorcycle motorcycle = (Motorcycle) latestAds.getLatestAds(new Motorcycle());
    if(motorcycle != null){
  %>
  <div class="indexAds">
    <div class="images"><img src="../webImages/motorcycle/<%
    if(motorcycle.getPhoto() != null){
        out.print(motorcycle.getPhoto());
    }else{
        out.print("noImage.png");
    }%>" alt="image" width="100px" height="100px"></div>
    <table>
      <tr><th><a href="reviewOfIndexAds.jsp?index=4" title="review"><%=motorcycle.getTitle()%></a></th></tr>
      <tr><td><%=motorcycle.getPrice()%>$</td></tr>
    </table>
  </div>
  <%
    }
    Notebook notebook = (Notebook) latestAds.getLatestAds(new Notebook());
    if(notebook != null){
  %>
  <div class="indexAds">
    <div class="images"><img src="../webImages/notebook/<%
    if(notebook.getPhoto() != null){
        out.print(notebook.getPhoto());
    }else{
        out.print("noImage.png");
    }%>" alt="image" width="100px" height="100px"></div>
    <table>
      <tr><th><a href="reviewOfIndexAds.jsp?index=5" title="review"><%=notebook.getTitle()%></a></th></tr>
      <tr><td><%=notebook.getPrice()%>$</td></tr>
    </table>
  </div>
  <%
    }
    Phone phone = (Phone) latestAds.getLatestAds(new Phone());
    if(phone != null){
  %>
  <div class="indexAds">
    <div class="images"><img src="../webImages/phone/<%
    if(phone.getPhoto() != null){
        out.print(phone.getPhoto());
    }else{
        out.print("noImage.png");
    }%>" alt="image" width="100px" height="100px"></div>
    <table>
      <tr><th><a href="reviewOfIndexAds.jsp?index=6" title="review"><%=phone.getTitle()%></a></th></tr>
      <tr><td><%=phone.getPrice()%>$</td></tr>
    </table>
  </div>
  <%
    }
    Tablet tablet = (Tablet) latestAds.getLatestAds(new Tablet());
    if(tablet != null){
  %>
  <div class="indexAds">
    <div class="images"><img src="../webImages/tablet/<%
    if(tablet.getPhoto() != null){
        out.print(tablet.getPhoto());
    }else{
        out.print("noImage.png");
    }%>" alt="image" width="100px" height="100px"></div>
    <table>
      <tr><th><a href="reviewOfIndexAds.jsp?index=7" title="review"><%=tablet.getTitle()%></a></th></tr>
      <tr><td><%=tablet.getPrice()%>$</td></tr>
    </table>
  </div>
  <%
    }
  %>
</div>

<!--footer-->
<footer>

</footer>
</body>
</html>
