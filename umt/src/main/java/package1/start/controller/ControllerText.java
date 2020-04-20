package package1.start.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.MalformedURLException;
import java.net.URLConnection;
import java.nio.charset.Charset;
import java.nio.charset.MalformedInputException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;
import java.util.Random;

import javax.imageio.stream.ImageInputStream;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import package1.start.model.Appointment;
import package1.start.model.Blood;
import package1.start.model.Doctor;
import package1.start.model.Drug;
import package1.start.model.Fpdoct;
import package1.start.model.ItemBuy;
import package1.start.model.OnlineActiveMode;
import package1.start.model.PersonalAssist;

import package1.start.model.Product;
import package1.start.model.StudPsSms;
import package1.start.model.Student;
import package1.start.service.EmployeeService;
import package1.start.service.RegisterLLService;
@Controller
public class ControllerText {

    @Autowired 
    private RegisterLLService srvc;
   
    @Autowired 
    private EmployeeService employeeService;
    
	@RequestMapping(value="/")
	public String test() {
	
		return "test";
	}
	
	@RequestMapping(value="/choice")
	public String choice(@RequestParam("operation") String operation) {
			
		return operation ;
	}
	
	@RequestMapping(value="/choicebyHref/{operation}" , method=RequestMethod.GET)
	public String choicebyhref(@PathVariable("operation") String operation) {
			
		return operation ;
	}
	
	
	@RequestMapping(value="/regstudent" , method=RequestMethod.GET)
	public ModelAndView studentregistration(@ModelAttribute("Student") Student st) {
		ModelAndView mv = new ModelAndView();
		if(srvc.checkuniquestudent(st.getName(),st.getPassword()).equals("true")) {
			srvc.studentreg(st);
		mv.setViewName("afterregstudent");
	
		}else {
mv.setViewName("studentreg");
mv.addObject("sms","the username or password you have entered is already exist.Try again");	
		}

	 return mv;
	
	}
	

	@RequestMapping(value="/drphotoupload" , method=RequestMethod.POST)
	public ModelAndView drphotoupload(@RequestParam CommonsMultipartFile file,HttpSession session) throws IOException {
String Path = "G:\\ums\\src\\main\\webapp\\static\\drphoto";

String filename=file.getOriginalFilename();
byte barr[]=file.getBytes();
BufferedOutputStream bout=new BufferedOutputStream(new FileOutputStream(Path+"/"+filename));
 int did = (int) session.getAttribute("did");
System.out.println("file name is "+filename+"    "+"did is your did"+did);
bout.write(barr);
bout.flush();
bout.close();
srvc.addphotodr(Path,filename,did);
ModelAndView mv = new ModelAndView("doctorlogin");
	 return mv;
	}
	@RequestMapping(value="/updatedrphoto" , method=RequestMethod.POST)
	public ModelAndView updatedrphoto(@RequestParam CommonsMultipartFile file,HttpSession session) throws IOException {
String Path = "G:\\ums\\src\\main\\webapp\\static\\drphoto";

String filename=file.getOriginalFilename();
byte barr[]=file.getBytes();
BufferedOutputStream bout=new BufferedOutputStream(new FileOutputStream(Path+"/"+filename));
 int did = (int) session.getAttribute("aid");
System.out.println("file name is xxxxxxxx "+ filename + "    "+"did is your did"+did);
bout.write(barr);
bout.flush();
bout.close();
srvc.addphotodr(Path,filename,did);
ModelAndView mv = new ModelAndView("doctorlogin");
	 return mv;
	}
	
