package package1.start.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;


import package1.start.model.Blood;
import package1.start.model.Contest;
import package1.start.model.Dochelper;
import package1.start.model.Doctor;
import package1.start.model.Fpdoct;
import package1.start.model.PersonalAssist;
import package1.start.service.RegisterLLService;

@Controller
public class Jaxpostcall {
	@Autowired 
	    private  RegisterLLService srvc3;
	@RequestMapping(value="/pathtosave",method=RequestMethod.POST,
			consumes=MediaType.APPLICATION_JSON_VALUE,produces=MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Blood> savetopath(@RequestBody Blood blood){
		srvc3.formblood(blood);
System.out.println(blood.getBgroop()+blood.getUname());
		return new ResponseEntity<Blood>(blood,HttpStatus.OK);
	}
	
	
	
	
	@RequestMapping(value="/givetest", method=RequestMethod.POST,
			consumes=MediaType.APPLICATION_JSON_VALUE,produces=MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Contest>   pathofsuggest(@RequestBody Contest con){
			Doctor dr = srvc3.getdoctorbyid(con.getIdofd())	;
			con.setNameofd(dr.getName());
			srvc3.giveTest(con);
System.out.println(con.getNameofp()+con.getTestname()+con.getDate()+con.getIdofd()+con.getIdofp()+"doctor name:");
return new ResponseEntity<Contest>(con,HttpStatus.OK);
			}	

	@RequestMapping(value="/testcon/{did}/{pid}",method=RequestMethod.GET)
	public ModelAndView  givetest(@PathVariable("did") int giver,@PathVariable("pid") int accepter) {
		
		ModelAndView mv = new ModelAndView("givecon");
		mv.addObject("giver",giver);mv.addObject("accepter",accepter);
		
	return mv;	
	}
	
	@RequestMapping(value="/testinfo/{pid}",method=RequestMethod.GET)
	public ModelAndView  testinfo(@PathVariable("pid") int pid) {
		ModelAndView mv = new ModelAndView("medicaltest");
		List<Contest> tests = srvc3.tests(pid);
		mv.addObject("tests",tests);
		System.out.println("xxxxxxxxxxxxxxxxxxxxxxxxxxxxx"+pid);
	return mv;	
	}
	
	@RequestMapping(value="/testrecord/{aid}",method=RequestMethod.GET)
	public ModelAndView  testrecord(@PathVariable int aid) {
		ModelAndView mv = new ModelAndView("testrecord");
		List<Contest> tests = srvc3.onlinetestrecord(aid);
		mv.addObject("tests",tests);
		for(Contest cn : tests) {
			System.out.println(cn.getDate()+cn.getTestname()+cn.getNameofd());
		}
		System.out.println("docotr id is"+aid);
	return mv;	
	}
	
	@RequestMapping(value="/allontreatment")
	public ModelAndView  allonlinepresrecord() {
		ModelAndView mv = new ModelAndView("searchpatientrecord");
		List<Fpdoct> fpform = srvc3.listofprescribedpatient();
		mv.addObject("fpform",fpform);
		String nullfpform="no";
		if(fpform.isEmpty()) {
			nullfpform="yes";
		}
		mv.addObject("nullfpform",nullfpform);
		return mv;	
	}
	
	
	
}
