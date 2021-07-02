
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class TM_logout extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try {
            response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server
            response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance
            response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
            response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility

            HttpSession session = request.getSession(false);

            if (session != null) {
                session.removeAttribute("TM_id");
                session.invalidate();
                String site = new String("Front_page.jsp");

                response.setStatus(response.SC_MOVED_TEMPORARILY);
                response.setHeader("Location", site);
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
