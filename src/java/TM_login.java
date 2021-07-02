
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

public class TM_login extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>TM_login</title>");
            out.println("</head>");
            out.println("<body>");

            String TM_id = request.getParameter("TM_id");
            HttpSession session = request.getSession();
            session.setAttribute("TM_id", TM_id);

            /* MD5 Password */
            String TM_pass = request.getParameter("Password");
            MessageDigest mdEnc = MessageDigest.getInstance("MD5"); //Encryption algorithm
            mdEnc.update(TM_pass.getBytes(), 0, TM_pass.length());
            TM_pass = new BigInteger(1, mdEnc.digest()).toString(16); // Encrypted string
            /* // MD5 Password */

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/e-tender", "root", "");
            /*  Check block  */
            PreparedStatement ps_block = con.prepareStatement("Select * from tender_manager_login where tm_id ='" + TM_id + "' AND password='" + TM_pass + "'and block = 1");
            ResultSet rs_block = ps_block.executeQuery();
            if (rs_block.next()) {

                out.println("<Script> alert('You Are Blcoked.'); window.location.replace('Front_page.jsp');</script>");

            }               
            /*  // Check block  */
            PreparedStatement ps = con.prepareStatement("Select * from tender_manager_login where tm_id ='" + TM_id + "' AND password='" + TM_pass + "'");
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                out.println("<Script> alert('You Are Successfully Login.'); window.location.replace('tm_dashboard.jsp');</script>");

            } else {

                out.println("<Script> alert('Your User ID Or Password Is Incorrect.'); window.location.replace('Front_page.jsp');</script>");

            }

            out.println("</body>");
            out.println("</html>");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(TM_login.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(TM_login.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(TM_login.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
