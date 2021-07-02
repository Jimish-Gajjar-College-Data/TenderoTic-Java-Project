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
            String TM_ID = "";
            int count_tm = 0;
            PreparedStatement ps_tm_count = con.prepareStatement("select * from tender_manager_login where approve = 2 and block = 0");
            ResultSet rs_tm_count = ps_tm_count.executeQuery();
            while (rs_tm_count.next()) {
                TM_ID = rs_tm_count.getString("tm_id");
                count_tm++;
            }
        %>
        <table align="center" id = "output">
            <tr>
                <th>Tender Manager ID</th>
                <th>
                    SELECT ALL <input type="checkbox" id="chkSelectDeselectAll" onClick="SelectDeselect()">
                </th> 
            </tr>
            <%
                /* cont five tm */
                int pagenation = 1;
                double total_tm = (double) count_tm / 5;
                double no_record = 0;

                no_record = Math.ceil(total_tm);

                int page_id = Integer.parseInt(request.getParameter("input"));
                int start = (page_id - 1) * 5;
                int end =  5;
                /* // cont five tm */

                String tm_id = "";
                String sql = "select * from tender_manager_login where approve = 2 and block = 0 limit " + start + "," + end;
                PreparedStatement ps_tm_disp = con.prepareStatement(sql);
                ResultSet rs_tm_disp = ps_tm_disp.executeQuery();
                while (rs_tm_disp.next()) {
                    tm_id = rs_tm_disp.getString("tm_id");
            %>
            <tr>                                          
                <td><%= tm_id%></td>                                
                <td><input type="checkbox" name="select_tm" value="<%=tm_id%>"></td>                                                                                        
            </tr>
            <% }%>   
        </table>
    </body>
</html>

