
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

public class Tenderer_fill_tender extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Tenderer_fill_tender</title>");
            out.println("</head>");
            out.println("<body>");
            
            HttpSession session = request.getSession();
            String Tenderer_id = (String) session.getAttribute("Tenderer_id");
            int no_of_que = Integer.parseInt(request.getParameter("no_of_que"));
            int tender_id = Integer.parseInt(request.getParameter("tender_id"));
            String price = request.getParameter("Price");
            String answer[] = new String[20];
            String answer_check[] = new String[5];
            int length[] = new int[20];
            int i = 0, answer_type_id = 0, k = 1;
            String total_lenght1 = "", total_lenght2 = "";
            String str = "";
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/e-tender", "root", "");
            /*  Check block  */
            PreparedStatement ps1 = con.prepareStatement("select * from que where tender_id='" + tender_id + "'");//check,radio,text,drop
            ResultSet rs1 = ps1.executeQuery();
            while (rs1.next()) {
                answer_type_id = rs1.getInt("answer_type_id");
                System.out.println(answer_type_id);
                if (answer_type_id == 1) {
                    answer[i] = request.getParameter("check'" + i + "'");
                    str = str + k + "-" + answer[i] + ",";
                } else if (answer_type_id == 2) {
                    answer[i] = request.getParameter("radio'" + i + "'");
                    System.out.println("radio'" + i + "'");
                    str = str + k + "-" + answer[i] + ",";
                } else if (answer_type_id == 3) {
                    answer[i] = request.getParameter("text'" + i + "'");
                    length[i] = answer[i].length();
                    System.out.println("radio'" + length[i] + "'");
                    if (length[i] <= 3500) {
                        total_lenght1 = total_lenght1 + k + "-'" + answer[i] + "',";
                    } else {
                        String lenght2 = answer[i].substring(0, 3500);
                        total_lenght1 = total_lenght1 + k + "-'" + lenght2 + "',";
                        String lenght = answer[i].substring(3500, (length[i] - 1));
                        total_lenght2 = total_lenght2 + k + "-'" + lenght + "',";
                        System.out.println("total_lenght'" + total_lenght1 + "'" + total_lenght2);
                    }
                } else if (answer_type_id == 4) {
                    answer[i] = request.getParameter("drop'" + i + "'");
                    str = str + k + "-" + answer[i] + ",";
                }
                i++;
                k++;
            }
            for (int j = 0; j < no_of_que; j++) {
                System.out.println(answer[j]);
                /*  // Check block  */
            }
            System.out.println(str + total_lenght1 + total_lenght2);
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/e-tender", "root", "");
            PreparedStatement ps2 = conn.prepareStatement("insert into fill_tender(tenderer_id,tender_id,date_of_fill,price,que_option,answer_1,answer_2) values(?,?,now(),?,?,?,?)");

            ps2.setString(1, Tenderer_id);
            ps2.setInt(2, tender_id);
            ps2.setString(3, price);            
            ps2.setString(4, str);
            ps2.setString(5, total_lenght1);
            ps2.setString(6, total_lenght2);
            ps2.execute();
            /*  Check block  */
                out.println("<Script> alert('Your tender has been filed.'); window.location.replace('tenderer_fill_tender.jsp');</script>");

            out.println("</html>");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Tenderer_fill_tender.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Tenderer_fill_tender.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
