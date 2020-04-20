<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="<c:url value="/static/theme/bootstrap.min.css" /> " rel="stylesheet">  
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
 
 <link href="<c:url value="/static/theme/font-awesome470.css" /> " rel="stylesheet">
  <script src="<c:url value="/static/theme/jquery311.js" />" > </script> 
   <script src="<c:url value="/static/theme/popper114.js" />" > </script>
<script src="<c:url value="/static/theme/bootstrap.min.js" />" > </script>
 <link href="<c:url value="/static/theme/test.css" /> " rel="stylesheet">
<link href="<c:url value="/static/theme/sidebarstyle.css" /> " rel="stylesheet">
<link href="<c:url value="/static/theme/tabstyle.css" /> " rel="stylesheet">
<script src="<c:url value="/static/theme/test.js" />" > </script>
<script src="<c:url value="/static/theme/imgslider.js" />" > </script>
<link href="<c:url value="/static/theme/stylefont.css" /> " rel="stylesheet">
<script src="<c:url value="/static/theme/cyclepl.js" />" > </script>
<script src="<c:url value="/static/theme/tabjs.js" />" > </script>

  
</head>
 
<body>
<script type="text/javascript">

			
$(document).ready(function(){

	  $('#pic1').mouseover(function(){
	
		$('#pic2').fadeOut('slow').fadeIn()	;
		$('#pic3').fadeOut('slow').fadeIn();

		
	});
	  
	

	  $("#btn").click(function(){
	  $("#sidebar").toggleClass('active');
	  
	  });
	  
	  
	$('#pic2').mouseover(function(){
		
		$('#pic1').fadeOut('slow').fadeIn('slow')	;
		$('#pic3').fadeOut('slow').fadeIn('slow');
		
		
	});
	
	$('#pic3').mouseover(function(){
		
		$('#pic1').fadeOut('slow').fadeIn('slow')	;
		$('#pic2').fadeOut('slow').fadeIn('slow');
		
		
	});

$('#down').mouseover(function(){
		
		$('#app').slideDown('slow');
		
		
	});
$('#see').mouseover(function(){
	
	$('#app').slideUp('slow');
		
});
$('#find').mouseover(function(){
	
	$('#find').css("background-color","gray");
	$('#find').animate({right:'200px'},"slow");

});


});
</script>

<div id="sidebar">

	<div class="toggle-btn" id="btn">
		<span></span>
		<span></span>
		<span></span>
	</div>
<ul>
	<li><a href="${pageContext.request.contextPath}/choice?operation=studentlogin" class="btn btn-primary btn-md">FIND  DOCTOR</a></li>
	<li><a href="${pageContext.request.contextPath}/choice?operation=report"  class="btn btn-primary btn-md">REPORT A PROBLEM</a></li>
	<li><a href="${pageContext.request.contextPath}/choice?operation=contacts"  class="btn btn-primary btn-md">CONTACT</a></li>
	<li><a href="${pageContext.request.contextPath}/choice?operation=aboutus" class="btn btn-primary btn-md">ABOUT HOSPITAL</a></li>
	<li><a href="${pageContext.request.contextPath}/choice?operation=findAjob" class="btn btn-primary btn-md">JOIN WITH US</a></li>
</ul>
</div>
<div class="container" style="background-color:LightCyan;">
<nav class="navbar">
	<div class="container-fluid" >
<div class="navbar-header" colo>
<a href="#"><i class="fa  fa-twitter fa-3x"></i> HOSPITAL twitter</a>
</div>
	<li class="active" ><a href="https://www.facebook.com/"><i class="fa  fa-facebook-official fa-3x"></i>Follow US facebook</a></li>
  <li class="active" ><a href="${pageContext.request.contextPath}/choice?operation=contacts"><i class="fa  fa-phone fa-3x"></i>Contact</a></li>
  <li class="active" ><a href=""><i class="fa fa-envelope-o fa-3x"></i>WebMail</a></li>

</div>
</nav>
</div>
<div id="heading" align="center">
<div align="center" style="background-color:maroon;">

<h1><p style="color:white;"> <img class="plogo" src="<c:url value="static/theme/logohos4.jpg" />"/> WELCOME TO OUR</p></h1>
<h1> <p style="color:white;">HOSPITAL MANAGEMENT SYSTEM</p></h1>
</div>

