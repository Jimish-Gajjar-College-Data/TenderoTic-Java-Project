import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Contact_us extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Contact_us</title>");            
            out.println("</head>");
            out.println("<body>");

            String f_name = request.getParameter("First_Name");
            String l_name = request.getParameter("Last_Name");            
            String mobile_no = request.getParameter("Mobile_Number");
            String email = request.getParameter("Email");
            String message = request.getParameter("Message");
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/e-tender", "root", "");
            PreparedStatement ps = con.prepareStatement("insert into front_contact_us(first_name, last_name, mobile_no, email, message) values(?,?,?,?,?)");
            ps.setString(1, f_name);
            ps.setString(2, l_name);
            ps.setString(3, mobile_no);
            ps.setString(4, email);
            ps.setString(5, message);
            ps.execute();

            out.println("<Script> alert('We have received your information we can contact you by email after some time...'); window.location.replace('Front_page.jsp');</script>");
            
            out.println("</body>");
            out.println("</html>");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Contact_us.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Contact_us.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
