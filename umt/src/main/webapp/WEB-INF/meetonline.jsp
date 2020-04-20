<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="/static/theme/bootstrap.min.css" /> " rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="<c:url value="/static/theme/bootstrap.min.js" />" > </script>

<script type="text/javascript">
function validateform(){
	if(document.myform.studsms.value==""){
		alert("empty message can not be sent.plz type your message");
		document.myform.studsms.focus();
		return false;
	                   }
return(true);	
}

</script>
</head>
<body>
<div align="center" style="background-color:lightblue;">
<p color="blue"><h1>Message the doctor to take consultation</h1> </p>
<br/>
 <h1>${invalidID}  </h1> 
<form name="myform" onsubmit="return(validateform());" action="smstops" method="post">
<input type="hidden" name="sid" value= ${selectedpid} /> <br/>
 Your message::<textarea rows="10" cols="20" name="studsms">your message</textarea> <br/>
 <input type="hidden" name="aid" value= ${selecteddid} /> <br/>
 Send::<input type="submit" name="send"/> <br/>
 reset: <input type="reset" name="reset"/>
 </form>
</div>
<div align="center"   style="background-color:darkseagreen; height:300px;">

<h1 style="color:red;"> ${failmsg}</h1>
<div style="background-color:gray; margin-left:300px;margin-right:200px;">
<button ><i class="fa fa-download" style="font-size:48px;color:red;"></i></button><a href="${pageContext.request.contextPath}/downloadPrescription?sid=${selectedpid }&aid=${selecteddid}"><span class="btn btn-success btn-lg">Download Prescription</span></a>
</div>
</div>
doctrs id : ${selecteddid}

patient id :${selectedpid}
</div>
</body>
</html>