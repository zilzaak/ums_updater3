<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="<c:url value="/static/jquery124.js" />" > </script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style type="text/css">
img{
width:50%;
height:50%;

}
#panel,#flip{
padding:5px;
text:align:center;
background-color:orange;
border:solid 1px green;
}
h1{
text-align:center;
color:red;
text-transform:uppercase;
font-size:1em;

}
#panel{
padding:50px;
display:block;
}
</style>
</head>

<h1>this include diffrent type of research paper, research ,scholarship etc with the professors</h1>

<body>
<script type="text/javascript">
$(document).ready(function(){
	$('#pic1').mouseover(function(){
	
		$('#pic2').fadeOut('slow').fadeIn()	;
		$('#pic3').fadeOut('slow').fadeIn();
		
		
	});
	
	$('#pic2').mouseover(function(){
		
		$('#pic1').fadeOut('slow').fadeIn('slow')	;
		$('#pic3').fadeOut('slow').fadeIn('slow');
		
		
	});
	
	$('#pic3').mouseover(function(){
		
		$('#pic1').fadeOut('slow').fadeIn('slow')	;
		$('#pic2').fadeOut('slow').fadeIn('slow');
		
		
	});
	
	$('#flip').mouseover(function(){
		
		$('#panel').slideUp('slow');
		
		
	});
$('#down').mouseover(function(){
		
		$('#panel').slideDown('slow');
		
		
	});
});



</script>
<h1>click to slide the indow</h1>

<div id="flip">
<h1>hellow world</h1>
</div>
<div id="panel">

<h1>click to slide panel</h1>
</div>
<div id="down">
<h1>hellow world</h1>
</div>
<div class="slider">

<div id="pic1">

<img src="C:\\Users\\Samiul Alim\\eclipse-workspace\\ums\\WebContent\\clinics.jpg"/>
</div>
<div id="pic2">

<img src="C:\\Users\\Samiul Alim\\eclipse-workspace\\ums\\WebContent\\lab.jpg"/>
</div>

</div>
<div id="pic3">

<img src="C:\\Users\\Samiul Alim\\eclipse-workspace\\ums\\WebContent\\nurse2.jpg"/>
</div>

</div>

</body>
</html>