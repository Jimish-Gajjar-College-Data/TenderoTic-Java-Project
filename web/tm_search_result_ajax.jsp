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
        <style>.table-view-tender td,tr {
    text-align: left;
    color: #000000;
    padding: auto;    
}

.table-view-tender th {
    text-align: center;
    background-color: #ff9933;
    color: white;
}

.table-view-tender tr:hover{background-color:#f5f5f5}</style>
    </head>
    <body>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/e-tender", "root", "");
 int flag= Integer.parseInt(request.getParameter("flag"));
 if(flag==1){
            int count_tende = 0;
            int tender_id= Integer.parseInt(request.getParameter("tender_id"));
            PreparedStatement count_tender = con.prepareStatement("SELECT * FROM fill_tender where tender_id='" + tender_id + "'");
            ResultSet rs_counttender = count_tender.executeQuery();
            while (rs_counttender.next()) {
                
                count_tende++;
            }
             int pagenation = 1;
                double total_tender = (double) count_tende / 5;
                double no_record = 0;

                no_record = Math.ceil(total_tender);

                int page_id = Integer.parseInt(request.getParameter("input"));
               
                int start = (page_id-1) * 5;
                int end =  5;
            //style="text-align: center;  width: 410px;height: 30px;"
        %>
        <div  id="View"  style="overflow-x:auto;">     
            <h6>
                <table id="output" style="text-align: left;  color: #000000;   padding: auto;width: 1400px;  height: 100px; ">
           <tr>
                            <th  >FILL_TENDER_ID</th>                
                            <th >TENDERER ID</th>                
                            <th>TENDER ID</th>                
                            <th>DATE OF FILL</th>             
                        </tr>
            <%
                /* cont five */
               
                /* // cont five */

                PreparedStatement view_tender = con.prepareStatement("SELECT * FROM fill_tender where tender_id='" + tender_id + "' limit " + start + "," + end);
                ResultSet rs_viewtender = view_tender.executeQuery();
                while (rs_viewtender.next()) {
                    
            %>
            <tr>
              <td><%=rs_viewtender.getInt("fill_tender_id")%></td>
                            <td><%=rs_viewtender.getString("tenderer_id")%></td>
                            <td ><%=rs_viewtender.getInt("tender_id")%></td>
                            <td><%=rs_viewtender.getString("date_of_fill")%></td>
            </tr>
            <% }%>
             </table></h6></div>
            <%} else{ int count_tende = 0;
int category_id=Integer.parseInt(request.getParameter("category"));
            PreparedStatement count_tender = con.prepareStatement("SELECT * FROM `tender_info` where category_id='" + category_id + "'");
            ResultSet rs_counttender = count_tender.executeQuery();
            while (rs_counttender.next()) {
                
                count_tende++;
            }
             int pagenation = 1;
                double total_tender = (double) count_tende / 1;
                double no_record = 0;

                no_record = Math.ceil(total_tender);

                int page_id = Integer.parseInt(request.getParameter("input"));
               
                int start = (page_id - 1) * 1;
                int end = page_id * 1;
           %>   
            
             <div  id="View"  style="overflow-x:auto;">     
            <h6>
                <table id="output" style="text-align: left;  color: #000000;   padding: auto;width: 1400px;  height: 100px; ">
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
            <%
                /* cont five */
               
                /* // cont five */

                PreparedStatement view_tender = con.prepareStatement("SELECT * FROM `tender_info` where category_id='" + category_id + "' limit " + start + "," + end);
                ResultSet rs_viewtender = view_tender.executeQuery();
                while (rs_viewtender.next()) {
                    
            %>
            <tr  class="tr">
                            <td class="td"><%=rs_viewtender.getInt("tender_id")%></td>
                            <td class="td"><%=rs_viewtender.getString("title")%></td>
                            <td class="td"><%=rs_viewtender.getInt("category_id")%></td>
                            <td class="td"><%=rs_viewtender.getString("description")%></td>

                            <td class="td"><%=rs_viewtender.getInt("product_id")%></td>
                            <td class="td"><%=rs_viewtender.getString("price")%></td>
                            <td class="td"><%=rs_viewtender.getString("type_of_work")%></td>
                            <td class="td"><%=rs_viewtender.getDate("reg_date")%></td>
                            <td class="td"><%=rs_viewtender.getDate("verification_date")%></td>
                            <td class="td"><%=rs_viewtender.getDate("result_dec_date")%></td>
                        </tr>  
            <%}%>
             </table></h6></div>
            <%}%>
       
        <!---->
        <!--scrolling js-->
       
        <!--//scrolling js-->
    </body>
</html>

