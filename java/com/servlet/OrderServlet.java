package com.servlet;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.FoodDto;
import com.dto.OrderDto;
import com.service.FoodService;
import com.service.ItemCategoryService;
import com.service.OrderService;

/**
 * Servlet implementation class CategoryServlet
 */
@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderServlet() {
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
		

		OrderDto dto = new OrderDto();
		OrderService ser = new OrderService();
		
		
		dto.setId(Integer.parseInt(request.getParameter("Id") == null ? "0" : request.getParameter("Id")));
		dto.setPaidAmount(Float.parseFloat(request.getParameter("PaidAmount") == null ? "0" : request.getParameter("PaidAmount")));
		dto.setRemark(request.getParameter("Remark") == null ? "" : request.getParameter("Remark"));
		dto.setStatus(request.getParameter("Status") == null ? "" : request.getParameter("Status"));
		
		/*
		 * dto.setUser_name(request.getParameter("User_name") == null ? "" :
		 * request.getParameter("User_name"));
		 */
		
		boolean b = false;
		
		// condition for insert
		if(dto.getId()>0) {
			
			b = ser.updateOrder(dto, request, config);
			
			if(b) {
				response.sendRedirect("pending_order.jsp?msg=Yes");
			}
			else {
				response.sendRedirect("pending_order.jsp?msg=No");
			}
		}
		//condition for updating
		
	}

}
