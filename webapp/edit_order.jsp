<!DOCTYPE html>
<%@page import="com.dto.OrderDto"%>
<%@page import="com.service.OrderService"%>
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
                        <h2>Edit Order</h2>
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
									OrderService service = new OrderService();
									OrderDto dto = service.getOrderInfoById(id, config, request);
							%>
							
                            <form action="OrderServlet" method="post">
                                
								<input type="hidden" name="Id" value="<%=id%>">
								<input type="hidden" name="User_id_fk" value="1">
                                
                                <label for="price">Total Price:</label>
                                <div class="control-group">
                                    <div class="input-group">
                                        <input type="number" step="0.01" class="form-control" id="price" value="<%=dto.getTotalAmount() %>" required="required" />
                                    </div>
                                </div>
                                
                                <label for="price">Paid Amount:</label>
                                <div class="control-group">
                                    <div class="input-group">
                                        <input type="number" step="0.01" class="form-control" name="PaidAmount" id="price" value="<%=dto.getTotalAmount() %>" required="required" />
                                    </div>
                                </div>
                                
                               <div class="form-group">
									<label for="status">Status:</label>
										<select class="form-control" id="status" name="Status" >

											<option value="Pending"
												<%if (dto.getStatus().equals("Pending")) {
							out.print("selected='selected'");
						}%>>Pending</option>

											<option value="Complete"
												<%if (dto.getStatus().equals("Complete"))

							{
								out.print("selected='selected'");
							
							}%>>Complete</option>
							
							<option value="Failed"
												<%if (dto.getStatus().equals("Failed"))

							{
								out.print("selected='selected'");
							
							}%>>Failed</option>

										</select>

										<div class="invalid-feedback">Please, select category
											Status!</div>

									</div>
									
									<label >Remark:</label>
                                        <div class="control-group">
                                            <textarea class="form-control" placeholder="Enter remark" name="Remark" style="height: 100px;" data-validation-required-message="Please enter your address"></textarea>
                                            <p class="help-block text-danger"></p>
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
