import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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

public class Tenderer_otp_send extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Tenderer_otp_send</title>");
            out.println("</head>");
            out.println("<body>");

            String tenderer_id = request.getParameter("Tenderer_id");
            String Tender_id = "";

            int flag = 0;
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/e-tender", "root", "");
            PreparedStatement ps_check = con.prepareStatement("select * from tenderer_login");
            ResultSet rs_check = ps_check.executeQuery();
            while (rs_check.next()) {
                Tender_id = rs_check.getString("tenderer_id");

                if (Tender_id.equals(tenderer_id)) {
                    flag = 1;
                } else {
                    out.println("<Script> alert('Enter username does't exist); window.location.replace('Front_page.jsp');</script>");
                }
            }
            if (flag == 1) {
                HttpSession session1 = request.getSession();
                session1.setAttribute("Otp_Tendere_id", tenderer_id);
                //////////////////////////////////////////////////////////////////           
                String to = tenderer_id;//change accordingly
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
                    message.setSubject("Your TenderoTic OTP");
                    // message.setText("YOUR OTP IS:- "+Math.random(/*otp*/)/50);
                    message.setText("Dear " + tenderer_id + " your TenderoTic OTP is = " + str);

                    System.out.println("Message Not Send.....");
                    //send message
                    Transport.send(message);

                    System.out.println("message sent successfully");
                    System.out.println("Username " + to + "has new otp " + str);
                    PreparedStatement ps = con.prepareStatement("Update tenderer_login set password = ? where tenderer_id ='" + tenderer_id + "'");
                    ps.setString(1, F_password);
                    ps.execute();

                    out.println("<Script> alert('OTP Send to your email id'); window.location.replace('tenderer_forgot_otp.jsp');</script>");

                } catch (MessagingException e) {
                    throw new RuntimeException(e.getMessage());
                }

                out.println("</body>");
                out.println("</html>");
            }
        } catch (Exception ex) {
            Logger.getLogger(Tenderer_otp_send.class.getName()).log(Level.SEVERE, null, ex);
        }
        /* FINESH MAIL*/
    }
}
