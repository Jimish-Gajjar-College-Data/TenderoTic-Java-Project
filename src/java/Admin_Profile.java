import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class Admin_Profile extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final String UPLOAD_DIRECTORY = "E:\\java project\\E-TENDER MANAGEMENT\\TenderoTic\\web\\profile_pic";

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);

        String name = "";
        // process only if its multipart content
        if (isMultipart) {
            // Create a factory for disk-based file items
            FileItemFactory factory = new DiskFileItemFactory();

            // Create a new file upload handler
            ServletFileUpload upload = new ServletFileUpload(factory);
            try {
                // Parse the request
                List<FileItem> multiparts = upload.parseRequest(request);

                for (FileItem item : multiparts) {
                    if (!item.isFormField()) {
                        name = new File(item.getName()).getName();
                        System.out.println("file :- " + UPLOAD_DIRECTORY + name);
                        item.write(new File(UPLOAD_DIRECTORY + File.separator + name));

                        HttpSession session = request.getSession(true);
                        String Admin_id = (String) session.getAttribute("Admin_id");

                        PreparedStatement ps = null;
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/e-tender", "root", "");
                        ps = con.prepareStatement("update admin_login set profilepic_path = ? where Admin_id ='" + Admin_id + "'");
                        ps.setString(1, name);
                        ps.execute();

                        String site = new String("profile.jsp");

                        response.setStatus(response.SC_MOVED_TEMPORARILY);
                        response.setHeader("Location", site);
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

        }
    }
}