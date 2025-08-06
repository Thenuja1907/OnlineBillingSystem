
import controller.LoginServlet;
import org.junit.*;
import org.mockito.*;

import javax.servlet.http.*;
import java.io.*;

import static org.mockito.Mockito.*;

public class LoginServletTest {

    @Test
    public void testDoPostValidCredentials() throws Exception {
        LoginServlet servlet = new LoginServlet();

        HttpServletRequest request = mock(HttpServletRequest.class);
        HttpServletResponse response = mock(HttpServletResponse.class);
        HttpSession session = mock(HttpSession.class);

        when(request.getParameter("username")).thenReturn("admin");
        when(request.getParameter("password")).thenReturn("admin123");
        when(request.getSession()).thenReturn(session);

        // You would mock DBConnection or use an in-memory DB here ideally

        servlet.doPost(request, response);

        verify(response).sendRedirect("dashboard.jsp");
    }
}