package com.servlet;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.CustomerDto;
import com.dto.FoodDto;
import com.dto.TrainDto;
import com.service.CustomerService;
import com.service.FoodService;
import com.service.ItemCategoryService;
import com.service.TrainService;

/**
 * Servlet implementation class CategoryServlet
 */
@WebServlet("/CustomerServlet")
public class CustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    
	private ServletConfig config;

	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		this.config = config;
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		

		CustomerDto dto = new CustomerDto();
		CustomerService ser = new CustomerService();
		
		dto.setId(Integer.parseInt(request.getParameter("Id") == null ? "0" : request.getParameter("Id")));
		dto.setName(request.getParameter("Name") == null ? "" : request.getParameter("Name"));
		dto.setMobile(request.getParameter("Mobile") == null ? "" : request.getParameter("Mobile"));
		dto.setPassword(request.getParameter("Password") == null ? "" : request.getParameter("Password"));
		String new_password =(request.getParameter("New_password") == null ? "" : request.getParameter("New_password"));
		dto.setEmail(request.getParameter("Email") == null ? "" : request.getParameter("Email"));
		dto.setAddress(request.getParameter("Address") == null ? "" : request.getParameter("Address"));
		dto.setStatus(request.getParameter("Status") == null ? "Active" : request.getParameter("Status"));
		
		/*
		 * dto.setUser_name(request.getParameter("User_name") == null ? "" :
		 * request.getParameter("User_name"));
		 */
		
		boolean b = false;
		
		// condition for insert
		if(dto.getId()==0) {
			
			b = ser.insertCustomer(dto, request, config);
			
			if(b) {
				response.sendRedirect("login.jsp?msg=Yes");
			}
			else {
				response.sendRedirect("register.jsp?msg=No");
			}
		}
		//condition for updating
		else {
			
			b = ser.updateCustomerInfo(dto, new_password,request, config);
			
			if(b) {
				response.sendRedirect("customer_profile.jsp?msg=YesUp");
			}
			else {
				response.sendRedirect("customer_profile.jsp?msg=NoUp");
			}
		}
		
	}

}
