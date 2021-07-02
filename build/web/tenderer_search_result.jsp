<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
    response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server
    response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance
    response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
    response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility

    String Tenderer_id = (String) session.getAttribute("Tenderer_id");

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

        <!----->
        <!--pie-chart--->
        <script src="dashboard_js/pie-chart.js" type="text/javascript"></script>
        <script type="text/javascript">

            $(document).ready(function () {
                $('#demo-pie-1').pieChart({
                    barColor: '#3bb2d0',
                    trackColor: '#eee',
                    lineCap: 'round',
                    lineWidth: 8,
                    onStep: function (from, to, percent) {
                        $(this.element).find('.pie-value').text(Math.round(percent) + '%');
                    }
                });
                $('#demo-pie-2').pieChart({
                    barColor: '#fbb03b',
                    trackColor: '#eee',
                    lineCap: 'butt',
                    lineWidth: 8,
                    onStep: function (from, to, percent) {
                        $(this.element).find('.pie-value').text(Math.round(percent) + '%');
                    }
                });
                $('#demo-pie-3').pieChart({
                    barColor: '#ed6498',
                    trackColor: '#eee',
                    lineCap: 'square',
                    lineWidth: 8,
                    onStep: function (from, to, percent) {
                        $(this.element).find('.pie-value').text(Math.round(percent) + '%');
                    }
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
        <!--skycons-icons-->
        <script src="dashboard_js/skycons.js"></script>
        <!--//skycons-icons-->        
        <!-- Slide menu display none -->
        <style>
            #page-wrapper2{  display: none;}
            #mySidenav{  display: none;}
            #drop1{  display: none;}
            #drop12{  display: none;}
            #page-wrapper{margin-left: 0}
        </style>
          <script>
        
    $(document).ready(function () {
                $('#ul1 li').click(function ()
                {
                    var val1 = $(this).text();
                     var val3=document.getElementById("flag").value;
              var val4=document.getElementById("tender_id").value;
              var val5=document.getElementById("category_id").value;
                   
                    $.ajax({
                        url: "tenderer_search_reasult_ajax.jsp", //this is my servlet
                         data: {input: val1, flag: val3, tender_id:val4,category:val5},
                        success: function (msg) {
                            $('#View').html(msg);
                        }
                    });
                 
                });

            });
          function pagi(element){
              var val2=document.getElementById("last_page").value;
              var val3=document.getElementById("flag").value;
              var val4=document.getElementById("tender_id").value;
              var val5=document.getElementById("category_id").value;
              var val=document.getElementById("pagi").value;
               
              if(val<=val2){
                 
                  $.ajax({
                        url: "tenderer_search_reasult_ajax.jsp", //this is my servlet
                        data: {input: val, flag: val3, tender_id:val4,category:val5},
                        success: function (msg) {
                            $('#View').html(msg);
                        }
                    });
            }
            else{
                alert("Page not Available");
            }
        }
        </script>

        <!-- //Slide menu display none -->
        <style>
            #chart
            {
                width:800px;
                padding-top: 1px;
            }
        </style>
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
            <div id="page-wrapper" class="gray-bg dashbard-1  ">
                <div class="content-main">

                    <!--banner-->	
                    <div class="banner">

                        <h2>
                            <a href="admin_dashboard.jsp">Home</a>
                            <i class="fa fa-angle-right"></i>
                            <span>Dashboard</span>
                        </h2>
                    </div>
                    <!--//banner-->
                    <!--content-->
                    <div class="content-top" >
                        <%
                            float total_tender = 0, prev_tender = 0, total_year2 = 0;
                            int prev_month = 0, pre_year = 0, cur_month = 0, tender_id = 0, flag = 0,last_year = 0,last_year_tender=0;
                            int category_id = 0;
                            String drop_down_result = request.getParameter("drop_down");
                            String drop1 = "", tm_id = "";
//                                        
                            PreparedStatement ps_nrf = con.prepareStatement("SELECT month(now())-1,YEAR(NOW()) FROM DUAL");
                            ResultSet rs_nrf = ps_nrf.executeQuery();
                            while (rs_nrf.next()) {
                                prev_month = rs_nrf.getInt("month(now())-1");
                                pre_year = rs_nrf.getInt("YEAR(now())");
                            }

                            if (drop_down_result.equals("Title")) {
                                flag = 1;
                                String search = request.getParameter("drop1");
                                System.out.println("search" + search);

                                String query = "SELECT tender_id  FROM tender_info where title LIKE '" + search + "'";
                                PreparedStatement ps_sr = con.prepareStatement(query);
                                ResultSet rs_sr = ps_sr.executeQuery();
                                if (rs_sr.next()) {
                                    tender_id = rs_sr.getInt("tender_id");

                                } else {
                                    flag = 3;
                                }
                                PreparedStatement ps_sr1 = con.prepareStatement("SELECT tm_id  FROM tender_info where tender_id='" + tender_id + "'");
                                ResultSet rs_sr1 = ps_sr1.executeQuery();
                                if (rs_sr1.next()) {
                                    tm_id = rs_sr1.getString("tm_id");

                                }

                                PreparedStatement ps_tp = con.prepareStatement("SELECT * FROM `tenderer_login");
                                ResultSet rs_tp = ps_tp.executeQuery();
                                while (rs_tp.next()) {
                                    
                                     total_tender++;
                                }
                                PreparedStatement ps_tp1 = con.prepareStatement("SELECT * FROM `fill_tender`where tender_id='" + tender_id + "'");
                                ResultSet rs_tp1 = ps_tp1.executeQuery();
                                while (rs_tp1.next()) {
                                   prev_tender++;
                                }

                            } else if (drop_down_result.equals("Category")) {
                                flag = 2;

                                drop1 = request.getParameter("drop12");
                                String query = "SELECT category_id  FROM category where title LIKE '" + drop1 + "'";
                                PreparedStatement ps_tp = con.prepareStatement(query);
                                ResultSet rs_tp = ps_tp.executeQuery();
                                if (rs_tp.next()) {
                                    category_id = rs_tp.getInt("category_id");
                                } else {
                                    flag = 3;
                                }
                                  last_year=pre_year-1;
                                switch (prev_month) {
                                    case 1: {
                                        PreparedStatement ps_sr = con.prepareStatement("SELECT * FROM tender_info where month(reg_date)>=8 and year(reg_date)='" + last_year + "' and  category_id='" + category_id + "'");
                                        ResultSet rs_sr = ps_sr.executeQuery();
                                        while (rs_sr.next()) {
                                            total_tender++;
                                        }
                                        break;
                                    }
                                    case 2: {
                                        PreparedStatement ps_sr = con.prepareStatement("SELECT * FROM tender_info where month(reg_date)>=9 and year(reg_date)='" + last_year + "' and  category_id='" + category_id + "'");
                                        ResultSet rs_sr = ps_sr.executeQuery();
                                        while (rs_sr.next()) {
                                            total_tender++;
                                        }
                                        break;
                                    }
                                    case 3: {
                                        PreparedStatement ps_sr = con.prepareStatement("SELECT * FROM tender_info where month(reg_date)>=10 and year(reg_date)='" + last_year + "' and  category_id='" + category_id + "'");
                                        ResultSet rs_sr = ps_sr.executeQuery();
                                        while (rs_sr.next()) {
                                            total_tender++;
                                        }
                                        break;
                                    }
                                     case 4: {
                                        PreparedStatement ps_sr = con.prepareStatement("SELECT * FROM tender_info where month(reg_date)>=11 and year(reg_date)='" + last_year + "' and  category_id='" + category_id + "'");
                                        ResultSet rs_sr = ps_sr.executeQuery();
                                        while (rs_sr.next()) {
                                            total_tender++;
                                        }
                                        break;
                                    }
                                      case 5: {
                                        PreparedStatement ps_sr = con.prepareStatement("SELECT * FROM tender_info where month(reg_date)=12 and year(reg_date)='" + last_year + "' and  category_id='" + category_id + "'");
                                        ResultSet rs_sr = ps_sr.executeQuery();
                                        while (rs_sr.next()) {
                                            total_tender++;
                                        }
                                        break;
                                    }
                                }
                                PreparedStatement ps_sr = con.prepareStatement("SELECT * FROM tender_info where month(reg_date)='" + prev_month + "'and year(reg_date)='" + pre_year + "' and  category_id='" + category_id + "'");
                                ResultSet rs_sr = ps_sr.executeQuery();
                                while (rs_sr.next()) {
                                    prev_tender++;
                                }

                                PreparedStatement ps_nrf2 = con.prepareStatement("SELECT * FROM tender_info where month(reg_date)<'" + prev_month + "'and year(reg_date)='" + pre_year + "' and category_id='" + category_id + "'");
                                ResultSet rs_nrf2 = ps_nrf2.executeQuery();
                                while (rs_nrf2.next()) {
                                    total_tender++;
                                }

                            }
                             float prev_tender1=prev_tender;
                            total_year2 = total_tender + prev_tender;
                            prev_tender = ((prev_tender / total_year2) * 100);
                            System.out.println("ctegory" + category_id + drop1);
                            if (flag == 1 || flag == 2) {
                        %>
                        <div class="col-md-4 ">
                            <div class="content-top-1">
                                <div class="col-md-6 top-content">
                                   <%if (flag == 1) {%>
                                    <h5> Tender Filled for this Title</h5>
                                      <label><%= prev_tender1%></label>
                                    <%} else if (flag == 2) {%>
                                    <h5>Total Posted by this Category</h5>
                                      <label><%=total_year2%></label>
                                    <%}%>
                                  <input type="hidden" value="<%= flag%>" id="flag">
                                      <input type="hidden" value="<%= tender_id%>" id="tender_id">
                                        <input type="hidden" value="<%= category_id%>" id="category_id">

                                </div>
                                <div class="col-md-6 top-content1">	   
                                    <div id="demo-pie-1" class="pie-title-center" data-percent="<%=Math.round(prev_tender)%>"> <span class="pie-value"></span> </div>
                                </div>
                                <div class="clearfix"> </div>
                            </div>

                            <%if (flag == 1) {%>
                            <div class="content-top-1">
                                <div class="col-md-6 top-content">
                                    <%
                                        float total_nrp = 0, today_nrp = 0, total_year = 0;

                                        PreparedStatement ps_nrp1 = con.prepareStatement("SELECT * FROM tender_info where month(reg_date)='" + prev_month + "'and year(reg_date)='" + pre_year + "'");
                                        ResultSet rs_nrp1 = ps_nrp1.executeQuery();
                                        while (rs_nrp1.next()) {
                                            today_nrp++;
                                        }

                                        PreparedStatement ps_nrp2 = con.prepareStatement("SELECT * FROM tender_info where month(reg_date)<'" + prev_month + "'and year(reg_date)='" + pre_year + "'");
                                        ResultSet rs_nrp2 = ps_nrp2.executeQuery();
                                        while (rs_nrp2.next()) {
                                            total_nrp++;
                                        }

                                        total_year = total_nrp + today_nrp;
                                        today_nrp = ((today_nrp / total_year) * 100);

                                        System.out.println(flag);
                                    %>

                                    <h5>Total Tenders Posted</h5>

                                    <label><%=total_year%></label>
                                </div>
                                <div class="col-md-6 top-content1">	   
                                    <div id="demo-pie-3" class="pie-title-center" data-percent="<%=today_nrp%>"> <span class="pie-value"></span> </div>
                                </div>
                                <div class="clearfix"> </div>

                            </div>
                            <%}%>
                        </div>
                        <div class="col-md-8 content-top-2" id="chart"  style="width:700px;" >
                            <!---start-chart---->
                            <!----->

                            <div class="content-graph"  style="width:700px;">
                                <div class="content-color" >
                                   <%if (flag == 1) {%>
                                    <div class="content-ch"><p><i></i>Tender Filled for tender posted by <%= tm_id%> this year</p>
                                        <div class="clearfix"> </div>
                                    </div>
                                    <%} else if (flag == 2) {%>
                                    <div class="content-ch"><p><i></i>Tender Posted by in this category in this year</p>
                                        <div class="clearfix"> </div>
                                    </div>
                                    <%}%>
                                </div>
                                <!--graph-->
                                <%
                                    int jan = 0, feb = 0, mar = 0, apr = 0, may = 0, jun = 0, jul = 0, aug = 0, sep = 0, oct = 0, nov = 0, dec = 0, ctr = 0, tm_id1 = 0;
                                    int jan1 = 0, feb1 = 0, mar1 = 0, apr1 = 0, may1 = 0, jun1 = 0, jul1 = 0, aug1 = 0, sep1 = 0, oct1 = 0, nov1 = 0, dec1 = 0, ctr1 = 0;
                                    String day = "";
                                    char day1;
                                    String reg_date = "";
                                    PreparedStatement ps0 = con.prepareStatement("SELECT reg_date FROM tender_info where tender_id='" + tender_id + "'");
                                    ResultSet rs0 = ps0.executeQuery();
                                    while (rs0.next()) {
                                        reg_date = rs0.getString("reg_date");
                                    }

                                    int tender_id1[] = new int[12];
                                    int tender_filled1 = 0, tender_filled2 = 0, tender_filled3 = 0, tender_filled4 = 0, tender_filled5 = 0, tender_filled6 = 0, tender_filled7 = 0, tender_filled8 = 0, tender_filled9 = 0, tender_filled10 = 0, tender_filled11 = 0, tender_filled12 = 0;
                                    PreparedStatement ps00 = con.prepareStatement("SELECT YEAR(CURRENT_DATE) FROM `tender_info`");
                                    ResultSet rs00 = ps00.executeQuery();
                                    while (rs00.next()) {
                                        ctr = rs00.getInt("YEAR(CURRENT_DATE)");
                                    }
                                    System.out.print(ctr);
                                    if (flag == 1) {
                                        PreparedStatement ps1 = con.prepareStatement("SELECT * FROM `tender_info` WHERE YEAR(reg_date)='" + ctr + "' and MONTH(reg_date)='1' and tm_id='" + tm_id + "'");
                                        ResultSet rs1 = ps1.executeQuery();
                                        while (rs1.next()) {
                                            jan++;
                                            tender_id1[0] = rs1.getInt("tender_id");
                                            PreparedStatement pst1 = con.prepareStatement("SELECT * FROM `fill_tender` WHERE  tender_id='" + tender_id1[0] + "'");
                                            ResultSet rst1 = pst1.executeQuery();
                                            while (rst1.next()) {
                                                tender_filled1++;
                                            }
                                        }
                                        PreparedStatement ps2 = con.prepareStatement("SELECT * FROM `tender_info` WHERE YEAR(reg_date)='" + ctr + "' and MONTH(reg_date)='2' and tm_id='" + tm_id + "'");
                                        ResultSet rs2 = ps2.executeQuery();
                                        while (rs2.next()) {
                                            feb++;
                                            tender_id1[1] = rs2.getInt("tender_id");
                                            PreparedStatement pst2 = con.prepareStatement("SELECT * FROM `fill_tender` WHERE  tender_id='" + tender_id1[1] + "'");
                                            ResultSet rst2 = pst2.executeQuery();
                                            while (rst2.next()) {
                                                tender_filled2++;
                                            }
                                        }
                                        PreparedStatement ps3 = con.prepareStatement("SELECT * FROM `tender_info` WHERE YEAR(reg_date)='" + ctr + "' and MONTH(reg_date)='3' and tm_id='" + tm_id + "'");
                                        ResultSet rs3 = ps3.executeQuery();
                                        while (rs3.next()) {
                                            mar++;
                                            tender_id1[2] = rs3.getInt("tender_id");
                                            PreparedStatement pst3 = con.prepareStatement("SELECT * FROM `fill_tender` WHERE  tender_id='" + tender_id1[2] + "'");
                                            ResultSet rst3 = pst3.executeQuery();
                                            while (rst3.next()) {
                                                tender_filled3++;
                                            }
                                        }
                                        PreparedStatement ps4 = con.prepareStatement("SELECT * FROM `tender_info` WHERE YEAR(reg_date)='" + ctr + "' and MONTH(reg_date)='4' and tm_id='" + tm_id + "'");
                                        ResultSet rs4 = ps4.executeQuery();
                                        while (rs4.next()) {
                                            apr++;
                                            tender_id1[3] = rs4.getInt("tender_id");
                                            PreparedStatement pst4 = con.prepareStatement("SELECT * FROM `fill_tender` WHERE  tender_id='" + tender_id1[3] + "'");
                                            ResultSet rst4 = pst4.executeQuery();
                                            while (rst4.next()) {
                                                tender_filled4++;
                                            }
                                        }
                                        PreparedStatement ps5 = con.prepareStatement("SELECT * FROM `tender_info` WHERE YEAR(reg_date)='" + ctr + "' and MONTH(reg_date)='5' and tm_id='" + tm_id + "'");
                                        ResultSet rs5 = ps5.executeQuery();
                                        while (rs5.next()) {
                                            may++;
                                            tender_id1[4] = rs5.getInt("tender_id");
                                            PreparedStatement pst5 = con.prepareStatement("SELECT * FROM `fill_tender` WHERE  tender_id='" + tender_id1[4] + "'");
                                            ResultSet rst5 = pst5.executeQuery();
                                            while (rst5.next()) {
                                                tender_filled5++;
                                            }
                                        }
                                        PreparedStatement ps6 = con.prepareStatement("SELECT * FROM `tender_info` WHERE YEAR(reg_date)='" + ctr + "' and MONTH(reg_date)='6' and tm_id='" + tm_id + "'");
                                        ResultSet rs6 = ps6.executeQuery();
                                        while (rs6.next()) {
                                            jun++;
                                            tender_id1[5] = rs6.getInt("tender_id");
                                            PreparedStatement pst6 = con.prepareStatement("SELECT * FROM `fill_tender` WHERE tender_id='" + tender_id1[5] + "'");
                                            ResultSet rst6 = pst6.executeQuery();
                                            while (rst6.next()) {
                                                tender_filled6++;
                                            }
                                        }
                                        PreparedStatement ps7 = con.prepareStatement("SELECT * FROM `tender_info` WHERE YEAR(reg_date)='" + ctr + "' and MONTH(reg_date)='7' and tm_id='" + tm_id + "'");
                                        ResultSet rs7 = ps7.executeQuery();
                                        while (rs7.next()) {
                                            jul++;
                                            tender_id1[6] = rs7.getInt("tender_id");
                                            PreparedStatement pst7 = con.prepareStatement("SELECT * FROM `fill_tender` WHERE  tender_id='" + tender_id1[6] + "'");
                                            ResultSet rst7 = pst7.executeQuery();
                                            while (rst7.next()) {
                                                tender_filled7++;
                                            }
                                        }
                                        PreparedStatement ps8 = con.prepareStatement("SELECT * FROM `tender_info` WHERE YEAR(reg_date)='" + ctr + "' and MONTH(reg_date)='8' and tm_id='" + tm_id + "'");
                                        ResultSet rs8 = ps8.executeQuery();
                                        while (rs8.next()) {
                                            aug++;
                                            tender_id1[7] = rs8.getInt("tender_id");
                                            PreparedStatement pst8 = con.prepareStatement("SELECT * FROM `fill_tender` WHERE  tender_id='" + tender_id1[7] + "'");
                                            ResultSet rst8 = pst8.executeQuery();
                                            while (rst8.next()) {
                                                tender_filled8++;
                                            }
                                        }

                                        PreparedStatement ps9 = con.prepareStatement("SELECT * FROM `tender_info` WHERE YEAR(reg_date)='" + ctr + "' and MONTH(reg_date)='9' and tm_id='" + tm_id + "'");
                                        ResultSet rs9 = ps9.executeQuery();
                                        while (rs9.next()) {
                                            sep++;
                                            tender_id1[8] = rs9.getInt("tender_id");
                                            PreparedStatement pst9 = con.prepareStatement("SELECT * FROM `fill_tender` WHERE  tender_id='" + tender_id1[8] + "'");
                                            ResultSet rst9 = pst9.executeQuery();
                                            while (rst9.next()) {
                                                tender_filled9++;
                                            }
                                        }
                                        PreparedStatement ps10 = con.prepareStatement("SELECT * FROM `tender_info` WHERE YEAR(reg_date)='" + ctr + "' and MONTH(reg_date)='10' and tm_id='" + tm_id + "'");
                                        ResultSet rs10 = ps10.executeQuery();
                                        while (rs10.next()) {
                                            oct++;
                                            tender_id1[9] = rs10.getInt("tender_id");
                                            PreparedStatement pst10 = con.prepareStatement("SELECT * FROM `fill_tender` WHERE  tender_id='" + tender_id1[9] + "'");
                                            ResultSet rst10 = pst10.executeQuery();
                                            while (rst10.next()) {
                                                tender_filled10++;
                                            }
                                        }
                                        PreparedStatement ps11 = con.prepareStatement("SELECT * FROM `tender_info` WHERE YEAR(reg_date)='" + ctr + "' and MONTH(reg_date)='11' and tm_id='" + tm_id + "'");
                                        ResultSet rs11 = ps11.executeQuery();
                                        while (rs11.next()) {
                                            nov++;
                                            tender_id1[10] = rs11.getInt("tender_id");
                                            PreparedStatement pst11 = con.prepareStatement("SELECT * FROM `fill_tender` WHERE tender_id='" + tender_id1[10] + "'");
                                            ResultSet rst11 = pst11.executeQuery();
                                            while (rst11.next()) {
                                                tender_filled11++;
                                            }
                                        }
                                        PreparedStatement ps12 = con.prepareStatement("SELECT * FROM `tender_info` WHERE YEAR(reg_date)='" + ctr + "' and MONTH(reg_date)='12' and tm_id='" + tm_id + "'");
                                        ResultSet rs12 = ps12.executeQuery();
                                        while (rs12.next()) {
                                            dec++;
                                            tender_id1[11] = rs12.getInt("tender_id");
                                            PreparedStatement pst12 = con.prepareStatement("SELECT * FROM `fill_tender` WHERE  tender_id='" + tender_id1[11] + "'");
                                            ResultSet rst12 = pst12.executeQuery();
                                            while (rs12.next()) {
                                                tender_filled12++;
                                            }
                                        }

                                    } else if (flag == 2) {

                                        PreparedStatement ps1 = con.prepareStatement("SELECT * FROM `tender_info` WHERE YEAR(reg_date)='" + ctr + "' and MONTH(reg_date)='1' and category_id='" + category_id + "'");
                                        ResultSet rs1 = ps1.executeQuery();
                                        while (rs1.next()) {
                                            jan++;
                                        }
                                        PreparedStatement ps2 = con.prepareStatement("SELECT * FROM `tender_info` WHERE YEAR(reg_date)='" + ctr + "' and MONTH(reg_date)='2' and category_id='" + category_id + "'");
                                        ResultSet rs2 = ps2.executeQuery();
                                        while (rs2.next()) {
                                            feb++;
                                        }
                                        PreparedStatement ps3 = con.prepareStatement("SELECT * FROM `tender_info` WHERE YEAR(reg_date)='" + ctr + "' and MONTH(reg_date)='3' and category_id='" + category_id + "'");
                                        ResultSet rs3 = ps3.executeQuery();
                                        while (rs3.next()) {
                                            mar++;
                                        }
                                        PreparedStatement ps4 = con.prepareStatement("SELECT * FROM `tender_info` WHERE YEAR(reg_date)='" + ctr + "' and MONTH(reg_date)='4' and category_id='" + category_id + "'");
                                        ResultSet rs4 = ps4.executeQuery();
                                        while (rs4.next()) {
                                            apr++;
                                        }
                                        PreparedStatement ps5 = con.prepareStatement("SELECT * FROM `tender_info` WHERE YEAR(reg_date)='" + ctr + "' and MONTH(reg_date)='5' and category_id='" + category_id + "'");
                                        ResultSet rs5 = ps5.executeQuery();
                                        while (rs5.next()) {
                                            may++;
                                        }
                                        PreparedStatement ps6 = con.prepareStatement("SELECT * FROM `tender_info` WHERE YEAR(reg_date)='" + ctr + "' and MONTH(reg_date)='6' and category_id='" + category_id + "'");
                                        ResultSet rs6 = ps6.executeQuery();
                                        while (rs6.next()) {
                                            jun++;
                                        }
                                        PreparedStatement ps7 = con.prepareStatement("SELECT * FROM `tender_info` WHERE YEAR(reg_date)='" + ctr + "' and MONTH(reg_date)='7' and category_id='" + category_id + "'");
                                        ResultSet rs7 = ps7.executeQuery();
                                        while (rs7.next()) {
                                            jul++;
                                        }
                                        PreparedStatement ps8 = con.prepareStatement("SELECT * FROM `tender_info` WHERE YEAR(reg_date)='" + ctr + "' and MONTH(reg_date)='8' and category_id='" + category_id + "'");
                                        ResultSet rs8 = ps8.executeQuery();
                                        while (rs8.next()) {
                                            aug++;
                                        }

                                        PreparedStatement ps9 = con.prepareStatement("SELECT * FROM `tender_info` WHERE YEAR(reg_date)='" + ctr + "' and MONTH(reg_date)='9' and category_id='" + category_id + "'");
                                        ResultSet rs9 = ps9.executeQuery();
                                        while (rs9.next()) {
                                            sep++;
                                        }
                                        PreparedStatement ps10 = con.prepareStatement("SELECT * FROM `tender_info` WHERE YEAR(reg_date)='" + ctr + "' and MONTH(reg_date)='10' and category_id='" + category_id + "'");
                                        ResultSet rs10 = ps10.executeQuery();
                                        while (rs10.next()) {
                                            oct++;
                                        }
                                        PreparedStatement ps11 = con.prepareStatement("SELECT * FROM `tender_info` WHERE YEAR(reg_date)='" + ctr + "' and MONTH(reg_date)='11' and category_id='" + category_id + "'");
                                        ResultSet rs11 = ps11.executeQuery();
                                        while (rs11.next()) {
                                            nov++;
                                        }
                                        PreparedStatement ps12 = con.prepareStatement("SELECT * FROM `tender_info` WHERE YEAR(reg_date)='" + ctr + "' and MONTH(reg_date)='12' and category_id='" + category_id + "'");
                                        ResultSet rs12 = ps12.executeQuery();
                                        while (rs12.next()) {
                                            dec++;
                                        }

                                    }
                                    System.out.println("llll" + ctr + category_id);
                                %>
                                <link rel="stylesheet" href="dashboard_css/graph.css">
                                <!--//graph-->
                                <script src="dashboard_js/jquery.flot.js"></script>
                                <script>
            $(document).ready(function () {

// Graph Data ##############################################
                var graphData = [{
// Visits
                        data: [[1, <%=jan%>], [2, <%=feb%>], [3, <%=mar%>], [4, <%=apr%>], [5, <%=may%>], [6, <%=jun%>], [7, <%=jul%>], [8, <%=aug%>], [9, <%=sep%>], [10, <%=oct%>], [11, <%=nov%>], [12, <%=dec%>]],
                        color: '#3bb2d0',
                        points: {radius: 4, fillColor: '#3bb2d0'}
                    }
// Returning Visits

                ];

// Lines Graph #############################################
                $.plot($('#graph-lines'), graphData, {
                    series: {
                        points: {
                            show: true,
                            radius: 5
                        },
                        lines: {
                            show: true
                        },
                        shadowSize: 0
                    },
                    grid: {
                        color: '#7f8c8d',
                        borderColor: 'transparent',
                        borderWidth: 20,
                        hoverable: true
                    },
                    xaxis: {
                        tickColor: 'transparent',
                        tickDecimals: 2
                    },
                    yaxis: {
                        tickSize: 1
                    }
                });

// Bars Graph ##############################################
                $.plot($('#graph-bars'), graphData, {
                    series: {
                        bars: {
                            show: true,
                            barWidth: .9,
                            align: 'center'
                        },
                        shadowSize: 0
                    },
                    grid: {
                        color: '#7f8c8d',
                        borderColor: 'transparent',
                        borderWidth: 20,
                        hoverable: true
                    },
                    xaxis: {
                        tickColor: 'transparent',
                        tickDecimals: 2
                    },
                    yaxis: {
                        tickSize: 1
                    }
                });

// Graph Toggle ############################################
                $('#graph-bars').hide();

                $('#lines').on('click', function (e) {
                    $('#bars').removeClass('active');
                    $('#graph-bars').fadeOut();
                    $(this).addClass('active');
                    $('#graph-lines').fadeIn();
                    e.preventDefault();
                });

                $('#bars').on('click', function (e) {
                    $('#lines').removeClass('active');
                    $('#graph-lines').fadeOut();
                    $(this).addClass('active');
                    $('#graph-bars').fadeIn().removeClass('hidden');
                    e.preventDefault();
                });

// Tooltip #################################################
                function showTooltip(x, y, contents) {
                    $('<div id="tooltip">' + contents + '</div>').css({
                        top: y - 16,
                        left: x + 20
                    }).appendTo('body').fadeIn();
                }

                var previousPoint = null;

                $('#graph-lines, #graph-bars').bind('plothover', function (event, pos, item) {
                    if (item) {
                        if (previousPoint != item.dataIndex) {
                            previousPoint = item.dataIndex;
                            $('#tooltip').remove();
                            var x = item.datapoint[0],
                                    y = item.datapoint[1];
                            showTooltip(item.pageX, item.pageY, y + ' Tenders posted at ' + x + 'th month');
                        }
                    } else {
                        $('#tooltip').remove();
                        previousPoint = null;
                    }
                });

            });
                                </script>
                                <div class="graph-container" id="graph1">

                                    <div id="graph-lines" style="width:700px;"></div>
                                    <div id="graph-bars"> </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="clearfix"> </div>
                </div><div class="blank-page" >
  
                        <%  if (flag == 1) {
                        
                        if(prev_tender1!=0){
                        %>
                          <div class="table-view-tender" id="View"  style="overflow-x:auto;">                                   
                    <table align="center"> 
                        <tr>
                            <th  >FILL_TENDER_ID</th>                
                            <th >TENDERER ID</th>                
                            <th>TENDER ID</th>                
                            <th>DATE OF FILL</th>             
                        </tr>
                        <%System.out.print("vvvvlll"+tender_id);
                           int count_tende = 0;
                               
                                PreparedStatement count_tender = con.prepareStatement("SELECT * FROM fill_tender where tender_id='" + tender_id + "'");
                                ResultSet rs_counttender = count_tender.executeQuery();
                                while (rs_counttender.next()) {
                                  
                                    count_tende++;
                                }
                              
                                            int pagenation = 1;
                                            double total_tender1 = (double) count_tende / 5;
                                            double no_record = 0;
                                            String product_id="";
                                            no_record = Math.ceil(total_tender1);
                            PreparedStatement ps_tb = con.prepareStatement("SELECT * FROM fill_tender where tender_id='" + tender_id + "'limit 0,5");

                            ResultSet rs_tb = ps_tb.executeQuery();
                            while (rs_tb.next()) {
                                System.out.print("vvvv");
                        %>
                        <tr>
                            <td><%=rs_tb.getInt("fill_tender_id")%></td>
                            <td><%=rs_tb.getString("tenderer_id")%></td>
                            <td ><%=rs_tb.getInt("tender_id")%></td>
                            <td><%=rs_tb.getString("date_of_fill")%></td>
                        </tr>    
                        
                        <%}%>
                         </table>       
    </div>
                         <nav align="center">
                                 <input type="hidden" value="<%=no_record%>" id="last_page">
                                 <ul class="pagination" id="ul1">
                                  
                                        <% while (pagenation <= no_record) {   if(pagenation<=10){%>                                   
                                    <li><a href="#"><%=pagenation%></a></li>                                                                        
                                        <%
                                                
                                              
                                                   
                                                }
pagenation++;
                                            }
 if(pagenation>10){
                                        %>
                                          
                                    <li><a href="#"><input type="text" style="height: 20px;width: 140px;" placeholder="Search page(Total pages<%=pagenation%>)"  onblur="pagi(this);" id="pagi"></a></li>
                                    <li><a href="#"><%=pagenation-1%></a></li>                                                                        
                                    <% }%>
                                   
                                </ul>
                         
                            </nav>
                       <% }else{%>
                        
                        No Data Found!!
                        <%}} else if (flag == 2) {
                        if(total_year2!=0){
                        
                        
                        
                        %>
  <div class="table-view-tender" id="View"  style="overflow-x:auto;">                                   
                    <table align="center"> 

                        <tr>
                            <th>TENDER ID</th>                
                            <th>TITLE</th>                
                            <th>CATEGORY ID</th>                
                            <th >DESCRIPTION</th>                

                            <th >PRODUCT ID</th>                
                            <th >PRICE</th>                
                            <th >TYPE OF WORK</th>                
                            <th >REGISTRATION DATE</th>                
                            <th >VERIFICATION DATE</th>                
                            <th >RESULT DECLARE DATE</th>                

                        </tr>
                        <%   int count_tende = 0;
                               
                                PreparedStatement count_tender = con.prepareStatement("SELECT * FROM `tender_info` where category_id='" + category_id + "'");
                                ResultSet rs_counttender = count_tender.executeQuery();
                                while (rs_counttender.next()) {
                                  
                                    count_tende++;
                                }
                              
                                            int pagenation = 1;
                                            double total_tender1 = (double) count_tende / 5;
                                            double no_record = 0;
                                            String product_id="";
                                            no_record = Math.ceil(total_tender1);
                            PreparedStatement ps_tb = con.prepareStatement("SELECT * FROM `tender_info` where category_id='" + category_id + "'limit 0,5");

                            ResultSet rs_tb = ps_tb.executeQuery();
                            while (rs_tb.next()) {

                        %>
                        <tr  class="tr">
                            <td class="td"><%=rs_tb.getInt("tender_id")%></td>
                            <td class="td"><%=rs_tb.getString("title")%></td>
                            <td class="td"><%=rs_tb.getInt("category_id")%></td>
                            <td class="td"><%=rs_tb.getString("description")%></td>

                            <td class="td"><%=rs_tb.getInt("product_id")%></td>
                            <td class="td"><%=rs_tb.getString("price")%></td>
                            <td class="td"><%=rs_tb.getString("type_of_work")%></td>
                            <td class="td"><%=rs_tb.getDate("reg_date")%></td>
                            <td class="td"><%=rs_tb.getDate("verification_date")%></td>
                            <td class="td"><%=rs_tb.getDate("result_dec_date")%></td>
                        </tr>  
                         <%}%>
                          </table>       
    </div>
                          <nav align="center">
                                 <input type="hidden" value="<%=no_record%>" id="last_page">
                                 <ul class="pagination" id="ul1">
                                  
                                        <% while (pagenation <= no_record) {   if(pagenation<=10){%>                                   
                                    <li><a href="#"><%=pagenation%></a></li>                                                                        
                                        <%
                                                
                                              
                                                   
                                                }
pagenation++;
                                            }
 if(pagenation>10){
                                        %>
                                          
                                    <li><a href="#"><input type="text" style="height: 20px;width: 140px;" placeholder="Search page(Total pages<%=pagenation%>)"  onblur="pagi(this);" id="pagi"></a></li>
                                    <li><a href="#"><%=pagenation-1%></a></li>                                                                        
                                    <% }%>
                                   
                                </ul>
                         
                            </nav>
                        <%}else{%>
                        
                        No Data Found!!
                        <%}
                            }%>
                   
                    <div class="clearfix"> </div>
                </div>
                <!----->
                <%} else {%>
                <!----->
                <div class="asked">

                    no data found


                </div>
                <%}%>
                <!--//content-->
                <!--//content-->
                <!---->
                <div class="copy">
                    <p> &copy; 2016 TenderoTic. All Rights Reserved </p>
                </div>
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

