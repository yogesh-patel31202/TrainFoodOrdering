<!DOCTYPE html>
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
                        <h2>Update Category</h2>
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
									ItemCategoryService service = new ItemCategoryService();
									ItemCategoryDto dto = service.getCategoryInfoById(id, config, request);
							%>
							
                            <form action="ItemCategoryServlet" enctype="multipart/form-data" method="post">
                                <div class="control-group">
                                    <div class="input-group">
                                        <input type="text" class="form-control" name="Name" placeholder="Category Name" value="<%=dto.getName() %>" required="required" />
                                    </div>
                                </div>
                                <input type="hidden" name="Id" value="<%=id%>">
								<input type="hidden" name="User_id_fk" value="1">
								
                                 <div class="control-group">
                                        <input type="file" name="File" title="Select category image." />
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
