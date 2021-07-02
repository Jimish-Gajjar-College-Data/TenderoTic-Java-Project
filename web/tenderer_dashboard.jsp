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
                } else if(val1 == "Category") {
                    $("#drop12").show();
                    $("#drop1").hide();
                }else{
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
            <%
                PreparedStatement ps_new_pass = con.prepareStatement("Select * from tenderer_login where tenderer_id ='" + Tenderer_id + "' AND approve = 1");
                ResultSet rs_new_pass = ps_new_pass.executeQuery();
                if (rs_new_pass.next()) {%>
            <script type="text/javascript">
            $(document).ready(function () {
                $('#Tenderer_New_Pass').modal({backdrop: 'static',keyboard: false}, 'show');
            });
            </script>
            <%}%>
            <!-- First Time Change Password -->
            <div class="modal fade" id="Tenderer_New_Pass" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" align="center">First change password</h4>
                        </div><br>
                        <div class="modal-body">
                            <script>
                                function validate(form) {
                                    var e = form.elements;

                                    if (e['new_pass'].value != e['confirm_new_pass'].value) {
                                        alert("Passwords don't match.");
                                        return false;
                                    }
                                    return true;
                                }
                            </script>
                            <form action="Tenderer_new_change_pass" method="get" role="form" onsubmit="return validate(this)" class="form-horizontal">
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <div class="input-group">							
                                            <span class="input-group-addon">
                                                <i class="fa fa-key"></i>
                                            </span>
                                            <input type="password" name="new_pass" class="form-control1" placeholder="New password" required="" maxlength="16" minlength="8">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <div class="input-group">
                                            <span class="input-group-addon">
                                                <i class="fa fa-key"></i>
                                            </span>
                                            <input type="password" name="confirm_new_pass" class="form-control1" placeholder="Confirm new password" required="" maxlength="16" minlength="8">
                                        </div>
                                        <div class="modal-footer">
                                            <input type="submit" class="btn btn-primary" value="Save changes">
                                            <a class="btn btn-default btn-send" href="Tenderer_logout">Logout</a>
                                        </div>
                                    </div>
                                </div>                                
                                <div class="clearfix"> </div>   
                            </form>
                        </div>                        
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div>
            <!-- // First Time Change Password -->

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
                            <span>Dashboard</span>
                        </h2>
                    </div>
                    <!--//banner-->
                    <!--content-->
                    <div class="content-top">


                        <div class="col-md-4 ">
                            <div class="content-top-1">
                                <div class="col-md-6 top-content">
                                    <%
                                        float total_tender = 0, prev_tender = 0, total_year2 = 0;
                                        int prev_month = 0, pre_year = 0, cur_month = 0;

                                        PreparedStatement ps_nrf = con.prepareStatement("SELECT month(now())-1,YEAR(NOW()) FROM DUAL");
                                        ResultSet rs_nrf = ps_nrf.executeQuery();
                                        while (rs_nrf.next()) {
                                            prev_month = rs_nrf.getInt("month(now())-1");
                                            pre_year = rs_nrf.getInt("YEAR(now())");
                                        }

                                        PreparedStatement ps_tp = con.prepareStatement("SELECT * FROM `tender_info`where month(reg_date)='" + prev_month + "'and year(reg_date)='" + pre_year + "'");
                                        ResultSet rs_tp = ps_tp.executeQuery();
                                        while (rs_tp.next()) {
                                            prev_tender++;
                                        }
                                        PreparedStatement ps_tp1 = con.prepareStatement("SELECT * FROM `tender_info`where month(reg_date)<'" + prev_month + "'and year(reg_date)='" + pre_year + "'");
                                        ResultSet rs_tp1 = ps_tp1.executeQuery();
                                        while (rs_tp1.next()) {
                                            total_tender++;
                                        }
                                        total_year2 = total_tender + prev_tender;
                                        prev_tender = ((prev_tender / total_year2) * 100);
                                        System.out.println(Math.round(prev_tender));
                                    %>
                                    <h5>New Tender Posted</h5>
                                    <label><%=total_year2%></label>
                                </div>
                                <div class="col-md-6 top-content1">	   
                                    <div id="demo-pie-1" class="pie-title-center" data-percent="<%=Math.round(prev_tender)%>"> <span class="pie-value"></span> </div>
                                </div>
                                <div class="clearfix"> </div>
                            </div>
                            <div class="content-top-1">
                                <div class="col-md-6 top-content">
                                    <h5>Result of Tenders</h5>
                                    <label>6295</label>
                                </div>
                                <div class="col-md-6 top-content1">	   
                                    <div id="demo-pie-2" class="pie-title-center" data-percent="50"> <span class="pie-value"></span> </div>
                                </div>
                                <div class="clearfix"> </div>
                            </div>

                        </div>
                        <div class="col-md-8 content-top-2" id="chart" style="width:725px;">
                            <!---start-chart---->
                            <!----->
                            <div class="content-graph"  style="width:725px; overflow-x:auto;">
                                <div class="content-color">
                                    <div class="content-ch"><p><i></i>Tenders Posted </p>
                                        <div class="clearfix"> </div>
                                    </div>
                                    <div class="content-ch1"><p><i></i>Tenders Filled</p>
                                        <div class="clearfix"> </div>
                                    </div>
                                </div>
                                <!--graph-->
                                <%
                                    int jan = 0, feb = 0, mar = 0, apr = 0, may = 0, jun = 0, jul = 0, aug = 0, sep = 0, oct = 0, nov = 0, dec = 0, ctr = 0;
                                    int jan1 = 0, feb1 = 0, mar1 = 0, apr1 = 0, may1 = 0, jun1 = 0, jul1 = 0, aug1 = 0, sep1 = 0, oct1 = 0, nov1 = 0, dec1 = 0, ctr1 = 0;

                                    PreparedStatement ps0 = con.prepareStatement("SELECT YEAR(CURRENT_DATE) FROM `tender_info`");
                                    ResultSet rs0 = ps0.executeQuery();
                                    while (rs0.next()) {
                                        ctr = rs0.getInt("YEAR(CURRENT_DATE)");
                                    }
                                    System.out.print(ctr);
                                    PreparedStatement ps1 = con.prepareStatement("SELECT * FROM `tender_info` WHERE YEAR(reg_date)='" + ctr + "' and MONTH(reg_date)='1'");
                                    ResultSet rs1 = ps1.executeQuery();
                                    while (rs1.next()) {
                                        jan++;
                                    }
                                    PreparedStatement ps2 = con.prepareStatement("SELECT * FROM `tender_info` WHERE YEAR(reg_date)='" + ctr + "' and MONTH(reg_date)='2'");
                                    ResultSet rs2 = ps2.executeQuery();
                                    while (rs2.next()) {
                                        feb++;
                                    }
                                    PreparedStatement ps3 = con.prepareStatement("SELECT * FROM `tender_info` WHERE YEAR(reg_date)='" + ctr + "' and MONTH(reg_date)='3'");
                                    ResultSet rs3 = ps3.executeQuery();
                                    while (rs3.next()) {
                                        mar++;
                                    }
                                    PreparedStatement ps4 = con.prepareStatement("SELECT * FROM `tender_info` WHERE YEAR(reg_date)='" + ctr + "' and MONTH(reg_date)='4'");
                                    ResultSet rs4 = ps4.executeQuery();
                                    while (rs4.next()) {
                                        apr++;
                                    }
                                    PreparedStatement ps5 = con.prepareStatement("SELECT * FROM `tender_info` WHERE YEAR(reg_date)='" + ctr + "' and MONTH(reg_date)='5'");
                                    ResultSet rs5 = ps5.executeQuery();
                                    while (rs5.next()) {
                                        may++;
                                    }
                                    PreparedStatement ps6 = con.prepareStatement("SELECT * FROM `tender_info` WHERE YEAR(reg_date)='" + ctr + "' and MONTH(reg_date)='6'");
                                    ResultSet rs6 = ps6.executeQuery();
                                    while (rs6.next()) {
                                        jun++;
                                    }
                                    PreparedStatement ps7 = con.prepareStatement("SELECT * FROM `tender_info` WHERE YEAR(reg_date)='" + ctr + "' and MONTH(reg_date)='7'");
                                    ResultSet rs7 = ps7.executeQuery();
                                    while (rs7.next()) {
                                        jul++;
                                    }
                                    PreparedStatement ps8 = con.prepareStatement("SELECT * FROM `tender_info` WHERE YEAR(reg_date)='" + ctr + "' and MONTH(reg_date)='8'");
                                    ResultSet rs8 = ps8.executeQuery();
                                    while (rs8.next()) {
                                        aug++;
                                    }

                                    PreparedStatement ps9 = con.prepareStatement("SELECT * FROM `tender_info` WHERE YEAR(reg_date)='" + ctr + "' and MONTH(reg_date)='9'");
                                    ResultSet rs9 = ps9.executeQuery();
                                    while (rs9.next()) {
                                        sep++;
                                    }
                                    PreparedStatement ps10 = con.prepareStatement("SELECT * FROM `tender_info` WHERE YEAR(reg_date)='" + ctr + "' and MONTH(reg_date)='10'");
                                    ResultSet rs10 = ps10.executeQuery();
                                    while (rs10.next()) {
                                        oct++;
                                    }
                                    PreparedStatement ps11 = con.prepareStatement("SELECT * FROM `tender_info` WHERE YEAR(reg_date)='" + ctr + "' and MONTH(reg_date)='11'");
                                    ResultSet rs11 = ps11.executeQuery();
                                    while (rs11.next()) {
                                        nov++;
                                    }
                                    PreparedStatement ps12 = con.prepareStatement("SELECT * FROM `tender_info` WHERE YEAR(reg_date)='" + ctr + "' and MONTH(reg_date)='12'");
                                    ResultSet rs12 = ps12.executeQuery();
                                    while (rs12.next()) {
                                        dec++;
                                    }

                                    System.out.print(ctr);
                                    PreparedStatement pst1 = con.prepareStatement("SELECT * FROM `fill_tender` WHERE YEAR(date_of_fill)='" + ctr + "' and MONTH(date_of_fill)='1' and tenderer_id='1'");
                                    ResultSet rst1 = pst1.executeQuery();
                                    while (rst1.next()) {
                                        jan1++;
                                    }
                                    PreparedStatement pst2 = con.prepareStatement("SELECT * FROM `fill_tender` WHERE YEAR(date_of_fill)='" + ctr + "' and MONTH(date_of_fill)='2'  and tenderer_id='1'");
                                    ResultSet rst2 = pst2.executeQuery();
                                    while (rst2.next()) {
                                        feb1++;
                                    }
                                    PreparedStatement pst3 = con.prepareStatement("SELECT * FROM `fill_tender` WHERE YEAR(date_of_fill)='" + ctr + "' and MONTH(date_of_fill)='3'  and tenderer_id='1'");
                                    ResultSet rst3 = pst3.executeQuery();
                                    while (rst3.next()) {
                                        mar1++;
                                    }
                                    PreparedStatement pst4 = con.prepareStatement("SELECT * FROM `fill_tender` WHERE YEAR(date_of_fill)='" + ctr + "' and MONTH(date_of_fill)='4'  and tenderer_id='1'");
                                    ResultSet rst4 = pst4.executeQuery();
                                    while (rst4.next()) {
                                        apr1++;
                                    }
                                    PreparedStatement pst5 = con.prepareStatement("SELECT * FROM `fill_tender` WHERE YEAR(date_of_fill)='" + ctr + "' and MONTH(date_of_fill)='5' and tenderer_id='1'");
                                    ResultSet rst5 = pst5.executeQuery();
                                    while (rst5.next()) {
                                        may1++;
                                    }
                                    PreparedStatement pst6 = con.prepareStatement("SELECT * FROM `fill_tender` WHERE YEAR(date_of_fill)='" + ctr + "' and MONTH(date_of_fill)='6'  and tenderer_id='1'");
                                    ResultSet rst6 = pst6.executeQuery();
                                    while (rst6.next()) {
                                        jun1++;
                                    }
                                    PreparedStatement pst7 = con.prepareStatement("SELECT * FROM `fill_tender` WHERE YEAR(date_of_fill)='" + ctr + "' and MONTH(date_of_fill)='7'  and tenderer_id='1'");
                                    ResultSet rst7 = pst7.executeQuery();
                                    while (rst7.next()) {
                                        jul1++;
                                    }
                                    PreparedStatement pst8 = con.prepareStatement("SELECT * FROM `fill_tender` WHERE YEAR(date_of_fill)='" + ctr + "' and MONTH(date_of_fill)='8'  and tenderer_id='1'");
                                    ResultSet rst8 = pst8.executeQuery();
                                    while (rst8.next()) {
                                        aug1++;
                                    }

                                    PreparedStatement pst9 = con.prepareStatement("SELECT * FROM `fill_tender` WHERE YEAR(date_of_fill)='" + ctr + "' and MONTH(date_of_fill)='9'  and tenderer_id='1'");
                                    ResultSet rst9 = pst9.executeQuery();
                                    while (rst9.next()) {
                                        sep1++;
                                    }
                                    PreparedStatement pst10 = con.prepareStatement("SELECT * FROM `fill_tender` WHERE YEAR(date_of_fill)='" + ctr + "' and MONTH(date_of_fill)='10'  and tenderer_id='1'");
                                    ResultSet rst10 = pst10.executeQuery();
                                    while (rst10.next()) {
                                        oct1++;
                                    }
                                    PreparedStatement pst11 = con.prepareStatement("SELECT * FROM `fill_tender` WHERE YEAR(date_of_fill)='" + ctr + "' and MONTH(date_of_fill)='11'  and tenderer_id='1'");
                                    ResultSet rst11 = pst11.executeQuery();
                                    while (rst11.next()) {
                                        nov1++;
                                    }
                                    PreparedStatement pst12 = con.prepareStatement("SELECT * FROM `fill_tender` WHERE YEAR(date_of_fill)='" + ctr + "' and MONTH(date_of_fill)='12'  and tenderer_id='1'");
                                    ResultSet rst12 = pst12.executeQuery();
                                    while (rs12.next()) {
                                        dec1++;
                                    }

                                    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

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
                                        }, {
                                            // Returning Visits
                                            data: [[1, <%=jan1%>], [2, <%=feb1%>], [3, <%=mar1%>], [4, <%=apr1%>], [5, <%=may1%>], [6, <%=jun1%>], [7, <%=jul1%>], [8, <%=aug1%>], [9, <%=sep1%>], [10, <%=oct1%>], [11, <%=nov1%>], [12, <%=dec1%>]],
                                            color: '#ffa800',
                                            points: {radius: 4, fillColor: '#ffa800'}
                                        }
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
                                                showTooltip(item.pageX, item.pageY, y + ' visitors at ' + x + '.00h');
                                            }
                                        } else {
                                            $('#tooltip').remove();
                                            previousPoint = null;
                                        }
                                    });

                                });
                                </script>
                                <div class="graph-container" id="graph1">
                                    <div id="graph-lines" style="width:720px;"></div>
                                    <div id="graph-bars"> </div>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                    <!---->


                    <div class="content-mid">

                        <div class="col-md-5">
                            <div class="cal1 cal_2"><div class="clndr"><div class="clndr-controls"><div class="clndr-control-button"><p class="clndr-previous-button">previous</p></div><div class="month">July 2015</div><div class="clndr-control-button rightalign"><p class="clndr-next-button">next</p></div></div><table class="clndr-table" border="0" cellspacing="0" cellpadding="0"><thead><tr class="header-days"><td class="header-day">S</td><td class="header-day">M</td><td class="header-day">T</td><td class="header-day">W</td><td class="header-day">T</td><td class="header-day">F</td><td class="header-day">S</td></tr></thead><tbody><tr><td class="day adjacent-month last-month calendar-day-2015-06-28"><div class="day-contents">28</div></td><td class="day adjacent-month last-month calendar-day-2015-06-29"><div class="day-contents">29</div></td><td class="day adjacent-month last-month calendar-day-2015-06-30"><div class="day-contents">30</div></td><td class="day calendar-day-2015-07-01"><div class="day-contents">1</div></td><td class="day calendar-day-2015-07-02"><div class="day-contents">2</div></td><td class="day calendar-day-2015-07-03"><div class="day-contents">3</div></td><td class="day calendar-day-2015-07-04"><div class="day-contents">4</div></td></tr><tr><td class="day calendar-day-2015-07-05"><div class="day-contents">5</div></td><td class="day calendar-day-2015-07-06"><div class="day-contents">6</div></td><td class="day calendar-day-2015-07-07"><div class="day-contents">7</div></td><td class="day calendar-day-2015-07-08"><div class="day-contents">8</div></td><td class="day calendar-day-2015-07-09"><div class="day-contents">9</div></td><td class="day calendar-day-2015-07-10"><div class="day-contents">10</div></td><td class="day calendar-day-2015-07-11"><div class="day-contents">11</div></td></tr><tr><td class="day calendar-day-2015-07-12"><div class="day-contents">12</div></td><td class="day calendar-day-2015-07-13"><div class="day-contents">13</div></td><td class="day calendar-day-2015-07-14"><div class="day-contents">14</div></td><td class="day calendar-day-2015-07-15"><div class="day-contents">15</div></td><td class="day calendar-day-2015-07-16"><div class="day-contents">16</div></td><td class="day calendar-day-2015-07-17"><div class="day-contents">17</div></td><td class="day calendar-day-2015-07-18"><div class="day-contents">18</div></td></tr><tr><td class="day calendar-day-2015-07-19"><div class="day-contents">19</div></td><td class="day calendar-day-2015-07-20"><div class="day-contents">20</div></td><td class="day calendar-day-2015-07-21"><div class="day-contents">21</div></td><td class="day calendar-day-2015-07-22"><div class="day-contents">22</div></td><td class="day calendar-day-2015-07-23"><div class="day-contents">23</div></td><td class="day calendar-day-2015-07-24"><div class="day-contents">24</div></td><td class="day calendar-day-2015-07-25"><div class="day-contents">25</div></td></tr><tr><td class="day calendar-day-2015-07-26"><div class="day-contents">26</div></td><td class="day calendar-day-2015-07-27"><div class="day-contents">27</div></td><td class="day calendar-day-2015-07-28"><div class="day-contents">28</div></td><td class="day calendar-day-2015-07-29"><div class="day-contents">29</div></td><td class="day calendar-day-2015-07-30"><div class="day-contents">30</div></td><td class="day calendar-day-2015-07-31"><div class="day-contents">31</div></td><td class="day adjacent-month next-month calendar-day-2015-08-01"><div class="day-contents">1</div></td></tr></tbody></table></div></div>
                            <!----Calender -------->
                            <link rel="stylesheet" href="dashboard_css/clndr.css" type="text/css" />
                            <script src="dashboard_js/underscore-min.js" type="text/javascript"></script>
                            <script src= "dashboard_js/moment-2.2.1.js" type="text/javascript"></script>
                            <script src="dashboard_js/clndr.js" type="text/javascript"></script>
                            <script src="dashboard_js/site.js" type="text/javascript"></script>
                            <!----End Calender -------->
                        </div>
                        <div class="col-md-7 mid-content-top">
                            <div class="middle-content">
                                <h3>Top Companies</h3>
                                <!-- start content_slider -->
                                <div id="owl-demo" class="owl-carousel text-center">
                                    <div class="item">
                                        <img class="lazyOwl img-responsive" data-src="images/logo1.jpg" alt="name">
                                    </div>
                                    <div class="item">
                                        <img class="lazyOwl img-responsive" data-src="images/logo5.jpg" alt="name">
                                    </div>
                                    <div class="item">
                                        <img class="lazyOwl img-responsive" data-src="images/logo6.png" alt="name">
                                    </div>
                                    <div class="item">
                                        <img class="lazyOwl img-responsive" data-src="images/logo1.jpg" alt="name">
                                    </div>
                                    <div class="item">
                                        <img class="lazyOwl img-responsive" data-src="images/logo5.jpg" alt="name">
                                    </div>
                                    <div class="item">
                                        <img class="lazyOwl img-responsive" data-src="images/logo6.png" alt="name">
                                    </div>
                                    <div class="item">
                                        <img class="lazyOwl img-responsive" data-src="images/logo1.jpg" alt="name">
                                    </div>

                                </div>
                            </div>
                            <!--//sreen-gallery-cursual---->
                            <!-- requried-jsfiles-for owl -->
                            <link href="dashboard_css/owl.carousel.css" rel="stylesheet">
                            <script src="dashboard_js/owl.carousel.js"></script>
                            <script>
                                $(document).ready(function () {
                                    $("#owl-demo").owlCarousel({
                                        items: 3,
                                        lazyLoad: true,
                                        autoPlay: true,
                                        pagination: true,
                                        nav: true,
                                    });
                                });
                            </script>
                            <!-- //requried-jsfiles-for owl -->
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                    <!----->
                    <div class="content-bottom">
                        <div class="col-md-6 post-top">
                            <div class="post">
                                <form class="text-area">
                                    <textarea   required="" > What are you doing...</textarea>
                                </form>
                                <div class="post-at">
                                    <ul class="icon">
                                        <div  class="post-file">
                                            <i class="fa fa-location-arrow"></i>
                                            <input id="input-1" name="input1[]" type="file" multiple="" class="">
                                        </div>
                                        <div  class="post-file">
                                            <i class="fa fa-camera"></i>
                                            <input id="input-2" name="input2[]" type="file" multiple="" class="">
                                        </div>
                                        <div  class="post-file">
                                            <i class="fa fa-video-camera"></i>
                                            <input id="input-3" name="input3[]" type="file" multiple="" class="">
                                        </div>
                                        <div  class="post-file">
                                            <i class="fa fa-microphone"></i>
                                            <input id="input-4" name="input4[]" type="file" multiple="" class="">
                                        </div>

                                        <script>
                                            $(document).on('ready', function () {
                                                $("#input-1").fileinput({showCaption: false});
                                            });
                                        </script>
                                        <script>
                                            $(document).on('ready', function () {
                                                $("#input-2").fileinput({showCaption: false});
                                            });
                                        </script>
                                        <script>
                                            $(document).on('ready', function () {
                                                $("#input-3").fileinput({showCaption: false});
                                            });
                                        </script>
                                        <script>
                                            $(document).on('ready', function () {
                                                $("#input-4").fileinput({showCaption: false});
                                            });
                                        </script>
                                    </ul>
                                    <form class="text-sub">
                                        <input type="submit" value="post">
                                    </form>
                                    <div class="clearfix"> </div>
                                </div>
                            </div>
                            <div class="post-bottom">
                                <div class="post-bottom-1">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <p>15k <label>Likes</label></p>
                                </div>
                                <div class="post-bottom-2">
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <p>20M <label>Followers</label></p>
                                </div>
                                <div class="clearfix"> </div>
                            </div>

                        </div>
                        <div class="col-md-6">
                            <div class="weather">
                                <div class="weather-top">
                                    <div class="weather-top-left">
                                        <div class="degree">
                                            <figure class="icons">
                                                <canvas id="partly-cloudy-day" width="64" height="64">
                                                </canvas>
                                            </figure>
                                            <span>37°</span>
                                            <div class="clearfix"></div>
                                        </div>
                                        <script>
                                            var icons = new Skycons({"color": "#1ABC9C"}),
                                                    list = [
                                                        "clear-night", "partly-cloudy-day",
                                                        "partly-cloudy-night", "cloudy", "rain", "sleet", "snow", "wind",
                                                        "fog"
                                                    ],
                                                    i;

                                            for (i = list.length; i--; )
                                                icons.set(list[i], list[i]);

                                            icons.play();
                                        </script>
                                        <p>FRIDAY
                                            <label>13</label>
                                            <sup>th</sup>
                                            AUG
                                        </p>
                                    </div>
                                    <div class="weather-top-right">
                                        <p><i class="fa fa-map-marker"></i>lorem ipsum</p>
                                        <label>lorem ipsum</label>
                                    </div>
                                    <div class="clearfix"> </div>
                                </div>
                                <div class="weather-bottom">
                                    <div class="weather-bottom1">
                                        <div class="weather-head">
                                            <h4>Cloudy</h4>
                                            <figure class="icons">
                                                <canvas id="cloudy" width="58" height="58"></canvas>
                                            </figure>					
                                            <script>
                                                var icons = new Skycons({"color": "#999"}),
                                                        list = [
                                                            "clear-night", "cloudy",
                                                            "partly-cloudy-night", "cloudy", "rain", "sleet", "snow", "wind",
                                                            "fog"
                                                        ],
                                                        i;

                                                for (i = list.length; i--; )
                                                    icons.set(list[i], list[i]);

                                                icons.play();
                                            </script>
                                            <h6>20°</h6>
                                            <div class="bottom-head">
                                                <p>August 16</p>
                                                <p>Monday</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="weather-bottom1 ">
                                        <div class="weather-head">
                                            <h4>Sunny</h4>
                                            <figure class="icons">
                                                <canvas id="clear-day" width="58" height="58">
                                                </canvas>				
                                            </figure>					
                                            <script>
                                                var icons = new Skycons({"color": "#999"}),
                                                        list = [
                                                            "clear-night", "clear-day",
                                                            "partly-cloudy-night", "cloudy", "rain", "sleet", "snow", "wind",
                                                            "fog"
                                                        ],
                                                        i;

                                                for (i = list.length; i--; )
                                                    icons.set(list[i], list[i]);

                                                icons.play();
                                            </script>
                                            <h6>37°</h6>
                                            <div class="bottom-head">
                                                <p>August 17</p>
                                                <p>Tuesday</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="weather-bottom1">
                                        <div class="weather-head">
                                            <h4>Rainy</h4>
                                            <figure class="icons">
                                                <canvas id="sleet" width="58" height="58">
                                                </canvas>
                                            </figure>
                                            <script>
                                                var icons = new Skycons({"color": "#999"}),
                                                        list = [
                                                            "clear-night", "clear-day",
                                                            "partly-cloudy-night", "cloudy", "rain", "sleet", "snow", "wind",
                                                            "fog"
                                                        ],
                                                        i;

                                                for (i = list.length; i--; )
                                                    icons.set(list[i], list[i]);

                                                icons.play();
                                            </script>

                                            <h6>7°</h6>
                                            <div class="bottom-head">
                                                <p>August 18</p>
                                                <p>Wednesday</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="weather-bottom1 ">
                                        <div class="weather-head">
                                            <h4>Snowy</h4>
                                            <figure class="icons">
                                                <canvas id="snow" width="58" height="58">
                                                </canvas>
                                            </figure>
                                            <script>
                                                var icons = new Skycons({"color": "#999"}),
                                                        list = [
                                                            "clear-night", "clear-day",
                                                            "partly-cloudy-night", "cloudy", "rain", "sleet", "snow", "wind",
                                                            "fog"
                                                        ],
                                                        i;

                                                for (i = list.length; i--; )
                                                    icons.set(list[i], list[i]);

                                                icons.play();
                                            </script>
                                            <h6>-10°</h6>
                                            <div class="bottom-head">
                                                <p>August 16</p>
                                                <p>Thursday</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"> </div>
                                </div>

                            </div>
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                    <!--//content-->

                    <!---->
                    <div class="copy">
                        <p> &copy; 2016 TenderoTic. All Rights Reserved </p>
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

