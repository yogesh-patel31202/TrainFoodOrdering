<!DOCTYPE html>
<%@page import="com.dto.FavouriteDto"%>
<%@page import="com.service.FavouriteService"%>
<%@page import="com.dto.ItemCategoryDto"%>
<%@page import="com.service.ItemCategoryService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.service.FoodService"%>
<%@page import="com.dto.FoodDto"%>
<html lang="en">
    <head>

	<%@include file="include/head.jsp"%>

    </head>

    <body>

	<%@include file="include/header.jsp"%>
        
        
        <!-- Page Header Start -->
        <div class="page-header mb-0">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <h2>Food Menu</h2>
                    </div>
                    <div class="col-12">
                        <a href="">Home</a>
                        <a href="">Menu</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Page Header End -->
        
		<%
		ItemCategoryService cat_ser = new ItemCategoryService();
		ArrayList<ItemCategoryDto> cat_list = cat_ser.getCategoryInfo(config, request);
		for (ItemCategoryDto cat_dto : cat_list) {
		%>

        <!-- Menu Start -->
        <div class="menu">
            <div class="container">
                <div class="section-header text-center">
                    <h2><%=cat_dto.getName() %></h2>
                </div>
                <div class="menu-tab">

                    <div class="tab-content">
                        <div id="burgers" class="container tab-pane active">
                            <div class="row">
                                <div class="col-lg-12 col-md-12">
                                <%
								FoodService ser = new FoodService();
								ArrayList<FoodDto> f_list = ser.getFoodInfoByCategoryId(cat_dto.getId(),config, request);
								for (FoodDto f_dto : f_list) {
								%> 
                                    <div class="menu-item">
                                        <div class="menu-img">
                                            <img src="CategoryImage/<%=cat_dto.getId() %>.jpg" alt="Image">
                                        </div>
                                        <div class="menu-text">
                                            <h3><span><%=f_dto.getName() %></span> <strong><%=f_dto.getPrice() %></strong></h3>
                                            <p><%=f_dto.getDescription() %></p>
                                        </div>
                                        <%if(customerId>0){
                                        FavouriteService fav_ser = new FavouriteService();
                                        boolean result = fav_ser.checkCustomerFavourite(customerId, f_dto.getId(), config, request);
                                        %>
                                        
                                        <div class="contact-icon mt-5">
                                            <i class="bi <%= result == true ? "bi-heart-fill" : "bi-heart" %>" style="font-size: 25px;color:red;"
                                            id="heart_<%=f_dto.getId()%>" onclick="addFavourite('<%=customerId %>', '<%=f_dto.getId()%>')"></i>
                                        </div>
                                        <%} %>
                                    </div>
                                    <%} %>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Menu End -->
        
        <%} %>
                
      <script>
		function addFavourite(customer_id, food_id) {
		//	alert('heart_'+food_id);
			var element = document.getElementById('heart_'+food_id);
			element.classList.contains("bi-heart");
			var flag = "";
			if(element.classList.contains("bi-heart")){
				flag = "Insert";
			//document.getElementById('heart_'+food_id).classList.add("bi-heart-fill");
			//document.getElementById('heart_'+food_id).classList.remove("bi-heart");
			}else{
				flag = "Delete";
			//document.getElementById('heart_'+food_id).classList.remove("bi-heart-fill");
			//document.getElementById('heart_'+food_id).classList.add("bi-heart");
			}
			//alert(flag);
			
				$.ajax({
					url : 'ajax/ajaxFavourite.jsp',
					data : 'Customer_id='+ customer_id+'&Food_id='+food_id+'&Flag='+flag,
					type : 'post',
					success : function(msg) {
						$('#ajax_response').html(msg);
						var result =  document.getElementById("result").value;
						if(result=='true'){
							if(element.classList.contains("bi-heart")){
							document.getElementById('heart_'+food_id).classList.add("bi-heart-fill");
							document.getElementById('heart_'+food_id).classList.remove("bi-heart");
							}else{
							document.getElementById('heart_'+food_id).classList.remove("bi-heart-fill");
							document.getElementById('heart_'+food_id).classList.add("bi-heart");
							}
						}
						$('#ajax_response').html('');
					}
				});
			}
      </script>


	<%@include file="include/footer.jsp"%>

    <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

	<%@include file="include/footer_js.jsp"%>
    </body>
</html>
