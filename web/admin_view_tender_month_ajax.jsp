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

            int count_tende = 0;
            String month = request.getParameter("month");
            PreparedStatement count_tender = con.prepareStatement("SELECT * FROM tender_info WHERE MONTH(reg_date)='" + month + "'");
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

                PreparedStatement view_tender = con.prepareStatement("SELECT *,name FROM tender_info t , product p where t.product_id = p.product_id and  MONTH(reg_date)='" + month + "'limit " + start + "," + end);
                ResultSet rs_viewtender = view_tender.executeQuery();
                while (rs_viewtender.next()) {
                    int tender_id = rs_viewtender.getInt("tender_id");
            %>
            <tr>
                <td><%= tender_id%></td>
                <td><%=rs_viewtender.getString("title")%></td>
                <td><%=rs_viewtender.getString("description")%></td>
                <td><%=rs_viewtender.getString("name")%></td>
                <td><%=rs_viewtender.getString("price")%></td>
                <td><%=rs_viewtender.getString("type_of_work")%></td>
                <td><%=rs_viewtender.getDate("reg_date")%></td>
                <td><%=rs_viewtender.getDate("verification_date")%></td>
                <td><%=rs_viewtender.getDate("result_dec_date")%></td>
            </tr>
            <% }%>                                           
        </table>
    </body>
</html>

