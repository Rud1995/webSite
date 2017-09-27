<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="web_src.LogRegModel" %>
<head>
    <link href="../css/headerTemplateStyle.css" rel="stylesheet" type="text/css">
    <script src="../js/jquery-3.2.1.min.js"></script>
    <script src="../js/animationOfTemplatePage.js"></script>
</head>
<!--header-->
<header>
    <div id="headerWrapper">
        <div id="home"><a href="myPage.jsp">My page</a></div>

        <div id="keyOpenList">
            <div id="category"><label><b>Category</b><img id="arrow1" src="../detailesImages/arrow-down.png" hspace="3px" alt="no-image" width="15px" height="15px"></label></div>

            <div id="category_list">
                <ul>
                    <li class="dropdown">
                        <a href="adsByCategory.jsp?sc=1&page=1">Real Estate</a>
                        <div class="dropdown-content">
                            <a href="adsBySubcategory.jsp?sc=1&page=1">Houses</a>
                            <a href="adsBySubcategory.jsp?sc=2&page=1">Apartments</a>
                        </div>
                    </li>
                    <li class="dropdown">
                        <a href="adsByCategory.jsp?sc=2&page=1">Vehicle</a>
                        <div class="dropdown-content">
                            <a href="adsBySubcategory.jsp?sc=3&page=1">Passenger Cars</a>
                            <a href="adsBySubcategory.jsp?sc=4&page=1">Motorcycles</a>
                        </div>
                    </li>
                    <li class="dropdown">
                        <a href="adsByCategory.jsp?sc=3&page=1">Electronics</a>
                        <div class="dropdown-content">
                            <a href="adsBySubcategory.jsp?sc=5&page=1">Notebooks</a>
                            <a href="adsBySubcategory.jsp?sc=6&page=1">Phones</a>
                            <a href="adsBySubcategory.jsp?sc=7&page=1">Tablets</a>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <div id="search">
        <form action="searchPreview.jsp">
        <input width="200px" placeholder="Search by Title" name="search">
        <a href="JavaScript:void(0);"><img src="../detailesImages/search.png" onclick="submitSearchForm();" width="40px" height="40px"></a>
            <script>
                function submitSearchForm() {
                    document.forms[0].submit();
                }
            </script>
        </form>
    </div>
    <div id="login"><label><b>Log-in</b><img id="arrow2Log" src="../detailesImages/arrow-down.png" alt="no-image" hspace="3px" width="15px" height="15px"></label></div>
    <div id="openFormLog" class="login_reg_form" style="display: none">
        <form action="log-in.jsp" method="post">
            <input type="text" name="username" placeholder="Username" required><br>
            <input type="password" name="password" placeholder="Password" required><br>
            <div class="center"><input id="subLog" type="submit" name="send" value="Log in"></div>
        </form>
    </div>
    <div id="register"><label><b>Register</b><img id="arrow2Reg" src="../detailesImages/arrow-down.png" alt="no-image" hspace="3px" width="15px" height="15px"></label></label></div>
    <div id="openformReg" class="login_reg_form" style="display: none">
        <form action="headerTemplate.jsp" method="get" onsubmit="return sendIfValid()">
            <input id="name" type="text" name="name" placeholder="Name" required><br>
            <input id="surname" type="text" name="surname" placeholder="Surname" required><br>
            <input id="age" type="number" name="age" placeholder="Age" required><br>
            <input id="address" type="text" name="address" placeholder="Address" required><br>
            <input id="phone" type="number" name="phone" placeholder="Phone" required><br>
            <input id="email" type="email" name="email" placeholder="Email" required><br>
            <input id="username" type="text" name="username" placeholder="Username" required><br>
            <input id="password" type="password" name="password" placeholder="Password" required><br>
            <input id="passwordAgain" type="password" name="passwordAgain" placeholder="Type Password Again" required><br>
            <div class="center"><input id="subReg" type="submit" name="register" value="Register"></div>
        </form>
        <%
            if(request.getParameter("register") != null){
                LogRegModel logRegModel = new LogRegModel();

                String name = request.getParameter("name");
                String surname = request.getParameter("surname");
                byte age = Byte.parseByte(request.getParameter("age"));
                String address = request.getParameter("address");
                int phone = Integer.parseInt(request.getParameter("phone"));
                String email = request.getParameter("email");
                String username = request.getParameter("username");
                String password = request.getParameter("password");



                if(logRegModel.saveNewUser(name, surname, username, password, age, address, email, phone) == true){
        %><script>alert("You registered successfully");</script><%
    }else {
    %><script>alert("Try another Username or Password");</script><%
            }
        }
    %>
    </div>
    </div>
</header>
<!--filter-->
<div id="filter" style="display: none">
    <div id="filterWrapper">
        <%
            String query = request.getQueryString()+"&";

            int indexOfFirstEq = query.indexOf('=', 0);
            int indexOfFirstAnd = query.indexOf('&', 0);

            int lastIndexOfEq = query.indexOf('=', indexOfFirstEq+1);
            int lastIndexOfAnd = query.indexOf('&', indexOfFirstAnd+1);
        %>
        <form action="adsBySubcategory.jsp" name="filter" method="get">
            <input type="hidden" name="sc" value="<%if(query.contains("sc") && query.contains("page")){
                out.print(query.substring(indexOfFirstEq+1, indexOfFirstAnd));
            }else {
                out.print(1);
            }%>">
            <input type="hidden" name="page" value="<%if(query.contains("sc") && query.contains("page")){
                out.print(query.substring(lastIndexOfEq+1, lastIndexOfAnd));
            }else {
                out.print(1);
            }%>">
            <label id="checkbox" class="left">
                <input type="checkbox" id="checkForImage" name="checkImage" value="show" style="outline-width: 0">with image
            </label>

            <div id="priceSpace" class="left"><input type="number" name="minPrice" width="40px" height="40px" style="outline-width: 0">-
                <input type="number" name="maxPrice" width="40px" height="40px" style="outline-width: 0">:price</div>
            <div id="locationSelect" class="left">
                <select style="outline-width: 0" name="location">
                    <option disabled selected>Choose</option><option value="yerevan">Yerevan</option><option value="dilijan">Dilijan</option>
                    <option value="idjevan">Idjevan</option><option value="spitak">Spitak</option><option value="gyumri">Gyumri</option>
                    <option value="lori">Lori</option><option value="chambarak">Chambarak</option><option value="hrazdan">Hrazdan</option>
                    <option value="sevan">Sevan</option><option value="aparan">Aparan</option>
                </select>:Location
            </div>
            <div class="left"><a href=""><input id="submitFilter" type="submit" name="send" value="Filter" style="outline-width: 0; width: 80px; height: 30px; background-color: white; text-align: center; border: 1px solid black"></a></div>
        </form>
    </div>
</div>
