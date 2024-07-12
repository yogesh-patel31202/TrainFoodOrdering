<!DOCTYPE html>
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
                        <h2>Update Profile</h2>
                    </div>
                </div>
            </div>
        </div>
        <!-- Page Header End -->
        

        <!-- Booking Start -->
        <div class="booking" style="background: #fff;">
            <div class="container">
                <div class="row align-items-center d-flex justify-content-center">
                    <div class="col-lg-6">
                        <div class="booking-form">
                            <form action="CustomerServlet" method="post">
                                <div class="control-group">
                                <label>Name:</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" name="Name" value="<%=head_cust_dto.getName() %>" placeholder="Enter name" required="required" />
                                        <div class="input-group-append">
                                            <div class="input-group-text"><i class="bi bi-person"></i></div>
                                        </div>
                                    </div>
                                </div>
                                <input type="hidden" name="Id" value="<%=head_cust_dto.getId()%>">
                                
                                <div class="control-group">
                                <label>Old Password:</label>
                                    <div class="input-group">
                                        <input type="password" class="form-control" name="Password" placeholder="Enter old Password" required="required" />
                                        <div class="input-group-append">
                                            <div class="input-group-text"><i class="bi bi-lock"></i></div>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="control-group">
                                <label>New Password:</label>
                                    <div class="input-group">
                                        <input type="password" class="form-control" name="New_password" placeholder="Enter new password" required="required" />
                                        <div class="input-group-append">
                                            <div class="input-group-text"><i class="bi bi-lock"></i></div>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="control-group">
                                <label>Email:</label>
                                    <div class="input-group">
                                        <input type="email" class="form-control" name="Email" value="<%=head_cust_dto.getEmail() %>" placeholder="Enter your email" required="required" />
                                        <div class="input-group-append">
                                            <div class="input-group-text"><i class="bi bi-envelope"></i></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="control-group">
                                <label>Address:</label>
                                <div class="input-group">
                                    <textarea class="form-control" name="Address" placeholder="Address" required="required" data-validation-required-message="Please enter your address"><%=head_cust_dto.getAddress() %></textarea>
                                   	<div class="input-group-append">
                                            <div class="input-group-text"><i class="bi bi bi-geo-alt"></i></div>
                                        </div>
                                   	<p class="help-block text-danger"></p>
                                </div>
                                </div>

                                <div>
                                    <button class="btn custom-btn" type="submit">Register</button>
                                </div>
                            </form>
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
