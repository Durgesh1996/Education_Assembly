<!DOCTYPE html>
<!--[if IE 9]><html class="ie ie9"> <![endif]-->
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords" content="college, campus, university, courses, school, educational">
    <meta name="description" content="ATENA - College, University and campus template">
    <meta name="author" content="Ansonika">
    <title>College, University and campus</title>

    <!-- Favicons-->
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" type="image/x-icon" href="img/apple-touch-icon-57x57-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="img/apple-touch-icon-72x72-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="114x114" href="img/apple-touch-icon-114x114-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="144x144" href="img/apple-touch-icon-144x144-precomposed.png">

    <!-- BASE CSS -->
     <link href="itc/document.css" rel="stylesheet">
    <link href="css/base.css" rel="stylesheet">
    
     <!-- SPECIFIC CSS -->
     <link href="css/date_time_picker.css" rel="stylesheet">
    

    <!--[if lt IE 9]>
      <script src="js/html5shiv.min.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->

</head>

<body>

<!--[if lte IE 8]>
    <p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a>.</p>
<![endif]-->
<%@page import="in.common.GetConnection"%>
		 <%@ include file="inc/stdimport.jsp" %> 
		 
		<%
		GetConnection getConObj=new GetConnection();
		Connection con=getConObj.getCon();
		Statement stmt=con.createStatement();
		
		%> 
<div id="preloader">
	<div class="pulse"></div>
</div><!-- Pulse Preloader -->

    <!--Header File-->	
	 <%@ include file="itc/header.jsp" %>
		<!--Header File-->

	 
		
        
        <div class="container_gray_bg">
            
            
            <div class="container margin_60">
                <div class="row">
                    <div class="col-md-9">
                        <div class="box_style">
                           
                           
                            
                    
                            
                            <div class="indent_title_in">
                                <i class="pe-7s-look"></i>
                                <h3>Plan a visit</h3>
                                <p>
                                   		
                                </p>
                            </div>
                            <div class="wrapper_indent">
                                <div id="message-visit"></div>
                                <form action="../Visit_Us" method="post" >
                                    <div class="row">
                                        <div class="col-md-6 col-sm-6">
                                            <div class="form-group">
                                                <label>Enter Name</label>
                                                <input type="text" class="form-control styled" id="name_visit" name="name" placeholder="First name">
                                            </div>
                                           </div> 
                                            <div class="col-md-6 col-sm-6">
                                            <div class="form-group">
                                                <label>Enter Email</label>
                                                <input type="email" id="email_visit" name="email" class="form-control styled" placeholder="Enter Email">
                                            </div>
                                            </div>
                                            <div class="col-md-6 col-sm-6">
                                            <div class="form-group">
                                                <label>Enter Phone number</label>
                                                <input type="text" id="phone_visit" name="num" class="form-control styled" placeholder="Phone number">
                                            </div>
                                            </div>
                                            
                                            
                                            <div class="col-md-6 col-sm-6">
											<div class="form-group">
												<label>Select College/University</label> 
												 <select name="college" id="college"
													class="form-control styled required" required="required">
													<option value="null">---Please Select---</option>
												<%
														try {
															String query = "select * from college_registration";
															//get Table data
															ResultSet rs = stmt.executeQuery(query);
															while (rs.next()) {
													%>
													<option><%=rs.getString("college_name")%></option>
													<%
														}
														} catch (Exception e) {

														}
													%>
													</select>
											</div>
										</div>
                                      <div class="col-md-6 col-sm-6">
                                            <div class="form-group">
                                                <label>Preferred visit date</label>
                                                <input type="date" name="date"  class="form-control styled" placeholder="Select date">
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-6">
                                            <div class="form-group">
                                                <label>Preferred visit time</label>
                                                <input class="time-pick form-control styled" type="text" name="time" id="time_visit">
                                            </div>
                                        </div>
                                       <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <input type="submit" value="Submit" class="button add_bottom_30" id="submit-contact"/>
                                            </div>
                                        </div>
                                    </div>
                                      
                                        </div>
                                        
                                
                                   
                                </form>
                            </div><!-- End wrapper_indent -->
                        </div><!-- End box style 1-->
                    </div><!-- End col-md-9 -->
                    <br><br><br><br>
                    <aside class="col-md-3">
                    <h3>Contacts info</h3>
                    <p>
                       Gwalior<br>
                         + 000-1234567 <br> + 000- 7654321<br>
                        <a href="#">info@educationassembly.com</a>
                    </p>
                    <h5>Get directions</h5>
                    <form action="http://maps.google.com/maps" method="get" target="_blank">
                        <div class="form-group">
                            <input type="text" name="saddr" placeholder="Enter your location" class="form-control styled">
                            <input type="hidden" name="daddr" value="Emotech Software Solutions pvt ltd">
                            <!-- Write here your end point -->
                        </div>
                        <input type="submit" value="Get directions" class="button small nomargin">
                    </form>
                    <hr class="styled">
                    <h3>Departments</h3>
                    <ul class="contacts_info">
                        
                        <li><strong>Admission</strong><br>
                   <a >admission@educationassembly.com</a><br>
                        <small>Monday to Friday 9am - 7pm</small></li>
                        <li><strong>General questions</strong><br>
                        <a >questions@educationassembly.com</a><br>
                        <small>Monday to Friday 9am - 7pm</small></li>
                    </ul>
         
                    
             </aside>
                    
                </div><!--End row -->
            </div><!--End container -->
        </div><!--End container_gray_bg -->
        
 		

	 
		<!--Footer File-->	 
	<%@ include file="itc/footer.jsp" %>
		<!--Footer File-->
    
