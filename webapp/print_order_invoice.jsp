<%@page import="com.dto.OrderItemDto"%>
<%@page import="com.dto.OrderDto"%>
<%@page import="com.service.OrderService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@ page import="java.time.LocalDateTime"%>
<%@ page import="java.time.LocalTime"%>
<%@ page import="java.time.format.DateTimeFormatter"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<title>Direct Bill</title>
<style>
a {
	text-decoration: none;
}

body {
	font-family: Arial, sans-serif;
	text-align: center;
}

.centered-container {
	max-width: 402px;
	margin: 0 auto;
}

.hotel-logo {
	max-width: 80px; /* Decreased logo width */
	float: left; /* Move logo to the left */
	margin-right: 20px; /* Add some space between logo and hotel info */
}

.hotel-logo img {
	width: 100%;
}

.hotel-info {
	display: flex;
	align-items: center;
	justify-content: center; /* Center-align hotel info */
	margin-bottom: 10px;
	/* Decreased margin between hotel info and customer details */
}

.hotel-details {
	text-align: left;
}

.hotel-name, .hotel-address, .hotel-mob {
	margin: 0; /* Remove default margins */
}

table {
	border-collapse: collapse;
	margin: 0 auto;
	width: 100%;
}

th, td {
	border: 1px solid black;
	padding: 4px 8px;
	/* text-align: left; */
	font-size: 12px;
	text-align: center;
}

th {
	background-color: #f2f2f2;
}

.total-row {
	font-weight: bold;
}

h3 {
	font-size: 16px;
	margin: 6px;
}

.item_row td {
	border-bottom: none;
}

.item_row {
	/* border: 1px solid black; */
	border-left: 1px solid black;
	border-right: 1px solid black;
}

td, th {
	
}

.right {
	float: right;
	padding-right: 3px;
}

.left {
	float: left;
	padding-left: 3px;
}

.print-button {
	background: #ff3f00;
	color: #fff;
	border: none;
	padding: 6px 15px;
	border-radius: 5px;
	font-size: 18px;
	cursor: pointer;
	margin-top: 20px;
}

.print-button:hover {
	background: #f03c02;
}

.home-button {
	background: #4c4846;
	color: #fff;
	border: none;
	padding: 6px 15px;
	border-radius: 5px;
	font-size: 18px;
	cursor: pointer;
	margin-top: 20px;
}

.home-button:hover {
	background: #373534;
}

.rupee-symbol::before {
	content: "\20B9"; /* Unicode character for the Rupee symbol (₹) */
}

.cust-massage {
	font-size: 12px;
}

.align-left {
	text-align: left;
	width: 3%;
}

.input-width {
	width: 20%;
}

.height {
	height: 15px
}

.width {
	width: 45%
}

.widths {
	width: 30%
}

.amt-width {
	width: 31%
}

.remark-width {
	width: 15%
}

.border-right {
	border-right: none;
}

.d-none {
	display: none;
}
</style>

