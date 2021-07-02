<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%
    response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server
    response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance
    response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
    response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility

    String Tenderer_id = (String) session.getAttribute("Tenderer_id");
    System.out.println(Tenderer_id);

    if (Tenderer_id == null) {
        String site = new String("Front_page.jsp");

        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", site);
    }
%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>TenderoTic - <%=Tenderer_id%></title>
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
        <script src="dashboard_js/bootstrap.min.js"></script>

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
        <!--  Search dropdown  -->
        <script>
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
        </script>
        <!-- // Search dropdown  -->        
        <!-- Slide menu display none -->
        <style>
            #page-wrapper2{  display: none;}
            #mySidenav{  display: none;}
            #drop1{  display: none;}
            #drop12{  display: none;}
            #page-wrapper{margin-left: 0}
        </style>
        <!-- //Slide menu display none -->
        <!-- Pagination ajax -->
        <script>
            $(document).ready(function () {
                $('#ul1 li').click(function ()
                {
                    var val1 = $(this).text();
                    $.ajax({
                        url: "tenderer_fill_tender_ajax.jsp", //this is my servlet
                        data: "input=" + val1,
                        success: function (msg) {
                            $('#output').html(msg);
                        }
                    });
                });
            });
            function pagi(element) {
                var val2 = document.getElementById("last_page").value;

                var val = document.getElementById("pagi").value;

                if (val <= val2) {

                    $.ajax({
                        url: "tenderer_fill_tender_ajax.jsp", //this is my servlet
                        data: "input=" + val,
                        success: function (msg) {
                            $('#output').html(msg);
                        }
                    });
                } else {
                    alert("Page not Available");
                }
            }
        </script> 
        <!-- // Pagination ajax -->
    </head>
    <body>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/e-tender", "root", "");
        %>
        <div id="wrapper">
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

                        <form class=" navbar-left-right" action="tenderer_search_result.jsp">
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

                                    PreparedStatement ps = con.prepareStatement("select profilepic_path from tenderer_regis_tab where tenderer_id='" + Tenderer_id + "'");
                                    ResultSet rs = ps.executeQuery();
                                    String imgLen = "";
                                    if (rs.next()) {
                                        imgLen = rs.getString("profilepic_path");
                                    }

                                    path += imgLen;
                                %>
                                <a href="#" class="dropdown-toggle dropdown-at" data-toggle="dropdown"><span class=" name-caret"><%=Tenderer_id%><i class="caret"></i></span><img src="<%= path%>" height="60" width="60"></a>
                                <ul class="dropdown-menu " role="menu">
                                    <li><a href="tenderer_profile.jsp"><i class="fa fa-user"></i>Edit Profile</a></li>
                                    <li><a href="tenderer_change_pass.jsp"><i class="fa fa-lock"></i>Change Password</a></li>
                                    <li><a href="#"><i class="fa fa-calendar"></i>Calender</a></li>
                                    <li><a href="#"><i class="fa fa-clipboard"></i>Tasks</a></li>
                                    <li><a href="Tenderer_logout"><i class="fa fa-sign-out"></i>Logout</a></li>
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
                                        <a href="tenderer_dashboard.jsp" class=" hvr-bounce-to-right"><i class="fa fa-dashboard nav_icon "></i><span class="nav-label">Dashboards</span> </a>
                                    </li>

                                    <li>
                                        <a href="#" class=" hvr-bounce-to-right"><i class="fa fa-file-text-o nav_icon"></i> <span class="nav-label">Manage Tender</span><span class="fa arrow"></span></a>
                                        <ul class="nav nav-second-level">
                                            <li><a href="tenderer_view_tender.jsp" class=" hvr-bounce-to-right"> <i class="fa fa-list nav_icon"></i>View Tender</a></li>
                                            <li><a href="tenderer_fill_tender.jsp" class=" hvr-bounce-to-right"> <i class="fa fa-align-left nav_icon"></i>Fill Tender</a></li>
                                            <li><a href="tenderer_update_tender.jsp" class=" hvr-bounce-to-right"> <i class="fa fa-check-square-o nav_icon"></i>Update Tender</a></li>
                                            <li><a href="tenderer_delete_tender.jsp" class=" hvr-bounce-to-right"><i class="fa fa-trash-o nav_icon"></i>Delete Tender</a></li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="#" class=" hvr-bounce-to-right"><i class="fa fa-history nav_icon"></i> <span class="nav-label" >History</span><span class="fa arrow"></span></a>
                                        <ul class="nav nav-second-level">
                                            <li><a href="tenderer_tender_history.jsp" class=" hvr-bounce-to-right"> <i class="fa fa-history nav_icon"></i>Tender History</a></li>
                                            <li><a href="tm_view_tenderer.jsp" class=" hvr-bounce-to-right"><i class="fa fa-history nav_icon"></i>Tenderer History</a></li>
                                        </ul> 
                                    </li>
                                    <li>
                                        <a href="tenderer_faq.jsp" class=" hvr-bounce-to-right"><i class="fa fa-question-circle nav_icon"></i> <span class="nav-label">Answer FAQs </span> </a>
                                    </li>
                                    <li>
                                        <a href="tenderer_feedback.jsp" class=" hvr-bounce-to-right"><i  class="fa fa-comments-o nav_icon"></i> <span class="nav-label">Feedback</span> </a>
                                    </li>
                                    <li>
                                        <a href="tenderer_categories.jsp" class=" hvr-bounce-to-right"><i  class="fa fa-navicon nav_icon"></i> <span class="nav-label">Categories</span> </a>
                                    </li>
                                    <li>
                                        <a href="tenderer_categories.jsp" class=" hvr-bounce-to-right"><i  class="fa fa-check-square-o nav_icon"></i> <span class="nav-label">Result</span> </a>
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
                            <a href="tenderer_dashboard.jsp">Home</a>
                            <i class="fa fa-angle-right"></i>
                            <span>Select Tender</span>
                        </h2>
                    </div>
                    <!--//banner-->
                    <!-- View All Tender Div-->
                    <div class="blank">
                        <div class="blank-page">                            
                            <form action="tenderer_fill_tender_que.jsp" id="myForm">
                                <%
                                    int count_tende = 0;
                                    int flag = 0;
                                    PreparedStatement count_tender = con.prepareStatement("select * from fill_tender where tenderer_id = '" + Tenderer_id + "'");
                                    ResultSet rs_counttender = count_tender.executeQuery();
                                    while (rs_counttender.next()) {
                                        int tender_id = rs_counttender.getInt("tender_id");
                                        count_tende++;
                                        flag = 1;
                                    }
                                    if (flag == 1) {
                                %>
                                <div class="table-view-tender" id="View"  style="overflow-x:auto;">                                   
                                    <h6>                                    
                                        <table id="output">
                                            <tr>
                                                <th>TITLE</th>
                                                <th>CATEGORY</th>
                                                <th>DESCRIPTION</th>                
                                                <th>PRODUCT</th>                
                                                <th>PRICE</th>                
                                                <th>TYPE OF WORK</th>                
                                                <th>REGISTRATION DATE</th>                
                                                <th>VERIFICATION DATE</th>                
                                                <th>RESULT DECLARE DATE</th>                
                                                <th>SELECT</th>                
                                            </tr>
                                            <%
                                                /* cont five */
                                                int pagenation = 1, tender_id = 0;
                                                double total_tender = (double) count_tende / 5;
                                                double no_record = 0;

                                                no_record = Math.ceil(total_tender);
                                                /* // cont five */

                                                String category_name = "", product_name = "";

                                                PreparedStatement view_tender = con.prepareStatement("SELECT * FROM tender_info where approve = 1 AND result_dec_date >= now() AND block = 0 AND tender_id NOT IN(SELECT tender_id FROM fill_tender where tenderer_id = '" + Tenderer_id + "') limit 0,5");
                                                ResultSet rs_viewtender = view_tender.executeQuery();
                                                while (rs_viewtender.next()) {
                                                    tender_id = rs_viewtender.getInt("tender_id");
                                                    int category_id = rs_viewtender.getInt("category_id");
                                                    int product_id = rs_viewtender.getInt("product_id");

                                                    PreparedStatement ps_category = con.prepareStatement("SELECT * FROM category where category_id ='" + category_id + "'");
                                                    ResultSet rs_category = ps_category.executeQuery();
                                                    while (rs_category.next()) {
                                                        category_name = rs_category.getString("title");
                                                    }

                                                    PreparedStatement ps_product = con.prepareStatement("SELECT * FROM product where product_id ='" + product_id + "'");
                                                    ResultSet rs_product = ps_product.executeQuery();
                                                    while (rs_product.next()) {
                                                        product_name = rs_product.getString("name");
                                                    }
                                            %>
                                            <tr>
                                                <td><%=rs_viewtender.getString("title")%></td>
                                                <td><%=category_name%></td>
                                                <td><%=rs_viewtender.getString("description")%></td>
                                                <td><%=product_name%></td>
                                                <td><%=rs_viewtender.getString("price")%></td>
                                                <td><%=rs_viewtender.getString("type_of_work")%></td>
                                                <td><%=rs_viewtender.getDate("reg_date")%></td>
                                                <td><%=rs_viewtender.getDate("verification_date")%></td>
                                                <td><%=rs_viewtender.getDate("result_dec_date")%></td>
                                                <td>                                                
                                                    <input type="radio" name="select_tender" value="<%=tender_id%>"/> 
                                                </td>
                                            </tr>
                                            <% }%>                                           
                                        </table>                                                                            
                                    </h6><br>                                   
                                </div>
                                <div class="panel-footer">
                                    <div class="row">
                                        <div class="col-sm-8 col-sm-offset-5">
                                            <button class="btn-primary btn">Submit</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <nav align="center">
                                <ul class="pagination" id="ul1">
                                    <li><a href="#" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
                                        <% while (pagenation <= no_record) {%>                                   
                                    <li><a href="#"><%=pagenation%></a></li>                                                                        
                                        <%
                                                pagenation++;
                                            }
                                        %>
                                    <li><a href="#" aria-label="Next"><span aria-hidden="true">»</span></a></li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                    <%} else {%>
                    <div class="blank">                                                              
                        <div class="blank-page">
                            <h4 align="center">Oops!!! Data not found.</h4>
                        </div>
                    </div>
                    <%}%>
                    <!--// View All Tender Div -->

                    <!---->
                    <div class="copy">
                        <p> &copy; 2016 TenderoTic. All Rights Reserved.
                    </div>
                </div>
                <div class="clearfix"> </div>
            </div>

            <!---->
            <!--scrolling js-->
            <script src="dashboard_js/jquery.nicescroll.js"></script>
            <script src="dashboard_js/scripts.js"></script>
            <!--//scrolling js-->

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