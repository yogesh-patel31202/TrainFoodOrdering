<%@page import="com.service.FavouriteService"%>
<%@page import="com.dto.FavouriteDto"%>
<%
FavouriteDto dto = new FavouriteDto();

//Integer
dto.setCustomer_id(Integer.parseInt(request.getParameter("Customer_id") == null ? "0" : request.getParameter("Customer_id")));
dto.setFood_id(Integer.parseInt(request.getParameter("Food_id") == null ? "0" : request.getParameter("Food_id")));

String flag = request.getParameter("Flag") == null ? "" : request.getParameter("Flag");

FavouriteService ser = new FavouriteService();

boolean b = false;

	if (flag.equalsIgnoreCase("Insert")) {
		b = ser.insertFavourite(dto, request, config);
	}
	if(flag.equalsIgnoreCase("Delete")){
		b = ser.deleteFavourite(dto, request, config);
	}

%>

<input id="result" type="hidden" value="<%=b%>" />
