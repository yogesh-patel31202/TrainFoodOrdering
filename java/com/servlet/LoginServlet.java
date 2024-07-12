package com.servlet;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.CustomerDto;
import com.service.CustomerService;

/**
 * Servlet implementation class Loginservlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ServletConfig config;

	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		this.config = config;
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		try {
			CustomerDto dto = new CustomerDto();
			CustomerService service = new CustomerService();

			dto.setMobile(request.getParameter("Mobile").trim());
			dto.setPassword(request.getParameter("Password").trim());

			String id = service.checkLogin(dto, config, request);

			if (!id.equalsIgnoreCase("0")) {

				session.setAttribute("customer_id", id);

				response.sendRedirect("index.jsp?msg=YesLogin");
			} else {
				response.sendRedirect("login.jsp?msg=NoLogin");
			}

		} catch (Exception e) {
			e.printStackTrace(response.getWriter());
		}

	}
}
