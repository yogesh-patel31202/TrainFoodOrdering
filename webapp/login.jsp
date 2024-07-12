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
                        <h2>Login</h2>
                    </div>
                </div>
            </div>
        </div>
        <!-- Page Header End -->
        

        <!-- Booking Start -->
        <div class="booking" style="background: #fff;">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-7">
                        <div class="booking-content">
                            <div class="section-header">
                                <p>Train Food Ordering</p>
                                <h2>Login your account</h2>
                            </div>
                            <div class="about-text">
                                <p>
                                    Create new account <a href="register.jsp">Register</a>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5">
                        <div class="booking-form">
                            <form action="LoginServlet" method="Post">
                                <div class="control-group">
                                    <div class="input-group">
                                        <input type="text" class="form-control" name="Mobile" placeholder="Mobile" required="required" />
                                        <div class="input-group-append">
                                            <div class="input-group-text"><i class="bi bi-phone"></i></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="control-group">
                                    <div class="input-group">
                                        <input type="password" class="form-control" name="Password" placeholder="Mobile" required="required" />
                                        <div class="input-group-append">
                                            <div class="input-group-text"><i class="bi bi-lock"></i></div>
                                        </div>
                                    </div>
                                </div>

                                <div>
                                    <button class="btn custom-btn" type="submit">Login</button>
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
