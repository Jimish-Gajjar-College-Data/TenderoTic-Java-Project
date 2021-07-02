<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
    response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server
    response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance
    response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
    response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility

    String TM_id = (String) session.getAttribute("TM_id");

    if (TM_id == null) {
        String site = new String("Front_page.jsp");

        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", site);
    }
%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>TenderoTic - <%=TM_id%></title>
        <link rel="shortcut icon" href="images/logo.png">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Minimal Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <link href="dashboard_css/bootstrap.min.css" rel='stylesheet' type='text/css' />
        <!-- Custom Theme files -->
        <link href="dashboard_css/style.css" rel='stylesheet' type='text/css' />
        <link href="dashboard_css/font-awesome.css" rel="stylesheet"> 
        <script src="dashboard_js/jquery.min.js"></script>
        <!-- Mainly scripts -->
        <script src="dashboard_js/jquery.metisMenu.js"></script>
        <script src="dashboard_js/jquery.slimscroll.min.js"></script>
        <!-- Custom and plugin javascript -->
        <link href="dashboard_css/custom.css" rel="stylesheet">
        <script src="dashboard_js/custom.js"></script>
        <script src="dashboard_js/screenfull.js"></script>
        <script>
            $(function () {
                $('#supported').text('Supported/allowed: ' + !!screenfull.enabled);
                if (!screenfull.enabled) {
                    return false;
                }
                $('#toggle').click(function () {
                    screenfull.toggle($('#container')[0]);
                });
            });
        </script>
        <!--Notification ajax-->
        <script>
            $(document).ready(function () {
                $('#id_1').click(function ()
                {
                    $.ajax({
                        url: "tm_notifi_ajax.jsp", //this is my servlet
                        success: function (msg) {
                            $('#id_2').html(msg);
                        }
                    });
                });
            });
        </script>
        <!--//Notification ajax-->
        <script>
            /*  Search Dropdown Script  */
            function myNewFunction(element) {
                var val1 = element.options[element.selectedIndex].text;
                if (val1 == "Title") {
                    $("#drop12").hide();
                    $("#drop1").show();
                } else if (val1 == "Category") {
                    $("#drop12").show();
                    $("#drop1").hide();
                } else {
                    $("#drop12").hide();
                    $("#drop1").hide();
                }
            }
            /*  // Search Dropdown Script  */

            /* For product inset hide and show */
            function myNewproduct(element) {
                var val2 = element.options[element.selectedIndex].text;
                if (val2 == "Other") {
                    $("#product_text").show();
                } else {
                    $("#product_text").hide();
                }
            }
            /* // For product inset hide and show */
        </script>
        <script>
            $(document).ready(function () {
                $('#product_sub').click(function ()
                {
                    var Product_name = document.getElementById('Product_name').value;
                    var Product_manufacture = document.getElementById('Product_manufacture').value;
                    var rangeinput = document.getElementById('rangeinput').value;
                    var Product_quantity = document.getElementById('Product_quantity').value;
                    var Product_man_date = document.getElementById('Product_man_date').value;
                    if (Product_name == '' || Product_manufacture == '' || rangeinput == '' || Product_quantity == '' || Product_man_date == '') {
                        alert('Please enter all fields....!!!');
                    } else {
                        $.ajax({
                            url: "tm_add_product_ajax.jsp", //this is my servlet
                            data: {product_name: Product_name, product_manufacture: Product_manufacture, Rangeinput: rangeinput, product_quantity: Product_quantity, product_man_date: Product_man_date},
                            //data: "input=" + val1,
                            success: function (msg) {
                                $("#product_text").empty();
                                $("#product").empty();
                                $('#product_text').html(msg);
                            }
                        });
                    }
                });
            });
        </script>
        <!-- Add product ajax -->
        <!-- // Add product ajax -->

        <!-- Slide menu display none -->
        <style>
            #page-wrapper2{  display: none;}
            #mySidenav{  display: none;}
            #drop1{  display: none;}
            #drop12{  display: none;}
            #page-wrapper{margin-left: 0}
        </style>
        <!-- // Slide menu display none -->
        <!----->
        <!--skycons-icons-->
        <script src="dashboard_js/skycons.js"></script>
        <!--//skycons-icons-->
    </head>
    <body>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/e-tender", "root", "");
        %>
        <div id="wrapper">
            <!------------  for last tender and not filed questions models  --------------->
            <!--                   <!-- // Question not filled model -->

            <!------------  // for last tender and not filed questions models  --------------->
            <!----->
            <nav class="navbar-default navbar-static-top" role="navigation">
                <div class="navbar-header" id="page-wrapper1">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>

                    <input type="checkbox" id="page-wrapper13" class="nav-trigger" />
                    <label for="nav-trigger"></label>
                </div>
                <div class="navbar-header" id="page-wrapper2">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <h1> <a class="navbar-brand"> TenderoTic</a></h1>         
                </div>

                <div class=" border-bottom">
                    <div class="full-left">
                        <section class="full-top" style="padding-left: 20px;">
                            <button id="toggle"><i class="fa fa-arrows-alt"></i></button>	
                        </section>

                        <form class=" navbar-left-right" action="tm_result_search.jsp">
                            <select name="drop_down" class="dropselect" id="drop" onChange="myNewFunction(this);">
                                <option>None</option>
                                <option>Category</option>
                                <option>Title</option>
                            </select>

                            <select name="drop12" id="drop12" class="dropselect">
                                <% PreparedStatement ps_co1 = con.prepareStatement("SELECT * FROM category");
                                    ResultSet rs_co1 = ps_co1.executeQuery();
                                    while (rs_co1.next()) {
                                %>
                                <option ><%=rs_co1.getString("title")%></option>
                                <%}%>
                            </select>

                            <select name="drop1" id="drop1"  class="dropselect">
                                <%
                                    int flag = 0;
                                    PreparedStatement ps_count = con.prepareStatement("SELECT * FROM tender_info where result_dec_date>now() ");
                                    ResultSet rs_count = ps_count.executeQuery();
                                    while (rs_count.next()) {
                                        flag = 1;
                                    }
                                    if (flag == 1) {
                                        PreparedStatement ps_co = con.prepareStatement("SELECT * FROM tender_info where result_dec_date>now() ");
                                        ResultSet rs_co = ps_co.executeQuery();
                                        while (rs_co.next()) {
                                %>
                                <option><%=rs_co.getString("title")%></option>
                                <%}
                                } else {%>
                                <option> No Data Found </option>
                                <%}%>
                            </select>
                            <input type="submit" value=""  class="fa fa-search">
                        </form>
                        <div class="clearfix"> </div>
                    </div>

                    <!-- Brand and toggle get grouped for better mobile display -->

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="drop-men" >
                        <ul class=" nav_1">
                            <li class="dropdown at-drop">
                                <%
                                    int fill_view = 0, result_view = 0, block_tender = 0, notification = 0;
                                    int counter = 0;
                                    PreparedStatement ps_notifi2 = con.prepareStatement("SELECT fill_tender_view , result_view,block_tender FROM tender_manager_login WHERE tm_id = '" + TM_id + "'");
                                    ResultSet rs_notifi2 = ps_notifi2.executeQuery();
                                    while (rs_notifi2.next()) {
                                        fill_view = rs_notifi2.getInt("fill_tender_view");
                                        result_view = rs_notifi2.getInt("result_view");
                                        block_tender = rs_notifi2.getInt("block_tender");

                                    }
                                    notification = fill_view + result_view + block_tender;
                                    if (notification != 0) {
                                        counter++;
                                %>
                                <script>
                                    $(document).ready(function f() {
                                        var val = $("#a_info").html();
                                        $("#a_info").show();
                                        $("#a_info").html();
                                    });
                                </script>
                                <%} else if (notification == 0) {%>
                                <script>

                                    $(document).ready(function f() {

                                        var val = $("#a_info").html();
                                        $("#a_info").hide();
                                        $("#a_info").html("No Message Till Now");

                                    });
                                </script>

                                <% } %>
                                <%
                                    int read = 0;
                                    int cal1 = 0;
                                    cal1 = fill_view;
                                    if (cal1 != 0) {
                                %>        
                                <script>
                                    $(document).ready(function f() {
                                        var val1 = $("#A_info").html();
                                        $("#A_info").show();
                                        $("#A_info").html();
                                    });
                                </script>
                                <%} else if (cal1 == 0) {%>
                                <script>
                                    $(document).ready(function f() {
                                        var val = $("#A_info").html();
                                        $("#A_info").hide();
                                        $("#A_info").html("No Message Till Now");
                                    });
                                </script>
                                <%}%>
                                <%
                                    int read2 = 0;
                                    int cal3 = 0;
                                    cal3 = result_view;
                                    if (cal3 != 0) {
                                %>        
                                <script>
                                    $(document).ready(function f() {
                                        var val4 = $("#C_info").html();
                                        $("#C_info").show();
                                        $("#C_info").html();
                                    });
                                </script>
                                <%} else if (cal3 == 0) {%>
                                <script>
                                    $(document).ready(function f() {
                                        var val5 = $("#C_info").html();
                                        $("#C_info").hide();
                                        $("#C_info").html("No Message Till Now");
                                    });
                                </script>
                                <%}%>
                                <%
                                    int admin = 0;
                                    int cal4 = 0;
                                    int counter1 = 0;
                                    cal4 = block_tender;
                                    if (cal4 != 0) {
                                        counter1++;
                                %>
                                <script>
                                    $(document).ready(function f() {
                                        var val6 = $("#D_info").html();
                                        $("#D_info").show();
                                        $("#D_info").html();
                                    });
                                </script>
                                <%} else if (cal4 == 0) {%>
                                <script>
                                    $(document).ready(function f() {
                                        var val7 = $("#D_info").html();
                                        $("#D_info").hide();
                                        $("#D_info").html("No Message Till Now");
                                    });
                                </script>
                                <%}%>
                                <a id="id_2" href="#" class="dropdown-toggle dropdown-at " data-toggle="dropdown">
                                    <i  id="id_1" class="fa fa-globe"></i> <span class="number"><%= cal1 + cal3 + cal4%></span></a>
                                <ul class="dropdown-menu menu1 " role="menu">
                                    <%
                                        int j = 0;
                                    %>
                                    <li id="A_info"><a href="#">
                                            <div class="user-new">
                                                <p><%=cal1%> New Filled Tenders</p>
                                            </div>
                                            <div class="user-new-left">
                                                <i class="fa fa-user-plus"></i>
                                            </div>
                                            <div class="clearfix"> </div>
                                        </a></li>
                                        <%
                                            int id1[] = new int[cal3];
                                            int j1 = 0;
                                            if (cal3 > 0) {
                                                PreparedStatement ps_ne = con.prepareStatement("select t.tender_id from  result_tender t,tender_info ti where t.tender_id=ti.tender_id and ti.tm_id='" + TM_id + "'");
                                                ResultSet rs_ne = ps_ne.executeQuery();
                                                while (rs_ne.next()) {
                                                    id1[j1] = rs_ne.getInt("t.tender_id");
                                                    j1++;
                                                }
                                            }
                                            for (int k = 0; k < cal3; k++) {
                                        %>
                                    <li id="C_info"><a href="#">
                                            <div class="user-new">
                                                <p><%=id1[k]%> Tender's Result Declared</p>
                                            </div>
                                            <div class="user-new-left">
                                                <i class="fa fa-heart"></i>
                                            </div>
                                            <div class="clearfix"> </div>
                                        </a></li>
                                        <%}%>
                                        <%
                                            int id3[] = new int[cal4];
                                            int j2 = 0;
                                            if (cal4 > 0) {
                                                PreparedStatement ps_ = con.prepareStatement("select tender_id from  tender_info   WHERE tm_id = '" + TM_id + "' and block=1");
                                                ResultSet rs_ = ps_.executeQuery();
                                                while (rs_.next()) {
                                                    id3[j2] = rs_.getInt("tender_id");
                                                    j2++;
                                                }
                                            }
                                            for (int l = 0; l < cal4; l++) {
                                        %> 
                                    <li id="D_info"><a href="#">
                                            <div class="user-new">
                                                <p><%=id3[l]%> Tender blocked by admin</p>
                                            </div>
                                            <div class="user-new-left">
                                                <i class="fa fa-lock"></i>
                                            </div>
                                            <div class="clearfix"> </div>
                                        </a></li>
                                        <%}%>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <%
                                    String path = "profile_pic\\";

                                    PreparedStatement ps = con.prepareStatement("select profilepic_path from tender_manager_regis_tab where tm_id='" + TM_id + "'");
                                    ResultSet rs = ps.executeQuery();
                                    String imgLen = "";
                                    if (rs.next()) {
                                        imgLen = rs.getString("profilepic_path");
                                        System.out.println(imgLen);
                                    }

                                    path += imgLen;
                                %>
                                <a href="#" class="dropdown-toggle dropdown-at" data-toggle="dropdown"><span class=" name-caret"><%=TM_id%><i class="caret"></i></span><img src="<%= path%>" height="60" width="60"></a>
                                <ul class="dropdown-menu " role="menu">
                                    <li><a href="tm_profile.jsp"><i class="fa fa-user"></i>Edit Profile</a></li>
                                    <li><a href="tm_change_pass.jsp"><i class="fa fa-lock"></i>Change Password</a></li>
                                    <li><a href="TM_logout"><i class="fa fa-clipboard"></i>Logout</a></li>
                                </ul>
                            </li>

                        </ul>
                    </div><!-- /.navbar-collapse -->
                    <div class="clearfix">

                    </div>

                    <div id="mySidenav">
                        <div class="navbar-default sidebar" role="navigation">
                            <div class="sidebar-nav navbar-collapse">
                                <ul class="nav" id="side-menu">
                                    <li>
                                        <a href="tm_dashboard.jsp" class="hvr-bounce-to-right"><i class="fa fa-dashboard nav_icon "></i><span class="nav-label">Dashboards</span> </a>
                                    </li>
                                    <li>
                                        <a href="#" class=" hvr-bounce-to-right"><i class="fa fa-file-text-o nav_icon"></i> <span class="nav-label">Manage Tender</span><span class="fa arrow"></span></a>
                                        <ul class="nav nav-second-level">
                                            <li><a href="tm__view_tender.jsp" class=" hvr-bounce-to-right"> <i class="fa fa-list nav_icon"></i>View Tender</a></li>
                                            <li><a href="tm_update_tender.jsp" class=" hvr-bounce-to-right"> <i class="fa fa-check-square-o nav_icon"></i>Update Tender</a></li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="tm_post_tender.jsp" class=" hvr-bounce-to-right"><i class="fa fa-upload nav_icon"></i> <span class="nav-label">Post Tender</span></a>
                                    </li>
                                    <li>
                                        <a href="tm_select_result_tender.jsp" class=" hvr-bounce-to-right"><i  class="fa fa-check-square-o nav_icon"></i> <span class="nav-label">Result</span> </a>
                                    </li>
                                    <li>
                                        <a href="#" class=" hvr-bounce-to-right"><i class="fa fa-history nav_icon"></i> <span class="nav-label" >History</span><span class="fa arrow"></span></a>
                                        <ul class="nav nav-second-level">
                                            <li><a href="tm_tender_history.jsp" class=" hvr-bounce-to-right"> <i class="fa fa-history nav_icon"></i>Tender History</a></li>
                                        </ul> 
                                    </li>                                
                                    <li>
                                        <a href="tm_faq.jsp" class=" hvr-bounce-to-right"><i class="fa fa-question-circle nav_icon"></i> <span class="nav-label">Answer FAQs </span> </a>
                                    </li>
                                    <li>
                                        <a href="tm_feedback.jsp" class=" hvr-bounce-to-right"><i  class="fa fa-comments-o nav_icon"></i> <span class="nav-label">Feedback</span> </a>
                                    </li>                                                               
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </nav>
            <div id="page-wrapper" class="gray-bg dashbard-1">
                <div class="content-main">

                    <!--banner-->	
                    <div class="banner">
                        <h2>
                            <a href="tm_dashboard.jsp">Home</a>
                            <i class="fa fa-angle-right"></i>
                            <span>Post Tender</span>
                        </h2>
                    </div>
                    <!--//banner-->
                    <!-- Post Tender Div-->
                    <div class="validation-system">

                        <div class="validation-form" id="category">
                            <!---->
                            <form action="Tm_update_tender" method="get" id="frm" >
                                <div class="col-md-12 form-group2 group-mail">
                                        <label class="control-label">Select Category</label>                                        
                                        <select name="Select_category">
                                            <%
                                                int tender_id = Integer.parseInt(request.getParameter("tender_id"));
                                                int p_id = 0, c_id = 0;
                                                String product_name = "";
                                                String discrip = "";
                                                String category = "", man = "", qual = "", quan = "";
                                                String title = "", type_of_work = "", price = "";
                                                PreparedStatement ps_category = con.prepareStatement("select *,p.name,p.manufacture,p.quality,p.quantity,c.title from tender_info t,product p,category c where t.product_id=p.product_id and t.category_id=c.category_id and tender_id='" + tender_id + "'");
                                                ResultSet rs_category = ps_category.executeQuery();
                                                while (rs_category.next()) {
                                                    category = rs_category.getString("c.title");
                                                    p_id = rs_category.getInt("product_id");
                                                    c_id = rs_category.getInt("category_id");
                                                    discrip = rs_category.getString("description");
                                                    product_name = rs_category.getString("p.name");
                                                    man = rs_category.getString("p.manufacture");
                                                    qual = rs_category.getString("p.quality");
                                                    quan = rs_category.getString("p.quantity");
                                                    title = rs_category.getString("title");
                                                    type_of_work = rs_category.getString("type_of_work");
                                                    price = rs_category.getString("price");
                                                    System.out.println(discrip);
                                            %>                                        
                                            <option value="<%= c_id%>"><%= category%></option>


                                            <% }
                                                int c_id1 = 0;

                                                PreparedStatement ps_category1 = con.prepareStatement("select *from category");
                                                ResultSet rs_category1 = ps_category1.executeQuery();
                                                while (rs_category1.next()) {
                                                    c_id1 = rs_category1.getInt("category_id");
                                                    category = rs_category1.getString("title");
                                                    if (c_id1 != c_id) {


                                            %>
                                            <option value="<%= c_id1%>"><%= category%></option>
                                            <%}
                                                }%>

                                        </select>
                                        <input type="hidden" value="<%=tender_id%>" name="tender_id">
                                </div>
                                <div class="vali-form">
                                    <div class="col-md-6 form-group1">
                                        <label class="control-label">Title</label>
                                        <input type="text" value="<%=title%>" name="Title" pattern="[a-zA-Z0-9 ]{10,40}" title="Enter only charecter & number(limit 10 to 40 charecter)" required="" maxlength="40" minlength="10">
                                    </div>
                                    <div class="col-md-6 form-group1 form-last">
                                        <label class="control-label">Type Of work</label>
                                        <input type="text" value="<%=type_of_work%>" name="Type_of_work" pattern="[a-zA-Z0-9 ]{10,40}" title="Enter only charecter & number(limit 10 to 40 charecter)" required="" maxlength="40" minlength="10">
                                    </div>
                                    <div class="clearfix"> </div>
                                </div>                            
                                <div class="clearfix"> </div>

                                <div class="col-md-12 form-group1 group-mail">
                                    <label class="control-label">Price</label>
                                    <input type="text" value="<%=price%>" name="Price" pattern="[0-9]{1,}" title="Enter only number" required="">
                                </div>
                                <div class="clearfix"> </div>

                                <div class="col-md-12 form-group2 group-mail" id="product">
                                    <label class="control-label">Product</label>
                                    <select name="Select_product" id="product1" onChange="myNewproduct(this);">
                                        <option value="<%= p_id%>" ><%=product_name%></option>
                                        <%
                                            PreparedStatement ps_product = con.prepareStatement("select * from product");
                                            ResultSet rs_product = ps_product.executeQuery();
                                            while (rs_product.next()) {
                                                String product_name1 = rs_product.getString("name");
                                                int product_id = rs_product.getInt("product_id");
                                                if (product_id != p_id) {
                                        %>                                        
                                        <option value="<%= product_id%>"><%= product_name1%></option>
                                        <%}
                                            }%>
                                        <option>Other</option>
                                    </select>

                                </div>
                                <div class="clearfix"> </div>                                


                                <!-- Add product hide data -->
                                <div id="product_text"  style="display: none; border: 2px solid #3BB2D0;">
                                    <br>
                                    <div class="col-md-12 form-group1 group-mail">
                                        <label class="control-label">Add Product</label>
                                        <input type="text" placeholder="Enter product name" name="Product_name" id="Product_name" pattern="[a-zA-Z ]{1,25}" title="Enter only charecter(limit 1 to 25 charecter)" maxlength="25" minlength="1">
                                    </div>
                                    <div class="clearfix"> </div>

                                    <div class="col-md-12 form-group1 group-mail">
                                        <label class="control-label">Manufacturer</label>
                                        <input type="text" placeholder="Enter product name" name="Product_manufacture" id="Product_manufacture" pattern="[a-zA-Z ]{1,40}" title="Enter only charecter(limit 1 to 40 charecter)" minlength="1" maxlength="40">
                                    </div>
                                    <div class="clearfix"> </div>

                                    <div class="col-md-12">
                                        <label class="control-label">Quality</label>
                                        <div id="slider">
                                            <input class="bar" type="range" id="rangeinput" value="50" onchange="rangevalue.value = value" required=""/>
                                            <span class="highlight"></span>
                                            <output id="rangevalue">50</output>
                                        </div>
                                    </div>
                                    <div class="clearfix"> </div>

                                    <div class="col-md-12 form-group1 group-mail">
                                        <label class="control-label">Quantity</label>
                                        <input type="text" placeholder="Enter product quantity" name="Product_quantity" id="Product_quantity" pattern="[0-9]{1,}" title="Enter only number">
                                    </div>
                                    <div class="clearfix"> </div>

                                    <div class="col-md-12 form-group1 group-mail">
                                        <label class="control-label">Manufacture Date</label>
                                        <input type="date" name="Product_man_date" id="Product_man_date" required="">
                                    </div>

                                    <div class="clearfix"> </div>
                                    <div class="col-md-12 form-group">
                                        <input type="button" class="btn btn-primary" value="Submit" id="product_sub">
                                    </div>
                                    <div class="clearfix"> </div>
                                </div>
                                <!-- // Add product hide data -->

