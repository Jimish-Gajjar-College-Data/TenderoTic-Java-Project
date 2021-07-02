<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
    response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server
    response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance
    response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
    response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility

    String Admin_id = (String) session.getAttribute("Admin_id");
    System.out.println(Admin_id);

    if (Admin_id == null) {
        String site = new String("Front_page.jsp");

        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", site);
    }
%>
<!DOCTYPE HTML>
<html>
    <head>
    </head>
    <body>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/e-tender", "root", "");
        %>
        <%
            int count_tenderer = 0;
            String TENDERER_ID = "";
            PreparedStatement ps_tenderer_count = con.prepareStatement("select * from tenderer_login where approve=0");
            ResultSet rs_tenderer_count = ps_tenderer_count.executeQuery();
            while (rs_tenderer_count.next()) {
                TENDERER_ID = rs_tenderer_count.getString("tenderer_id");
                count_tenderer++;
            }
        %>
        <table align="center" id="output">
            <tr>
                <th>Tenderer ID</th>
                <th>
                    Select All <input type="checkbox" id="chkSelectDeselectAll" onClick="SelectDeselect()">
                </th> 
            </tr>
            <%
                /* cont five tm */
                int pagenation = 1;
                double total_tenderer = (double) count_tenderer / 5;
                double no_record = 0;

                no_record = Math.ceil(total_tenderer);

                int page_id = Integer.parseInt(request.getParameter("input"));
                int start = (page_id - 1) * 5;
                int end =  5;
                /* // cont five tm */

                String tenderer_id = "";
                PreparedStatement ps_view_tenderer = con.prepareStatement("select * from tenderer_login where approve=0 limit " + start + "," + end);
                ResultSet rs_view_tenderer = ps_view_tenderer.executeQuery();
                while (rs_view_tenderer.next()) {
                    tenderer_id = rs_view_tenderer.getString("tenderer_id");
            %>
            <tr>                                          
                <td><%= tenderer_id%></td>                                
                <td><input type="checkbox" name="select_tenderer" value="<%=tenderer_id%>"></td>                                                                                        
            </tr>
            <%}%>   
        </table>
        <!---->
        <!--scrolling js-->
        <script src="dashboard_js/jquery.nicescroll.js"></script>
        <script src="dashboard_js/scripts.js"></script>
        <!--//scrolling js-->
    </body>
</html>

