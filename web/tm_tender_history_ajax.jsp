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

            int count_tende = 0;
            PreparedStatement count_tender = con.prepareStatement("select ti.tender_id, ti.title,ti.category_id,ti.product_id,p.name,c.title,ti.reg_date,ti.result_dec_date from category c, tender_info ti, product p where ti.tm_id='" + TM_id + "' and ti.product_id=p.product_id and ti.category_id=c.category_id");
            ResultSet rs_counttender = count_tender.executeQuery();
            while (rs_counttender.next()) {
                int tender_id = rs_counttender.getInt("ti.tender_id");
                count_tende++;
            }
        %>
        <table id="output">
            <tr>
                <th>TENDER_id</th>
                <th>TITLE</th>
                <th>CATEGORY</th>                
                <th>PRODUCT</th>                
                <th>DURATION</th>                
                <th>NO OF FILLED TENDER</th>  
                <th>WINNING PRICE</th>                
                <th>WINNING COMPANY</th>                
            </tr>
            <%
                /* cont five */
                int pagenation = 1;
                double total_tender = (double) count_tende / 5;
                double no_record = 0;

                no_record = Math.ceil(total_tender);

                int page_id = Integer.parseInt(request.getParameter("input"));
                int start = (page_id - 1) * 5;
                int end = page_id * 5;
                /* // cont five */

                String reg_date = "";
                int result_tender = 0;
                String result_price = "l", winning_comp = "l";
                int length = 0;
                int no_of_filled = 0;

                PreparedStatement view_tender = con.prepareStatement("select ti.tender_id, ti.title,ti.category_id,ti.product_id,p.name,c.title,ti.reg_date,ti.result_dec_date from category c, tender_info ti, product p where ti.tm_id='" + TM_id + "' and ti.product_id=p.product_id and ti.category_id=c.category_id limit " + start + "," + end);
                ResultSet rs_viewtender = view_tender.executeQuery();
                while (rs_viewtender.next()) {
                    int tender_id = rs_viewtender.getInt("ti.tender_id");
                    PreparedStatement view_tender11 = con.prepareStatement("select * from fill_tender where tender_id='" + tender_id + "'");
                    ResultSet rs_viewtender1 = view_tender11.executeQuery();
                    while (rs_viewtender1.next()) {
                        no_of_filled = rs_viewtender1.getInt("fill_tender_id");
                    }
                    for (int i = 0; i < 10; i++) {
                        char n = rs_viewtender.getString("ti.reg_date").charAt(i);
                        reg_date += n;

                    }
                    PreparedStatement view_tender12 = con.prepareStatement("select r.tender_id,r.price,r.tenderer_id,t.company_name from result_tender r, tenderer_regis_tab t where r.tender_id='" + tender_id + "' and r.tenderer_id=t.tenderer_id");
                    ResultSet rs_viewtender12 = view_tender12.executeQuery();
                    while (rs_viewtender12.next()) {
                        result_tender = rs_viewtender12.getInt("r.tender_id");

                        if (result_tender != 0) {
                            result_price = rs_viewtender12.getString("r.price");
                            winning_comp = rs_viewtender12.getString("t.company_name");
                        }
                    }
            %>
            <tr style="text-align: center;">
                <td><%=tender_id%></td>
                <td><%=rs_viewtender.getString("ti.title")%></td>
                <td><%=rs_viewtender.getString("c.title")%></td>
                <td><%=rs_viewtender.getString("p.name")%></td>
                <td><%=reg_date + " to " + rs_viewtender.getString("ti.result_dec_date")%></td>
                <td><%=no_of_filled%></td>
                <% if (result_tender != 0) {%>
                <td><%= result_price%></td>
                <td><%=winning_comp%></td>
                <%} else {%>
                <td>Result not Declared</td>
                <td>Result not Declared</td>
                <%}%>
            </tr>
            <% reg_date = "";
                }
            %>                                           
        </table>
        <!---->
        <!--scrolling js-->
        <script src="dashboard_js/jquery.nicescroll.js"></script>
        <script src="dashboard_js/scripts.js"></script>
        <!--//scrolling js-->
    </body>
</html>