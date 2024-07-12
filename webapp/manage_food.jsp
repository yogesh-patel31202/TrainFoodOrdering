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
                        <h2>Manage Food</h2>
                    </div>
                </div>
            </div>
        </div>
        <!-- Page Header End -->
        

        <!-- Booking Start -->
        <div class="booking">
            <div class="container">
                <div class="row align-items-center d-flex justify-content-center">
                            <div class="col-lg-12">
                                <div class="booking-form" style="background: #fff;">
                                    <h3 class="text-center">Manage Food</h3>
                                    <div class="col-lg-12 m-4">
						<table id="example-small" class="table hover table-responsive nowrap" style="width: 100%">
							<thead class="text-center" id="thead">
								<tr>
									<th style="text-align: center;" width="10%">S.No.</th>
									<th style="text-align: center;" width="20%">Category</th>
									<th style="text-align: center;" width="30%">Name</th>
									<th style="text-align: center;" width="10%">Price</th>
									<th style="text-align: center;" width="35%">Description</th>
									<th style="text-align: center;" width="25%">Status</th>
									<th style="text-align: center;" width="2%">Edit</th>
									<th style="text-align: center;" width="2%">Delete</th>
								</tr>
							</thead>
							<tbody class="text-center" id="tbody">
								<%
								FoodService ser = new FoodService();
								ArrayList<FoodDto> f_list = ser.getFoodInfo(config, request);
								for (FoodDto dto : f_list) {
								%>
								<tr>
									<td><%=f_list.indexOf(dto) + 1%></td>
									<td><%=dto.getCategory_name()%></td>
									<td><%=dto.getName()%></td>
									<td><%=dto.getPrice()%></td>
									<td><%=dto.getDescription()%></td>
									<td><%=dto.getStatus()%></td>
									<td><a  href="edit_food.jsp?id=<%=dto.getId()%>"><i
											class="bi bi-pencil-square"></i></a></td>
									<td><a  onclick="return confirm('Are you sure? You want to delete')"
										href="AjaxService/AjaxDelete.jsp?item_category_id=<%=dto.getId()%>">
											<i class="bi bi-trash"></i>
									</a></td>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>
                                      </div>
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
