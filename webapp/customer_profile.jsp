<!DOCTYPE html>
<%@page import="com.dto.OrderDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.service.OrderService"%>
<html lang="en">
    <head>

	<%@include file="include/head.jsp"%>

    </head>

    <body>

	<%@include file="include/header.jsp"%>
        
        
        <!-- Page Header Start -->
        <div class="page-header">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <h2>Profile</h2>
                    </div>
                </div>
            </div>
        </div>
        <!-- Page Header End -->
        

        <!-- Booking Start -->
        <div class="booking" style="background: #fff;">
            <div class="container">
                <div class="row align-items-center col-12 d-flex justify-content-center" style="border: 1px solid;">

                    <div class="col-6 row d-flex justify-content-center pt-4 pb-4">
                    		<div class="col-6 mt-2"><b>Name:</b></div><div class="col-6 mt-2"><%=head_cust_dto.getName() %></div>
                    		<div class="col-6 mt-2"><b>Mobile:</b></div><div class="col-6 mt-2"><%=head_cust_dto.getMobile() %></div>
                    		<div class="col-6 mt-2"><b>Email:</b></div><div class="col-6 mt-2"><%=head_cust_dto.getEmail() %></div>
                    		<div class="col-6 mt-2"><b>Address:</b></div><div class="col-6 mt-2"><%=head_cust_dto.getAddress() %></div>
                    </div>
                </div>
                <div class="carousel-btn mt-4 text-center">
                                <a class="btn custom-btn" href="edit_customer.jsp?id=<%=head_cust_dto.getId()%>">Edit Profile</a>
                 </div>
            </div>
        </div>
        <!-- Booking End -->
        
                                    <div class="col-lg-12">
                                <div class="booking-form">
                                    <h3 class="text-center">Order History</h3>
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
                                              </tr>
                                            </thead>
                                            <tbody>
                                <%
								OrderService ser = new OrderService();
								ArrayList<OrderDto> f_list = ser.getOrderInfoByCustId(customerId, config, request);
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
