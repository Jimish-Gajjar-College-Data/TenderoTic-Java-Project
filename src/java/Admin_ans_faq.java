import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Admin_ans_faq extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BroadBand_login</title>");
            out.println("</head>");
            out.println("<body>");

          int id=Integer.parseInt(request.getParameter("id"));
            String ans = request.getParameter("txtarea1");

            String tmid = " ";
            int user = 0;

            System.out.println("lll" + ans+id);

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/e-tender", "root", "");
//            PreparedStatement ps = null;
           
              
              
                PreparedStatement ps = con.prepareStatement("Update faq set ans = ? where faq_id ='" + id + "'");
                ps.setString(1, ans);
                ps.execute();
            
//          
//            ps.execute();
//            

            String site = new String("admin_faq.jsp");

            response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", site);

            out.println("</body>");
            out.println("</html>");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Admin_ans_faq.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Admin_ans_faq.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