<div  id="tab" class="row">
<div class="col-md"><button   class="tablinks"  onClick="openCity(event, 'find')"><span class="btn btn-info ">FIND A DOCTOR</span></button></div>
<div class="col-md">  <button  class="tablinks" onClick="openCity(event, 'contact')"><span class="btn btn-info ">DOCTOR PORTAL</span></button></div>
<div class="col-md">  <button  class="tablinks"  onClick="openCity(event, 'about')"><span class="btn btn-info ">BLOOD BLANK</span></button></div>
<div class="col-md"> <button   class="tablinks"  onClick="openCity(event, 'technician')"><span class="btn btn-info ">LAB TECHNITIAN</span></button></div>
<div class="col-md">  <button  class="tablinks" onClick="openCity(event, 'job')"><span class="btn btn-info ">APPOINTMENT</span></button></div>
</div>
<!-- Tab content -->

<div id="find" class="tabcontent" align="center" >
  <h3>FIND A DOCTOR</h3>
   <a href="${pageContext.request.contextPath}/choice?operation=studentlogin" class="btn btn-primary btn-lg">CLICK HERE</a>
  <p>SEARCH FOR A NEW JOB .START A NEW JOB IN THIS HOSPITAL</p>
</div>


<div id="contact" class="tabcontent" align="center">
  <h3>DOCTORS PORTAL</h3>
   <a href="${pageContext.request.contextPath}/choice?operation=doctorlogin" class="btn btn-primary btn-lg">CLICK HERE</a>
  <p>CONTACT TO OUR ADMIN FOR ANY PROBLM OR REPORTING ISSUE ABOUT US</p> 
</div>


<div id="about" class="tabcontent" align="center" >
  <h3>Find Blood Or Donate Blood . Fill Up A form and post you opinion with date</h3>
  <a href="${pageContext.request.contextPath}/choice?operation=blooddonation" class="btn btn-success btn-lg">CLICK HERE</a>
  <p >Fill Up A form and post you opinion with date</p>
</div>

<div id="technician" class="tabcontent" align="center" >
  <h3></h3>
   <a href="${pageContext.request.contextPath}/choice?operation=technician" class="btn btn-primary btn-lg">CLICK HERE</a>
  <p >RECORD OF ALLKIND OF TEST REPORT ACCRODING TO PATIENT ID.</p> 
</div>
<div id="job" class="tabcontent" align="center" >
  <h3>GET A APPOINTMENT </h3>
  <a href="${pageContext.request.contextPath}/searchdoc2" class="btn btn-primary btn-lg">CLICK HERE</a>
  <p >WE PROVIDE SUPPORT FOR YOU. CONTACT WITH US </p>
</div>

<div class="continer">
	<div id="slider_image1"  align="center">
	<img class="img5" src="<c:url value="static/theme/hos1.jpg" />"/>
	<img class="img5" src="<c:url value="static/theme/hos2.jpg" />"/>
	<img class="img5" src="<c:url value="static/theme/hos3.jpg" />"/>
	<img class="img5" src="<c:url value="static/theme/hos4.jpg" />"/>
	
</div>
</div>
<div class="container" style="background-color:LightCyan;">
<nav class="navbar navbar-expand-sm navbar-light bg-faded">
<div class="collapse navbar-collapse" id="nav-content">   
<ul class="navbar-nav">
<li class="nav-item dropdown">
<a class="nav-link dropdown-toggle" data-toggle="dropdown" id="Preview" href="#" role="button" aria-haspopup="true" aria-expanded="false">
<span class="btn btn-success">PHARMACY</span>
</a>
<div class="dropdown-menu" aria-labelledby="Preview" style="background-color:burlywood;" >
<a class="dropdown-item" href="#">Order medicine</a>
<a class="dropdown-item" href="#">call a pharmacist</a>
<a class="dropdown-item" href="#"> pharmacy portal</a>
</div>
</li>
<li class="nav-item dropdown">
<a class="nav-link dropdown-toggle" data-toggle="dropdown" id="Preview" href="#" role="button" aria-haspopup="true" aria-expanded="false">
<span class="btn btn-success">REGISTRATION</span>
</a>
<div class="dropdown-menu" aria-labelledby="Preview" style="background-color:burlywood;">
<a class="dropdown-item"  href="${pageContext.request.contextPath}/choice?operation=studentreg">patient registration</a>
<a class="dropdown-item" href="${pageContext.request.contextPath}/choice?operation=doctorreg">doctor registration</a>
</div>
</li>

