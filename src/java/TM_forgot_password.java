
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
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
import javax.servlet.http.HttpSession;

public class TM_forgot_password extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet TM_forgot_password</title>");
            out.println("</head>");
            out.println("<body>");

            HttpSession session = request.getSession();
            String OTP_TM = (String) session.getAttribute("Otp_Tm");

            /* MD5 Password */
            String New_pass = request.getParameter("new_pass");
            MessageDigest mdEnc = MessageDigest.getInstance("MD5"); //Encryption algorithm
            mdEnc.update(New_pass.getBytes(), 0, New_pass.length());
            New_pass = new BigInteger(1, mdEnc.digest()).toString(16); // Encrypted string
            /* // MD5 Password */

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/e-tender", "root", "");
            PreparedStatement ps = con.prepareStatement("update tender_manager_login set password = ? where tm_id ='" + OTP_TM + "'");
            ps.setString(1, New_pass);
            ps.execute();

            response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server
            response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance
            response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
            response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility

            session = request.getSession(false);

            if (session != null) {
                session.removeAttribute("Otp_Tm");
                session.invalidate();
                
                out.println("<Script> alert('Password change successfully.'); window.location.replace('Front_page.jsp');</script>");
            }            

            out.println("</body>");
            out.println("</html>");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(TM_forgot_password.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(TM_forgot_password.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(TM_forgot_password.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
