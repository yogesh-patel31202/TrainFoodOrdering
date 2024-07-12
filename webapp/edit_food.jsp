<!DOCTYPE html>
<%@page import="com.dto.FoodDto"%>
<%@page import="com.service.FoodService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dto.ItemCategoryDto"%>
<%@page import="com.service.ItemCategoryService"%>
<html lang="en">
    <head>

	<%@include file="include/head.jsp"%>

    </head>

    <body>

	<%@include file="include/admin_header.jsp"%>
        
        <!-- Page Header Start -->
        <div class="page-header">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <h2>Add Food</h2>
                    </div>
                </div>
            </div>
        </div>
        <!-- Page Header End -->
        

        <!-- Booking Start -->
        <div class="booking">
            <div class="container">
                <div class="row align-items-center d-flex justify-content-center">
                            <div class="col-lg-6">
                                <div class="booking-form">
                                
                           <%
											 
								int id = Integer.parseInt(request.getParameter("id") == null ? "0" : request.getParameter("id"));
									FoodService service = new FoodService();
									FoodDto dto = service.getFoodInfoById(id, config, request);
							%>
							
                            <form action="FoodServlet" method="post">
                                
								<div class="form-group">
								 <label for="category_id_fk">Category:</label>
								  <select class="form-control" name="Category_id_fk" id="category_id_fk" >
									<option value="0">Select Category</option>
									<%
								ItemCategoryService ser = new ItemCategoryService();
								ArrayList<ItemCategoryDto> cat_list = ser.getCategoryInfo(config, request);
								for (ItemCategoryDto cat_dto : cat_list) {
								%>
								<option value="<%=cat_dto.getId()%>" <%=dto.getCategory_id_fk()==cat_dto.getId()?"selected":"" %>><%=cat_dto.getName() %></option>
								<%
								}
								%>
									</select>
								</div>
								<input type="hidden" name="Id" value="<%=id%>">
								<input type="hidden" name="User_id_fk" value="1">
                                
                                <div class="control-group">
                                <label for="name">Name:</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" name="Name" id="name" value="<%=dto.getName() %>" required="required" />
                                    </div>
                                </div>
                                <label for="price">Price:</label>
                                <div class="control-group">
                                    <div class="input-group">
                                        <input type="number" step="0.01" class="form-control" name="Price" id="price" value="<%=dto.getPrice() %>" required="required" />
                                    </div>
                                </div>
                                <label for="description">Description</label>
                                 <div class="control-group">
                                    <textarea class="form-control" id="description" name="Description" style="height: 100px;" required="required" data-validation-required-message="Please enter item description"><%=dto.getDescription() %></textarea>
                                    <p class="help-block text-danger"></p>
                                </div>
                                
                               <div class="form-group">
									<label for="status">Status:</label>
										<select class="form-control" id="status" name="Status" >

											<option value="Active"
												<%if (dto.getStatus().equals("Active")) {
							out.print("selected='selected'");
						}%>>Active</option>

											<option value="Block"
												<%if (dto.getStatus().equals("Block"))

							{
								out.print("selected='selected'");
							
							}%>>Block</option>

										</select>

										<div class="invalid-feedback">Please, select category
											Status!</div>

									</div>

                                <div>
                                    <button class="btn custom-btn" type="submit">Submit</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Booking End -->


	<%@include file="include/footer.jsp"%>

        <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

	<%@include file="include/footer_js.jsp"%>
    </body>
</html>
