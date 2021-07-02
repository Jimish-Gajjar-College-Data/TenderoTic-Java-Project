<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
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
        <script src="dashboard_js/bootstrap.min.js"></script>

        <!-- Mainly scripts -->
        <script src="dashboard_js/jquery.metisMenu.js"></script>
        <script src="dashboard_js/jquery.slimscroll.min.js"></script>
        <!-- Custom and plugin javascript -->
        <link href="dashboard_css/custom.css" rel="stylesheet">
        <script src="dashboard_js/custom.js"></script>
        <script src="dashboard_js/screenfull.js"></script>
    </head>
    <body>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/e-tender", "root", "");

            int count_tende = 0;
            PreparedStatement count_tender = con.prepareStatement("SELECT * FROM tender_info where verification_date >= now() AND block = 0 AND approve = 0 AND tender_id IN(SELECT tender_id FROM que where tm_id = '" + TM_id + "')");
            ResultSet rs_counttender = count_tender.executeQuery();
            while (rs_counttender.next()) {
                int tender_id = rs_counttender.getInt("tender_id");
                count_tende++;
            }
        %>
        <table id="output">
            <tr>
                <th>ID</th>
                <th>TITLE</th>
                <th>DESCRIPTION</th>                
                <th>PRODUCT NAME</th>                
                <th>PRICE</th>                
                <th>TYPE OF WORK</th>                
                <th>REGISTRATION DATE</th>                
                <th>VERIFICATION DATE</th>                
                <th>RESULT DECLARE DATE</th>
                <th>UPDATE</th>
            </tr>
            <%
                /* cont five */
                int pagenation = 1;
                double total_tender = (double) count_tende / 5;
                double no_record = 0;

                no_record = Math.ceil(total_tender);

                int page_id = Integer.parseInt(request.getParameter("input"));
                int start = (page_id - 1) * 5;
                int end = 5;
                /* // cont five */

                PreparedStatement view_tender = con.prepareStatement("SELECT * FROM tender_info where verification_date >= now() AND block = 0 AND approve = 0 AND tender_id IN(SELECT tender_id FROM que where tm_id = '" + TM_id + "') limit " + start + "," + end);
                ResultSet rs_viewtender = view_tender.executeQuery();
                while (rs_viewtender.next()) {
                    int tender_id = rs_viewtender.getInt("tender_id");
                    int product_id = rs_viewtender.getInt("product_id");
                    String product_name = "";

                    PreparedStatement ps_product = con.prepareStatement("SELECT * FROM product where product_id = '" + product_id + "'");
                    ResultSet rs_product = ps_product.executeQuery();
                    while (rs_product.next()) {
                        product_name = rs_product.getString("name");
                    }
            %>
            <tr>
                <td><%= tender_id%></td>
                <td><%=rs_viewtender.getString("title")%></td>
                <td><%=rs_viewtender.getString("description")%></td>
                <td><%= product_name%></td>
                <td><%=rs_viewtender.getString("price")%></td>
                <td><%=rs_viewtender.getString("type_of_work")%></td>
                <td><%=rs_viewtender.getDate("reg_date")%></td>
                <td><%=rs_viewtender.getDate("verification_date")%></td>
                <td><%=rs_viewtender.getDate("result_dec_date")%></td>
                <td>                                                
                    <form action="tm_update_tender_details.jsp" id="myForm">
                        <input type="hidden" name="tender_id" value="<%=tender_id%>">
                        <div  class="post-file">
                            <h3><i class="fa fa-pencil-square-o" onclick="myFunction()"></i></h3>                                                        
                        </div>
                    </form>
                    <script>
                        function myFunction() {
                            document.getElementById("myForm").submit();
                        }
                    </script>
                </td>
            </tr>
            <% }%>                                           
        </table>
        <!---->
        <!--scrolling js-->
        <script src="dashboard_js/jquery.nicescroll.js"></script>
        <script src="dashboard_js/scripts.js"></script>
        <!--//scrolling js-->
    </body>
</html>