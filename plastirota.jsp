





<!-- /*
* Bootstrap 5
* Template Name: Furni
* Template Author: Untree.co
* Template URI: https://untree.co/
* License: https://creativecommons.org/licenses/by/3.0/
*/ -->
<%@page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="author" content="Untree.co">
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


	<script>  
	
	function isNumeric(value) { 
      return /^-?\d+(\.\d+)?$/.test(value); 
}


		
function validateform(){  
	
var device_date = document.myform.device_date.value;  
var user_name = document.myform.user_name.value;  
var reams = document.myform.reams.value;  
var sheets = document.myform.sheets.value;   
var lost_hour = document.myform.lost_hour.value; 
var machine = document.myform.machine.value; 
var shift = document.myform.shift.value; 
var report = document.myform.report.value;  
var reason = document.myform.reason.value;  

var shift = document.myform.shift.value;                     
var start_finish = document.myform.start_finish.value; 
var wiper_change = document.myform.wiper_change.value;  
var foil_change = document.myform.foil_change.value;  
var feeder_adjustment = document.myform.feeder_adjustment.value;  
var attended = document.myform.attended.value;  
var mech_breakdown  = document.myform.mech_breakdown.value;  
var elect_breakdown = document.myform.elect_breakdown.value;  
var batch = document.myform.batch.value; 
var minders = document.myform.minders.value; 

// alert(shift +"  start_finish "+ start_finish + " wiper_change "+ wiper_change+ " foil_change "+foil_change+ "feeder_adjustment  "+feeder_adjustment+" attended "+ attended+" mech_breakdown "+mech_breakdown+" elect_breakdown " +elect_breakdown+ " minders "+minders);



// selectElement = document.querySelector('#select1');
       // output = selectElement.value;
 
if (report==null || device_date==""){  
  alert("Device date can't be blank");  
  return false;  
}

else if(report==null || report == ""){  
  alert("Report can't be blank");  
  return false;  
  }  
  
  else if(reason ==null || reason == ""){  
  alert("Reason can't be blank ");  
  return false;  
  }
  
    else if(start_finish ==null || start_finish == "" || !isNumeric(start_finish)){  
  alert("Start and finish must be a number in format 3.14!!! ");  
  return false;  
  } 
  
      else if(wiper_change ==null || wiper_change == "" || !isNumeric(wiper_change)){  
  alert("Wiper change must be a number in format 3.14!!! ");  
  return false;  
  } 

      else if(foil_change ==null || foil_change == "" || !isNumeric(foil_change)){  
  alert("Foil change must be a number in format 3.14!!! ");  
  return false;  
  } 
  
      else if(feeder_adjustment ==null || feeder_adjustment == "" || !isNumeric(feeder_adjustment)){  
  alert("Feeder adjustment must be a number in format 3.14!!! ");  
  return false;  
  } 
  
      else if(attended ==null || attended == "" || !isNumeric(attended)){  
  alert("Attended must be a number in format 3.14!!! ");  
  return false;  
  } 
  
      else if(mech_breakdown  ==null || mech_breakdown  == "" || !isNumeric(mech_breakdown )){  
  alert("Mech breakdown must be a number in format 3.14!!! ");  
  return false;  
  } 
  
      else if(elect_breakdown == null || elect_breakdown == "" || !isNumeric(elect_breakdown)){  
  alert("Elect breakdown must be a number in format 3.14!!! ");  
  return false;  
  }    
  
        else if(batch == null || batch == "" ){  
  alert("Batch can't be blank ");  
  return false;  
  }     
  
  
          else if(minders == null || minders == "" ){  
  alert("Minders can't be blank ");  
  return false;  
  } 
  
  
  
   // Confirm before submitting
   
   if (confirm("Do you really want to save !")) {
 return true;
} else {
  return false;
}




}  

</script> 



<script>

// To change date to previous day if night shift is selected

