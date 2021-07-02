
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

public class Tenderer_login extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Tenderer_login</title>");
            out.println("</head>");
            out.println("<body>");

            String Tenderer_id = request.getParameter("Tenderer_id");
            HttpSession session = request.getSession();
            session.setAttribute("Tenderer_id", Tenderer_id);

            /* MD5 Password */
            String Tenderer_pass = request.getParameter("Password");
            MessageDigest mdEnc = MessageDigest.getInstance("MD5"); //Encryption algorithm
            mdEnc.update(Tenderer_pass.getBytes(), 0, Tenderer_pass.length());
            Tenderer_pass = new BigInteger(1, mdEnc.digest()).toString(16); // Encrypted string
            /* // MD5 Password */

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/e-tender", "root", "");
            /*  Check block  */
            PreparedStatement ps_block = con.prepareStatement("Select * from tenderer_login where tenderer_id ='" + Tenderer_id + "' AND password='" + Tenderer_pass + "'and block = 1");
            ResultSet rs_block = ps_block.executeQuery();
            if (rs_block.next()) {

                out.println("<Script> alert('You Are Blcoked.'); window.location.replace('Front_page.jsp');</script>");

            }               
            /*  // Check block  */
            
            PreparedStatement ps = con.prepareStatement("Select * from tenderer_login where tenderer_id ='" + Tenderer_id + "' AND password='" + Tenderer_pass + "' AND  block = 0");
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                out.println("<Script> alert('You Are Successfully Login.'); window.location.replace('tenderer_dashboard.jsp');</script>");

            } else {

                out.println("<Script> alert('Your User ID Or Password Is Incorrect.'); window.location.replace('Front_page.jsp');</script>");

            }            
            
            out.println("</body>");
            out.println("</html>");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Tenderer_login.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Tenderer_login.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(Tenderer_login.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
