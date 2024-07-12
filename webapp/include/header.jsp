        <!-- Nav Bar Start -->
        <div class="navbar navbar-expand-lg bg-light navbar-light">
            <div class="container-fluid">
                <a href="index.jsp" class="navbar-brand">Train <span>Food Ordering</span></a>
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                    <div class="navbar-nav ml-auto">
                        <a href="index.jsp" class="nav-item nav-link active">Home</a>
                        <a href="menu.jsp" class="nav-item nav-link">Menu</a>
                         <%if(customerId>0){ %>
                        <a href="favourite.jsp" class="nav-item nav-link">Favourite Item</a>
                         <%}if(customerId>0){ %>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown"><i class="bi bi-person"></i><%=head_cust_dto.getName() %></a>
                            <div class="dropdown-menu">
                                <a href="customer_profile.jsp" class="dropdown-item"><i class="bi bi-person"></i>Profile</a>
                               
                                <a href="logout.jsp" class="dropdown-item"><i class="bi bi-power"></i>Log out</a>
                            </div>
                        </div>
                        <%}else{ %>
                        <a href="login.jsp" class="nav-item nav-link">Login</a>
                        <%}%>
                    </div>
                </div>
            </div>
        </div>
        <!-- Nav Bar End -->
        
        <div style="display: none;" id="ajax_response"></div>