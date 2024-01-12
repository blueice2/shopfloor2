


  
<!-- /*
* Bootstrap 5
* Template Name: Furni
* Template Author: Untree.co
* Template URI: https://untree.co/
* License: https://creativecommons.org/licenses/by/3.0/
*/ -->
<!doctype html>
<html lang="en">
<script src="https://www.gstatic.com/charts/loader.js"></script>


<!-- Styles -->
<style>
#chartdiv {
  width: 100%;
  height: 500px;
}

</style>


<!-- Resources -->
<script src="https://cdn.amcharts.com/lib/4/core.js"></script>
<script src="https://cdn.amcharts.com/lib/4/charts.js"></script>
<script src="https://cdn.amcharts.com/lib/4/themes/animated.js"></script>



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
		<title> Store Enhancer </title>
	
		
	</head>
	
 
   <script type="text/javascript"> 
        function preventBack() { 
            window.history.forward();  
        } 
          
        setTimeout("preventBack()", 0); 
          
        window.onunload = function () { null }; 
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
								<h1>Search Core Press Report</h1>
							</div>
						</div>
						<div class="col-lg-7">
							
						</div>
					</div>
				</div>
			</div>
		<!-- End Hero Section -->
		
		
		
	
	  <%@page import="java.util.*" %>



<% 
	String user_name =  (String)session.getAttribute("user_name");
	String user_password = (String)session.getAttribute("password");
	
	
	
	out.println( "Hello user: "+user_name  ); 
	
	Cookie firstName = new Cookie("username", user_name  );
	 firstName.setMaxAge(60*60*24); 
	 response.addCookie( firstName );
	 
	
	if( user_name  != null){
	  
	    
	
	  
	 
	
%>
	
	 
              
                    

  <%@page import="java.sql.*" %>
  <% 
  
  int rowCount = 0; 
  double start_finished = 0;
  double wiper_changed = 0;
  double foil_changed = 0;
  double feeder_adjustmented = 0;
  double mech_breakdowned = 0;
  double elect_breakdowned = 0;
  
  // To connect to the database
  
  // Load postgresql Driver. The jar file was downloaded and placed in the lib folder of tomcat server
  
  try {
  Class.forName("org.postgresql.Driver"); 
  }
  catch(Exception e){out.println( e.getClass().getName()+": "+ e.getMessage() );
    }
  
  // Database logic
  
  String search_date = request.getParameter("search_date");
  String shift  = request.getParameter("shift");  
  String minder = request.getParameter("minder");  
  String search_date1 = request.getParameter("search_date1");
  String search_date2 = request.getParameter("search_date2"); 
  String mach = request.getParameter("mach");  
  String search_date3 = request.getParameter("search_date3");
  String search_date4 = request.getParameter("search_date4"); 
  String search_date10 = request.getParameter("search_date10"); 
  
  
    
    String query1 = "";
    
    if(null != request.getParameter("button_a_clicked")){  

		out.println("<br/>You searched for minder: "+ minder +" and search dates is between: "+search_date1 +" and "+search_date2  );
		
		
		 }
		 
   else if(null != request.getParameter("button_b_clicked")){  

		out.println("<br/>You searched for wiper: "+ mach +" and search dates is between: "+search_date3 +" and "+search_date4  );
		
		
		 }		 
    
    else if( search_date == null ){
			query1 = " select distinct on (machine_type) * from wiper_preparation    order by machine_type , id DESC LIMIT 30 ";
    }
    
    else{
    
    

    query1 = " select distinct on (machine) * from history_production where device_date= ? and  shift = ? order by machine, id DESC";
    }
    

    Connection c = null;
    Statement stmt = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
    
    	
    
      try {
         Class.forName("org.postgresql.Driver");
         c = DriverManager.getConnection("jdbc:postgresql://localhost:5432/store", "postgres", "raspberry");
         
         
	 preparedStatement = c.prepareStatement(query1);
	 
	 //Searching by minder's name takes precedence over searching by date
	 
	 if(null != request.getParameter("button_a_clicked")){ 
		 
		 String minder_name = "%"+ minder +"%";
		 query1 = "select * from wiper_preparation where TO_DATE(date, 'YYYY-MM-DD')  between  TO_DATE(?, 'YYYY-MM-DD')   AND  TO_DATE(?, 'YYYY-MM-DD') AND minder ilike ?  ";
		 
		 preparedStatement = c.prepareStatement(query1);
		 
		 preparedStatement.setString(1, search_date1 );
		 preparedStatement.setString(2, search_date2 );
		 preparedStatement.setString(3, minder_name);
		 
		  }
		  
		  // Next is searching by wiper
		   else if(null != request.getParameter("button_b_clicked")){ 
			   
			   String machine_name = "%"+ mach +"%";
			   
			   
			  // query1 = " select wiper_number,   sum(cast ( output AS DOUBLE PRECISION)) as  output from wiper_return where TO_DATE(device_date, 'YYYY-MM-DD')  between  TO_DATE(?, 'YYYY-MM-DD')   AND  TO_DATE(?, 'YYYY-MM-DD') AND machine ilike ? group by machine ";
			  
				query1 = " select  wiper_number , sum(cast ( output AS DOUBLE PRECISION)) as  output from wiper_return where TO_DATE(date_fitted, 'YYYY-MM-DD')  between  TO_DATE(?, 'YYYY-MM-DD')   AND  TO_DATE(?, 'YYYY-MM-DD') AND wiper_number ilike ? group by  wiper_number";
			  
			   preparedStatement = c.prepareStatement(query1);
			   preparedStatement.setString(1, search_date3 );
			   preparedStatement.setString(2, search_date4 );
			   preparedStatement.setString(3, machine_name );
			   
			   }
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 // Search by Date
	else  if( search_date != null){
		
	query1 = " select distinct on (machine_type) * from wiper_preparation where TO_DATE(date, 'YYYY-MM-DD')  between  TO_DATE(?, 'YYYY-MM-DD')   AND  TO_DATE(?, 'YYYY-MM-DD')   order by machine_type, id DESC";
	
	
	  
	preparedStatement = c.prepareStatement(query1);	
	preparedStatement.setString(1, search_date );  
	preparedStatement.setString(2, search_date10);
	 
	
       }
	
	 //String sql = query1 ;
	 
	resultSet = preparedStatement.executeQuery();
	
		
	out.println("  <div class=\"untree_co-section before-footer-section\"> <div class=\"container\"> ");
	out.println(" <div class=\"container\"> ");
	
             out.println("  <div class=\"row mb-5\"> ");
              //out.println("   <form class=\"col-md-12\" method=\"post\"  action=\"remove.jsp\"  onsubmit=\"return validateform()\" >");
	      
	      
                 out.println("  <div class=\"site-blocks-table\"> ");
                 
                 
                 // Table starts here
                 
                 //Table for wiper search
                 
                 if(null != request.getParameter("button_b_clicked")){
					 
					   out.println("  <h2>Wiper Output Over a Period of Time </h2>");
					 
					               out.println("   <table class=\"table\"> ");
                     out.println("  <thead> ");
                     out.println("    <tr> ");
                        out.println("   <th class=\"product-thumbnail\">Image</th> ");
                        
						out.println("   <th class=\"product-quantity\">Wiper Number</th> ");
                        out.println("   <th class=\"product-quantity\">Output</th> ");
                     

                      out.println("   </tr> ");
                    out.println("   </thead> ");

		      out.println(" <tbody> ");


	ArrayList aList=new ArrayList();   
	
	  
	 
	  while (resultSet.next()) {
	    
	   rowCount++;
	
	   String partnumner = "as";

	    
	    
                   out.println("      <tr>  ");
		
		
		   
               out.println("            <td class=\"product-thumbnail\">  ");
	        out.println("       <img src=\"images/product-1.png\" alt=\"Image\" class=\"img-fluid\">  ");
                      out.println("     </td>  ");
                     
         
        out.println(" 	  <td>" +resultSet.getString("wiper_number")  + " </td>  ");             
		out.println(" 	  <td>" +resultSet.getString("output")  + " </td>  ");                  
		
	
		out.println("      </tr>  ");
		  
		  
	
	    
	  } // end of while button_b clicked
	  
	  out.println(" </tbody>  ");
	  
	  out.println("  </table> ");
	  
	  out.println("  </div>");
	 
	  out.println("    </div> ");
	  
	  

	  

      
	  if(rowCount == 1){
		  out.println("Number of Rows = " + rowCount);
		  
	 out.println(" <div id=\"chartdiv\"></div>");  
 }
 
 
 
					 
					  }// end button_b clicked
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 // For other tables
                 else{
		    
                  out.println("   <table class=\"table\"> ");
                     out.println("  <thead> ");
                     out.println("    <tr> ");
                        out.println("   <th class=\"product-thumbnail\">Image</th> ");
                        out.println("   <th class=\"product-name\">date</th> ");
                        out.println("   <th class=\"product-price\">Size Before Coating</th> ");
                        out.println("   <th class=\"product-quantity\">Size After Coating</th> ");
                         out.println("   <th class=\"product-price\">Machine Type</th> ");
                         out.println("   <th class=\"product-price\">Shore Size</th> ");
                         out.println("   <th class=\"product-price\">Minder</th> ");
                         out.println("  <th class=\"product-total\">Type Of Coating</th> ");
			 out.println("   <th class=\"product-name\">Mixer Name</th> ");
                        out.println("   <th class=\"product-remove\">Wiper Number</th> ");
			 out.println("  <th class=\"product-remove\">Start Time</th> ");
			 out.println("  <th class=\"product-remove\">End Time</th> ");
			
			
			
			
		
			
                      out.println("   </tr> ");
                    out.println("   </thead> ");

		      out.println(" <tbody> ");


	ArrayList aList=new ArrayList();      
	 
	  while (resultSet.next()) {
	    
	    
					out.println("      <tr>  ");
		
		  
		   
					out.println("    <td class=\"product-thumbnail\">  ");
					out.println("    <img src=\"images/product-1.png\" alt=\"Image\" class=\"img-fluid\">  ");
                    out.println("    </td>  ");

                    
                    out.println("     <td> "+resultSet.getString("date") +"</td>  ");
                    out.println("     <td> "+resultSet.getString("size_before_coating") +"</td>  ");
					out.println(" 	  <td>" +resultSet.getString("size_after_coating") + " </td>  ");   
					out.println("     <td> "+resultSet.getString("machine_type") +"</td>  ");
					out.println(" 	  <td>" +resultSet.getString("shore_size") + " </td>  ");  
					
					out.println("     <td> "+resultSet.getString("minder") +"</td>  ");
					out.println(" 	  <td>" +resultSet.getString("type_of_coating") + " </td>  ");   
					out.println("     <td> "+resultSet.getString("mixer_name") +"</td>  ");
					out.println(" 	  <td>" +resultSet.getString("wiper_number") + " </td>  ");   
					out.println("     <td> "+resultSet.getString("start_time") +"</td>  ");
					out.println(" 	  <td>" +resultSet.getString("end_time") + " </td>  "); 
		
				
	    
	  } // end of while
	  
	  out.println(" </tbody>  ");
	  
	  out.println("  </table> ");
	  
	  out.println("  </div>");
	 
	  out.println("    </div> ");
	  
	} // end of else for search by date and shift
         
	 
         preparedStatement.close();
         c.close();
	
      } catch ( Exception e ) {
	out.println( e.getClass().getName()+": "+ e.getMessage() );
         
      }
      
      //End to connect to a database
      
      
 
  %>
  
  <% if(rowCount == 1){  
	  
	  %>
	  
  

	  
	  <!-- Chart code -->
<script>
// armcharts was used

am4core.ready(function() {

// Themes begin
am4core.useTheme(am4themes_animated);
// Themes end

var chart = am4core.create("chartdiv", am4charts.PieChart3D);
chart.hiddenState.properties.opacity = 0; // this creates initial fade-in

chart.legend = new am4charts.Legend();

chart.data = [
  {
    country: "Wiper 1",
    litres: '<%=start_finished%>'
  },
  {
    country: "Wiper 2",
    litres: '<%=wiper_changed%>'
  },
  {
    country: "Wiper 3",
    litres: '<%=foil_changed%>'
  }
];

var series = chart.series.push(new am4charts.PieSeries3D());
series.dataFields.value = "litres";
series.dataFields.category = "country";

}); 
</script>


	  
	  <% } %>
    
      <%@ page import="java.time.LocalDate" %>
      
      <% LocalDate myObj = LocalDate.now(); // Create a date object 
      
      %>
              
        
              <div class="row">
                <div class="col-md-6">
                  
		  <br/> 
		  
		  <form  name="myform"  action="display.jsp" class="row g-3" method="POST"  >
                  <div class="row">
                    <div class="col-md-12">
                      <label class="text-black h4" for="coupon">Search</label>
                      <p>Enter a date to search core press shift report <br/> Note: It will show the last entry per machine </p>
                    </div>
                    <div class="col-md-8 mb-3 mb-md-0">
                    
                    <label class="text-black" for="email">Start Date</label>
                     
		      <input type="date" class="form-control py-3"  id="today"  style="width: 200px;" name="search_date"   value=<% out.println("\""+myObj+"\""); %> > 
		      
		      
		      <label class="text-black" for="email">End Date</label>
		      
		       <input type="date" class="form-control py-3"  id="today"  style="width: 200px;" name="search_date10"   value=<% out.println("\""+myObj+"\""); %> > 
		      

		  
                    </div>
                    <div class="col-md-4">
                      <button class="btn btn-black">Search </button>
                    </div>
                  </div>
		  
		  </form>
		  
		  
		    <br/> <br/>
		    
		  <form  name="myform"  action="display.jsp" class="row g-3" method="POST"  >
                  <div class="row">
                    <div class="col-md-12">
                      <label class="text-black h4" for="coupon">Search for Minder </label>
                      <p>Enter a minder's name</p>
                    </div>
                    <div class="col-md-8 mb-3 mb-md-0">
                     
                      
		      <input type="text" class="form-control py-3"  id="minder"  style="width: 200px;" name="minder"   placeholder = "Minder's name "> 
		      
		      <label class="text-black" for="email">Start Date</label>
		      
		       <input type="date" class="form-control py-3"  id="today"  style="width: 200px;" name="search_date1"   value=<% out.println("\""+myObj+"\""); %> > 
		       
		       <label class="text-black" for="email">End Date</label>
		        <input type="date" class="form-control py-3"  id="today"  style="width: 200px;" name="search_date2"   value=<% out.println("\""+myObj+"\""); %> > 
		      
		      <div class="form-group">
                  

		
		 
                </div>
		  
                    </div>
                    <div class="col-md-4">
                      <button name="button_a_clicked" class="btn btn-black">Search </button>
                    </div>
                  </div>
		  
		  </form>
		  
		  
		  
		 <br/> <br/>
		  		  <form  name="myform"  action="display.jsp" class="row g-3" method="POST"  >
                  <div class="row">
                    <div class="col-md-12">
                      <label class="text-black h4" for="coupon">Search for Wiper's Output Over a Time Range </label>
                      <p>Enter a wiper's name</p>
                    </div>
                    <div class="col-md-8 mb-3 mb-md-0">
                     
                      
		      <input type="text" class="form-control py-3"  id="minder"  style="width: 200px;" name="mach"   placeholder = "Wiper's name "> 
		      
		      <label class="text-black" for="email">Start Date</label>
		      
		       <input type="date" class="form-control py-3"  id="today"  style="width: 200px;" name="search_date3"   value=<% out.println("\""+myObj+"\""); %> > 
		       
		       <label class="text-black" for="email">End Date</label>
		        <input type="date" class="form-control py-3"  id="today"  style="width: 200px;" name="search_date4"   value=<% out.println("\""+myObj+"\""); %> > 
		      
		      <div class="form-group">
                  

		
		 
                </div>
		  
                    </div>
                    <div class="col-md-4">
                      <button name="button_b_clicked" class="btn btn-black">Search </button>
                    </div>
                  </div>
		  
		  </form>
                </div>
		
		
		
		
		
	 
             
             
             
             
                
        
                      
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
		

	

		<script src="js/bootstrap.bundle.min.js"></script>
		<script src="js/tiny-slider.js"></script>
		<script src="js/custom.js"></script>
		
		<% 
		
		  } // End to if username != null 
   
   else{
     out.println( "Please login  " );
     }
		%>
	</body>

</html>

