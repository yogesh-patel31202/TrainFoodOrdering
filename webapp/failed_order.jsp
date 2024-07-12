<!DOCTYPE html>
<%@page import="com.dto.OrderDto"%>
<%@page import="com.service.OrderService"%>
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
                        <h2>Pending Order Details</h2>
                    </div>
                    <div class="col-12">
                        <a href="">Home</a>
                        <a href="">Chef</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Page Header End -->
        
             <div class="col-lg-12">
                                <div class="booking-form">
                                    <div class="col-lg-12 m-4">
                                        <table class="table">
                                            <thead class="thead-dark">
                                              <tr>
                                                <th scope="col">#</th>
                                                <th scope="col">Order No</th>
                                                <th scope="col">Train No</th>
                                                <th scope="col">Date (YYYY/MM/DD) Time (HH/MM/SS)</th>
                                                <th scope="col">Total Price</th>
                                                <th scope="col">Paid Amount</th>
                                                <th scope="col">Sheet No</th>
                                                <th scope="col">Coach No</th>
                                                <th scope="col">Invoice</th>
                                                <th scope="col">Update</th>
                                              </tr>
                                            </thead>
                                            <tbody>
                                <%
								OrderService ser = new OrderService();
								ArrayList<OrderDto> f_list = ser.getFailedOrderInfo(config, request);
								int index = 1;
								for (OrderDto dto : f_list) {
								%>
                                              <tr>
                                                <th scope="row"><%=index++ %></th>
                                                <td>I<%=dto.getId() %></td>
                                                <td><%=dto.getTrainNumber() %></td>
                                                <td><%=dto.getOrderDateTime() %></td>
                                                <td><%=dto.getTotalAmount() %></td>
                                                <td><%=dto.getPaidAmount() %></td>
                                                <td><%=dto.getSheetNo() %></td>
                                                <td><%=dto.getCoachNo() %></td>
                                                <td><a href="print_order_invoice.jsp?id=<%=dto.getId()%>"><i class="bi bi-printer"></i></a></td>
                                                <td><a href="edit_order.jsp?id=<%=dto.getId()%>"><i class="bi bi-pencil"></i></a></td>
                                              </tr>
                                              <%} %>
  
                                            </tbody>
                                          </table>
                                      </div>
                                </div>
                                
                            </div>


	<%@include file="include/footer.jsp"%>

        <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

	<%@include file="include/footer_js.jsp"%>
    </body>
</html>
