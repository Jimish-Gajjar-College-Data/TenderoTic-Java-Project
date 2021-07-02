<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
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
<!DOCTYPE html>
<html>
    <head>
    </head>
    <body>
        <%
            int str = Integer.parseInt(request.getParameter("field1"));
            int q_id = Integer.parseInt(request.getParameter("field6"));
            int ans_type = Integer.parseInt(request.getParameter("field2"));
            String ans = request.getParameter("field3");
            int tender_id = Integer.parseInt(request.getParameter("field5"));
            String que = request.getParameter("field4");
            System.out.println("no of total answers:" + str + ans + que + tender_id + "q_id" + q_id);
            int counter = 0, k = 0, l = 0;
            String j[] = new String[6];
            for (int i = 0; i < ans.length(); i++) {
                if (ans.charAt(i) == ',') {
                    counter++;
                    j[k] = ans.substring(l, i);
                    l = i;
                    l += 1;
                    k++;
                }
            }
            for (int i = 0; i < k; i++) {
                System.out.println(j[i]);
            }
            int i = tender_id;
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/e-tender", "root", "");
            if (str == 0) {

                PreparedStatement ps = con.prepareStatement("insert into que(tender_id,q_id,tm_id,question,answer_type_id) values(?,?,?,?,?)");
                ps.setInt(1, i);
                ps.setInt(2, q_id);
                ps.setString(3, TM_id);
                ps.setString(4, que);
                ps.setInt(5, ans_type);
                ps.execute();

            } else if (str == 1) {

                PreparedStatement ps = con.prepareStatement("insert into que(tender_id,q_id,tm_id,question,answer_type_id,an_op_1) values(?,?,?,?,?,?)");
                ps.setInt(1, i);
                ps.setInt(2, q_id);
                ps.setString(3, TM_id);
                ps.setString(4, que);
                ps.setInt(5, ans_type);
                ps.setString(6, j[0]);
                ps.execute();

            } else if (str == 2) {

                PreparedStatement ps = con.prepareStatement("insert into que(tender_id,q_id,tm_id,question,answer_type_id,an_op_1,an_op_2) values(?,?,?,?,?,?,?)");
                ps.setInt(1, i);
                ps.setInt(2, q_id);
                ps.setString(3, TM_id);
                ps.setString(4, que);
                ps.setInt(5, ans_type);
                ps.setString(6, j[0]);
                ps.setString(7, j[1]);
                ps.execute();

            } else if (str == 3) {

                PreparedStatement ps = con.prepareStatement("insert into que(tender_id,q_id,tm_id,question,answer_type_id,an_op_1,an_op_2,an_op_3) values(?,?,?,?,?,?,?,?)");
                ps.setInt(1, i);
                ps.setInt(2, q_id);
                ps.setString(3, TM_id);
                ps.setString(4, que);
                ps.setInt(5, ans_type);
                ps.setString(6, j[0]);
                ps.setString(7, j[1]);
                ps.setString(8, j[2]);
                ps.execute();

            } else if (str == 4) {

                PreparedStatement ps = con.prepareStatement("insert into que(tender_id,q_id,tm_id,question,answer_type_id,an_op_1,an_op_2,an_op_3,an_op_4) values(?,?,?,?,?,?,?,?,?)");
                ps.setInt(1, i);
                ps.setInt(2, q_id);
                ps.setString(3, TM_id);
                ps.setString(4, que);
                ps.setInt(5, ans_type);
                ps.setString(6, j[0]);
                ps.setString(7, j[1]);
                ps.setString(8, j[2]);
                ps.setString(9, j[3]);
                ps.execute();

            } else if (str == 5) {

                PreparedStatement ps = con.prepareStatement("insert into que(tender_id,q_id,tm_id,question,answer_type_id,an_op_1,an_op_2,an_op_3,an_op_4,an_op_5) values(?,?,?,?,?,?,?,?,?,?)");
                ps.setInt(1, i);
                ps.setInt(2, q_id);
                ps.setString(3, TM_id);
                ps.setString(4, que);
                ps.setInt(5, ans_type);
                ps.setString(6, j[0]);
                ps.setString(7, j[1]);
                ps.setString(8, j[2]);
                ps.setString(9, j[3]);
                ps.setString(10, j[4]);
                ps.execute();
            }
            if (q_id == 20) {
                out.println("<Script> alert('You can fill only 20 question.'); window.location.replace('tm_post_tender.jsp');</script>");
            }
            q_id++;            
        %>

        <!---->
        <div id="main">
               <input type="hidden" value="<%=q_id%>" id="q_id">
            <div class="col-md-12 form-group1 group-mail">
                <label class="control-label">Q<%=q_id%> Question : </label>
                <input type="text" placeholder="Question" name="que" id="que" required="">
            </div>
            <div class="clearfix"> </div>
            <div class="col-md-12 form-group2 group-mail">
                <label class="control-label">Select Answer Type : </label>                                        
                <select name="select_ans_type"  onChange="myNewFunction1(this);" id="ans">
                    <option disabled selected value>None</option>
                    <option>Text Box</option>
                    <option>Radio Button</option>
                    <option>Check Box</option>
                    <option>Dropdown</option>
                </select>
            </div>
            <div class="clearfix"> </div>

            <div id="text1">
                <h3>                                        
                    <div class="col-md-1 col-sm-1 col-lg-1 col-xs-1">
                        <a href="javascript:void(0);" onclick="addElement();"><i class="fa fa-plus-circle"></i></a>
                    </div>
                    <div class="col-md col-sm-1 col-lg-1 col-xs-1">
                        <a href="javascript:void(0);" onclick="removeElement();"><i class="fa fa-minus-circle"></i></a>
                    </div>
                </h3>
                <br>
                <div id="content"></div>                
            </div>  
            <div class="clearfix"> </div> 
        </div>
        <!---->
    </body>
</html>

