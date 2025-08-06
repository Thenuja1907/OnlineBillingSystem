import controller.BillingServlet;
import org.junit.Test;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.*;

import static org.mockito.Mockito.*;

public class BillingServletTest {

@Test
public void testDoPostNoCustomerId() throws Exception {
    BillingServlet servlet = new BillingServlet();
    HttpServletRequest request = mock(HttpServletRequest.class);
    HttpServletResponse response = mock(HttpServletResponse.class);
    RequestDispatcher dispatcher = mock(RequestDispatcher.class);

    when(request.getParameter("customerId")).thenReturn(null);
    when(request.getRequestDispatcher("calculateBill.jsp")).thenReturn(dispatcher);

    servlet.doPost(request, response);

    verify(request).setAttribute("error", "Please select a customer.");
    verify(dispatcher).forward(request, response);
}


}