function myFunction() {
  var shift = document.getElementById("shift").value;
  
   
  if(shift == "night_shift"){
    
   
    var dateObj = new Date();
    
    dateObj.setDate(dateObj.getDate() - 1);
   
  
  document.getElementById("demo").innerHTML = "You selected: " + shift;
  
 const months = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"];
let month = months[dateObj.getMonth()];

 const days = ["01", "02", "03", "04", "05", "06", "07",  "08", "09", "10", "11", "12", "13", "14",  "15", "16", "17", "18", "19", "20", "21",  "22", "23", "24", "25", "26", "27", "28", "29", "30", "31"];


  let dayddd =  days[ dateObj.getDate() - 1];
 
 
 
  let date_night = dateObj.getFullYear()+"-"+  month + "-"+ dayddd ;
    
    document.getElementById("device_date").value = date_night;
    
     alert("You have selected "+ shift + " , the date will change to the previous day "+ " date: "+date_night);
 
  } 
  
  
  
  else{
    
    var dateObj = new Date();
    
       document.getElementById("demo").innerHTML = "You selected: " + shift;
       
 const months = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"];
let month = months[dateObj.getMonth()];

 const days = ["01", "02", "03", "04", "05", "06", "07",  "08", "09", "10", "11", "12", "13", "14",  "15", "16", "17", "18", "19", "20", "21",  "22", "23", "24", "25", "26", "27", "28", "29", "30", "31"];

   let dayddd =  days[ dateObj.getDate() - 1 ]; // You subtract here becuse array days starts from zero
   
   let date_night = dateObj.getFullYear()+"-"+  month + "-"+ dayddd ;
    
    document.getElementById("device_date").value = date_night;
    
     alert("You have selected "+ shift + " , the date will change to the current day "+ " date: "+date_night);
    
    
    }
  
}

