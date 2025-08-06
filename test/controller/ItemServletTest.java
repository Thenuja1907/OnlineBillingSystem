import controller.ItemServlet;
import org.junit.Test;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.*;

import static org.mockito.Mockito.*;

public class ItemServletTest {

    @Test
    public void testAddItemInvalid() throws Exception {
        ItemServlet servlet = new ItemServlet();

        HttpServletRequest request = mock(HttpServletRequest.class);
        HttpServletResponse response = mock(HttpServletResponse.class);
        RequestDispatcher dispatcher = mock(RequestDispatcher.class);

        when(request.getParameter("action")).thenReturn(null);
        when(request.getParameter("itemName")).thenReturn("");
        when(request.getParameter("price")).thenReturn("abc");
        when(request.getRequestDispatcher("addItem.jsp")).thenReturn(dispatcher);

        servlet.doPost(request, response);

        verify(request).setAttribute(eq("error"), anyString());
        verify(dispatcher).forward(request, response);
    }
}
