<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="<c:url value="/static/theme/bootstrap334.min.css"/> "rel="stylesheet">
<link href="<c:url value="/static/theme/font-awesome470.css" />" rel="stylesheet">
<script src="<c:url value="/static/theme/jquery311.js" />" > </script> 
<script src="<c:url value="/static/theme/popper114.js" />" > </script>
<script src="<c:url value="/static/theme/bootstrap334.min.js" />" > </script>
<link href="<c:url value="/static/theme/search2.css" />" rel="stylesheet">
<link href="<c:url value="/static/theme/jquery-ui.css" /> " rel="stylesheet"> 
<script src="<c:url value="/static/theme/jquery224.js" />" > </script>  
<script src="<c:url value="/static/theme/jquery.min.321.js" />"> </script>  
<script src="<c:url value="/static/theme/jquery-ui.js" />" > </script> 
<script src="<c:url value="/static/theme/bootstrap334.min.js" />" > </script>
<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"  rel="stylesheet" type="text/css" href="">
	<script
  src="https://code.jquery.com/jquery-2.2.4.js"
  integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
  crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js" type="text/javascript"></script>
	<link href="<c:url value="/static/theme/get.css" /> " rel="stylesheet">
<style>

</style>
</head>
<body onload="dnts();hmm();recall();" class="bd">

<script type="text/javascript">
function dnts(){
//$("#tab").show();
$("#srch").show();

}
function hmm(){
	var x = document.getElementById("btntab").value;
if(x=="sss"){
$("#tab").show();
}
	
}
function recall(){
	var r = document.getElementById("recall").value;	
                  
         }

$(window).load(function(){
	var r = document.getElementById("recall").value;
	if(r=="recall"){
		$("#modbtn").show();
	}
	 });
</script>


<script>
	                 $(function() {
		        $("#searchBox").autocomplete({
			source : function(request, response) {
				$.ajax({
					url : "${pageContext.request.contextPath}/getdoctor",
					dataType : "json",
					data : {
						q : request.term
					},
					success : function(data) {
						//alert(data);
						console.log(data);
						response(data);
					}
 				});
			},
			minLength : 2
		});
	});
</script>
<br/><br/><br/>


<div id="srch"  align="center" style="width: 600px; margin:auto;border:2px;display:none;background-color:darkcyan;">
	    <br/>
	    <h3>Search a doctor typing the  disease name</h3>
	 <input type="hidden" id="btntab" value="${btn}" />
	 <form name="myform2" action="${pageContext.request.contextPath}/drbydis2">
	Disease Name::<input type="text"   name="disname" id="searchBox" /><br/><br/>
	<button type="submit" ><span class="btn btn-success btn-md">search</span></button>
		</form>
	<br/>
	
	
	</div>
	<br/><br/>
	<div style="display:none;" id="tab">
	<table align="center" border="2" style="background-color:darkseagreen;">
	<tr style="color:blue;">
	<th>Doctor name</th>
	<th> age</th>
	<th>Expert In</th>
	<th>Schedule</th>
	<th>time</th>
	<th>Phone</th>
	<th>chooste appointment</th>
	
	</tr>
	
	<c:forEach  var="dr" items="${dlist}">
		<tr>
		<input  type="hidden" id="id5" value="${dr.name}"/>
<td>${dr.name}</td>
<td>${dr.age}</td>
<td>${dr.expertint}</td>
<td>${dr.day}</td>
<td>${dr.schedule}</td>
<td>${dr.drphone}</td>
<td>
<button  type="button"   onclick="getdid(${dr.did});" 
class="btn btn-info btn-md " data-toggle="modal"
data-target="#mymodal">getAppointment</button>
</td>
	</tr>
		</c:forEach>
	</table>

	</div>
	
<script type="text/javascript">


$(function(){
    $("#dp").datepicker({
    	 dateFormat: "mm/dd/yy",
    	 changeDay: true,
        changeMonth: true,
        changeYear: true
        
    });
});


 
</script>

<script type="text/javascript">
var di;
function getdid(did){
	
	di=did;
	
}
 jQuery(document).ready(function($){
	 $("#formats").submit(function(event){
		 event.preventDefault();
	
			 	 ajpa();
			   });
	 
function ajpa(){
		var data = { }
		var x = $("#s").val();
		alert(x);
		data["chsid"] = $("#s").val();
		data["chdid"] = di;alert(di);
		data["chdate"] = $("#dp").val();
		
			$.ajax({
			type: "POST",
			contentType: "application/json",
			url: "${pageContext.request.contextPath}/chooseapp2",
			data: JSON.stringify(data),
			dataType: 'json',
			success: function(r){
				$("#sm").show();
              $("#msg").text(r.chsmg);
              $("#pn").text(r.prname);
              $("#rt").text(r.dname);
              $("#sn").text(r.sirialno);
				}
			});
	
}	 
 });

 </script>

	</tr>
	
	
<div class="modal fade" id="mymodal">
<div class="modal-dialog">
	     <div class="modal-content">
		    <div class="modal-header">
               
<button class="close" data-dismis="modal" >&times;</button>
                   	     <h4 class="modal-title">select appointment date(PUST MC)</h4>
               </div>
   <div class="modal-body">
            <form id="formats">
            <input type="hidden" id="s" value="${chids}"/>
            <input type="text"  id="dp" /> 
            <button type="submit" >submit</button>
                  </form>
               </div>
              <div id="sm" style="display:none;">
              Patient name:<b><span id="pn" style="color:green;" ></span></b><br/>
              Sirial no:<b><span id="sn" style="color:green;" ></span></b><br/>
              Requested to:<b><span id="rt" style="color:green;" ></span></b><br/>
              result:<b><span id="msg" style="color:green;" ></span></b><br/>
              </div>
            </div>
            </div>	</div>
	<br/>
	<br/>
	
${chids}
<div align="center" style="background-color:skyblue;margin-left:200px;margin-right:200px;">
<form  action="${pageContext.request.contextPath}/apprecordall/" method="post">
<input type="hidden"  name="sid"   value="${chids}" />
<b>All Appointment Record</b>::<input  type="submit" name="seeAll"/>
</form>
</div>

<div align="center" id="modbtn" style="display:none;">
<br/><br/>
<button type="submit" class="btn btn-info btn-lg" data-toggle="modal" data-target="#recmodal">All Appointment</button>
</div>
     <br/>
     <br/>
     <br/>

    <input type="hidden" id="recall" value="${recall}"/>
    
    
   
    <div class="modal" id="recmodal">
<div class="modal-dialog">
	     <div class="modal-content">
		    <div class="modal-header">
     <h4 class="modal-title">Record of all appointment(PUST MC)</h4>
               </div>
   <div class="modal-body">
       <table  border="2"  style="background-color:darkseagreen;" >
         <tr><th>Patient Name</th>
         <th>Doctor Name</th>
         <th>Date of Appointment</th>
         <th>Sirial Number</th>
         <th>Download</th></tr>
         <c:forEach  var="m" items="${recs}">
          <tr>  
          <td>${m.prname}</td>
          <td>${m.dname}</td>
          <td>${m.chdate}</td>
          <td>${m.sirialno}</td>
          <td><a href="${pageContext.request.contextPath}/dapp/${m.chsid}/${m.chdid}">download</a></td>
          </tr>
         </c:forEach>
     
          </table>   
   </div>
 </div>
            </div>
       </div>	 
     
            
</body>
</html>