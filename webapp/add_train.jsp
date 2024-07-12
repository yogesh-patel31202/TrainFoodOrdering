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
                        <h2>Add Food</h2>
                    </div>
                </div>
            </div>
        </div>
        <!-- Page Header End -->
        

        <!-- Booking Start -->
        <div class="booking">
            <div class="container">
                <div class="row align-items-center d-flex justify-content-center">
                            <div class="col-lg-6">
                                <div class="booking-form">
                            <form action="TrainServlet" method="post">
                                
								<input type="hidden" name="User_id_fk" value="1">
                                
                                <label for="trainNumber">Train Number:</label>
                                <div class="control-group">
                                    <div class="input-group">
                                        <input type="text" class="form-control" name="TrainNumber" id="trainNumber" required="required" />
                                    </div>
                                </div>
                                
                                <label for="departureStation">Departure Station:</label>
                                <div class="control-group">
                                    <div class="input-group">
                                        <input type="text" class="form-control" name="DepartureStation" id="departureStation" required="required" />
                                    </div>
                                </div>
                                
                                <label for="departureTime">Departure Time:</label>
                                <div class="control-group">
                                    <div class="input-group">
                                        <input type="time" class="form-control" name="DepartureTime" id="departureTime" required="required" />
                                    </div>
                                </div>
                                
                                <label for="arrivalStation">Arrival Station:</label>
                                <div class="control-group">
                                    <div class="input-group">
                                        <input type="text" class="form-control" name="ArrivalStation" id="arrivalStation" required="required" />
                                    </div>
                                </div>
                                
                                <label for="arrivalTime">Arrival Time:</label>
                                <div class="control-group">
                                    <div class="input-group">
                                        <input type="time" class="form-control" name="ArrivalTime" id="arrivalTime" required="required" />
                                    </div>
                                </div>

                                <div>
                                    <button class="btn custom-btn" type="submit">Submit</button>
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
