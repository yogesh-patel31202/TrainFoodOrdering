<!DOCTYPE html>
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
                            <div class="col-lg-12">
                                <div class="booking-form" style="background: #fff;">
                                    <h3 class="text-center">Manage Category</h3>
                                    <div class="col-lg-12 m-4">
						<table id="example-small" class="table hover table-responsive nowrap" style="width: 100%">
							<thead class="text-center" id="thead">
								<tr>
									<th style="text-align: center;" width="10%">S.No.</th>
									<th style="text-align: center;" width="10%">Image</th>
									<th style="text-align: center;" width="45%">Name</th>
									<th style="text-align: center;" width="25%">Status</th>
									<th style="text-align: center;" width="2%">Edit</th>
									<th style="text-align: center;" width="2%">Delete</th>
								</tr>
							</thead>
							<tbody class="text-center" id="tbody">
								<%
								ItemCategoryService ser = new ItemCategoryService();
								ArrayList<ItemCategoryDto> list1 = ser.getCategoryInfo(config, request);
								for (ItemCategoryDto dto : list1) {
								%>
								<tr>
									<td><%=list1.indexOf(dto) + 1%></td>
									<td>
										                  			<div class="align-item-center justify-content-center">
													                   <img src="CategoryImage/<%=dto.getId()%>.jpg"
													                      width="100" height="80" style="border: 1px solid gray;"
													                      alt="" />
													                  </div>
										                	  	</td>
									<td><%=dto.getName()%></td>
									<td><%=dto.getStatus()%></td>
									<td><a  href="edit_category.jsp?id=<%=dto.getId()%>"><i
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
