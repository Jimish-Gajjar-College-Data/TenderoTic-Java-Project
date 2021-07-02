<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
    response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server
    response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance
    response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
    response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility

    String OTP_TM = (String) session.getAttribute("Otp_Tm");

    if (OTP_TM == null) {
        String site = new String("Front_page.jsp");

        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", site);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <title>TenderoTic</title>
        <link rel="shortcut icon" href="images/logo.png">

        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Max Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
              SmartPhone Compatible web template, free WebDesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!--Custom Theme files-->
        <link href="front_end_css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
        <link href="front_end_css/style.css" type="text/css" rel="stylesheet" media="all">
        <link href="front_end_css/index.css" rel="stylesheet" type="text/css" media="all" />
        <link rel="stylesheet" href="front_end_css/swipebox.css">
        <!--//Custom Theme files-->
        <!--js-->
        <script src="front_end_js/jquery-1.11.1.min.js"></script> 
        <!--//js-->
        <!--web-fonts-->
        <link href='//fonts.googleapis.com/css?family=Nova+Round' rel='stylesheet' type='text/css'>
        <link href='//fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
        <!--//web-fonts-->
        <!--start-smooth-scrolling-->
        <script type="text/javascript" src="front_end_js/move-top.js"></script>
        <script type="text/javascript" src="front_end_js/easing.js"></script>	
        <script type="text/javascript">
            jQuery(document).ready(function ($) {
                $(".scroll").click(function (event) {
                    event.preventDefault();

                    $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
                });
            });
        </script>        
        <!--//end-smooth-scrolling-->	

        <!-- Map Script -->
        <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCgifapReVUfCcVMt2-KFnIG6qFle1SsN8&callback=initMap"
        type="text/javascript"></script>
        <script src="http://maps.googleapis.com/maps/api/js"></script>  
        <script>
            function initialize() {
                var mapProp = {
                    center: new google.maps.LatLng(23.087131, 72.546875),
                    zoom: 20,
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                };
                var map = new google.maps.Map(document.getElementById("googleMap"), mapProp);
            }
            google.maps.event.addDomListener(window, 'load', initialize);
        </script>
        <!-- // Map script -->      
        <script type="text/javascript">
            $(document).ready(function () {
                $("#Tm_otp").modal('show');
            });
        </script>
    </head>   
    <body>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/e-tender", "root", "");
        %>
        <!-- Tm Enter Otp -->
        <div class="modal bnr-modal fade" id="Tm_otp" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
                    </div>
                    <section>
                        <div class="modal-body modal-spa">
                            <h2 align="center">Forgot Password</h2><br>
                            <form action="tm_forgot_password.jsp">                                
                                <label>Enter OTP :</label>
                                <input type="password" name="TM_otp" placeholder="Enter One Time Password" required="">                                        
                                <input type="submit" value="Change">
                            </form>                                    
                            <div class="clearfix"> </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
        <!-- // Tm Enter Otp -->
        <!--banner-->
        <div class="banner">
            <div class="header"><!--header-->
                <div class="container">		
                    <nav class="navbar navbar-default">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <h1><a href="Front_page.jsp"><image src="images/logo.png" width="40" hight="40"> TenderoTic </a></h1>
                        </div>
                        <!--navbar-header-->
                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                            <ul class="nav navbar-nav navbar-right">
                                <li><a href="Front_page.jsp" class="active">Home</a></li>
                                <li><a href="#about" class="scroll">About</a></li>
                                <li><a href="#features" class="scroll">Features</a></li>
                                <li><a href="#team" class="scroll">Team</a></li>
                                <li><a href="#portfolio" class="scroll">Portfolio</a></li>
                                <li><a href="#contact" class="scroll">Contact Us</a></li>
                            </ul>	
                            <div class="clearfix"> </div>	
                        </div>
                    </nav>
                </div>
                <div class="cd-main-header">
                    <ul class="cd-header-buttons">
                        <li><a class="cd-search-trigger" href="#cd-search"> <span></span></a></li>
                    </ul> <!-- cd-header-buttons -->
                </div>
                <div id="cd-search" class="cd-search">
                    <form action="#" method="post">
                        <input name="Search" type="search" placeholder="Search...">
                    </form>
                </div>
            </div>
            <!--//header-->

            <!-- Site Admin Login -->
            <script type="text/javascript">
                $(document).ready(function () {
                    $('input[type="checkbox"]').click(function () {
                        if ($(this).attr("value") == "Site_admin") {
                            $(".Site_admin").toggle(1000);
                        }
                    });
                });
            </script>
            <div class="modal bnr-modal fade" id="admin_login" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
                        </div>
                        <section>
                            <div class="modal-body modal-spa">
                                <h2 align="center">Admin Login</h2><br>

                                <div class="Site_admin">
                                    <form action="Admin_login" method="get">                                
                                        <label>Username :</label>
                                        <input type="text" name="Admin_id" placeholder="Enter Username" required="">
                                        <label>Password :</label>
                                        <input type="password" name="A_Password" placeholder="Enter Password" required="">                                        
                                        <input type="submit" value="Login">
                                    </form>                                    
                                </div>

                                <font color="#000"><h4>Forgot password ? <input type="checkbox" class="chck" value="Site_admin" ></h4></font><br>

                                <div class="Site_admin" style="display: none;">
                                    <font color="#000"><h4 align="center">Change Password</h4></font><br>  
                                    <form action="Admin_otp_send" method="get">
                                        <input type="text" name="Admin_id" placeholder="Enter Username" required="">                                        
                                        <input type="submit" value="Change">
                                    </form>
                                </div>
                                <div class="clearfix"> </div>
                            </div>
                        </section>
                    </div>
                </div>
            </div>
            <!-- // End Site Admin Login -->
            <!-- Tenderer Login -->
            <script type="text/javascript">
                $(document).ready(function () {
                    $('input[type="checkbox"]').click(function () {
                        if ($(this).attr("value") == "Tenderer_login") {
                            $(".Tenderer_login").toggle(1000);
                        }
                    });
                });

                /* In login modal registration modal show and other hide */
                $(document).ready(function (e) {
                    $('#Tenderer').click(function (e) {
                        $("#T_login").modal('fade');
                        $("#Tenderer_regi").modal('show');
                    });
                    $('#TM').click(function (e) {
                        $("#TM_login").modal('fade');
                        $("#TM_regi").modal('show');
                    });
                });
                /* //In login modal registration modal show and other hide */
            </script>
            <div class="modal bnr-modal fade" id="T_login" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
                        </div>
                        <section>
                            <div class="modal-body modal-spa">
                                <h2 align="center">Tenderer login</h2><br>
                                <div class="Tenderer_login">
                                    <form action="Tenderer_login" method="get">                                
                                        <label>Username :</label>
                                        <input type="text" name="Tenderer_id" placeholder="Enter Username" required="">
                                        <label>Password :</label>
                                        <input type="password" name="Password" placeholder="Enter Password" required="">                                        
                                        <input type="submit" value="Login">
                                    </form><br>
                                    <input type="submit" id="Tenderer" value="Register Now" data-toggle="modal" data-target="#Tenderer_regi">
                                </div>

                                <font color="#000"><h4>Forgot password ? <input type="checkbox" class="chck" value="Tenderer_login"></h4></font><br>

                                <div class="Tenderer_login" style="display: none;">
                                    <font color="#000"><h4 align="center">Change Password</h4></font><br>                                    
                                    <form action="admin_forgot_otp.jsp"> 
                                        <input type="text" name="Tenderer_id" placeholder="Enter Username" required="">                                        
                                        <input type="submit" value="Change">
                                    </form>
                                </div>
                                <div class="clearfix"> </div>
                            </div>
                        </section>
                    </div>
                </div>
            </div>
            <!-- // End Tenderer Login -->
            <!-- Tender Manager Login -->
            <script type="text/javascript">
                $(document).ready(function () {
                    $('input[type="checkbox"]').click(function () {
                        if ($(this).attr("value") == "Tm_login") {
                            $(".Tm_login").toggle(1000);
                        }
                    });
                });
            </script>
            <div class="modal bnr-modal fade" id="TM_login" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
                        </div>
                        <section>
                            <div class="modal-body modal-spa">
                                <h2 align="center">Tender manager login</h2><br>
                                <div class="Tm_login">
                                    <form action="TM_login" method="get">                                
                                        <label>Username :</label>
                                        <input type="text" name="TM_id" placeholder="Enter Username" required="">
                                        <label>Password :</label>
                                        <input type="password" name="Password" placeholder="Enter Password" required="">                                        
                                        <input type="submit" value="Login">
                                    </form><br>
                                    <input type="submit" id="TM" value="Register Now" data-toggle="modal" data-target="#TM_regi">
                                </div>

                                <font color="#000"><h4>Forgot password ? <input type="checkbox" class="chck" value="Tm_login" ></h4></font><br>

                                <div class="Tm_login" style="display: none;">
                                    <font color="#000"><h4 align="center">Change Password</h4></font><br>                                    
                                    <form action="tm_forgot_password.jsp">                                
                                        <label>Enter OTP :</label>
                                        <input type="password" name="TM_otp" placeholder="Enter One Time Password" required="">                                        
                                        <input type="submit" value="Change">
                                    </form>  
                                </div>
                                <div class="clearfix"> </div>
                            </div>
                        </section>
                    </div>
                </div>
            </div>
            <!-- // End Tender Manager Login -->

            <!-- // Tenderer registration -->            
            <div class="modal bnr-modal fade" id="Tenderer_regi" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
                        </div>
                        <section>
                            <div class="modal-body modal-spa">
                                <form action="Tenderer_registration" method="get">
                                    <div class="form-left">
                                        <label>* Company Name :</label>
                                        <input type="text" name="Company_name" placeholder="Enter Your Company Name" required="">
                                    </div>
                                    <div class="form-right">
                                        <label>* Person Name :</label>
                                        <input type="text" name="Person_name" placeholder="Enter Your Name">
                                    </div>
                                    <div class="form-left">
                                        <label>* Contact Number 1 :</label>
                                        <input type="text" name="Mobile_no1" placeholder="Enter Mobile Number" required="" maxlength="10" minlength="10">
                                    </div>
                                    <div class="form-right">
                                        <label>* Contact Number 2 :</label>
                                        <input type="text" name="Mobile_no2" placeholder="Enter Mobile Number" required="" maxlength="10" minlength="10">
                                    </div>
                                    <div class="form-left">
                                        <label>* City :</label>
                                        <select name = "city_name">
                                            <%
                                                String city_name = "";
                                                PreparedStatement ps_city = con.prepareStatement("select * from city");
                                                ResultSet rs_city = ps_city.executeQuery();
                                                while (rs_city.next()) {
                                            %>                                        
                                            <option><%= rs_city.getString("name")%></option>
                                            <% }%>
                                        </select>
                                    </div>
                                    <div class="form-right">
                                        <label>* Area :</label>
                                        <input type="text" name="Area" placeholder="Enter Your Area" required="">                                        
                                    </div>                                    
                                    <div class="clearfix"> </div>
                                    <label>* Zip Code :</label>
                                    <input type="text" name="Zip_id" placeholder="Enter Area Zip Code" required="" maxlength="6" minlength="6">
                                    <label>* Email :</label>
                                    <input type="text" name="Email_id" placeholder="Enter Email id" required="">
                                    <input type="submit" value="Register Now">
                                </form>
                            </div>
                            <div class="clearfix"> </div>
                        </section>
                    </div>
                </div>
            </div>
            <!-- // End Tenderer registration -->
            <!-- Tender manager registration -->
            <div class="modal bnr-modal fade" id="TM_regi" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
                        </div>
                        <section>
                            <div class="modal-body modal-spa">
                                <form action="TM_registration" method="get">
                                    <div class="form-left">
                                        <label>* Company Name :</label>
                                        <input type="text" name="Company_name" placeholder="Enter Your Company Name" required="">
                                    </div>
                                    <div class="form-right">
                                        <label>* Person Name :</label>
                                        <input type="text" name="Person_name" placeholder="Enter Your Name">
                                    </div>
                                    <div class="form-left">
                                        <label>* Contact Number 1 :</label>
                                        <input type="text" name="Mobile_no1" placeholder="Enter Mobile Number" required="" maxlength="10" minlength="10">
                                    </div>
                                    <div class="form-right">
                                        <label>* Contact Number 2 :</label>
                                        <input type="text" name="Mobile_no2" placeholder="Enter Mobile Number" required="" maxlength="10" minlength="10">
                                    </div>
                                    <div class="form-left">
                                        <label>* City :</label>
                                        <select name = "city_name">
                                            <%
                                                ps_city = con.prepareStatement("select * from city");
                                                rs_city = ps_city.executeQuery();
                                                while (rs_city.next()) {
                                            %>                                        
                                            <option><%= rs_city.getString("name")%></option>
                                            <% }%>
                                        </select>
                                    </div>
                                    <div class="form-right">
                                        <label>* Area :</label>
                                        <input type="text" name="Area" placeholder="Enter Your Area" required="">                                        
                                    </div>                                    
                                    <div class="clearfix"> </div>
                                    <label>* Zip Code :</label>
                                    <input type="text" name="Zip_id" placeholder="Enter Area Zip Code" required="" maxlength="6">
                                    <label>* Email :</label>
                                    <input type="text" name="Email_id" placeholder="Enter Email id" required="">
                                    <input type="submit" value="Register Now">
                                </form>
                            </div>
                            <div class="clearfix"> </div>
                        </section>
                    </div>
                </div>
            </div>
            <!-- // End Tender Manager Registration -->

            <!--banner-text-->
            <div class="banner-text">
                <!--banner Slider starts Here-->
                <script src="front_end_js/responsiveslides.min.js"></script>
                <script>
                // You can also use "$(window).load(function() {"
                $(function () {
                    // Slideshow 3
                    $("#slider3").responsiveSlides({
                        auto: true,
                        pager: true,
                        nav: false,
                        speed: 500,
                        namespace: "callbacks",
                        before: function () {
                            $('.events').append("<li>before event fired.</li>");
                        },
                        after: function () {
                            $('.events').append("<li>after event fired.</li>");
                        }
                    });

                });
                </script>
                <!--//End-slider-script-->
                <div  id="top" class="callbacks_container">
                    <ul class="rslides" id="slider3">
                        <li>
                            <h2>Welcome to the<br>TenderoTic.</h2>
                            <p>Best Tender Management system.</p>
                        </li>
                        <li>
                            <h3>Best tenders<br> & best tenderer company.</h3>
                            <p>Post your tender and get best company to mange your tender.</p>
                        </li>
                        <li>
                            <h3>A perfect destination for all<br>your tenders.</h3>
                            <p>We provide best service to our user.</p>
                        </li>
                    </ul>                    
                </div>
                <a class="more hvr-bounce-to-right" href="#" data-toggle="modal" data-target="#admin_login">Admin Login</a> 
                <a class="more hvr-bounce-to-right" href="#" data-toggle="modal" data-target="#T_login">Tenderer Login</a>
                <a class="more hvr-bounce-to-right" href="#" data-toggle="modal" data-target="#TM_login">Tender Manager Login</a>
            </div>
            <!--//banner-text-->
        </div>
        <!--//banner-->

        <!--about-->
        <div id="about" class="about">
            <div class="container">
                <div class="title">
                    <h3>About Us </h3>
                    <p>Some best information about Performance, Security & Privacy of TenderoTic . </p>
                </div>
                <div class="about-row">
                    <div class="col-md-3 about-grids">
                        <span class="glyphicon glyphicon-stats effect-1" aria-hidden="true"></span>
                        <h4>Best Performance</h4>
                        <p>TendroTic provide best performance of manage tender and reliable service to our users</p>
                        <h6> </h6>
                    </div>
                    <div class="col-md-3 about-grids">
                        <span class="glyphicon glyphicon-user effect-1" aria-hidden="true"></span>
                        <h4>Online Users</h4>
                        <p>Online users manage his tenders, post tender, fill tender & many other function provide by TenderoTic.</p>
                        <h6> </h6>
                    </div>
                    <div class="col-md-3 about-grids">
                        <span class="glyphicon glyphicon-list-alt effect-1" aria-hidden="true"></span>
                        <h4>Tenders</h4>
                        <p>TenderoTic provide worlds best tenders on site. We provide top tenders to our users....</p>
                        <h6> </h6>
                    </div>
                    <div class="col-md-3 about-grids">
                        <span class="glyphicon glyphicon-check effect-1" aria-hidden="true"></span>
                        <h4>Security & Privacy</h4>
                        <p>We provide best security & privacy to our users. users manage his tenders, details and other informaition secure. </p>
                        <h6> </h6>
                    </div>
                    <div class="clerfix"> </div>
                </div>
            </div>
        </div>
        <!--//about-->
        <!--features-->
        <div id="features" class="features">
            <div class="container">
                <div class="title">
                    <h3>Features</h3>
                    <p>Features of TenderoTic. </p>
                </div>
                <div class="features-row">
                    <div class="col-md-4 features-grids">
                        <div class="features-left">
                            <h4>Tenders</h4>
                            <h5>5200 </h5>
                        </div>
                        <div class="features-right">
                            <span class="glyphicon glyphicon-check" aria-hidden="true"></span>
                        </div>
                        <div class="clerfix"> </div>
                    </div>
                    <div class="col-md-4 features-grids features-grids-mdl">
                        <div class="features-left">
                            <h4>Visitors</h4>
                            <h5>6000 </h5>
                        </div>
                        <div class="features-right">
                            <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
                        </div>
                        <div class="clerfix"> </div>
                    </div>
                    <div class="col-md-4 features-grids">
                        <div class="features-left">
                            <h4>Users</h4>
                            <h5>2500 </h5>
                        </div>
                        <div class="features-right">
                            <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                        </div>
                        <div class="clerfix"> </div>
                    </div>
                    <div class="clerfix"> </div>
                </div>
            </div>
        </div>
        <!--//about-->
        <!--team-->
        <div class="team" id="team">
            <div class="container">
                <div class="title">
                    <h3>Our Team</h3>
                    <p>Spacial thanks to our team to make this TendeeroTic System. </p>
                </div>
                <div class="team-row">
                    <div class="col-md-3 team-grids">
                        <img class="img-responsive" src="images/img1.JPG" alt="">
                        <div class="captn">
                            <h4>Jimish Gajjar</h4>
                            <p>Founder & maker</p>
                            <div class="social-icons">
                                <ul>
                                    <li><a href="#"> </a></li>
                                    <li><a href="#" class="fb"> </a></li>
                                    <li><a href="#" class="gp"> </a></li>
                                    <li><a href="#" class="drb"> </a></li>
                                </ul>
                                <div class="clearfix"> </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 team-grids">
                        <img class="img-responsive" src="images/img2.jpg" alt="">
                        <div class="captn">
                            <h4>Parth Nayi</h4>
                            <p>Back End Design</p>
                            <div class="social-icons">
                                <ul>
                                    <li><a href="#"> </a></li>
                                    <li><a href="#" class="fb"> </a></li>
                                    <li><a href="#" class="gp"> </a></li>
                                    <li><a href="#" class="drb"> </a></li>
                                </ul>
                                <div class="clearfix"> </div>
                            </div>
                        </div>
                    </div>	
                    <div class="col-md-3 team-grids">
                        <img class="img-responsive" src="images/.jpg" alt="">
                        <div class="captn">
                            <h4>Miral </h4>
                            <p>Site Manager</p>
                            <div class="social-icons">
                                <ul>
                                    <li><a href="#"> </a></li>
                                    <li><a href="#" class="fb"> </a></li>
                                    <li><a href="#" class="gp"> </a></li>
                                    <li><a href="#" class="drb"> </a></li>
                                </ul>
                                <div class="clearfix"> </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 team-grids">
                        <img class="img-responsive" src="images/.jpg" alt="">
                        <div class="captn">
                            <h4>Xpert support & creative</h4>
                            <p>Lead Manager</p>
                            <div class="social-icons">
                                <ul>
                                    <li><a href="#"> </a></li>
                                    <li><a href="#" class="fb"> </a></li>
                                    <li><a href="#" class="gp"> </a></li>
                                    <li><a href="#" class="drb"> </a></li>
                                </ul>
                                <div class="clearfix"> </div>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>
        </div>
        <!--//team-->
        <!--portfolio-->
        <div id="portfolio" class="portfolio">
            <div class="container">
                <div class="title">
                    <h3>Portfolio</h3>
                    <p>Categories of tenders. </p>
                </div>
                <div class="gallery_gds">
                    <ul class="simplefilter">
                        <li class="active" data-filter="all">All</li>
                        <li data-filter="1">CONSTRUCTION</li>
                        <li data-filter="2">FOOD PACKAGING</li>
                        <li data-filter="3">MACHINERY</li>
                    </ul>
                    <div class="filtr-container">
                        <div class="col-md-4 filtr-item" data-category="1, 4" data-sort="Busy streets">
                            <div class="hover ehover14">
                                <a href="images/g1.jpg" class="swipebox" title="Construction">
                                    <img src="images/g1.jpg" alt="" class="img-responsive" />
                                    <div class="overlay">
                                        <h4>Portfolio</h4>
                                    </div>
                                </a>	
                            </div>
                        </div>
                        <div class="col-md-4 filtr-item" data-category="4, 3" data-sort="Luminous night">
                            <div class="hover ehover14">
                                <a href="images/g2.jpg" class="swipebox" title="Machinery">
                                    <img src="images/g2.jpg" alt="" class="img-responsive" />
                                    <div class="overlay">
                                        <h4>Portfolio</h4>
                                    </div>
                                </a>	
                            </div>
                        </div>
                        <div class="col-md-4 filtr-item" data-category="1, 4" data-sort="City wonders">
                            <div class="hover ehover14">
                                <a href="images/g3.jpg" class="swipebox" title="Construction">
                                    <img src="images/g3.jpg" alt="" class="img-responsive" />
                                    <div class="overlay">
                                        <h4>Portfolio</h4>
                                    </div>
                                </a>	
                            </div>
                        </div>
                        <div class="col-md-4 filtr-item" data-category="3, 4" data-sort="Industrial site">
                            <div class="hover ehover14">
                                <a href="images/g4.jpg" class="swipebox" title="Machinery">
                                    <img src="images/g4.jpg" alt="" class="img-responsive" />
                                    <div class="overlay">
                                        <h4>Portfolio</h4>
                                    </div>
                                </a>	
                            </div>
                        </div>
                        <div class="col-md-4 filtr-item" data-category="3" data-sort="In production">
                            <div class="hover ehover14">
                                <a href="images/g5.jpg" class="swipebox" title="Machinery">
                                    <img src="images/g5.jpg" alt="" class="img-responsive" />
                                    <div class="overlay">
                                        <h4>Portfolio</h4>
                                    </div>
                                </a>	
                            </div>
                        </div>
                        <div class="col-md-4 filtr-item" data-category="2, 4" data-sort="Peaceful lake">
                            <div class="hover ehover14">
                                <a href="images/g6.jpg" class="swipebox" title="Food Packaging">
                                    <img src="images/g6.jpg" alt="" class="img-responsive" />
                                    <div class="overlay">
                                        <h4>Portfolio</h4>
                                    </div>
                                </a>	
                            </div>
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                </div>
            </div>
        </div>
        <!--//portfolio-->
        <!--skills-->
        <div class="skills">
            <div class="container">
                <div class="title">
                    <h3>Skills</h3>
                    <p>Our overall skils of TenderoTic best skils shows below. </p>
                </div>
                <div class="skills-row">
                    <div class="col-md-6 skills-left">
                        <div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
                            <ul id="myTab" class="nav nav-tabs" role="tablist">
                                <li role="presentation" class="active"><a href="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">History</a></li>
                                <li role="presentation"><a href="#carl" role="tab" id="carl-tab" data-toggle="tab" aria-controls="carl">Our Goal</a></li>
                                <li role="presentation"><a href="#james" role="tab" id="james-tab" data-toggle="tab" aria-controls="james">Achievements</a></li>
                            </ul>
                            <div id="myTabContent" class="tab-content">
                                <div role="tabpanel" class="tab-pane fade in active" id="home" aria-labelledby="home-tab">
                                    <div class="tabcontent-grids">
                                        <p>E-Procurement is the purchasing of goods and services using the internet.It.</p>
                                        <ul>
                                            <li><span class="glyphicon glyphicon-menu-right"></span> Covers full life cycle of purchasing (indent to receipt of goods) </li>
                                            <li><span class="glyphicon glyphicon-menu-right"></span> Connects buyers and suppliers through electronic exchange of Tenders, catalogs, contracts, POs, invoices etc. </li>
                                            <li><span class="glyphicon glyphicon-menu-right"></span> Includes on-contract and off-contract buying </li>
                                        </ul>
                                    </div>
                                </div>
                                <div role="tabpanel" class="tab-pane fade" id="carl" aria-labelledby="carl-tab">
                                    <div class="tabcontent-grids">
                                        <p>We can archive this goal in present year is show in below.</p>
                                        <ul>
                                            <li><span class="glyphicon glyphicon-menu-right"></span> Archive 7000 users in this year. </li>
                                            <li><span class="glyphicon glyphicon-menu-right"></span> 10000 tender mange this site. </li>
                                            <li><span class="glyphicon glyphicon-menu-right"></span> 80% of followers. </li>
                                        </ul>	
                                    </div>
                                </div>
                                <div role="tabpanel" class="tab-pane fade" id="james" aria-labelledby="james-tab">
                                    <div class="tabcontent-grids">
                                        <p>Our best achievements shows below. </p>
                                        <ul>
                                            <li><span class="glyphicon glyphicon-menu-right"></span> 5200 Tenders </li>
                                            <li><span class="glyphicon glyphicon-menu-right"></span> 2500 Users </li>
                                            <li><span class="glyphicon glyphicon-menu-right"></span> 7500 Followerseam </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 skills-right bar_group">
                        <div class='bar_group__bar thin' label='Users &nbsp;&nbsp; 25%' value='75'></div>
                        <div class='bar_group__bar thin' label='Tenders &nbsp;&nbsp; 52%' value='120'></div>
                        <div class='bar_group__bar thin' label='constumer Support &nbsp;&nbsp; 100%' value='200'></div>
                        <div class='bar_group__bar thin' label='Followers &nbsp;&nbsp; 75%' value='150'></div>
                    </div>
                    <!--bar-js-->
                    <script src="front_end_js/bars.js"></script>
                    <!--bar-js-->
                    <div class="clearfix"> </div>
                </div>
            </div>
        </div>
        <!--//skills-->
        <!--testimonial-->
        <div class="testimonial">
            <div class="col-md-6 testi-left">
                <div class="testi-left-info">
                    <h4>HAPPY CUSTOMERS</h4>
                    <script>
                // You can also use "$(window).load(function() {"
                $(function () {
                    // Slideshow 2
                    $("#slider2").responsiveSlides({
                        auto: true,
                        pager: true,
                        nav: false,
                        speed: 500,
                        namespace: "callbacks",
                        before: function () {
                            $('.events').append("<li>before event fired.</li>");
                        },
                        after: function () {
                            $('.events').append("<li>after event fired.</li>");
                        }
                    });

                });
                    </script>
                    <!--//End-slider-script-->
                    <div  id="top2" class="callbacks_container">                        
                        <ul class="rslides" id="slider2">                            
                            <%
                                String message = "";
                                String f_name = "";
                                String l_name = "";

                                PreparedStatement ps_contact = con.prepareStatement("Select * from front_contact_us");
                                ResultSet rs_contact = ps_contact.executeQuery();
                                while (rs_contact.next()) {
                                    message = rs_contact.getString("message");
                                    f_name = rs_contact.getString("first_name");
                                    l_name = rs_contact.getString("last_name");
                            %>
                            <li>
                                <p><span> </span><%= message%><span class="last"></span></p>
                                <h6><%= f_name%> <%= l_name%>- </h6>
                                <img src="images/img7.png" alt=""/>
                            </li>
                            <%}%>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-md-6 testi-left testi-right">
                <div class="testi-right-info">
                    <h4>SUBSCRIBE</h4>
                    <form action="#" method="post">
                        <input type="text" name="Email" placeholder="Enter Your Email" required="">
                        <input type="submit" value="Submit">
                    </form>
                </div>
            </div>
            <div class="clearfix"> </div>
        </div>
        <!--//testimonial-->
        <!--contact-->
        <div class="contact" id="contact">
            <div class="container">
                <div class="title">
                    <h3>Contact</h3><br>
                    <h4 align="center">Get in touch with us.</h4>
                </div>
                <div class="contact-grids">
                    <div class="col-md-5 address">
                        <h4>Contact Info</h4>
                        <div class="address-row">
                            <div class="col-md-2 address-left">
                                <span class="glyphicon glyphicon-home" aria-hidden="true"></span>
                            </div>
                            <div class="col-md-10 address-right">
                                <h5>Visit Us</h5>
                                <p>Sonali park, Chandlodia, Ahmedabad </p>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="address-row">
                            <div class="col-md-2 address-left">
                                <span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
                            </div>
                            <div class="col-md-10 address-right">
                                <h5>Mail Us</h5>
                                <p><a href=""> jimsih.gajjar@gmail.com</a></p>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="address-row">
                            <div class="col-md-2 address-left">
                                <span class="glyphicon glyphicon-phone" aria-hidden="true"></span>
                            </div>
                            <div class="col-md-10 address-right">
                                <h5>Call Us</h5>
                                <p>+91 9737956805</p>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                    </div>
                    <div class="col-md-7 contact-form">
                        <form action="Contact_us" method="get">
                            <input type="text" name="First_Name" placeholder="First Name" required="">
                            <input class="email" name="Last_Name" type="text" placeholder="Last Name" required="">
                            <input type="text" name="Mobile_Number" placeholder="Mobile Number" required="" maxlength="10" minlength="10">
                            <input class="email" name="Email" type="text" placeholder="Email" required="">
                            <textarea name="Message" placeholder="Message" required="" maxlength="150" minlength="135"></textarea>
                            <input type="submit" value="SUBMIT">
                        </form>
                    </div>
                    <div class="clearfix"> </div>	
                </div>
            </div>
        </div>
        <!--//contact-->
        <!--map-->
        <!--        <div class="map">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d343829.1271629402!2d-122.61489066225299!3d47.681214398164556!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x54906aba3648f20b%3A0xc5c4dedaafcead17!2sSeattle%2C+WA+98104!5e0!3m2!1sen!2sin!4v1461914461629"></iframe>
                </div>-->
        <div id="googleMap" style="width:100%;height:350px;"></div>
        <!--//map-->
        <!--footer-->
        <div class="footer">
            <div class="container">
                <div class="footer-left">
                    <p>© 2016 TenderoTic . All rights reserved | Design by <a href="">Jimish Gajjar</a></p>
                </div>
                <div class="footer-right social-icons">
                    <ul>
                        <li><a href="#"> </a></li>
                        <li><a href="#" class="fb"> </a></li>
                        <li><a href="#" class="gp"> </a></li>
                        <li><a href="#" class="drb"> </a></li>
                    </ul>
                    <div class="clearfix"> </div>
                </div>
            </div>
        </div>
        <!--//footer-->	
        <!--smooth-scrolling-of-move-up-->
        <script type="text/javascript">
            $(document).ready(function () {
                /*
                 var defaults = {
                 containerID: 'toTop', // fading element id
                 containerHoverID: 'toTopHover', // fading element hover id
                 scrollSpeed: 1200,
                 easingType: 'linear' 
                 };
                 */

                $().UItoTop({easingType: 'easeOutQuart'});

            });
        </script>
        <!--//smooth-scrolling-of-move-up-->
        <!-- Include jQuery & Filterizr -->
        <script src="front_end_js/jquery.filterizr.js"></script>
        <script src="front_end_js/controls.js"></script>
        <!-- Kick off Filterizr -->
        <script type="text/javascript">
            $(function () {
                //Initialize filterizr with default options
                $('.filtr-container').filterizr();
            });
        </script>
        <!--//gallery-->
        <!-- swipe box js -->
        <script src="front_end_js/jquery.swipebox.min.js"></script> 
        <script type="text/javascript">
            jQuery(function ($) {
                $(".swipebox").swipebox();
            });
        </script>
        <!-- //swipe box js -->
        <!--search jQuery-->
        <script src="front_end_js/main.js"></script>
        <!--//search jQuery-->
        <!-- Bootstrap core JavaScript
    ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="front_end_js/bootstrap.js"></script>
    </body>
</html>