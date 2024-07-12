<%@page import="com.service.OrderService"%>
<%@page import="com.dto.OrderDto"%>
<%@page import="com.service.FavouriteService"%>
<%@page import="com.dto.FavouriteDto"%>
<%
OrderDto dto = new OrderDto();

dto.setCustomerID(Integer.parseInt(request.getParameter("Customer_id") == null ? "0" : request.getParameter("Customer_id")));
dto.setTrainID(Integer.parseInt(request.getParameter("Train_id") == null ? "0" : request.getParameter("Train_id")));
dto.setSheetNo(Integer.parseInt(request.getParameter("Sheet_no") == null ? "0" : request.getParameter("Sheet_no")));
dto.setTotalAmount(Float.parseFloat(request.getParameter("Total_price") == null ? "0" : request.getParameter("Total_price")));
dto.setTrainNumber(Integer.parseInt(request.getParameter("Train_number") == null ? "0" : request.getParameter("Train_number")));
dto.setCoachNo(request.getParameter("Coach_number") == null ? "0" : request.getParameter("Coach_number"));
dto.setRemark(request.getParameter("Remark") == null ? "0" : request.getParameter("Remark"));
dto.setTokan(request.getParameter("Tokan") == null ? "0" : request.getParameter("Tokan"));
dto.setQuantity_tokan(request.getParameter("Quantity") == null ? "0" : request.getParameter("Quantity"));
dto.setCust_name(request.getParameter("Cust_name") == null ? "0" : request.getParameter("Cust_name"));
dto.setCust_mobile(request.getParameter("Cust_mobile") == null ? "0" : request.getParameter("Cust_mobile"));

String flag = request.getParameter("Flag") == null ? "" : request.getParameter("Flag");

OrderService ser = new OrderService();

boolean b = false;

	if (flag.equalsIgnoreCase("Insert")) {
		b = ser.insertOrder(dto, request, config);
	}

%>

<input id="result" type="hidden" value="<%=b%>" />
