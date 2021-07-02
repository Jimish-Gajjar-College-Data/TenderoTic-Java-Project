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
            int count_tende = 0;
            int flag = 0;
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/e-tender", "root", "");
            PreparedStatement count_tender = con.prepareStatement("SELECT * FROM tender_info WHERE tm_id = '" + TM_id + "' AND result_dec_date <= now()");
            ResultSet rs_counttender = count_tender.executeQuery();
            while (rs_counttender.next()) {
                int tender_id = rs_counttender.getInt("tender_id");
                count_tende++;
                flag = 1;
            }
            if (flag == 1) {
        %>
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

                int page_id = Integer.parseInt(request.getParameter("input"));
                int start = (page_id - 1) * 5;
                int end = 5;
                /* // cont five */

                String category_name = "", product_name = "";

                PreparedStatement view_tender = con.prepareStatement("SELECT * FROM tender_info WHERE tm_id = '" + TM_id + "' AND result_dec_date <= now() limit " + start + "," + end);
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
        <!---->
        <!--scrolling js-->
        <script src="dashboard_js/jquery.nicescroll.js"></script>
        <script src="dashboard_js/scripts.js"></script>
        <!--//scrolling js-->
    </body>
</html>

