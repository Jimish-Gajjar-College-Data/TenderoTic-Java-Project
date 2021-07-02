import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class TM_post_tender extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet TM_post_tender</title>");
            out.println("</head>");
            out.println("<body>");

            /* For tm post tender question not fill delete */
            String Tender_id = request.getParameter("tm_last_tender_id");
            /* // For tm post tender question not fill delete */

            HttpSession session = request.getSession();
            String TM_id = (String) session.getAttribute("TM_id");

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/e-tender", "root", "");
            if (Tender_id != null) {
                PreparedStatement ps_delet = con.prepareStatement("DELETE FROM tender_info WHERE tender_id ='" + Tender_id + "'AND tm_id = '" + TM_id + "'");
                ps_delet.execute();
                String site = new String("tm_dashboard.jsp");

                response.setStatus(response.SC_MOVED_PERMANENTLY);
                response.setHeader("Location", site);
            } else {
                int Category_id = Integer.parseInt(request.getParameter("Select_category"));
                String Title = request.getParameter("Title");
                String Type_of_work = request.getParameter("Type_of_work");
                String Price = request.getParameter("Price");
                int Select_product_id = Integer.parseInt(request.getParameter("Select_product"));
                String Description = request.getParameter("Description");
                String Verfication_date = request.getParameter("Verfication_date");
                String Result_date = request.getParameter("Result_date");

                PreparedStatement ps = con.prepareStatement("insert into tender_info(title,category_id,description,tm_id,product_id,price,type_of_work,reg_date,verification_date,result_dec_date) values(?,?,?,?,?,?,?,now(),?,?)");
                ps.setString(1, Title);
                ps.setInt(2, Category_id);
                ps.setString(3, Description);
                ps.setString(4, TM_id);
                ps.setInt(5, Select_product_id);
                ps.setString(6, Price);
                ps.setString(7, Type_of_work);
                ps.setString(8, Verfication_date);
                ps.setString(9, Result_date);
                ps.execute();

                String tender_id = "";
                PreparedStatement ps_tender_id = con.prepareStatement("select tender_id from tender_info where tm_id= '" + TM_id + "'order by reg_date desc");
                ResultSet rs_tender_id = ps_tender_id.executeQuery();
                while (rs_tender_id.next()) {
                    tender_id = rs_tender_id.getString("tender_id");
                }

                out.println("<script>setInterval(function () {myForm.submit();}, 500);</script>");
                out.println("<form action='tm_post_tender_questions.jsp' name='myForm'>");
                out.println("<input type='hidden' value=" + tender_id + " name='tm_last_tender_id'>");
                out.println("</form>  ");
            }
            out.println("</body>");
            out.println("</html>");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(TM_post_tender.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(TM_post_tender.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