	@RequestMapping(value="/loginstudent" , method=RequestMethod.POST)
	public  ModelAndView studentlogin(@RequestParam("name") String uname,
			@RequestParam("password") String password
			,HttpServletRequest req) {
		
		 ModelAndView mv = new  ModelAndView();
		if(srvc.verifyloginstudent(uname, password).equals("true")) {
			
			int sid = srvc.getStudId(password);
			 OnlineActiveMode st = new OnlineActiveMode(sid,"patient","active",uname);
			  srvc.addactive_status(st);
			mv.setViewName("studentprofile");
			HttpSession session = req.getSession();
			session.setAttribute("sid",sid);
			session.setAttribute("username",uname);
			session.setAttribute("password",password);
		}
		else {
			mv.setViewName("studentlogin");
	        mv.addObject("sms","Password or Username is not match please try again");		
		}
		return mv;	
	
	   }
	
	
	@RequestMapping(value="/logout")
	public String logout(@RequestParam("log") String log,@RequestParam("id") int id, HttpSession session) {
		
		if(log.equals("logoutpatient")) {
			String name = (String) session.getAttribute("username");
			 OnlineActiveMode st = new OnlineActiveMode(id,"patient","inactive",name);
			 srvc.addactive_status(st);
			session.removeAttribute("username");session.removeAttribute("password");
			session.invalidate();
		}
		if(log.equals("logoutdoctor")) {
			String name = (String) session.getAttribute("Dusername");
			 OnlineActiveMode st = new OnlineActiveMode(id,"doctor","inactive",name);
			 srvc.addactive_status(st);
			session.removeAttribute("Dusername");session.removeAttribute("Dpassword");
			session.invalidate();
		}
		
		return "test";
	}
	
	
	@RequestMapping(value="/logindoctor" , method=RequestMethod.POST)
	public  ModelAndView  doctorlogin(@RequestParam("name") String uname,
			@RequestParam("password") String password
			,HttpSession session) {
		 ModelAndView mv = new  ModelAndView();
		if(srvc.verifylogindoctor(uname, password).equals("true")) {
			  int did = srvc.getDocId(password);
			  OnlineActiveMode st = new OnlineActiveMode(did,"doctor","active",uname);
			  srvc.addactive_status(st);
			session.setAttribute("aid",did);
			session.setAttribute("Dusername",uname);
			session.setAttribute("Dpassword",password);
			Doctor dr = srvc.getdoctorbyid(did);
			mv.setViewName("doctorprofile");mv.addObject("dr",dr);
		}else {
			mv.setViewName("doctorlogin");
			mv.addObject("sms","username or password is not match .Try again");
		
		}
		return mv;	
	
	   }
	

@RequestMapping(value="/finaleditStu" , method=RequestMethod.POST)
public ModelAndView finaleditStu(@ModelAttribute("Student") Student st) {
    srvc.studentupdate(st);
ModelAndView mv = new ModelAndView("editaccountStu");
    mv.addObject("st",st);
return mv;	
             } 



@RequestMapping(value="/finaleditDoc" , method=RequestMethod.POST)
public ModelAndView finaleditDoc(@ModelAttribute("Doctor") Doctor dr ) {
	  ModelAndView mv = new ModelAndView();
	if(srvc.verifylogindoctor(dr.getName(),dr.getPassword()).equals("true")){
	  srvc.doctorupdate(dr);
	 mv.setViewName("editaccountDoc");
	        mv.addObject("dr",dr);
	}else {
		mv.addObject("notyourprofile","this account is not yours beacause the user name and password is incorrect");
		 mv.setViewName("editaccountDoc");
	}
      

	return mv;	

   } 



@RequestMapping(value="/doctorlist")
public ModelAndView doctorlist( ) {
    List<Doctor> list = srvc.getalldoctor();
   ModelAndView mv = new ModelAndView("doctorlist");
    mv.addObject("doctors",list);
 	return mv;
   } 





@RequestMapping(value="/godoctorprofile" , method=RequestMethod.GET)
public ModelAndView gotodoctorprofile(@RequestParam("gdid") int gdid,@RequestParam("gsid") int gsid,HttpSession tsession ) {
   
   ModelAndView mv = new ModelAndView("dproforSt");
  mv.addObject("DID",gdid);
   
    mv.addObject("PID",gsid);
   tsession.setAttribute("selecteddid",gdid);
   tsession.setAttribute("selectedpid",gsid);
    return mv;
   }


@RequestMapping(value="/smstostud" , method=RequestMethod.POST)
public ModelAndView smstostud(@RequestParam("aid") int aid,@RequestParam("sid") int sid,
		@RequestParam("pssms") String pssms, HttpSession session 
		) {

ModelAndView mv = new ModelAndView("bothsms");
	  DateFormat dateformat = new SimpleDateFormat("yyy/MM//dd HH:mm:ss");
			Date date  = new Date();	
			StudPsSms sps = new StudPsSms();
			sps.setAid(aid);sps.setSid(sid);sps.setPssms(pssms);
		   sps.setDate(dateformat.format(date));
		       srvc.addspsmsg(sps,"doctor");
		    session.setAttribute("pssms",pssms);
   return mv;
   }

@RequestMapping(value="/smstops" , method=RequestMethod.POST)
public ModelAndView smstops(@RequestParam("sid") int sid,@RequestParam("aid") int aid,
		@RequestParam("studsms") String studsms,
		//@RequestParam("password") String password,
		HttpSession session ) {
	ModelAndView mv = new ModelAndView();
	 // if(srvc.invalidSIDwhilesms(password,sid).equals("true")) {
		  mv.setViewName("bothsms");
	  session.setAttribute("studsms",studsms);
	  DateFormat dateformat = new SimpleDateFormat("yyy/MM//dd HH:mm:ss");
		Date date  = new Date();	
		StudPsSms sps = new StudPsSms();
		sps.setAid(aid);sps.setSid(sid);sps.setStudsms(studsms);
	   sps.setDate(dateformat.format(date));
	       srvc.addspsmsg(sps,"patient");
	    
	  
     // }else {
		//  mv.setViewName("dproforSt");
		//mv.addObject("invalidID","your id is invalid");  
	 // }
 	return mv;
   }

@RequestMapping(value="/downloadPrescription", method=RequestMethod.GET)
public ModelAndView downloadPrescription(HttpServletRequest rq,HttpServletResponse rs ) throws IOException {
	ModelAndView mv = new ModelAndView("successtodownload");
	mv.addObject("sms", "downloaded prescription successfully");
	String id1 = rq.getParameter("sid");
	int sid = Integer.parseInt(id1);
	String id2 = rq.getParameter("aid");
	int did = Integer.parseInt(id2);
	String existprescription = srvc.existPrescriptionOrNot(did, sid);
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

@RequestMapping(value="/ChatDescision" ,method = RequestMethod.GET)

public ModelAndView doctorsChatDescision(@RequestParam("operation") String op,
		@RequestParam("pid") int pid,
		@RequestParam("aid") int aid
		) {
	ModelAndView mv = new ModelAndView();
	if(op.equalsIgnoreCase("chatWithOldPatient")) {
		mv.addObject("dpform",initialprescribe(aid,pid));
		mv.setViewName("chatWithOldPatient");
		mv.addObject("mypid",pid);mv.addObject("myaid", aid);
	}
if(op.equalsIgnoreCase("chatWithActivePatient")) {
		//mv.setViewName("chatWithActivePatient");
		mv.setViewName("chatWithOldPatient");
		mv.addObject("mypid",pid);mv.addObject("myaid", aid);
	}

	return mv;
}


public Fpdoct initialprescribe(int did,int pid) {
	  DateFormat dateformat = new SimpleDateFormat("yyy/MM//dd HH:mm:ss");
	Date date  = new Date();	
Fpdoct fpdoct = new Fpdoct();
	List<Drug> druglist = new ArrayList<Drug>();
	fpdoct.setIddx(did);fpdoct.setIdpx(pid);fpdoct.setPdate(dateformat.format(date));
Drug d = new Drug(); Drug d1 = new Drug();
druglist.add(d1);druglist.add(d);
fpdoct.setDlist(druglist);
d.setFpdoct(fpdoct);d1.setFpdoct(fpdoct);
	return fpdoct;
}


public String randomstring() {
	byte[] array=new byte[10];
	new Random().nextBytes(array);
	String xx=new String(array,Charset.forName("UTF-8"));
	
	return xx;
}
@RequestMapping(value = "/updateprescription", method = RequestMethod.POST)
public ModelAndView saveoperation(@ModelAttribute("Fpdoct")  Fpdoct fpdoct,@RequestParam("operation") String op
			)throws DocumentException, IOException{
	
	ModelAndView mv = new ModelAndView();
		if(op.equalsIgnoreCase("Save")) {
		Fpdoct fp = new Fpdoct();
		Doctor dr = srvc.getdoctorbyid(fpdoct.getIddx());
		Student st= srvc.getpatientbyid(fpdoct.getIdpx());
		fp.setXpname(fpdoct.getXpname());
		//String x =  randomstring();
		
		String presname =st.getName()+srvc.createuniquepres();
		fp.setPlink("G:\\ums\\WebContent\\prescription\\"+presname+".pdf");
		fp.setIddx(fpdoct.getIddx());fp.setIdpx(fpdoct.getIdpx());fp.setTdisease(fpdoct.getTdisease());
		fp.setPdate(fpdoct.getPdate());
		fp.setXpage(fpdoct.getXpage());
		List<Drug> dlist1 = new ArrayList<Drug>();
		List<Drug> dlist = fpdoct.getDlist();
for(Drug d : dlist) {
	d.setFpdoct(fp);
	dlist1.add(d);	
}


fp.setDlist(dlist1);
srvc.adddpress(fp, dlist1);
createpdf(st,dr,fp);
	mv.addObject("prescriptionForm",fp);
	 mv.setViewName("show_medicine");
		
		
		} 
		
		
	 if(op.equalsIgnoreCase("addrow")){
		   
			 List<Drug> mds = fpdoct.getDlist();
		Drug m = new Drug();  m.setFpdoct(fpdoct);
		mds.add(m);
		fpdoct.setDlist(mds);
		mv.addObject("dpform",fpdoct);
	    mv.setViewName("chatWithOldPatient");
	}
	if(op.equalsIgnoreCase("remove")){
		List<Drug> dlist=fpdoct.getDlist();
	Drug md = new Drug();
	int top = dlist.size();
	int n=top-1;
    md = dlist.get(n);
	dlist.remove(md);
	fpdoct.setDlist(dlist);
mv.addObject("dpform",fpdoct);
mv.setViewName("chatWithOldPatient");
}
return mv;
		}

public void createpdf(Student st,Doctor dr,Fpdoct fp) throws DocumentException,IOException {
       Document document = new Document();
	   OutputStream out = new FileOutputStream(new File(fp.getPlink()));
			PdfWriter.getInstance(document,out);
			document.open();
		Image img = Image.getInstance(dr.getDrphotopath()+"/"+dr.getFilename());
		document.add(img);
	document.add(new Paragraph("PUST MEDICAL CENTER" +"     "  +"Date:"+fp.getPdate()));
	document.add(new Paragraph("Doctor Name:"+dr.getName())); document.add(new Paragraph("Expertin:"+dr.getExpertint()+"(MBBS)"));
	document.add(new Paragraph("Patient Name:"+st.getName()+"   "+
	"Age::"+"    "+fp.getXpage()));
	document.add(new Paragraph("drug name"+"    "+"drug schedule"+"   "+"drug rule/condition"+"    "+"duration"));
	for(Drug d : fp.getDlist()) {
		document.add(new Paragraph(d.getNdrug()+"        "+d.getSdrug()+"      "+d.getCdrug()+"      "+d.getDdrug()));
	}
		
	document.addTitle("Prescription");
	document.close();
	out.close();	
	
}



@RequestMapping(value="/doctorsquery",method = RequestMethod.GET)
public ModelAndView DoctorsAllkindofQuery(@RequestParam("dq") String dq,@RequestParam("did") int did) {
	ModelAndView mv = new ModelAndView("onlineservice");
	if(dq.equalsIgnoreCase("listofpatient")) {
		ModelMap map = srvc.listofknockedpatient(did);
	List<Student> pInfos = (List<Student>) map.get("pids");
	List<StudPsSms> smsInfos = (List<StudPsSms>) map.get("dids");
	Object o = new Object();
	String kp = "yes";
	if(pInfos.isEmpty()) {
		kp="no";
	}
	mv.addObject("kp", kp);
	mv.addObject("pInfos",pInfos);mv.addObject("smsInfos",smsInfos);mv.addObject("listofknockedpatient", "list of patient whoknocked you");
	}
if(dq.equalsIgnoreCase("priviousrecord")) {
		List<OnlineActiveMode> acs=srvc.listofactivepatient(did);
	String pp="yes";
		if(acs.isEmpty()) {
			pp="no";
		}
		mv.addObject("acs", acs);
		mv.addObject("pp", pp);
	}
if(dq.equalsIgnoreCase("listofprescribedpatient")) {
	String pp="yes";
	List<Fpdoct> dplist=srvc.listofprescribedpatient(did);
	if(dplist.isEmpty()) {
		pp="no";
		//mv.setViewName("noprescribedpatientfound");
	}
	mv.addObject("dplist",dplist);mv.addObject("pp", pp);
}
	return mv;
}

@RequestMapping(value="/seestudinfo" , method=RequestMethod.GET)
public ModelAndView studpssms(@RequestParam("name") String name
	         ){
		 Student st = srvc.searchstudent(name);
		 ModelAndView mv = new ModelAndView("studentprofile");
		 mv.addObject("st",st);
     return mv;
   }
@RequestMapping(value="/ordermedicine" , method=RequestMethod.POST)
public  ModelAndView ordermedicine(@RequestParam("sname") String sname,
		@RequestParam("spass") String spass
		,HttpServletRequest req) {
	
	 ModelAndView mv = new  ModelAndView();
	if(srvc.verifyloginstudent(sname, spass).equals("true")) {
		int sid = srvc.getStudId(spass);
		mv.setViewName("medistore");
		HttpSession session = req.getSession();
		List<Product> list = employeeService.getallproduct();
		mv.addObject("list",list);
		session.setAttribute("sid",sid);
		session.setAttribute("sname",sname);
		session.setAttribute("spass", spass);
	}
	else {
		mv.setViewName("ordermedicine");
mv.addObject("sms","Password or Username is not match please try again");		
	}
	return mv;	

   }
@RequestMapping(value = "/addproduct", method = RequestMethod.POST)
public ModelAndView addproduct(@ModelAttribute("product") Product product
		,HttpServletRequest r) {
	ModelAndView mv = new ModelAndView();
	HttpSession s = r.getSession();
	if(checkproduct(product.getProduct_name()).equals("no")) {
		employeeService.addproduct(product);
		List<Product> products = employeeService.getallproduct();
		s.setAttribute("product",product);
		s.setAttribute("products",products);
		mv.addObject("prods",products);
		mv.setViewName("afteraddproduct");
	}
	else {
		mv.setViewName("addproduct");mv.addObject("sms","this product is already exist");
	}


return mv;
}




@RequestMapping(value = "/buy/{pid}/{buyer_id}", method = RequestMethod.GET)
public String buyproduct(@PathVariable("pid") int pid,
		@PathVariable("buyer_id") int buyer_id,
		HttpServletRequest r) {
	ItemBuy ib = new ItemBuy();
	List<ItemBuy> cart = employeeService.getallItem();
	Product product = employeeService.getproduct(pid);
	if(cart.isEmpty()) {
		ib.setItem_name(product.getProduct_name());
		ib.setItem_price(product.getPrice());
		ib.setBuyer_id(buyer_id);
		ib.setBuydate(new Date());
		ib.setQuantity(1);
		employeeService.additem(ib);
		cart.add(ib);
		
	}else {
		  if(isexist(product.getProduct_name())==1) {
				 ib = update(product.getProduct_name()); 
				cart.add(ib);
				 employeeService.updateitem(ib);
					
				 }
		  else {
				 ib.setItem_name(product.getProduct_name());
				 ib.setItem_price(product.getPrice());
				 ib.setBuyer_id(buyer_id);
				 ib.setBuydate(new Date());
				 ib.setQuantity(1);
				 employeeService.additem(ib);  
				 cart.add(ib);
			 }
	}

   r.setAttribute("cart", cart);	
 	return "continuebuying";
}





public int isexist(String pid) {
	List<ItemBuy> cart0 = employeeService.getallItem();
int n=0;
	for(ItemBuy ib1 : cart0) {
		if(ib1.getItem_name().equals(pid)) {
		  n=1;
		 break;
		}
	}
	return n;
                }

public String checkproduct(String name) {
	String exist="no";
	List<Product> prs = employeeService.getallproduct();
	for(Product pr : prs) {
		if(name.equals(pr.getProduct_name())) {
			exist="true";
			break;
		}
	}
	return exist;
}


public ItemBuy update(String pid) {
	ItemBuy ib1 = new ItemBuy();
	List<ItemBuy> cart1=employeeService.getallItem();
	for(ItemBuy ib : cart1) {
		if(ib.getItem_name().equals(pid)) {
			int q = ib.getQuantity()+1;
			ib.setQuantity(q);
			ib1=ib;
			break;
		}
}
	return ib1;
                  }


@RequestMapping(value="/removecart/{item_id}",method = RequestMethod.GET)
public String  removeCart(@PathVariable("item_id") int item_id) {
        ItemBuy ib = employeeService.getItem(item_id) ;
       if(ib.getQuantity()==1) {
    	  employeeService.deleteItem(ib);
       }
       else {
    	  int q = ib.getQuantity()-1; 
    	   ib.setQuantity(q);
    	   employeeService.updateitem(ib);
       }
    	ModelAndView mv = new ModelAndView();  
   return "continuebuying";
                   
            }

@RequestMapping(value="/pharmacyAdmin",method = RequestMethod.POST)
public ModelAndView  pharmacyadmin(@RequestParam("adminname") String adminname,
		@RequestParam("adminpass") String adminpass	
		) {
	ModelAndView mv = new ModelAndView();
	mv.setViewName("pharmacy");

       if(adminname.equals("admin5") && adminpass.equals("adminpass5")) {
    	   mv.setViewName("addproduct");
       }
         return mv;          
            }


@RequestMapping(value="/activelist",method = RequestMethod.GET)
public ModelAndView activeLIST(@RequestParam("listof") String listof ) {
 
	ModelAndView mv = new ModelAndView();
                  if(listof.equals("doctor")) {
               List<OnlineActiveMode> activedoctorlist =  srvc.activelistofdoctor();  
                  	  
                     mv.setViewName("doctorlist");
                     mv.addObject("activelistofdoctor", activedoctorlist);
                  }
                  if(listof.equals("patient")) {
                	  List<OnlineActiveMode> activedoctorlist = srvc.activelistofdoctor();                     	  
                           mv.setViewName("doctorlist");
                           mv.addObject("activelistofdoctor", activedoctorlist);
                                   
                                 }   
                   	return mv;
   } 

@RequestMapping(value="/appointment", method=RequestMethod.POST)
@ResponseBody
public String appointment(@ModelAttribute Appointment app) {
	 DateFormat dateformat = new SimpleDateFormat("yyy/MM//dd HH:mm:ss");
	 Student st = srvc.getpatientbyid(app.getReqby());
	 Doctor dr = srvc.getdoctorbyid(app.getReqto());
	Date date = new Date();
app.setReq_date(dateformat.format(date));
app.setDoctorName(dr.getName());app.setPatientname(st.getName());
srvc.reqappointment(app);
String xx = "you have just requested afor appointment .a message will be sent soon to your contact to meet the doxctor ";
	return xx;
}
@RequestMapping(value="/appointmentReqList/{did}")
//@ResponseBody
public ModelAndView reqList(@PathVariable("did") int did) {
    ModelAndView  mv = new ModelAndView("offlineservice"); 
    List<Appointment> lst = srvc.appreqlist(did);
    mv.addObject("apps",lst);
    String y = "nonull";
    if(lst.isEmpty()) {
    	y="yesull";
    }
    mv.addObject("nllval",y);
	return mv;
}
@RequestMapping(value="/confirmapp")
@ResponseBody
public String finalconfirmapp(
@ModelAttribute("App") Appointment app
	) throws MessagingException {
	Student st = srvc.getpatientbyid(app.getReqby());
	Doctor dr = srvc.getdoctorbyid(app.getReqto());
    String from = "orchidpust@gmail.com";
	String to ="ibrankhansurmi@gmail.com";

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
	msg.setSubject("appointment confirmation form pabna university of science and technology");
	msg.setFrom(new InternetAddress(from));
	String stn = app.getMeet_date()+"  "+"doctor contact::"+dr.getDrphone()+"  "+"patient Name::"+st.getName()+
			"patient email::"+st.getEmail();
	
	msg.setContent("<h1>"+stn+"</h1>","text/html");
    msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
	Transport.send(msg);
srvc.confirmappointment(app.getApp_id(), app.getMeet_date());
String success="you have successfully confirmed the appointment request of::"+"  "+
		""+st.getName()+"  "+". patient email::"+st.getEmail()+"  "+". patient_id::" +" "+st.getSid()+" "+ ". date of culsulting with you is::"
		+" "+app.getMeet_date();
		
	return success;
	
	
	
}

@RequestMapping(value="/appconfirm/{app_id}/{reqby}/{reqto}/{problem}/{contact}")
@ResponseBody
public ModelAndView appconfirm(@PathVariable("app_id") int app_id,
		@PathVariable("reqby") int reqby,
		@PathVariable("reqto") int reqto,
		@PathVariable("problem") String problem,
		@PathVariable("contact") String contact) {
	
ModelAndView  mv = new ModelAndView("confirmapp"); 
Appointment app = new Appointment(app_id,reqby,reqto,problem,contact,"fsdg");
	  mv.addObject("app",app);
	  
return mv;
}
@RequestMapping(value="/appletter/{sid}")
@ResponseBody
public ModelAndView appletter(@PathVariable("sid") int sid) {
ModelAndView  mv = new ModelAndView("appletter"); 
if(srvc.appletter(sid).isEmpty()) {
mv.setViewName("emptyappointment");

}
mv.addObject("applst",srvc.appletter(sid));
	  
return mv;
}


}