</script>



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
								<h1>Plastirota</h1>
								<p class="mb-4">Plastirota Wiper Preparation</p>
								
							</div>
						</div>
						<div class="col-lg-7">
							<div class="hero-img-wrap">
								<img src="images/couch.png" class="img-fluid">
							</div>
						</div>
					</div>
				</div>
			</div>
		<!-- End Hero Section -->

		
		<!-- Start Contact Form -->
		<div class="untree_co-section">
      <div class="container">

        <div class="block">
          <div class="row justify-content-center">


            <div class="col-md-8 col-lg-8 pb-4">


              <div class="row mb-5">
                <div class="col-lg-4">
                  <div  class="service no-shadow align-items-center link horizontal d-flex active" data-aos="fade-left" data-aos-delay="0">
                    <div class="service-icon color-1 mb-4">
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo-alt-fill" viewBox="0 0 16 16">
                        <path d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 1 0-6 3 3 0 0 1 0 6z"/>
                      </svg>
                    </div> <!-- /.icon -->
                    <div class="service-contents">
                      <p>New Line Currency</p>
                    </div> <!-- /.service-contents-->
                  </div> <!-- /.service -->
                </div>

                <div class="col-lg-4">
                  <div  class="service no-shadow align-items-center link horizontal d-flex active" data-aos="fade-left" data-aos-delay="0">
                    <div class="service-icon color-1 mb-4">
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-envelope-fill" viewBox="0 0 16 16">
                        <path d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414.05 3.555zM0 4.697v7.104l5.803-3.558L0 4.697zM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586l-1.239-.757zm3.436-.586L16 11.801V4.697l-5.803 3.546z"/>
                      </svg>
                    </div> <!-- /.icon -->
                    <div class="service-contents">
                      <p>placevalue</p>
                    </div> <!-- /.service-contents-->
                  </div> <!-- /.service -->
                </div>

                <div class="col-lg-4">
                  <div  class="service no-shadow align-items-center link horizontal d-flex active" data-aos="fade-left" data-aos-delay="0">
                    <div class="service-icon color-1 mb-4">
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-telephone-fill" viewBox="0 0 16 16">
                        <path fill-rule="evenodd" d="M1.885.511a1.745 1.745 0 0 1 2.61.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z"/>
                      </svg>
                    </div> <!-- /.icon -->
                    <div class="service-contents">
                      <p>Departmental Phone Number</p>
                    </div> <!-- /.service-contents-->
                  </div> <!-- /.service -->
                </div>
              </div>
	      
	      


  <% 
    
	out.println("  Your IP address is " + request.getRemoteAddr() +" and today's date is: " +  (new java.util.Date()).toLocaleString() );
	
	
	String shop_user_name = request.getParameter("user_name");
	String shop_user_password = request.getParameter("password");
	
	
	if ( shop_user_name == null ) {
	 shop_user_name = (String)session.getAttribute("user_name");
	 shop_user_password = (String)session.getAttribute("password");
	 
	
	  }
	
	else {
	  
	session.setAttribute("user_name",shop_user_name );
	session.setAttribute("password",shop_user_password );
	
	  }
	  
	//Global variable to store supplied login username and password from shop
	//String shop_user_name = request.getParameter("user_name");
	//String shop_user_password = request.getParameter("password");
	
	
	String user_namesd = "user_name";
	
	//session.setAttribute("user_name",shop_user_name );
	user_namesd = (String)session.getAttribute("user_name");
	
	
	
	
	
	
	
	
	
	//Global variables to store entry from database
	String contact_user_name = "";
	String contact_password = "";
	boolean contact_store_A = false;
	boolean contact_store_B = false;
	boolean contact_store_C = false;
	boolean contact_store_D = false;
	String department= "";
	
	
	
	
	
    
  %>
  
  
  
 
  
  <%@page import="java.sql.*" %>
  <% 
  // To connect to the database
  
  // Load postgresql Driver. The jar file was downloaded and placed in the lib folder of tomcat server
  
  try {
  Class.forName("org.postgresql.Driver"); 
  }
  catch(Exception e){out.println( e.getClass().getName()+": "+ e.getMessage() );
    }
  
  // Database logic
   String query1 = " select * from username where username = ?";

    Connection c = null;
    Statement stmt = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
    
    	
    
      try {
         Class.forName("org.postgresql.Driver");
         c = DriverManager.getConnection(" ");
         
         
	 preparedStatement = c.prepareStatement(query1);
	  preparedStatement.setString(1, shop_user_name);
         
	
	 String sql = query1 ;
	 
	resultSet = preparedStatement.executeQuery();
	 
	  while (resultSet.next()) {
	    
	    contact_user_name = resultSet.getString("username") ;
	    contact_password =  resultSet.getString("password");
	    contact_store_A =   resultSet.getBoolean("storea");
	    contact_store_B =   resultSet.getBoolean("storeb");
	    contact_store_C =   resultSet.getBoolean("storec");
	    contact_store_D =   resultSet.getBoolean("stored");
	    department = resultSet.getString("department") ;
	    
	    
	  }
	  
	   
         
	 
         preparedStatement.close();
         c.close();
	
      } catch ( Exception e ) {
	out.println( e.getClass().getName()+": "+ e.getMessage() );
         
      }
      
      //End to connect to a database
      
  
  %>
  
  <%@ page import="java.time.LocalDate" %>
   <%@ page import="java.time.LocalTime" %>
  
  
 <%  
  

   if( contact_user_name.equals( shop_user_name)  && contact_password.equals( shop_user_password)     &&    department.equals( "production_plastirota")        ){ 
   
   
   //if( contact_user_name.equals( shop_user_name)  && contact_password.equals( shop_user_password)        ){ 
   
    
    out.println("<br> Hello " +contact_user_name + "<br>"  );
    
   LocalDate myObj = LocalDate.now(); // Create a date object
   LocalTime time = LocalTime.now();  
   //time = time.plusHours(7);
   int Hour = time.getHour();
   
   int morning_shift_begin = 5;  
  
   int morning_shift_end = 17; 
   
   int afternoon_shift_begin = 14;
   int afternoon_shift_end = 22;
   
   int night_shift_begin = 0; 
 
   int night_shift_end = 9;
   
  
   

   
 
    
     %>
  
  
  <BR>



              <form  name="myform"  action="obodo.jsp"  class="row g-3" method="POST"  onsubmit="return validateform()">
                <div class="row">
                  <div class="col-6">
                    <div class="form-group">
                      <label class="text-black" for="fname">Date</label>
                      <input type="date" class="form-control"  name="device_date" id="device_date"  readonly  value=<% out.println("\""+myObj+"\"");   %>   >
                      
         


                      
                    </div>
                  </div>
                  <div class="col-6">
                    <div class="form-group">
                      <label class="text-black" for="lname">Size Before Coating</label>
                      <input type="text" class="form-control"  name="size_before_coating"   >
		      
		      <label class="text-black" for="lname">Size After Coating</label>
                      <input type="text" class="form-control"  name="size_after_coating"  >
                    </div>
		  
		    

		    
                  </div>
                </div>
                <div class="form-group">
                  <label class="text-black" for="email">Machine Type</label>
 
		    <select name="machine_type"    class="form-control"> 
		    
		<option value="komori">Komori</option> 
		    <option value="kba">KBA </option>
		    
		    </select>
                </div>
		
		
		  <div class="form-group">
                      <label class="text-black" for="lname">Output</label>
                      <input type="text" class="form-control"  name="shore_size" placeholder= "Shore Size">
                      <input type="text" class="form-control"  name="minder" placeholder= "Coating Minder" >
		      <input type="text" class="form-control"  name="mixer" placeholder= "Mixer" >
		      <input type="text" class="form-control"  name="start_time" placeholder= "Start Time" >
		      <input type="text" class="form-control"  name="end_time" placeholder= "End Time" >
                    </div>
		    
		    <br/> <br/>
		    
		     <div class="form-group">
                  <label class="text-black" for="email">Type of Coating</label>
 
		    <select name="type_of_coating"    class="form-control"> 
		    
		<option value="finish">Finish</option> 
		    <option value="hardlayer">Hard layer </option>
		    <option value="inking">Inking</option>
		    
		    </select>
                </div>
		    
		    <div class="form-group">
                  <label class="text-black" for="email">Wiper Number</label>
 
		    <select name="wiper_number"    class="form-control"> 
		    
		<option value="01">01</option> 
		    <option value="02">02 </option>
		    <option value="03">03</option>
		    
		    </select>
                </div>
		    
		    
		 <div class="form-group">
                  <label class="text-black" for="email">Shift</label>

		
		    <select name="shift"  id="shift"  class="form-control" onchange="myFunction()" > 
		    
		   <% if( Hour >= morning_shift_begin && Hour <= morning_shift_end ){ %>
				
		    <option value="morning_shift">Morning Shift </option> 
		    
		<% } %>
		
		
		 <% if( Hour >= afternoon_shift_begin  && Hour <= afternoon_shift_end ){ %>
			 
		    <option value="afternoon_shift">Afternoon Shift</option> 
		    
		    <% } %>
		    
		    <% if( Hour >= night_shift_begin && Hour <= night_shift_end ){ %>
				
		    <option value="night_shift">Night Shift</option> 
		    
		    <% } %>
		    
		   
		    </select>
                </div>   
		    
		
		
		
		<p id="demo"></p>
		
	
                <div class="form-group mb-5">
                  <label class="text-black" for="message">Report</label>
                  <textarea name="report" class="form-control" id="message" cols="30" rows="5"></textarea>
                </div>
           

                <button type="submit" class="btn btn-primary-hover-outline">Save Wiper Preparation Data</button>
              </form>

            </div>

          </div>

        </div>

      </div>


    </div>
  </div>

  <!-- End Contact Form -->

	<% }
	
	
	
  
	
	// Unable to decide on what to do, redirect to login page
	else if( contact_user_name.equals( shop_user_name)  && contact_password.equals( shop_user_password)   ){
	  
	
	  
	  // New location to be redirected
         String site = new String("http://15.45.21.246:8080/fumi/");
         response.setStatus(response.SC_MOVED_TEMPORARILY);
         response.setHeader("Location", site); 
	  
	  }
	
	else{ out.println("<br> Seems your login credentials are wrong, you can try again." ); }
	
	 %>	

	

		<script src="js/bootstrap.bundle.min.js"></script>
		<script src="js/tiny-slider.js"></script>
		<script src="js/custom.js"></script>
	</body>

</html>
