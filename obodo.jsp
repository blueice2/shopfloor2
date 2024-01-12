



<!-- /*
* Bootstrap 5
* Template Name: Furni
* Template Author: Untree.co
* Template URI: https://untree.co/
* License: https://creativecommons.org/licenses/by/3.0/
*/ -->

<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="author" content="Nnamdi Chibueze">
  <link rel="shortcut icon" href="favicon.png">

  <meta name="description" content="" />
  <meta name="keywords" content="bootstrap, bootstrap4" />

		<!-- Bootstrap CSS -->
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
		<link href="css/tiny-slider.css" rel="stylesheet">
		<link href="css/style.css" rel="stylesheet">
		<title>Store Enhancer</title>
		
		<script type="text/javascript"> 
        function preventBack() { 
            window.history.forward();  
        } 
          
        setTimeout("preventBack()", 0); 
          
        window.onunload = function () { null }; 
    </script>
    
		
	</head>
	


	<body>
		




		<!-- Start Header/Navigation -->
		<nav class="custom-navbar navbar navbar navbar-expand-md navbar-dark bg-dark" arial-label="Furni navigation bar">

			<div class="container">
				<a class="navbar-brand" href="index.html">Store Enhancer<span>.</span></a>

				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsFurni" aria-controls="navbarsFurni" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarsFurni">
				
					<ul class="custom-navbar-nav navbar-nav ms-auto mb-2 mb-md-0">
					
								<li class="nav-item active">
							<a class="nav-link" href="index.html">Home</a>
						</li>
						<li><a class="nav-link" href="shop.html">Log-In</a></li> 
						<li><a class="nav-link" href="plastirota.jsp">Wiper Preparation</a></li>
						<li><a class="nav-link" href="plastirota2.jsp">Wiper Return</a></li>
						<li><a class="nav-link" href="display.jsp">Display</a></li>
						
					</ul>

					<ul class="custom-navbar-cta navbar-nav mb-2 mb-md-0 ms-5">
						<li><a class="nav-link" href="#"><img src="images/user.svg"></a></li>
						<li><a class="nav-link" href="cart.html"><img src="images/cart.svg"></a></li>
					</ul>
				</div>
			</div>
				
		</nav>
		<!-- End Header/Navigation -->

		<!-- Start Hero Section -->
			<div class="hero">
				<div class="container">
					<div class="row justify-content-between">
						<div class="col-lg-5">
							<div class="intro-excerpt">
								<h1>Core Press Shift Report</h1>
							</div>
						</div>
						<div class="col-lg-7">
							
						</div>
					</div>
				</div>
			</div>
		<!-- End Hero Section -->

		


		<!-- Start Footer Section -->
		<footer class="footer-section">
			<div class="container relative">

				<div class="sofa-img">
					<img src="images/sofa.png" alt="Image" class="img-fluid">
				</div>

				<div class="row">
					<div class="col-lg-8">
						<div class="subscription-form">
							<h3 class="d-flex align-items-center"><span class="me-1"><img src="images/envelope-outline.svg" alt="Image" class="img-fluid"></span><span>Values Entered </span></h3>
					 
					  <%@page import="java.sql.*" %>		
					  <%@page import="java.time.*" %>
 
 
     <% 
     String user_name =  (String)session.getAttribute("user_name");
	
	out.println( "user name: "+user_name );
	
	
	
     String device_date= request.getParameter("device_date");
     String userd = request.getParameter("user_name"); 
     
     LocalDate dated = LocalDate.now(); // Create a date object
     LocalTime timed = LocalTime.now(); // Create a time object
     
	
	 
	 
String device_dates = "N/A";    							
if(request.getParameter("device_date") != null){
    device_dates= request.getParameter("device_date"); }

String user_names = "N/A";  
if(request.getParameter("user_name") != null){
    user_names= request.getParameter("user_name"); }
    
String size_before_coating ="";  
if(request.getParameter("size_before_coating") != null){
    size_before_coating = request.getParameter("size_before_coating"); }
    
