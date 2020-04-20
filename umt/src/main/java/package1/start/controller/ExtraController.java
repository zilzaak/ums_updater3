package package1.start.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import package1.start.model.Dochelper;
import package1.start.model.Doctor;
import package1.start.model.PersonalAssist;
import package1.start.service.RegisterLLService;

@Controller
@RequestMapping("/regex")
public class ExtraController {
	
	  @Autowired 
	    private  RegisterLLService srv;
	@RequestMapping("/")
	
	public String gogame(){
		
	return "game";
		}
	
	@RequestMapping(value="/regadoc", method=RequestMethod.POST,
			consumes=MediaType.APPLICATION_JSON_VALUE,
			produces=MediaType.APPLICATION_JSON_VALUE
			)
 
	public ResponseEntity<Dochelper>  getgame(@RequestBody Dochelper dr ){
		PersonalAssist ps = new PersonalAssist();
		if(srv.checkuniquedoctor(dr.getName(),dr.getPass()).equals("true")) {
			Doctor dc = new Doctor();dr.setMsg("yes");
			String pn=dr.getPhone();
			dc.setAge(dr.getAge());dc.setDay(dr.getDay());
			dc.setDegree(dr.getDegree());dc.setDrphone(Integer.parseInt(pn));
			dc.setExpertint(dr.getExpertin());dc.setSchedule(dr.getSchedule());
			dc.setName(dr.getName());dc.setPassword(dr.getPass());
			//srv.doctorreg(dc,ps);
			
			
			}
		return new ResponseEntity<Dochelper>(dr,HttpStatus.OK);
	}
	@RequestMapping(value="/reg", method=RequestMethod.POST,
			consumes=MediaType.APPLICATION_JSON_VALUE,
			produces=MediaType.APPLICATION_JSON_VALUE)
		public ResponseEntity<Dochelper> doctorregistration(@RequestBody Dochelper dr) 
			
			{
				
				
				//PersonalAssist ps = new PersonalAssist();
				
				//if(srvc3.checkuniquedoctor(dr.getName(),dr.getPassword()).equals("true")) {
					//Doctor dc = new Doctor();
					//dc.setAge(dr.getAge());dc.setDay(dr.getDay());
					//dc.setDegree(dr.getDegree());dc.setDrphone(dr.getDrphone());
					//dc.setExpertint(dr.getExpertint());dc.setSchedule(dr.getSchedule());
					//dc.setName(dr.getName());dc.setPassword(dr.getPassword());
					//dr.setMsg("done");
					//srvc3.doctorreg(dc,ps);
				
			//	mv.setViewName("afterregdoctor");
				
				//}else {
				//dr.setMsg("fail");
					
				//}
				System.out.println("vhgftdrshgfytfgsdgsrfgfgf");
			//session.setAttribute("did",dr.getDid());
			 return new ResponseEntity<Dochelper>(dr,HttpStatus.OK);
			}
	
	
}