</head>
<body>


	<div class="centered-container">
		<button class="print-button" id="print-button" onclick="printBill()">Print</button>
		<a class="home-button" id="home-button" href="index.jsp">Home</a> <br>
		<br>

		<div
			style="float: left; width: 400px; border: 1px solid; border-bottom: none;">


			<div
				style="width: 100%; float: left; font-size: 20px; color: #000; text-align: center;">

				<div style="width: 20%; float: left; font-size: 19px;">
					
					<div style="float: left; width: 100%;">
						<div
							style="width: 90%; float: left; font-size: 11px; color: #000; padding: 0px 5px 0px;">
							
						</div>
						<div
							style="width: 100%; float: left; font-size: 11px; text-align: right; color: #000; padding: 0px 5px 0; display: none;">
							<b>Mobile -</b>9826607332
						</div>
					</div>
				</div>

				<div style="width: 100%; float: left; font-size: 21px;">




					<span
						style="font-size: 21px; width: 100%; float: left; margin-top: 5px;">
						<b style="color: #f00;">TRAIN FOOD ORDERING</b>
					</span> <span
						style="font-size: 13px; width: 100%; float: left; margin-top: 5px;">Khandwa</span>
						<span style="font-size: 13px; width: 100%; float: left; margin-top: 5px;">
						Mobile : 564654654</span> <span
						style="font-size: 15px; width: 100%; float: left; margin-top: 10px;"><b> INVOICE </b> </span>


				</div>



			</div>


		</div>



		<!-- <h3>Customer Details</h3> -->
		
		  <%		int id = Integer.parseInt(request.getParameter("id") == null ? "0" : request.getParameter("id"));
								OrderService ser = new OrderService();
								OrderDto dto = ser.getOrderInfoById(id, config, request);
		%>
		
		<table>
			<tr>
				<th class="align-left">Name:</th>
				<td class="align-left width"><%=dto.getCust_name() %></td>
				<th class="align-left">Mob.:</th>

				<td class="input-width align-left"><%=dto.getCust_mobile() %></td>

			</tr>

			<tr>

				<th class="align-left ">Date:</th>
				<td class="align-left width"><%=dto.getOrderDateTime() %></td>
				<th class="align-left">Invoice.:</th>
				<td class="input-width align-left">I<%=dto.getId() %></td>

			</tr>

		</table>


		<h3>Food Details</h3>

		<table>

			<tr class="item_row" height="20px;">
				<td width="5%" align="center">SN</td>
				<td style="text-align: left;" colspan="3">Item</td>
				<td width="15%" style="text-align: left;">Quantity</td>
				<td width="20%" style="text-align: left;">Price</td>
				<td width="20%" style="text-align: left;">Total</td>

			</tr>

				<%
				ArrayList<OrderItemDto> itemList = ser.getOrderItemInfoByOrderId( dto.getId(), config, request);
				int index = 1;
				float total_price =0 ;
				for (OrderItemDto item_dto : itemList) {
					total_price = total_price + item_dto.getQuantity()*item_dto.getPrice();
				%>

			<tr class="">
				<td align="center" style="border-bottom: none; border-right: none;"><%=index++ %></td>
				<td colspan="6"
					style="border-bottom: none; text-align: left; border-left: none;"><%=item_dto.getName() %></td>

			</tr>

			<tr class="" style="border-top: none;">

				<td style="border-top: none; border-right: none;"></td>
				<td colspan="3"
					style="border-top: none; border-right: none; border-left: none;"></td>
				<td align="center" colspan="1"
					style="text-align: left; border-right: none; border-top: none; border-left: none;"><%=item_dto.getQuantity() %></td>
				<td
					style="text-align: left; border-left: none; border-right: none; border-top: none;"
					colspan="1"><%=item_dto.getPrice() %></td>
				<td style="text-align: left; border-left: none; border-top: none;"
					colspan="1"><%=item_dto.getQuantity() *item_dto.getPrice() %></td>

			</tr>
			<%} %>

			<tr class="item_row" height="20px;" style="border: none;">
				<td align="center" colspan="7" style="border: none;"></td>
			</tr>

		</table>


		<div style="width: 100%;">
			<table>

				<tr class="total-row">
					<td colspan="3" width=""><span class="right">Total Price :</span></td>

					<td width="25%"><span></span><%=total_price %></td>
				</tr>
				<%if(total_price - dto.getPaidAmount()>0&&dto.getStatus().equalsIgnoreCase("Complete")){ %>
				<tr class="total-row">
					<td colspan="3" width=""><span class="right">Discount Amount :</span></td>
					<td width="25%"><span></span><%=total_price - dto.getPaidAmount() %></td>
				</tr>

				<tr class="total-row">
					<td colspan="3"><span class="right">Paid Amount :</span></td>
					<td style="color: #f00;"><span class="rupee-symbol"><%=dto.getPaidAmount() %></span></td>
				</tr>
				<%} %>

			</table>
		</div>
		
		<script src="js/jquery-1.9.1.js"></script>

	</div>

	<script>
		function printBill() {
			// Hide the print button
			var button = document.getElementById("print-button");
			button.style.display = "none";
			var homebutton = document.getElementsByClassName("home-button");
			for (let i = 0; i < homebutton.length; i++) {
			    homebutton[i].style.display = "none";
			}


			// Print the document
			window.print();

			// Show the print button again after printing
			button.style.display = "";
			for (let i = 0; i < homebutton.length; i++) {
			    homebutton[i].style.display = "";
			}
		}
	</script>
</body>
</html>

