
<%
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);

Object customer_id = session.getAttribute("customer_id");
	int customerId = 0;
	if(customer_id==null){
		customerId =0;
	}else{
		customerId = Integer.parseInt((String) (session.getAttribute("customer_id")));
	}

%>