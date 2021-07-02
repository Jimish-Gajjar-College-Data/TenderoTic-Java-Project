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
        <script>
            /*  Search Dropdown Script  */
            function myNewFunction(element) {
                var val1 = element.options[element.selectedIndex].text;
                alert(val1);
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
                    $("#product_text").empty();
                }
            }
            /* // For product inset hide and show */
        </script>

        <!-- Add product ajax -->
        <script>
            $(document).ready(function () {
                $('#product_sub').click(function ()
                {
                    var Product_name = document.getElementById('Product_name').value;
                    var Product_manufacture = document.getElementById('Product_manufacture').value;
                    var rangeinput = document.getElementById('rangeinput').value;
                    var Product_quantity = document.getElementById('Product_quantity').value;
                    var Product_man_date = document.getElementById('Product_man_date').value;
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
                });
            });
        </script>
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
            <%
                int tender_id = 0;
                int c_que = 2, t_info = 0, q_id = 0,qu = 0;

                String tender_title = "";
                PreparedStatement ps_continue = con.prepareStatement("select * from tender_info where tm_id='" + TM_id + "'AND verification_date >= (SELECT now() from DUAL) order by reg_date desc");
                ResultSet rs_continue = ps_continue.executeQuery();
                if (rs_continue.next()) {
                    tender_id = rs_continue.getInt("tender_id");
                    tender_title = rs_continue.getString("title");
                    t_info = 1;
                } else {
                    t_info = 2;
                }

                PreparedStatement ps_checkque = con.prepareStatement("select * from que where tm_id='" + TM_id + "'AND tender_id ='" + tender_id + "' order by q_id desc");
                ResultSet rs_checkque = ps_checkque.executeQuery();
                if (rs_checkque.next()) {
                    c_que = 1;
                    q_id = rs_checkque.getInt("q_id");
                    if(q_id == 20){
                        qu = 1;
                    }                     
                } else {
                    c_que = 0;
                }
            %>
            <%if (c_que == 0 && t_info == 1) {%>
            <script type="text/javascript">
            $(document).ready(function () {
                $('#last_tender_que').modal({backdrop: 'static', keyboard: false}, 'show');
            });
            </script>                  
            <%}
                if (t_info == 1 && c_que == 1 && qu != 1) {%>            
            <script type="text/javascript">
                $(document).ready(function () {
                    $('#Continue_last_tender').modal({backdrop: 'static', keyboard: false}, 'show');
                });
            </script>
            <%}%>
            <!--  Do you want to continue model -->
            <div class="modal fade" id="Continue_last_tender" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" align="center"> Do you want to continue with your last tender ? </h4>
                        </div><br>
                        <div class="modal-body">
                            <div class="form-group">
                                <h4 align="center">Tender title:- <%= tender_title%> </h4>
                                <br>
                                <table align="center">
                                    <tr>
                                        <td>
                                            <form action="tm_post_tender_questions.jsp">
                                                <input type="submit" class="btn btn-primary" value="Yes">
                                                <input type="hidden" value="<%=tender_id%>" name="tm_last_tender_id">
                                            </form>
                                        </td>
                                        <td><button type="button" class="btn btn-default" data-dismiss="modal">No</button></td>
                                    </tr>
                                </table>                                
                            </div>                                
                            <div class="clearfix"> </div>   
                        </div>                        
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div>
            <!-- // Do you want to continue model -->
            <!-- Question not filled model -->
            <div class="modal fade" id="last_tender_que" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" align="center"> Your last tender is empty, please fill it first!!!</h4>
                        </div>
                        <div class="modal-body">
                            <h4 align="center">Tender title:- <%= tender_title%> </h4><br>
                            <h4 align="center">Do you want to continue ?</h4><br>
                            <h5 align="center"><font color="red">If you don't continue with your tender it will be deleted !!!</font></h5>
                            <table align="center">
                                <tr>
                                    <td>
                                        <form action="tm_post_tender_questions.jsp">
                                            <input type="hidden" value="<%=tender_id%>" name="tm_last_tender_id">
                                            <input type="submit" class="btn btn-primary" value="Yes">
                                        </form>
                                    </td>
                                    <td>
                                        <form action="TM_post_tender" get="method">
                                            <input type="submit" class="btn btn-default" value="Delete">
                                            <input type="hidden" value="<%=tender_id%>" name="tm_last_tender_id">
                                        </form>
                                    </td>
                                </tr>
                            </table>                                
                            <div class="clearfix"> </div>   
                        </div>                        
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div>
            <!-- // Question not filled model -->

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
                                <% PreparedStatement ps_co = con.prepareStatement("SELECT * FROM tender_info where result_dec_date>'2016-10-15' ");
                                    ResultSet rs_co = ps_co.executeQuery();
                                    while (rs_co.next()) {
                                %>
                                <option><%=rs_co.getString("title")%></option>
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
                                <a href="#" class="dropdown-toggle dropdown-at " data-toggle="dropdown"><i class="fa fa-globe"></i> <span class="number">5</span></a>
                                <ul class="dropdown-menu menu1 " role="menu">
                                    <li><a href="#">

                                            <div class="user-new">
                                                <p>Admin Approved Your Tender</p>
                                                <span>40 seconds ago</span>
                                            </div>
                                            <div class="user-new-left">

                                                <i class="fa fa-user-plus"></i>
                                            </div>
                                            <div class="clearfix"> </div>
                                        </a></li>
                                    <li><a href="#">
                                            <div class="user-new">
                                                <p>Someone liked your page</p>
                                                <span>3 minutes ago</span>
                                            </div>
                                            <div class="user-new-left">

                                                <i class="fa fa-heart"></i>
                                            </div>
                                            <div class="clearfix"> </div>
                                        </a></li>
                                    <li><a href="#">
                                            <div class="user-new">
                                                <p>Result declared of xyz tender</p>
                                                <span>4 hours ago</span>
                                            </div>
                                            <div class="user-new-left">

                                                <i class="fa fa-lock"></i>
                                            </div>
                                            <div class="clearfix"> </div>
                                        </a></li>
                                    <li><a href="#">
                                            <div class="user-new">
                                                <p>xyz company posted tender</p>
                                                <span>yesterday at 08:30am</span>
                                            </div>
                                            <div class="user-new-left">

                                                <i class="fa fa-file-text-o"></i>
                                            </div>
                                            <div class="clearfix"> </div>
                                        </a></li>
                                    <li><a href="#">
                                            <div class="user-new">
                                                <p>Today last day to fill tender for xyz company</p>
                                                <span>Last Week</span>
                                            </div>
                                            <div class="user-new-left">

                                                <i class="fa fa-info"></i>
                                            </div>
                                            <div class="clearfix"> </div>
                                        </a></li>
                                    <li><a href="#" class="view">View all messages</a></li>
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
                                    <li><a href="#"><i class="fa fa-calendar"></i>Calender</a></li>
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
                                            <li><a href="tm_current_tender.jsp" class=" hvr-bounce-to-right"> <i class="fa fa-align-left nav_icon"></i>Current Tender</a></li>
                                            <li><a href="tm_update_tender.jsp" class=" hvr-bounce-to-right"> <i class="fa fa-check-square-o nav_icon"></i>Update Tender</a></li>
                                            <li><a href="tm_delete_tender.jsp" class=" hvr-bounce-to-right"><i class="fa fa-trash-o nav_icon"></i>Delete Tender</a></li>
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
                                            <li><a href="tm_view_tenderer.jsp" class=" hvr-bounce-to-right"><i class="fa fa-history nav_icon"></i>Tenderer History</a></li>
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
                            <form action="TM_post_tender" method="get">
                                <div class="col-md-12 form-group2 group-mail">
                                    <label class="control-label">Select Category</label>                                        
                                    <select name="Select_category">
                                        <%
                                            PreparedStatement ps_category = con.prepareStatement("select * from category");
                                            ResultSet rs_category = ps_category.executeQuery();
                                            while (rs_category.next()) {
                                                String category = rs_category.getString("title");
                                                int category_id = rs_category.getInt("category_id");
                                        %>                                        
                                        <option value="<%= category_id%>"><%= category%></option>
                                        <% }%>
                                    </select>
                                </div>
                                <div class="vali-form">
                                    <div class="col-md-6 form-group1">
                                        <label class="control-label">Title</label>
                                        <input type="text" placeholder="Enter Title" name="Title" required="">
                                    </div>
                                    <div class="col-md-6 form-group1 form-last">
                                        <label class="control-label">Type Of work</label>
                                        <input type="text" placeholder="Enter type of work" name="Type_of_work" required="">
                                    </div>
                                    <div class="clearfix"> </div>
                                </div>                            
                                <div class="clearfix"> </div>

                                <div class="col-md-12 form-group1 group-mail">
                                    <label class="control-label">Price</label>
                                    <input type="text" placeholder="Enter price" name="Price" required="">
                                </div>
                                <div class="clearfix"> </div>

                                <div class="col-md-12 form-group2 group-mail" id="product">
                                    <label class="control-label">Product</label>
                                    <select name="Select_product" id="product" onChange="myNewproduct(this);" required="">
                                        <option disabled selected value>Select option</option>
                                        <%
                                            PreparedStatement ps_product = con.prepareStatement("select * from product");
                                            ResultSet rs_product = ps_product.executeQuery();
                                            while (rs_product.next()) {
                                                String product_name = rs_product.getString("name");
                                                int product_id = rs_product.getInt("product_id");
                                        %>                                        
                                        <option value="<%= product_id%>"><%= product_name%></option>
                                        <% }%>
                                        <option>Other</option>
                                    </select>
                                </div>
                                <div class="clearfix"> </div>                                

                                <!-- Add product hide data -->
                                <div id="product_text"  style="display: none; border: 2px solid #3BB2D0;">
                                    <br>
                                    <div class="col-md-12 form-group1 group-mail">
                                        <label class="control-label">Add Product</label>
                                        <input type="text" placeholder="Enter product name" name="Product_name" id="Product_name" required="">
                                    </div>
                                    <div class="clearfix"> </div>

                                    <div class="col-md-12 form-group1 group-mail">
                                        <label class="control-label">Manufacturer</label>
                                        <input type="text" placeholder="Enter product name" name="Product_manufacture" id="Product_manufacture" required="">
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
                                        <input type="text" placeholder="Enter product quantity" name="Product_quantity" id="Product_quantity" required="">
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

                                <div class="col-md-12 form-group1 ">
                                    <label class="control-label">Description of tender</label>
                                    <textarea  placeholder="Your Description..." name="Description" required=""></textarea>
                                </div>
                                <div class="clearfix"> </div>

                                <div class="vali-form">
                                    <div class="col-md-6 form-group1">
                                        <label class="control-label">Verification Date</label>
                                        <input type="date" required="" name="Verfication_date">
                                    </div>
                                    <div class="col-md-6 form-group1">
                                        <label class="control-label">Result Date</label>
                                        <input type="date" required="" name="Result_date">
                                    </div>
                                    <div class="clearfix"> </div>
                                </div>                            
                                <div class="clearfix"> </div>

                                <div class="col-md-12 form-group">
                                    <input type="submit" class="btn btn-primary" value="Submit">
                                    <input type="reset" class="btn btn-default" value="Reset">
                                </div>
                                <div class="clearfix"> </div>
                            </form>
                            <!---->
                        </div>
                    </div>
                    <!--// Post Tender Div -->
                    <!---->
                    <div class="copy">
                        <p> &copy; 2016 TenderoTic. All Rights Reserved.</p>
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