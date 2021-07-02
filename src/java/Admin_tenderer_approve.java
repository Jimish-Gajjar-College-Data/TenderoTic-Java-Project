
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

public class Admin_tenderer_approve extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        Connection con = null;
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Admin_tenderer_approve</title>");
            out.println("</head>");
            out.println("<body>");

            String[] select = request.getParameterValues("select_tenderer");
            int approval = 1;

            if (select == null) {
                out.println("<Script> alert('Please select one check box'); window.location.replace('admin_tenderer_approve.jsp');</script>");
            } else {

                for (String s : select) {
                    /* SEND MAIL */
                    try {

                        //////////////////////////////////////////////////////////////////
                        String to = s;//change accordingly
                        Random otp = new Random();
                        int val = (int) ((Math.random() * 9999) + 99999);
                        String str = "" + val;
                        /* MD5 Password */
                        String F_password = "";
                        MessageDigest mdEnc = MessageDigest.getInstance("MD5"); //Encryption algorithm
                        mdEnc.update(str.getBytes(), 0, str.length());
                        F_password = new BigInteger(1, mdEnc.digest()).toString(16); // Encrypted string
                        /* // MD5 Password */

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
                            message.setSubject("Your TenderoTic account conformation");
                            // message.setText("YOUR OTP IS:- "+Math.random(/*otp*/)/50);
                            message.setText("Congratulation!!!! Now your TenderoTic account as a tenderer is ready to login your id = " + s + " And Password = " + str);

                            System.out.println("Message Not Send.....");
                            //send message
                            Transport.send(message);

                            System.out.println("message sent successfully");
                            Class.forName("com.mysql.jdbc.Driver");
                            out.println("Username " + to + "has new password " + str);
                            con = DriverManager.getConnection("jdbc:mysql://localhost/e-tender", "root", "");
                            PreparedStatement ps = con.prepareStatement("Update tenderer_login set password = ?,approve = ? where tenderer_id ='" + s + "'");
                            ps.setString(1, F_password);
                            ps.setInt(2, approval);
                            ps.execute();

                            String site = new String("admin_tenderer_approve.jsp");
                            response.setStatus(response.SC_MOVED_PERMANENTLY);
                            response.setHeader("Location", site);

                        } catch (MessagingException e) {
                            throw new RuntimeException(e.getMessage());
                        }

                    } catch (Exception ex) {
                        Logger.getLogger(Admin_tenderer_approve.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    /* FINESH MAIL*/
                }
            }

            out.println("</body>");
            out.println("</html>");
        }
    }
}