<li class="nav-item dropdown">
<a class="nav-link dropdown-toggle" data-toggle="dropdown" id="Preview" href="#" role="button" aria-haspopup="true" aria-expanded="false">
<span class="btn btn-success">SEARCH</span>
</a>
<div class="dropdown-menu" aria-labelledby="Preview" style="background-color:burlywood;">
<a class="dropdown-item"  href="${pageContext.request.contextPath}/choice?operation=blood">search blood</a>
<a class="dropdown-item"  href="${pageContext.request.contextPath}/choice?operation=blood">donate blood</a>
<a class="dropdown-item"  href="${pageContext.request.contextPath}/choice?operation=blood">shell blood</a>
<a class="dropdown-item" href="${pageContext.request.contextPath}/choice?operation=doctorlogin">search a Patient</a>
<a class="dropdown-item" href="${pageContext.request.contextPath}/choice?operation=studentlogin">Search a Doctor</a>
</div>
</li>
<li class="nav-item dropdown">
<a class="nav-link dropdown-toggle" data-toggle="dropdown" id="Preview" href="#" role="button" aria-haspopup="true" aria-expanded="false">
<span class="btn btn-success">RECORD</span>
</a>
<div class="dropdown-menu" aria-labelledby="Preview" style="background-color:burlywood;">
<a class="dropdown-item" href="#">record of a patient</a>
<a class="dropdown-item" href="#">record of appointment date</a>
<a class="dropdown-item" href="#">record of conversation</a>
</div>
</li>

<li class="nav-item dropdown">
<a class="nav-link dropdown-toggle" data-toggle="dropdown" id="Preview" href="#" role="button" aria-haspopup="true" aria-expanded="false">
<span class="btn btn-success">LATEST NEWS</span>
</a>
<div class="dropdown-menu" aria-labelledby="Preview" style="background-color:burlywood;">
<a class="dropdown-item" href="#">latest news</a>
<a class="dropdown-item" href="#">upcoming service</a>
<a class="dropdown-item" href="#">about new invention</a>
<a class="dropdown-item" href="#">latest  medical technology</a>
</div>
</li>
</ul>
</div>
</nav>
</div>
<div align="center">


<div class="wrapper" align="center" style="margin-top:150px;">
	<div id="slider_image">
	<img class="img4"  src="<c:url value="static/theme/hd1.jpg" />"/>
	<img class="img3"   src="<c:url value="static/theme/ncamp5.jpg" />"/>
	<img  class="img2"   src="<c:url value="static/theme/ncamp6.jpg" />"/>
	<img class="img1" src="<c:url value="static/theme/hd5.jpg" />"/>
	
	</div>
</div>
<div class="container">
  <div class="row">
    <div class="col"  style="background-color:bisque;">
    <h1><a href="#" class="btn btn-success btn-lg">HOSPITAL</a></h1>
      <p style="color:black; font-size:20px;">THIS IS A NEWLY DEVELOPED SITE WHICH HELP YOU TO ENSURE YOUR
 tO FULLFILL HEALTH SERVICE.
 </p>
    </div>
    <div class="col" style="background-color:gray;">
    <h1><a href="#" class="btn btn-success btn-lg">OUR services</a></h1>
       <p style="color:yellow; font-size:20px;">AUTHOR has taken 
       a few step to provide help to the PATIENT .and it give all kind of services for its patient.
   this newly made website will take a very good influence of handling  all kind of upcomming medical problems
   of future PATIENT.
       There are workarounds for older browser version</p>
    </div>

  
    <div class="col"  style="background-color:bisque;">
    <h1><a href="#" class="btn btn-success btn-lg">NEW technology</a></h1>
   <p style="color:black; font-size:20px;">AUTHOR has taken a good step and that step is to 
   search updated tehnology for giving good ser ice.it always help in good medical service.
   i brings all liknd of new technology for mdical service</p>
    </div>
    <div class="col"  style="background-color:gray;">
     <h1><a href="#" class="btn btn-success btn-lg">Research</a></h1>
      <p style="color:yellow; font-size:20px;">Our  HOSPITAL always support for reasearching. it allways keen to invent new thing a new solution a new medicine.
      this always .our medical expert are busy all time to invent complex disease vecsin</p>
    </div>
  </div>
</div>
<div align="center">
<button id="see" style="background-color:blue;height:4em;width:10em;">hidefeatures</button>
<button id="down" style="background-color:blue;height:4em;width:10em;">allfeatures</button>
</div>

