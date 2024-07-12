package com.servlet;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.dto.ItemCategoryDto;
import com.service.ItemCategoryService;

/**
 * Servlet implementation class CategoryServlet
 */
@WebServlet("/ItemCategoryServlet")
public class ItemCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String Name = "";
	String path = "";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItemCategoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    
	private ServletConfig config;

	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		this.config = config;
		path = config.getServletContext().getRealPath("/");
		System.out.println(path);
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
		

		ItemCategoryDto dto = new ItemCategoryDto();
		ItemCategoryService ser = new ItemCategoryService();
		
		File savesFile = null;
		FileItem item = null;

		if (ServletFileUpload.isMultipartContent(request)) {
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			List<FileItem> items = null;
			try {

				items = upload.parseRequest(request);

			} catch (Exception e) {
			}

			Iterator<FileItem> itr = items.iterator();

			while (itr.hasNext()) {
				item = itr.next();

				if (item.isFormField()) {

					String name = item.getFieldName();

					if (name.equals("Id"))
						dto.setId(Integer.parseInt(item.getString() == null ? "0"
								: item.getString().trim()));
					
					if (name.equals("User_id_fk"))
						dto.setUser_id_fk(Integer.parseInt(item.getString() == null ? "0"
								: item.getString().trim()));
					
					if (name.equals("Name"))
						dto.setName(item.getString() == null ? "" : item
								.getString().trim());
					
					if (name.equals("Status"))
						dto.setStatus(item.getString() == null ? "block" : item.getString().trim());
					
				} else {

					if (item.getSize() != 0) {
						if (item.getSize() < 3000000) {
							if (dto.getId() == 0) {

								int j = ser.maxId(request);
								savesFile = new File(path
										+ "CategoryImage/" + j + ".jpg");

								try {
									item.write(savesFile);

									System.out.println(savesFile);
								} catch (Exception e2) {
								}

							} else {

								savesFile = new File(path
										+ "CategoryImage/" + dto.getId() +".jpg");
								try {
									item.write(savesFile);

								}
								catch (Exception e2) {
								}
							}

						}

					}

				}
			}
		}
		
		
		boolean b = false;
		
		// condition for insert
		if(dto.getId()==0) {
			
			b = ser.insertCategory(dto, request, config);
			
			if(b) {
				response.sendRedirect("add_category.jsp?msg=Yes");
			}
			else {
				response.sendRedirect("add_category.jsp?msg=No");
			}
		}
		//condition for updating
		else {
			
			b = ser.updateCategory(dto, request, config);
			
			if(b) {
				response.sendRedirect("manage_category.jsp?msg=YesUp");
			}
			else {
				response.sendRedirect("manage_category.jsp?msg=NoUp");
			}
		}
		
	}

}
