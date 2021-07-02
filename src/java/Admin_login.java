import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
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

public class Admin_login extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Admin_login</title>");
            out.println("</head>");
            out.println("<body>");

            String admin_id = request.getParameter("Admin_id");
            HttpSession session = request.getSession();
            session.setAttribute("Admin_id", admin_id);

            /* MD5 Password */
            String admin_pass = request.getParameter("A_Password");
            MessageDigest mdEnc = MessageDigest.getInstance("MD5"); //Encryption algorithm
            mdEnc.update(admin_pass.getBytes(), 0, admin_pass.length());
            admin_pass = new BigInteger(1, mdEnc.digest()).toString(16); // Encrypted string
            /* // MD5 Password */

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/e-tender", "root", "");
            PreparedStatement ps = null;
            ps = con.prepareStatement("Select * from admin_login where Admin_id ='" + admin_id + "' AND Admin_Password='" + admin_pass + "'");
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                out.println("<Script> alert('You Are Successfully Login.'); window.location.replace('admin_dashboard.jsp');</script>");

            } else {

                out.println("<Script> alert('Your User ID Or Password Is Incorrect.'); window.location.replace('Front_page.jsp');</script>");

            }

            out.println("</body>");
            out.println("</html>");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Admin_login.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Admin_login.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(Admin_login.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
