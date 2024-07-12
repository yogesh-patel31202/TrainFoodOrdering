package com.servlet;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.FoodDto;
import com.dto.TrainDto;
import com.service.FoodService;
import com.service.ItemCategoryService;
import com.service.TrainService;

/**
 * Servlet implementation class CategoryServlet
 */
@WebServlet("/TrainServlet")
public class TrainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TrainServlet() {
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
		

		TrainDto dto = new TrainDto();
		TrainService ser = new TrainService();
		
		dto.setId(Integer.parseInt(request.getParameter("Id") == null ? "0" : request.getParameter("Id")));
		dto.setTrainNumber(Integer.parseInt(request.getParameter("TrainNumber") == null ? "0" : request.getParameter("TrainNumber")));
		dto.setDepartureStation(request.getParameter("DepartureStation") == null ? "" : request.getParameter("DepartureStation"));
		dto.setArrivalStation(request.getParameter("ArrivalStation") == null ? "" : request.getParameter("ArrivalStation"));
		dto.setDepartureTime(request.getParameter("DepartureTime") == null ? "" : request.getParameter("DepartureTime"));
		dto.setArrivalTime(request.getParameter("ArrivalTime") == null ? "" : request.getParameter("ArrivalTime"));
		dto.setStatus(request.getParameter("Status") == null ? "Active" : request.getParameter("Status"));
		dto.setUser_id_fk(Integer.parseInt(request.getParameter("User_id_fk") == null ? "0" : request.getParameter("User_id_fk")));
		
		/*
		 * dto.setUser_name(request.getParameter("User_name") == null ? "" :
		 * request.getParameter("User_name"));
		 */
		
		boolean b = false;
		
		// condition for insert
		if(dto.getId()==0) {
			
			b = ser.insertTrain(dto, request, config);
			
			if(b) {
				response.sendRedirect("add_train.jsp?msg=Yes");
			}
			else {
				response.sendRedirect("add_train.jsp?msg=No");
			}
		}
		//condition for updating
		else {
			
			b = ser.updateTrainInfo(dto, request, config);
			
			if(b) {
				response.sendRedirect("manage_train.jsp?msg=YesUp");
			}
			else {
				response.sendRedirect("manage_train.jsp?msg=NoUp");
			}
		}
		
	}

}
