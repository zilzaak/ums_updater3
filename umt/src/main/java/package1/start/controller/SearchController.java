package package1.start.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLConnection;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;
import java.util.TimeZone;
import java.util.stream.Collectors;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.JsonObject;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;

import package1.start.model.Blood;
import package1.start.model.ChooseAppStr;
import package1.start.model.ChooseAppointment;
import package1.start.model.Contest;
import package1.start.model.Doctor;
import package1.start.model.Drug;
import package1.start.model.Fpdoct;
import package1.start.model.OnlineActiveMode;
import package1.start.model.Student;
import package1.start.service.RegisterLLService;


@Controller

public class SearchController {
	  @Autowired 
	    private  RegisterLLService srvc2;
	 
	@RequestMapping(value="/search")
public ModelAndView searchpatient(@RequestParam("pid") int pid) {
	List<Fpdoct> plist = srvc2.searchpatient(pid);
     if(plist.isEmpty()) {
    	 return new ModelAndView("emptyrecord","record","this patient have not prescribed by any doctor.he is in waiting for a consultation"); 
     }
     else {
    		return new ModelAndView("searchpatientrecord","fpform",plist);
    		 
    	   }

}
	
	@RequestMapping(value="/getdocbyid/{did}")
public ModelAndView docbyid(@PathVariable("did") int did) {
	Doctor dr = srvc2.getdoctorbyid(did);
       ModelAndView mv = new ModelAndView("searchpatientrecord");
	mv.addObject("doc",dr);
	mv.addObject("hidepres","hidepress");
	return mv;
}
	
	@RequestMapping(value="/provideddrug/{fpid}")
public ModelAndView provideddrug(@PathVariable("fpid") int fpid) {
	List<Drug> lst = srvc2.provideddrugs(fpid);
for(Drug d : lst) {
	
	System.out.println("drug name is "+d.getNdrug()+"    "+"schedule of drug"+"  "+d.getSdrug());
	System.out.println("patient name is"+d.getFpdoct().getXpname());
}
	return new ModelAndView("provideddrugs","druglist",lst);
	
}
	
	
	
	@RequestMapping(value="/presfordoc/{sid}/{aid}", method=RequestMethod.GET)
	public ModelAndView presfordoc(@PathVariable("sid") int sid,@PathVariable("aid") int aid,
			
			HttpServletResponse rs) throws IOException {
		ModelAndView mv = new ModelAndView("successtodownload");
		mv.addObject("sms", "downloaded prescription successfully");
			String existprescription = srvc2.existPrescriptionOrNot(aid, sid);
		if(existprescription.equals("not")) {
			mv.setViewName("meetonline");
	mv.addObject("failmsg","your doctor have not prescribe any thing yet!! request him to provide a prescription");
	     }else {
			File file = new File(existprescription);
			FileInputStream k = new FileInputStream(file);
			InputStream im = new  BufferedInputStream(k );
			String mimetype = URLConnection.guessContentTypeFromStream(im);
			if(mimetype==null) {
			mimetype="application/octet-stream";
			rs.setContentType(mimetype);
			rs.setContentLengthLong(file.length());
			rs.setHeader("Content-Disposition", String.format("attachment;filename=\"%s\"",file.getName()));
			FileCopyUtils.copy(im,rs.getOutputStream());
	}	
}
		
		return mv;
}
	
	@RequestMapping(value = "/searchdoc", method = RequestMethod.GET)
	
	public String didsease(HttpSession session) {
List<Doctor> lstdoc = srvc2.getalldoctor();
List<String> dislst = new ArrayList<String>();

for(Doctor dr : lstdoc) {
	dislst.add(dr.getExpertint());
}
session.setAttribute("dislist", dislst);
		return "searchdisease";

	}
	
@RequestMapping(value = "/searchdoc2", method = RequestMethod.GET)
	
	public String didsease2(HttpSession session) {
List<Doctor> lstdoc = srvc2.getalldoctor();
List<String> dislst = new ArrayList<String>();

for(Doctor dr : lstdoc) {
	dislst.add(dr.getExpertint());
}
session.setAttribute("dislist", dislst);
		return "getapp1";

	}
	
