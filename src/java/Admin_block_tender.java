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

public class Admin_block_tender extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        Connection con = null;
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Admin_block_tender</title>");
            out.println("</head>");
            out.println("<body>");

            String[] select = request.getParameterValues("select_tender");
            int block = 1;

            if (select == null) {
                out.println("<Script> alert('Please select one check box'); window.location.replace('admin_block_tender.jsp');</script>");
            } else {

                for (String s : select) {
                    /* SEND MAIL */
                    try {
                        String tender_email = "";
                        /*Find email id */
                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/e-tender", "root", "");
                        PreparedStatement ps1 = con.prepareStatement("Select tm_id from tender_info where tender_id='" + s + "'");
                        ResultSet rs1 = ps1.executeQuery();
                        while (rs1.next()) {
                            tender_email = rs1.getString("tm_id");
                        }
                        /*---// Find email id */

                        //////////////////////////////////////////////////////////////////
                        String to = tender_email;//change accordingly

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
                            message.setSubject("Your TenderoTic tender blocked");
                            message.setText("Sorry!!!! Your TenderoTic tender is blocked by admin and your tender is :- '" + s + "' contact to admin to ubblock tender.");

                            System.out.println("Message Not Send.....");
                            //send message
                            Transport.send(message);

                            System.out.println("message sent successfully");
                            Class.forName("com.mysql.jdbc.Driver");
                            out.println("tender id " + s + "and email " + tender_email);
                            PreparedStatement ps_update = con.prepareStatement("Update tender_info set block = ? where tender_id ='" + s + "'");
                            ps_update.setInt(1, block);
                            ps_update.execute();

                            String site = new String("admin_block_tender.jsp");
                            response.setStatus(response.SC_MOVED_PERMANENTLY);
                            response.setHeader("Location", site);

                        } catch (MessagingException e) {
                            throw new RuntimeException(e.getMessage());
                        }

                    } catch (Exception ex) {
                        Logger.getLogger(Admin_block_tender.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    /* FINESH MAIL*/
                }
            }

            out.println("</body>");
            out.println("</html>");
        }
    }
}