<div id="app" style="background-color:aquamarine;">
<div align="center" ><h1>bookappointment</h1></div>
<div align="center"><h1>find a job</h1></div>
<div align="center"><h1>research a topics</h1></div>
<div align="center"><h1>find a lodge</h1></div>
<div align="center"><h1>pharmacy</h1></div>
<div align="center"><h1>health tips</h1></div>
<div align="center" ><h1>academics</h1></div>
<div align="center"><h1>admit to a medical course</h1></div>
<div align="center"><h1>admit gymnaciam</h1></div>
<div align="center"><h1>find blood</h1></div>
<div align="center"><h1>meet while emergency</h1></div>
</div>

<br/>
<div id="one" class="one" align="center">
   <form action="choice">
  <input type="submit" name="operation" value="doctorreg" style="margin-right:100px;background-color:blue;height:2em;width:10em;" /> 
<input type="submit" name="operation" value="studentreg" style="margin-left:20px;background-color:blue;height:2em;width:10em;"/>
 <br/><br/>
    
      
   <input type="submit" name="operation" value="doctorlogin" style="margin-right:100px;background-color:blue;height:2em;width:10em;" /> 
 
    <input type="submit" name="operation" value="studentlogin" style="margin-left:20px;background-color:blue;height:2em;width:10em;" />
     <br/><br/>
     <input type="submit" name="operation" value="otherservice" style="margin-right:100px;background-color:blue;height:2em;width:10em;" />
    <input type="submit" name="operation" value="aboutus" style="margin-left:20px;background-color:blue;height:2em;width:10em;" /> 
     <br/><br/>
    <input type="submit" name="operation" value="pharmacy" style="background-color:blue;height:2em;width:10em;"/>

   </form>
   
  </div>

  <div class="testc">
 <div class="testc1">
 <form action="choice">
 <br/>
  <br/>
 <br/>
  <br/>
  
  <h1>find your health tips</h1>   <input type="submit" name="operation" value="healthtips"style="background-color:blue;height:2em;width:10em;" /> 
  <br/>
   <br/>
    <h1>join to a research</h1> <input type="submit" name="operation" value="research" style="background-color:blue;height:2em;width:10em;"/>
     <br/>
      <br/>
   <h1>for sort term course learning</h1>  <input type="submit" name="operation" value="admittraining" style="background-color:blue;height:2em;width:10em;" />
    <br>
    <br/>
   <h1>for contact info</h1>  <input type="submit" name="operation" value="contacts" style="background-color:blue;height:2em;width:10em;"/>
    
     <br/>
      <br/>
      </form>
 </div>
  </div>

 <div class="two">
 <form action="choice">
 <br/>
  <br/>
 
  <div class="bdonation"><input type="submit" name="operation" value="blooddonation" style="background-color:blue;height:2em;width:10em;"/></div>
    
       <br/>
        <br/>
        <div class="hinfo"> <input type="submit" name="operation" value="onlineHealthinfo" style="background-color:blue;height:2em;width:10em;"/> </div>
   
  <br/>
   <br/>
     <div class="clinicservice"><input type="submit" name="operation" value="clinicsandservices" style="background-color:blue;height:2em;width:10em;"/></div>
    
     <br/>
      <br/>
        <div class="lodgeinfo"><input type="submit" name="operation" value="lodgeinfo" style="background-color:blue;height:2em;width:10em;" /></div>
    
    <br>
    <br/>
      <div class="findjob"><input type="submit" name="operation" value="findAjob" style="background-color:blue;height:2em;width:10em;"/></div>
    
    
     <br/>
      <br/>
        <div class="findblood">  <input type="submit" name="operation" value="findblood" style="background-color:blue;height:2em;width:10em;" /></div>
     
    
     <br/>
      <br/>
      </form>
      
      </div>
   <div  class="picd" id="ten" onmouseover="changeback()" >
   
   <form>
   <div class="findblood">  <input type="submit" name="operation" value="gymnasiam" style="background-color:blue;height:2em;width:10em;" /></div>
      </form>
      
   <div id="pic1">

<img src="clinics.jpg"/>
</div>
<div id="pic2">

<img src="lab.jpg"/>
</div>

</div>
<div id="pic3">

<img src="gymnacian1.jpg"/>
</div>   
   </div>
    </div>
</div>

</body>
</html>