	@RequestMapping(value="/getdoctor")
	public ResponseEntity<String> doAutoComplete(@RequestParam("q")  final String input,HttpSession session) {
		
	List<String> lst =(List<String>) session.getAttribute("dislist");
	List<String> lst2 = new ArrayList<>() ;
	for(String st : lst) {
		if(st.contains(input)) {
			lst2.add(st);
		}
	}
	
		ObjectMapper mapper = new ObjectMapper();
		String resp = "";
		try {
			resp = mapper.writeValueAsString(lst2);
		} catch (JsonProcessingException e) {
		}
	 return new ResponseEntity<String>(resp, HttpStatus.OK);

	}
@RequestMapping(value="/drbydis")
 public ModelAndView getdoctorByDisease(@RequestParam("disname") String disname){
	List<Doctor> lst = srvc2.getDoctorBydisname(disname) ;
	ModelAndView mv = new ModelAndView("searchdisease");
	
	mv.addObject("dlist",lst);
	return mv;
	 
 }

@RequestMapping(value="/drbydis2", method=RequestMethod.GET)
public ModelAndView getdoctorByDisease2(@RequestParam String disname){
	List<Doctor> lst = srvc2.getDoctorBydisname(disname) ;
	ModelAndView mv = new ModelAndView("getapp");
	mv.addObject("dlist",lst);
	mv.addObject("btn","sss");
 return mv;
}

public void sendmail(Student st , Doctor dr,ChooseAppointment ca) throws AddressException, MessagingException {
   String to = st.getEmail();
   String from="orchidpust@gmail.com";
	Properties prop=new Properties();
	prop.put("mail.smtp.port",587);
	prop.put("mail.smtp.auth","true");
	prop.put("mail.smtp.host","smtp.gmail.com");
	prop.put("mail.smtp.starttls.enable","true");
	Session session = Session.getDefaultInstance(prop, 
new javax.mail.Authenticator() {
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication(from,"627363orchidpust");
	}
	});
	
MimeMessage msg = new MimeMessage(session);
	msg.setSubject("appointment confirmation from PUST MEDICAL CENTER");
	msg.setFrom(new InternetAddress(from));
	String stn="appointment of"+" "+dr.getName()+" "+"appointment date::"+
			ca.getChdate()+"  "+"doctor contact::"+dr.getDrphone()+"  "+
			"Doctor Schedule::"+dr.getDay()+"Time::"+dr.getSchedule()+"patient Name::"+st.getName()+"  "+
			"patient email::"+st.getEmail();
msg.setContent("<h1>"+stn+"</h1>","text/html");
 msg.addRecipient(Message.RecipientType.TO, new InternetAddress(st.getEmail()));
	Transport.send(msg);

}

@RequestMapping(value="/chooseapp2",
method=RequestMethod.POST,
consumes=MediaType.APPLICATION_JSON_VALUE,
produces=MediaType.APPLICATION_JSON_VALUE)

public ResponseEntity<ChooseAppointment> datefor2(@RequestBody ChooseAppStr cap
		) throws ParseException, DocumentException, IOException, AddressException, MessagingException {
	 DateFormat df =new SimpleDateFormat("MM/dd/yyy");
		TimeZone tz = TimeZone.getTimeZone("PDT");
		df.setTimeZone(tz);
		Date d = df.parse(cap.getChdate());
Student st = srvc2.getpatientbyid(cap.getChsid());
	Doctor dr = srvc2.getdoctorbyid(cap.getChdid());
String pn=st.getName();String dn=dr.getName();
int sid=cap.getChsid();int did=cap.getChdid();
	ChooseAppointment ca = new ChooseAppointment ();
	ca.setChdate(d);ca.setChdid(did);ca.setChsid(sid);ca.setDname(dn);ca.setPrname(pn);
	Date d1 = new Date();
System.out.println("two date are new date="+d1+"parsed date is"+d);
if( d1.compareTo(d)>0) {	
	 ca.setChsmg("invalid date selection");
	 System.out.println(ca.getChsmg());
	 return new ResponseEntity<ChooseAppointment>(ca,HttpStatus.OK); 
}


if(srvc2.lstofchooseapp().isEmpty()) {
		ca.setSirialno(1);
		ca.setChsmg("successfully confirmed date check email or download appointment copy");
		//sendmail(st,dr,ca);
		srvc2.insertchapp(ca);
		appdfcreater(dr,ca);
		System.out.println(ca.getChsmg());
		return new ResponseEntity<ChooseAppointment>(ca,HttpStatus.OK);
	}

if(srvc2.nullreqtoadate(d, did).equalsIgnoreCase("yesnull")) {
	ca.setChsmg("successfully confirmed date check email or download appointment copy");
	ca.setSirialno(1);
	//sendmail(st,dr,ca);
srvc2.insertchapp(ca); 
return new ResponseEntity<ChooseAppointment>(ca,HttpStatus.OK);			
}
    if(srvc2.countappforadate(d,did)>4 ) {
    	ca.setChsmg("all appontment are booked select another date");	
System.out.println(ca.getChsmg());
   return new ResponseEntity<ChooseAppointment>(ca,HttpStatus.OK);			
    }
    
    
if(srvc2.countappforadate(d,did)<5 && d1.compareTo(d)<0 && srvc2.samedateduplicatepatient(ca.getChsid(), cap.getChdid(),ca.getChdate())!=false) {
	 ca.setSirialno(srvc2.countappforadate(ca.getChdate(),did));
	 ca.setChsmg("confirmed the appointment in date.Check email or Download appointment copy ");	
		sendmail(st,dr,ca);
	 srvc2.insertchapp(ca); 
		appdfcreater(dr,ca); 
		System.out.println(ca.getChsmg());
 return new ResponseEntity<ChooseAppointment>(ca,HttpStatus.OK);	
}
 
 ca.setChsmg("a doctor treat more than 4 patient same date");	 
 System.out.println(ca.getChsmg());
 return new ResponseEntity<ChooseAppointment>(ca,HttpStatus.OK); 
 
	  
}

