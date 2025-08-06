import controller.CustomerServlet;
import org.junit.Test;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.*;

import static org.mockito.Mockito.*;

public class CustomerServletTest {

    @Test
    public void testAddCustomerInvalidInput() throws Exception {
        CustomerServlet servlet = new CustomerServlet();

        HttpServletRequest request = mock(HttpServletRequest.class);
        HttpServletResponse response = mock(HttpServletResponse.class);
        RequestDispatcher dispatcher = mock(RequestDispatcher.class);

        when(request.getParameter("action")).thenReturn(null);
        when(request.getParameter("name")).thenReturn("");
        when(request.getParameter("phone")).thenReturn("123");
        when(request.getParameter("units")).thenReturn("abc");
        when(request.getRequestDispatcher("addCustomer.jsp")).thenReturn(dispatcher);

        servlet.doPost(request, response);

        verify(dispatcher).forward(request, response);
        verify(request).setAttribute(eq("error"), anyString());
    }
}