<!--                                <div id="product_text1"  style="display: none; border: 2px solid #3BB2D0;">
                                    <div class="col-md-12 form-group1 group-mail">
                                        <label class="control-label">Manufacturer</label>
                                        <input type="text" value="<%=man%>" name="Product_manufacture"  required="">
                                    </div>
                                    <div class="clearfix"> </div>

                                    <div class="col-md-12">
                                        <label class="control-label">Quality</label>
                                        <div id="slider">
                                            <input class="bar" type="range" id="rangeinput" value="<%=qual%>" onchange="rangevalue.value = value" required=""/>
                                            <span class="highlight"></span>
                                            <output id="rangevalue"><%=qual%></output>
                                        </div>
                                    </div>
                                    <div class="clearfix"> </div>

                                    <div class="col-md-12 form-group1 group-mail">
                                        <label class="control-label">Quantity</label>
                                        <input type="text" value="<%=quan%>" name="Product_quantity" id="Product_quantity" required="">
                                    </div>
                                    <div class="clearfix"> </div>
                                </div>-->
                                <!-- // Add product hide data -->

                                <div class="col-md-12 form-group1 ">
                                    <label class="control-label">Description of tender</label>
                                    <textarea  value="<%=discrip%>" name="Description" required="" maxlength="150"><%=discrip%></textarea>
                                </div>
                                <div class="clearfix"> </div>
                                <div class="col-md-12 form-group">
                                    <input type="submit" class="btn btn-primary" value="Update" id="sub1">
                                </div>
                                <div class="clearfix"> </div>
                            </form>
                            <!---->
                        </div>
                    </div>
                    <!--// Post Tender Div -->
                    <!---->
                    <div class="copy">
                        <p> © 2016 TenderoTic . All rights reserved | Design by Jimish Gajjar.</p>
                    </div>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>
        <!---->
        <!--scrolling js-->
        <script src="dashboard_js/jquery.nicescroll.js"></script>
        <script src="dashboard_js/scripts.js"></script>
        <!--//scrolling js-->
        <script src="dashboard_js/bootstrap.min.js"></script>
        <script>

                                                $('#sub1').click(function () {
                                                    var pro = document.getElementById('product1').value;
                                                    if (pro != "Other") {
                                                        $("#frm").submit();
                                                    } else
                                                    {
                                                        var Product_name = document.getElementById('Product_name').value;
                                                        var Product_manufacture = document.getElementById('Product_manufacture').value;
                                                        var rangeinput = document.getElementById('rangeinput').value;
                                                        var Product_quantity = document.getElementById('Product_quantity').value;
                                                        var Product_man_date = document.getElementById('Product_man_date').value;
                                                        if (Product_name == '' || Product_manufacture == '' || rangeinput == '' || Product_quantity == '' || Product_man_date == '') {
                                                            alert('Please enter all fields....!!!');
                                                        } else {
                                                            $("#frm").submit();
                                                        }
                                                    }

                                                });</script>
        <!-- Side Menu -->
        <script>
            var temp = 0;
            var val = document.getElementById("page-wrapper");
            $(document).ready(function () {
                $("#page-wrapper1").click(function () {
                    $("#page-wrapper1").fadeOut(500);
                    $("#mySidenav").fadeIn(1000);
                    $("#page-wrapper2").fadeIn(1000);
                    document.getElementById("mySidenav").style.width = "250px";
                    document.getElementById("page-wrapper").style.marginLeft = "250px";
                    document.getElementById("chart").style.width = "650px";
                    document.getElementById("graph-lines").style.width = "100px";
                    var val = 0;
                });
                $("#page-wrapper2").click(function () {
                    $("#page-wrapper2").fadeOut(1000);
                    $("#mySidenav").fadeOut(1000);
                    $("#page-wrapper1").fadeIn(1000);
                    document.getElementById("mySidenav").style.width = "0";
                    document.getElementById("page-wrapper").style.marginLeft = "0";
                    temp = 1;
                });
            });
        </script>
        <!-- //Side Menu -->            
    </body>
</html>