public void appdfcreater(Doctor dr,ChooseAppointment ap) throws DocumentException, IOException {
 Document document = new Document();
	   OutputStream out = new FileOutputStream(new File("G:\\ums\\WebContent\\appointment\\"+ap.getPrname()+".pdf"));
			PdfWriter.getInstance(document,out);
			document.open();
		Image img = Image.getInstance(dr.getDrphotopath()+"/"+dr.getFilename());
		document.add(img);
     document.add(new Paragraph("PUST MEDICAL CENTER" +"     "  +"Date:"+ap.getChdate()));
	document.add(new Paragraph("Doctor Name:"+dr.getName())); document.add(new Paragraph("Expertin:"+dr.getExpertint()+"(MBBS)"));
	document.add(new Paragraph("Doctor schedule"+dr.getSchedule()));
	document.add(new Paragraph("Doctor schedule"+dr.getDay()));
	document.add(new Paragraph("Patient Name:"+ap.getPrname()));
	
	document.add(new Paragraph("Patient Serial No:"+ap.getSirialno()));
	document.addTitle("Appointment");
	document.close();
	out.close();	
	

}

@RequestMapping(value="/apprecordall",
method=RequestMethod.POST)
//consumes=MediaType.APPLICATION_JSON_VALUE,
//produces=MediaType.APPLICATION_JSON_VALUE)

public ModelAndView allrecordapp(@RequestParam int sid){
List<ChooseAppointment> recs = srvc2.lstofchooseappbyid(sid);
ModelAndView mv = new ModelAndView("getapp");
mv.addObject("recs",recs);mv.addObject("recall","recall");
return mv;
}




@RequestMapping("/appdatselect/{chdid}/{chsid}")
public ModelAndView selectappdate(@PathVariable int chdid,@PathVariable int chsid) {
	ModelAndView mv = new ModelAndView("choosedate");
	mv.addObject("chdid",chdid);
	mv.addObject("chsid",chsid);
	return mv;
                          }

@RequestMapping(value="/studentlogin" , method=RequestMethod.POST)
public ModelAndView stlogin(@RequestParam String user,@RequestParam String pass,
		 HttpSession session
		) {
	ModelAndView mv = new ModelAndView("getapp");
if(srvc2.verifyloginstudent(user,pass).equals("true")) {
		
		int sid = srvc2.getStudId(pass);
		 OnlineActiveMode st = new OnlineActiveMode(sid,"patient","active",user);
		  srvc2.addactive_status(st);
		session.setAttribute("chids",sid);
		mv.addObject("mvsid",sid);

}

return mv;
}

@RequestMapping(value="/dapp/{chsid}/{chdid}")
public @ResponseBody String dapp(@PathVariable int chsid,@PathVariable int chdid,HttpServletResponse rs) throws IOException {
Student st = srvc2.getpatientbyid(chsid);
File file = new File("G:\\ums\\WebContent\\appointment\\"+st.getName()+".pdf");
FileInputStream k = new FileInputStream(file);
InputStream im = new  BufferedInputStream(k );
String mimetype = URLConnection.guessContentTypeFromStream(im);
if(mimetype==null) {
mimetype="application/octet-stream";
rs.setContentType(mimetype);
rs.setContentLengthLong(file.length());
rs.setHeader("Content-Disposition", String.format("attachment;filename=\"%s\"",file.getName()));
FileCopyUtils.copy(im,rs.getOutputStream());

}
return "appointment is downloaded succesfully.bring it while coming to PUST MC";
}
	

@RequestMapping(value="/recordapp/{aid}")
public ModelAndView recordapp(@PathVariable int aid) {
	
	ModelAndView mv = new ModelAndView("doctorprofile");
	String app="yes";
	List<ChooseAppointment> dapplst= srvc2.doctorapp(new Date());
	if(dapplst.isEmpty()) {
		app="no";
	}
	mv.addObject("app",app);mv.addObject("dapps",dapplst);
	
	return mv;
}


}