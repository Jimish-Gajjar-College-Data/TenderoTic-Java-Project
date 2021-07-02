
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.apache.catalina.connector.Response;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@WebServlet("/Tenderer_update_profile")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)      // 50MB
public class Tenderer_update_profile extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final String UPLOAD_DIRECTORY = "E:\\java project\\E-TENDER MANAGEMENT\\TenderoTic\\web\\profile_pic\\";

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();

        List<File> uploadedFiles = saveUploadedFiles(request);
        response.setContentType("text/html");

        String site = new String("tenderer_profile.jsp");

        response.setStatus(response.SC_MOVED_PERMANENTLY);
        response.setHeader("Location", site);

    }

    private List<File> saveUploadedFiles(HttpServletRequest request)
            throws IllegalStateException, IOException, ServletException {

        HttpSession session = request.getSession(true);
        String Tenderer_id = (String) session.getAttribute("Tenderer_id");

        String person_name = request.getParameter("name");
        String contact1 = request.getParameter("contact1");
        String contact2 = request.getParameter("contact2");
        String area = request.getParameter("area");
        String city_name = request.getParameter("city_name");
        String zipcode = request.getParameter("zipcode");

        List<File> listFiles = new ArrayList<File>();
        byte[] buffer = new byte[4096];
        int bytesRead = -1;
        Collection<Part> multiparts = request.getParts();
        if (multiparts.size() > 0) {
            for (Part part : request.getParts()) {

                HttpServletResponse response1 = new Response();
                // creates a file to be saved
                try {
                    String city_id = "";
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/e-tender", "root", "");
                    PreparedStatement ps1 = con.prepareStatement("select * from city where name='" + city_name + "'");
                    ResultSet rs1 = ps1.executeQuery();
                    if (rs1.next()) {
                        city_id = rs1.getString("city_id");
                    }

                    String fileName = extractFileName(part);

                    if (fileName == null) {
                        PreparedStatement ps2 = con.prepareStatement("update tenderer_regis_tab set person_name = ?, contact_no1 = ?, contact_no2 = ?, area = ?, city_id = ?, zip_code = ? where tenderer_id ='" + Tenderer_id + "'");
                        ps2.setString(1, person_name);
                        ps2.setString(2, contact1);
                        ps2.setString(3, contact2);
                        ps2.setString(4, area);
                        ps2.setString(5, city_id);
                        ps2.setString(6, zipcode);
                        ps2.execute();
                    } else {
                        System.out.println("file name:- " + fileName);
                        if (fileName == null || fileName.equals("")) {
                            // not attachment part, continue
                            continue;
                        }

                        File saveFile = new File(UPLOAD_DIRECTORY + fileName);
                        System.out.println("saveFile: " + saveFile.getAbsolutePath());
                        FileOutputStream outputStream = new FileOutputStream(saveFile);

                        // saves uploaded file
                        InputStream inputStream = part.getInputStream();
                        while ((bytesRead = inputStream.read(buffer)) != -1) {
                            outputStream.write(buffer, 0, bytesRead);
                        }
                        outputStream.close();
                        inputStream.close();

                        listFiles.add(saveFile);

                        PreparedStatement ps = con.prepareStatement("update tenderer_regis_tab set person_name = ?, contact_no1 = ?, contact_no2 = ?, area = ?, city_id = ?, zip_code = ?, profilepic_path = ? where tenderer_id ='" + Tenderer_id + "'");
                        ps.setString(1, person_name);
                        ps.setString(2, contact1);
                        ps.setString(3, contact2);
                        ps.setString(4, area);
                        ps.setString(5, city_id);
                        ps.setString(6, zipcode);
                        ps.setString(7, fileName);
                        ps.execute();
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }

            }
        }
        return listFiles;

    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return null;
    }
}