String size_after_coating = "";  
if(request.getParameter("size_after_coating") != null){
    size_after_coating = request.getParameter("size_after_coating"); }
  

String machine_type ="";
if(request.getParameter("machine_type") != null){						
    machine_type= request.getParameter("machine_type"); }
    
    
    

    
    
String shore_size = "N/A";
if(request.getParameter("shore_size") != null){
   shore_size = request.getParameter("shore_size"); }

String minder = "N/A";
if(request.getParameter("minder") != null){
    minder= "Minder is : "+ request.getParameter("minder")+ " and logged in as "+user_name; }

String mixer = "N/A";  
if(request.getParameter("mixer") != null){
     mixer = request.getParameter("mixer"); }

String type_of_coating = "N/A";  
if(request.getParameter("type_of_coating") != null){
    type_of_coating= request.getParameter("type_of_coating"); }

                
String wiper_number = "0"; 
if(request.getParameter("wiper_number") != null){
    wiper_number= request.getParameter("wiper_number"); }

String shift = "N/A";
if(request.getParameter("shift") != null){
    shift = request.getParameter("shift"); }

String report = "N/A"; 
if(request.getParameter("report") != null){
   report= request.getParameter("report"); }




String start_time = "N/A";
if(request.getParameter("start_time") != null){
   start_time = request.getParameter("start_time"); }

String end_time = "N/A"; 
if(request.getParameter("end_time") != null){
   end_time = request.getParameter("end_time"); }

   
     
   
     
     
  // Save into database
  
  
   // To connect to the database
  
  // Load postgresql Driver. The jar file was downloaded and placed in the lib folder of tomcat server
  
  try {
  Class.forName("org.postgresql.Driver"); 
  }
  catch(Exception e){out.println( e.getClass().getName()+": "+ e.getMessage() );
    }
  
  // Database logic
   String query1 = "insert into wiper_preparation (  date, size_before_coating, size_after_coating,  machine_type, shore_size, minder, type_of_coating , mixer_name, wiper_number, start_time ,  end_time ) values ( ?,?,?,?,?,?,?,?,? , ?,? ) ";

                                                                                                                                                                                                                                            
	     
	                                                                                                                                                                                                                               



    Connection c = null;
    Statement stmt = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
    long id = 0;
    
    	
    
      try {
         Class.forName("org.postgresql.Driver");
         c = DriverManager.getConnection(" ");
         
         out.println("<br/> Connected to DB successfully <br/>");
	  preparedStatement = c.prepareStatement(query1);
	  preparedStatement.setString(1,device_dates);
	  preparedStatement.setString(2, size_before_coating );
	  preparedStatement.setString(3, size_after_coating );
	  preparedStatement.setString(4, machine_type );
	  preparedStatement.setString(5, shore_size  );
	  preparedStatement.setString(6, minder );
	  preparedStatement.setString(7, type_of_coating);    
	  preparedStatement.setString(8, mixer );
	 preparedStatement.setString(9, wiper_number );
	 
	  preparedStatement.setString(10, start_time);
	  preparedStatement.setString(11, end_time);
	
	 
	 int affectedRows = preparedStatement.executeUpdate();
	 
	 
	 
	  if (affectedRows > 0) {
                // get the ID back
                try (ResultSet rs =  preparedStatement.getGeneratedKeys()) {
                    if (rs.next()) {
                        id = rs.getLong(1);
                    }
                } catch (SQLException ex) {
                    System.out.println(ex.getMessage());
                }
            }
	  
	  
	  
	  
	 
      
      
	   
         preparedStatement.close();
         c.close();
	
      } catch ( Exception e ) {
	out.println( "Error "+ e.getClass().getName()+": "+ e.getMessage() );
         
      }
      
        //End to connect to a database
	
     %>


						</div>
					</div>
				</div>

				

					


						</div>
					</div>

				</div>

				

			</div>
		</footer>
		<!-- End Footer Section -->	


		<script src="js/bootstrap.bundle.min.js"></script>
		<script src="js/tiny-slider.js"></script>
		<script src="js/custom.js"></script>
	</body>

</html>


