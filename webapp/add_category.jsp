<!DOCTYPE html>
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
                        <h2>Add Category</h2>
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
                            <form action="ItemCategoryServlet" enctype="multipart/form-data" method="post">
                                <div class="control-group">
                                    <div class="input-group">
                                        <input type="text" class="form-control" name="Name" placeholder="Category Name" required="required" />
                                    </div>
                                </div>
                                <input type="hidden" name="User_id_fk" value="1">
                                
                                <div class="control-group">
                                        <input type="file" name="File" title="Select category image." required="required" />
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
