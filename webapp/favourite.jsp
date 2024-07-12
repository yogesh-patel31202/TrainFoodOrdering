<!DOCTYPE html>
<%@page import="com.service.FoodService"%>
<%@page import="com.dto.FoodDto"%>
<%@page import="com.dto.FavouriteDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.service.FavouriteService"%>
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
                        <h2>Favourite And Order</h2>
                    </div>
                    <div class="col-12">
                        <a href="">Home</a>
                        <a href="">Favourite</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Page Header End -->
    

        <!-- Menu Start -->
        <div class="menu">
            <div class="container">
                <div class="section-header text-center">
                    <h3>Select Order Item</h3>
                </div>
                <div class="menu-tab">

                    <div class="tab-content">
                        <div id="burgers" class="container tab-pane active">
                            <div class="row">
                                <div class="col-lg-12 col-md-12">
                                <%
								FavouriteService fav_ser = new FavouriteService();
								FoodService f_ser = new FoodService();
								ArrayList<FavouriteDto> fav_list = fav_ser.getFavouriteInfoByCustomer(customerId,config, request);
								
								for (FavouriteDto fav_dto : fav_list) {
									
									FoodDto f_dto = f_ser.getFoodInfoById(fav_dto.getFood_id(),config, request);
								%> 
								
                                    <div class="menu-item" id="menu_<%=f_dto.getId()%>">
                                        <div class="menu-img">
                                            <img src="CategoryImage/<%=f_dto.getCategory_id_fk() %>.jpg" alt="Image">
                                        </div>
                                        <div class="menu-text">
                                            <h3><span><%=f_dto.getName() %></span> <strong><%=f_dto.getPrice() %></strong></h3>
                                            <p><%=f_dto.getDescription() %></p>
                                        </div>
                                        
                                         <%if(customerId>0){
                                        boolean result = fav_ser.checkCustomerFavourite(customerId, f_dto.getId(), config, request);
                                        %>
                                        
                                        <div class="contact-icon mt-5">
                                            <i class="bi <%= result == true ? "bi-heart-fill" : "bi-heart" %>" style="font-size: 25px;color:red;"
                                            id="heart_<%=f_dto.getId()%>" onclick="addFavourite('<%=customerId %>', '<%=f_dto.getId()%>')"></i>
                                        </div>
                                        <%} %>
                                        
                                        <div class="contact-icon mt-5" style="margin-left: 12px;">
                                        	<input type="hidden" name="Tokan" id="tokan" value="">
                                        	<input type="hidden" name="Quantity" id="quantity" value="">
                                        	<input type="hidden" name="Customer_id" id="customer_id" value="<%=customerId%>">
                                        	<input type="hidden" name="Customer_id" id="cust_name" value="<%=head_cust_dto.getName()%>">
                                        	<input type="hidden" name="Customer_id" id="cust_mobile" value="<%=head_cust_dto.getMobile()%>">
                                        	<input type="hidden" name="Train_id" id="train_id" value="1">
                                            <input type="checkbox" onclick="findTotalPrice();" data-id="<%=f_dto.getId()%>" title="Select food" name="Food_price" value="<%=f_dto.getPrice() %>" style="zoom: 1.7;">
                                        </div>
                                        
                                        <div class="contact-icon mt-5" style="margin-left: 12px;">
                                            <input type="number" class="form-control" placeholder="Enter Quantity" onblur="findTotalPrice();" name="Food_quantity" >
                                        </div>
                                    </div>
                                    <%} %>

                                    <hr>
                                    
                                </div>
                                <div class="col-12 d-flex justify-content-center">
                                    <div class="col-6">
                                    <div class="contact-icon mt-4">
                                        <b class="text-center">Total Price:</b>
                                    </div>
                                    <div class="contact-icon mt-4" style="margin-left: 10px;">
                                        <input type="text" readonly="readonly" class="form-control" id="total_price" placeholder="Total Price" value="0" required="required" />
                                    </div>
                                    </div>
                                    
                                    <div class="col-6">
                                    <div class="contact-icon mt-4">
                                        <b class="text-center">Total Quantity:</b>
                                    </div>
                                    <div class="contact-icon mt-4" style="margin-left: 10px;">
                                        <input type="text" readonly="readonly" class="form-control" id="total_quantity" placeholder="Total Quantity" value="0" required="required" />
                                    </div>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Menu End -->

                <!-- Booking Start -->
                <div class="booking" style="background: #fff;">
                    <div class="container">
                        <div class="row align-items-center d-flex justify-content-center">
                            <div class="col-lg-6">
                                <div class="booking-form">
                                    <h3 class="text-center">Fill Order Details</h3>
                                    <form>
                                	     <label >Train No:</label>
                                        <div class="control-group">
                                            <div class="input-group">
                                                <input type="text" class="form-control" placeholder="Enter train number" id="train_number" required="required" />
                                            </div>
                                        </div>
										<label >Coach No:</label>
                                        <div class="control-group">
                                            <div class="input-group">
                                                <input type="text" class="form-control" placeholder="Enter coach No" id="coach_number" required="required" />
                                            </div>
                                        </div>
										<label >Sheet No:</label>
                                        <div class="control-group">
                                            <div class="input-group">
                                                <input type="text" class="form-control" placeholder="Enter sheet No" id="sheet_no" required="required" />
                                            </div>
                                        </div>
        								<label style="display: none;">Remark:</label>
                                        <div class="control-group d-none">
                                            <textarea class="form-control" placeholder="Enter remark" id="remark" style="height: 100px;" data-validation-required-message="Please enter your address"></textarea>
                                            <p class="help-block text-danger"></p>
                                        </div>
        
                                        <div>
                                            <button class="btn custom-btn" onclick="insertOrder();" type="button">Create Order</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Booking End -->
                
        <script>
        
		function insertOrder() {
				var tokan = document.getElementById("tokan").value;
				var total_price = document.getElementById("total_price").value;
				var quantity = document.getElementById("quantity").value;
				var train_number = document.getElementById("train_number").value;
				var customer_id = document.getElementById("customer_id").value;
				var coach_number = document.getElementById("coach_number").value;
				var sheet_no = document.getElementById("sheet_no").value;
				var sheet_no = document.getElementById("sheet_no").value;
				var remark = document.getElementById("remark").value;
				var cust_name = document.getElementById("cust_name").value;
				var cust_mobile = document.getElementById("cust_mobile").value;
				var train_id = document.getElementById("train_id").value;
				let flag = "Insert";
				
					$.ajax({
						url : 'ajax/ajaxOrder.jsp',
						data : 'Tokan='+ tokan+
						'&Quantity='+quantity+
						'&Total_price='+total_price+
						'&Train_number='+train_number+
						'&Customer_id='+customer_id+
						'&Coach_number='+coach_number+
						'&Sheet_no='+sheet_no+
						'&Remark='+remark+
						'&Cust_name='+cust_name+
						'&Cust_mobile='+cust_mobile+
						'&Train_id='+train_id+
						'&Flag='+flag,
						type : 'post',
						success : function(msg) {
							$('#ajax_response').html(msg);
							var result =  document.getElementById("result").value;
							if(result=='true'){
								
								alert("Order Successful.");
								window.location.href = "customer_profile.jsp?msg=YesUp";
							}
							$('#ajax_response').html('');
						}
					});
				}
		
		function addFavourite(customer_id, food_id) {
		//	alert('heart_'+food_id);
			var element = document.getElementById('heart_'+food_id);
			element.classList.contains("bi-heart");
			var flag = "Delete";
			
				$.ajax({
					url : 'ajax/ajaxFavourite.jsp',
					data : 'Customer_id='+ customer_id+'&Food_id='+food_id+'&Flag='+flag,
					type : 'post',
					success : function(msg) {
						$('#ajax_response').html(msg);
						var result =  document.getElementById("result").value;
						if(result=='true'){
							document.getElementById('menu_'+food_id).remove();
							findTotalPrice();
						}
						$('#ajax_response').html('');
					}
				});
			}
		
		function findTotalPrice(){
			var foodPriceArr = document.getElementsByName('Food_price');
			var foodQuantityArr = document.getElementsByName('Food_quantity');
			var total_price = 0;
			var total_quantity = 0;
			let selectFoodId = [];
			let selectFoodQuantity = [];
			
			for (var i = 0; i < foodPriceArr.length; i++) {
				if (parseFloat(foodPriceArr[i].value) && foodPriceArr[i].checked){
					if(foodQuantityArr[i].value==""){
						foodQuantityArr[i].value = 1;
					}
					total_price = total_price + parseFloat(foodPriceArr[i].value*foodQuantityArr[i].value);
					total_quantity = total_quantity + parseFloat(foodQuantityArr[i].value);
					selectFoodId.push(foodPriceArr[i].dataset.id);
					selectFoodQuantity.push(foodQuantityArr[i].value);
				}
			}
			document.getElementById("total_price").value = total_price.toFixed(2);
			document.getElementById("total_quantity").value = total_quantity.toFixed(2);
			document.getElementById("tokan").value = selectFoodId.join(',');
			document.getElementById("quantity").value = selectFoodQuantity.join(',');
			//alert(document.getElementById("tokan").value+"****"+document.getElementById("quantity").value);
			//alert(document.getElementById("quantity").value);
		}
		
      </script>

  
	<%@include file="include/footer.jsp"%>

    <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

	<%@include file="include/footer_js.jsp"%>
    </body>
</html>
