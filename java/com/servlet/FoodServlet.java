package com.servlet;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.FoodDto;
import com.service.FoodService;
import com.service.ItemCategoryService;

/**
 * Servlet implementation class CategoryServlet
 */
@WebServlet("/FoodServlet")
public class FoodServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FoodServlet() {
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
		

		FoodDto dto = new FoodDto();
		FoodService ser = new FoodService();
		
		
		dto.setId(Integer.parseInt(request.getParameter("Id") == null ? "0" : request.getParameter("Id")));
		dto.setName(request.getParameter("Name") == null ? "" : request.getParameter("Name"));
		dto.setPrice(Float.parseFloat(request.getParameter("Price") == null ? "0" : request.getParameter("Price")));
		dto.setDescription(request.getParameter("Description") == null ? "" : request.getParameter("Description"));
		dto.setStatus(request.getParameter("Status") == null ? "Active" : request.getParameter("Status"));
		dto.setUser_id_fk(Integer.parseInt(request.getParameter("User_id_fk") == null ? "0" : request.getParameter("User_id_fk")));
		dto.setCategory_id_fk(Integer.parseInt(request.getParameter("Category_id_fk") == null ? "0" : request.getParameter("Category_id_fk")));
		
		/*
		 * dto.setUser_name(request.getParameter("User_name") == null ? "" :
		 * request.getParameter("User_name"));
		 */
		
		boolean b = false;
		
		// condition for insert
		if(dto.getId()==0) {
			
			b = ser.insertFood(dto, request, config);
			
			if(b) {
				response.sendRedirect("add_food.jsp?msg=Yes");
			}
			else {
				response.sendRedirect("add_food.jsp?msg=No");
			}
		}
		//condition for updating
		else {
			
			b = ser.updateFoodInfo(dto, request, config);
			
			if(b) {
				response.sendRedirect("manage_food.jsp?msg=YesUp");
			}
			else {
				response.sendRedirect("manage_food.jsp?msg=NoUp");
			}
		}
		
	}

}