<!-- Login modal -->   
<div class="modal fade" id="login" tabindex="-1" role="dialog" aria-labelledby="myLogin" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content modal-popup">
				<a href="#" class="close-link"><i class="icon_close_alt2"></i></a>
				<form action="../St_Login" method="post" class="popup-form" id="myLogin">
					<input type="text" name="uname" class="form-control form-white" placeholder="Enter Username">
					<input type="password" name="pass" class="form-control form-white" placeholder="Enter Password">
					<div class="checkbox-holder text-left">
						<div class="checkbox">
							<input type="checkbox" value="accept_1" id="check_1" name="check_1" />
							<label for="check_1"><span>I Agree to the <strong>Terms &amp; Conditions</strong></span></label>
						</div>
					</div>
					<button type="submit" class="btn btn-submit">Submit</button>
				</form>
			</div>
		</div>
	</div>  
    
<!-- Register modal -->   
<div class="modal fade" id="register" tabindex="-1" role="dialog" aria-labelledby="myRegister" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content modal-popup">
				<a href="#" class="close-link"><i class="icon_close_alt2"></i></a>
				<form action="#" class="popup-form" id="myRegister">
					<input type="text" class="form-control form-white" placeholder="Name">
					<input type="text" class="form-control form-white" placeholder="Last Name">
                    <input type="email" class="form-control form-white" placeholder="Email">
                    <input type="text" class="form-control form-white" placeholder="Password">
					<div class="checkbox-holder text-left">
						<div class="checkbox">
							<input type="checkbox" value="accept_2" id="check_2" name="check_2" />
							<label for="check_2"><span>I Agree to the <strong>Terms &amp; Conditions</strong></span></label>
						</div>
					</div>
					<button type="submit" class="btn btn-submit">Register</button>
				</form>
			</div>
		</div>
	</div>
    
<!-- Search modal -->   
<div id="search">
    <button type="button" class="close">�</button>
    <form>
        <input type="search" value="" placeholder="type keyword(s) here" >
        <button type="submit" class="button">Search</button>
    </form>
</div>

<!-- Common scripts -->
<script src="js/jquery-1.11.2.min.js"></script>
<script src="js/common_scripts_min.js"></script>
<script src="js/functions.js"></script>
<script src="assets/validate.js"></script>

<!-- GOOGLE map -->
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
<script type="text/javascript" src="js/mapmarker.jquery.js"></script>
<script type="text/javascript" src="js/mapmarker_func.jquery.js"></script>

<!-- Date and time pickers -->
<script src="js/bootstrap-datepicker.js"></script>
<script src="js/bootstrap-timepicker.js"></script>
<script>
  $('input.date-pick').datepicker();
  $('input.time-pick').timepicker({
    minuteStep: 15,
    showInpunts: false
})
</script>
</body>
</html>