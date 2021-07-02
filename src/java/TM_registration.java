
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

public class TM_registration extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Tenderer_registration</title>");
            out.println("</head>");
            out.println("<body>");

            String Email = request.getParameter("Email_id");
            String Company_name = request.getParameter("Company_name");
            String Person_name = request.getParameter("Person_name");
            String Contact1 = request.getParameter("Mobile_no1");
            String Contact2 = request.getParameter("Mobile_no2");
            String Area = request.getParameter("Area");
            String City_name = request.getParameter("city_name");
            String Zip_code = request.getParameter("Zip_id");

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/e-tender", "root", "");

            /* check account exist */
            String TM_id = "";
            int flag = 0;
            PreparedStatement ps_check = con.prepareStatement("select * from tender_manager_regis_tab");
            ResultSet rs_check = ps_check.executeQuery();
            while (rs_check.next()) {
                TM_id = rs_check.getString("tm_id");

                if (TM_id.equals(Email)) {
                    flag = 1;
                }
            }
            /* // check account exist */

            /* Insert into tm registration */
            if (flag == 1) {
                out.println("<Script> alert('This email id already registered'); window.location.replace('Front_page.jsp');</script>");
            } else {
                String City_id = "";
                PreparedStatement ps_city = con.prepareStatement("select * from city where name='" + City_name + "'");
                ResultSet rs_city = ps_city.executeQuery();
                while (rs_city.next()) {
                    City_id = rs_city.getString("city_id");
                }

                PreparedStatement ps = con.prepareStatement("insert into tender_manager_regis_tab(tm_id,company_name,person_name,contact_no1,contact_no2,area,city_id,zip_code,reg_date) values(?,?,?,?,?,?,?,?,now())");

                ps.setString(1, Email);
                ps.setString(2, Company_name);
                ps.setString(3, Person_name);
                ps.setString(4, Contact1);
                ps.setString(5, Contact2);
                ps.setString(6, Area);
                ps.setString(7, City_id);
                ps.setString(8, Zip_code);
                ps.execute();

                int block = 0, approve = 0;
                String password = null;
                ps = con.prepareStatement("insert into tender_manager_login(tm_id,password,block,approve) values(?,?,?,?)");

                ps.setString(1, Email);
                ps.setString(2, password);
                ps.setInt(3, block);
                ps.setInt(4, approve);
                ps.execute();
                out.println("<Script> alert('Please wait until we will send conformation email'); window.location.replace('Front_page.jsp');</script>");
            }
            /* Insert into tm registration */

            out.println("</body>");
            out.println("</html>");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(TM_registration.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(TM_registration.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
