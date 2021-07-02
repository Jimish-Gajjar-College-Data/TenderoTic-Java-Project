import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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

public class Admin_block_tm extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        Connection con = null;
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Admin_block_tm</title>");
            out.println("</head>");
            out.println("<body>");

            String[] select = request.getParameterValues("select_tm");
            int block = 1;

            if (select == null) {
                out.println("<Script> alert('Please select one check box'); window.location.replace('admin_block_tm.jsp');</script>");
            } else {

                for (String s : select) {
                    /* SEND MAIL */
                    try {

                        //////////////////////////////////////////////////////////////////
                        String to = s;//change accordingly
                        
                        //Get the session object
                        Properties props = new Properties();
                        props.put("mail.smtp.host", "smtp.gmail.com");
                        props.put("mail.smtp.starttls.enable", "true");
                        props.put("mail.smtp.socketFactory.port", "587");
                        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
                        props.put("mail.smtp.auth", "true");
                        props.put("mail.smtp.port", "587");

                        Session session = Session.getInstance(props,
                                new javax.mail.Authenticator() {
                            protected PasswordAuthentication getPasswordAuthentication() {
                                return new PasswordAuthentication("learn.code.630@gmail.com", "learn123pmj");//change accordingly
                            }
                        });

                        //compose message
                        try {
                            MimeMessage message = new MimeMessage(session);
                            message.setFrom(new InternetAddress("learn.code.630@gmail.com"));//change accordingly
                            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
                            message.setSubject("Your TenderoTic account blocked");
                            // message.setText("YOUR OTP IS:- "+Math.random(/*otp*/)/50);
                            message.setText("Sorry!!!! Your TenderoTic account as a tender manager is Blocked by admin contact to admin to unblock.");

                            System.out.println("Message Not Send.....");
                            //send message
                            Transport.send(message);

                            System.out.println("message sent successfully");
                            Class.forName("com.mysql.jdbc.Driver");
                            con = DriverManager.getConnection("jdbc:mysql://localhost/e-tender", "root", "");
                            PreparedStatement ps = con.prepareStatement("Update tender_manager_login set block = ? where tm_id ='" + s + "'");
                            ps.setInt(1, block);
                            ps.execute();

                            String site = new String("admin_block_tm.jsp");
                            response.setStatus(response.SC_MOVED_PERMANENTLY);
                            response.setHeader("Location", site);

                        } catch (MessagingException e) {
                            throw new RuntimeException(e.getMessage());
                        }

                    } catch (Exception ex) {
                        Logger.getLogger(Admin_block_tm.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    /* FINESH MAIL*/
                }
            }

            out.println("</body>");
            out.println("</html>");
        }
    }
}
