package coding.mentor.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import coding.mentor.entity.Account;
import coding.mentor.service.AccountService;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		try {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String rePassword = request.getParameter("repassword");
			String email = request.getParameter("email");
			
			if (password != rePassword) {
				request.setAttribute("alert", "Error");
				request.setAttribute("message", "Password & Confirm Password do not match");

			} else {
				AccountService accountService = new AccountService();
				Account account = accountService.checkAccountExist(username);
				if (account == null) {
					accountService.register(username, password, email);
					request.setAttribute("yeppi", "Yeppi");
					request.setAttribute("mes", "You are successfully registered. Please login.");
					request.getRequestDispatcher("login.jsp").forward(request, response);
					
				}else {
					request.setAttribute("al", "Oops");
					request.setAttribute("mss", "User Name Already Exists. Please login.");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			} 
			}
		}catch (SQLException e) {
				e.printStackTrace();
			}
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
