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
    </head>
    <body>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/e-tender", "root", "");

            String Product_name = request.getParameter("product_name");
            String Product_manufacture = request.getParameter("product_manufacture");
            String rangeinput = request.getParameter("Rangeinput");
            String Product_quantity = request.getParameter("product_quantity");
            String Product_man_date = request.getParameter("product_man_date");

            PreparedStatement ps = con.prepareStatement("insert into product(name,manufacture,quality,quantity,manufacture_date) values(?,?,?,?,?)");

            ps.setString(1, Product_name);
            ps.setString(2, Product_manufacture);
            ps.setString(3, rangeinput);
            ps.setString(4, Product_quantity);
            ps.setString(5, Product_man_date);
            ps.execute();

            int product_id = 0;
            PreparedStatement ps_product = con.prepareStatement("select * from product  ORDER BY product_id DESC");
            ResultSet rs_product = ps_product.executeQuery();
            while (rs_product.next()) {
                product_id = rs_product.getInt("product_id");
            }
        %>
        <div class="col-md-12 form-group1 group-mail">
            <label class="control-label"> Your product is <%= Product_name%> inserted in your current tender.</label>
            <input type="hidden" name="Select_product" value="<%= product_id%>">
        </div>
        <div class="clearfix"> </div><br>
    </body>
</html>

