

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Controller() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String check =request.getParameter("type");
		int ck=Integer.parseInt(check);
		switch(ck)
		{
		case 1:
			request.getRequestDispatcher("UserValidate.jsp").forward(request,response);
		/*{

			String name=request.getParameter("uname");
			String pass=request.getParameter("password");
			if(name.equals("Admin") &&  pass.equals("Admin@123"))
			{
				request.getRequestDispatcher("AdminHome.jsp").forward(request,response);
			}
			else
			{
				request.getRequestDispatcher("UserValidate.jsp").forward(request,response);
			}*/
		break;
		}
		
		}
		
		
	}


