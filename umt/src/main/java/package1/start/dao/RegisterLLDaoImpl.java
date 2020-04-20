package package1.start.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.ModelMap;

import package1.start.model.Appointment;
import package1.start.model.Blood;
import package1.start.model.ChooseAppointment;
import package1.start.model.Contest;
import package1.start.model.Doctor;
import package1.start.model.Drug;
import package1.start.model.Fpdoct;
import package1.start.model.OnlineActiveMode;
import package1.start.model.PersonalAssist;

import package1.start.model.StudPsSms;
import package1.start.model.Student;

@Repository
public class RegisterLLDaoImpl implements RegisterLLDao {
  @Autowired
    private SessionFactory sessionfactory;
  
	@Override
	public void studentreg(Student st) {
		
		sessionfactory.getCurrentSession().save(st);
		sessionfactory.getCurrentSession().flush();sessionfactory.getCurrentSession().clear();
	}

	@Override
	public void doctorreg(Doctor dr,PersonalAssist ps) {
	
		sessionfactory.getCurrentSession().save(dr);
		sessionfactory.getCurrentSession().save(ps);
		sessionfactory.getCurrentSession().flush();sessionfactory.getCurrentSession().clear();
	}

	@Override
	public void studentupdate(Student st) {
		sessionfactory.getCurrentSession().update(st);
		
	}

	@Override
	public void doctorupdate(Doctor dr) {
		PersonalAssist ps = new PersonalAssist();
		String psname="psof"+dr.getName();
		List<PersonalAssist> psl=sessionfactory.getCurrentSession().createQuery("from PersonalAssist").list();
		Doctor dr1 = (Doctor) sessionfactory.getCurrentSession().get(Doctor.class , dr.getDid());
		sessionfactory.getCurrentSession().flush();sessionfactory.getCurrentSession().clear();
		for(PersonalAssist ps1 : psl) {
			if(psname.equals(ps1.getName())) {
				ps=ps1;
				break;
			}	
			}
		dr.setPs(ps);dr.setDrphotopath(dr1.getDrphotopath());ps.setDtr(dr);
		sessionfactory.getCurrentSession().update(ps);	
		sessionfactory.getCurrentSession().update(dr);	
	}

	@Override
	public String verifyloginstudent(String uname, String password) {
	     String validity="false";
		List<Student> list = sessionfactory.getCurrentSession().createQuery("from Student").list();
		 sessionfactory.getCurrentSession().flush();sessionfactory.getCurrentSession().clear();
		for(Student st : list) {
			if(uname.equals(st.getName()) && password.equals(st.getPassword())) {
				validity="true";
				break;
			}
		}
		return validity;
	}

	@Override
	public String verifylogindoctor(String uname, String password) {
	    String validity="false";
			List<Doctor> list = sessionfactory.getCurrentSession().createQuery("from Doctor").list();
			for(Doctor dr : list) {
				if(uname.equals(dr.getName()) && password.equals(dr.getPassword())) {
					validity="true";
					break;
				}
			}
			return validity;
	}

	@Override
	public String checkuniquestudent(String name, String password) {
		String validity="true";
List<Student> list = sessionfactory.getCurrentSession().createQuery("from Student").list();
   for(Student st : list) {
	  if(name.equals(st.getName()) || password.equals(st.getPassword())) {
		  validity="false";
	  }
   }
return validity ;
	}

	@Override
	public String checkuniquedoctor(String name, String password) {
		String validity="true";
List<Doctor> list = sessionfactory.getCurrentSession().createQuery("from Doctor").list();
   for(Doctor dr : list) {
	  if(name.equals(dr.getName()) || password.equals(dr.getPassword())) {
		  validity="false";
	  }
   }
return validity ;
	}

	@Override
	public List<Doctor> getalldoctor() {
		List<Doctor> drs = new ArrayList<Doctor>();
		
		drs=sessionfactory.getCurrentSession().createQuery("from Doctor").list();
	return drs;
	
	}

	@Override
	@SuppressWarnings("unchecked")
	public void addspsmsg(StudPsSms sps,String sender) {
	
		List<StudPsSms> lst = new ArrayList<StudPsSms>();
		lst= this.sessionfactory.getCurrentSession().createQuery("from StudPsSms").list();
		int did=sps.getAid();  int sid=sps.getSid();  
	      StudPsSms latest = new StudPsSms();
		List<StudPsSms> lsttemp =new ArrayList<StudPsSms>();
	   if(lst.isEmpty()) {
	this.sessionfactory.getCurrentSession().save(sps);	
		
		}else {
			
		for(StudPsSms lst1 : lst) {
		if(lst1.getAid()==did && lst1.getSid()==sid) {
				lsttemp.add(lst1);
			  latest=lst1;
		
		}
			 
			}
			

			if(lsttemp.isEmpty()) {
				this.sessionfactory.getCurrentSession().save(sps);
			}
			
			else {
			if(sender.equals("patient")) {
			if(latest.getPssms()!=null && latest.getStudsms()==null) {
				latest.setStudsms(sps.getStudsms());
				sps=latest;
				this.sessionfactory.getCurrentSession().update(sps);
				
			}
			if(latest.getPssms()==null && latest.getStudsms()!=null) {
					this.sessionfactory.getCurrentSession().save(sps);
				
		         }
			if(latest.getPssms()!=null && latest.getStudsms()!=null) {
				
				this.sessionfactory.getCurrentSession().save(sps);
						}
	               }
			
			if(sender.equals("doctor")){
	               if(latest.getStudsms()==null && latest.getPssms()!=null) {
			        this.sessionfactory.getCurrentSession().save(sps);
					
					
				}
				if(latest.getPssms()==null && latest.getStudsms()!=null) {
					latest.setPssms(sps.getPssms());
					sps=latest;
					
					this.sessionfactory.getCurrentSession().update(sps);
				}
				if(latest.getPssms()!=null && latest.getStudsms()!=null) {
					
		this.sessionfactory.getCurrentSession().save(sps);
				}
				
				
		}	
		}
			}
		}

	

	@Override
	public Student searchstudent(String name) {
		
	List<Student> sts=sessionfactory.getCurrentSession().createQuery("from Student").list();
	Student st = new Student();	
	
		for(Student ss : sts) {
			if(name.equals(ss.getName())) {
				st=ss;
				break;
			}
		}
	return st;
	}

	@Override
	public String invalidSIDwhilesms(String password,int sid) {
	String valid="false";
	List<Student> sts =sessionfactory.getCurrentSession().createQuery("from Student").list(); 

	for(Student ss : sts) {
		if(password.equals(ss.getPassword()) && ss.getSid()==sid) {
		valid="true";
			break;
		}
	}
	return valid;
	}

	@Override
	public int getStudId(String password) {
		int id=0;
		List<Student> sts =sessionfactory.getCurrentSession().createQuery("from Student").list(); 

		for(Student ss : sts) {
			if(password.equals(ss.getPassword())) {
			  id=ss.getSid();
				break;
			                }}
	return id;
	}

	@Override
	public int getDocId(String password) {
		int id=0;
		List<Doctor> drs =sessionfactory.getCurrentSession().createQuery("from Doctor").list(); 

		for(Doctor dr : drs) {
			if(password.equals(dr.getPassword())) {
			  id=dr.getDid();
				       break;
				       
			         }}
	return id;
	}

	@Override
	public void addphotodr(String path,String filename, int did) {
		Doctor dr = new Doctor();
		PersonalAssist ps = new PersonalAssist();
		
	 dr =	(Doctor) sessionfactory.getCurrentSession().get(Doctor.class, did);
	 dr.setDrphotopath(path);dr.setFilename(filename);
	 String psname="psof"+dr.getName();
		List<PersonalAssist> psl=sessionfactory.getCurrentSession().createQuery("from PersonalAssist").list();
		for(PersonalAssist ps1 : psl) {
			if(psname.equals(ps1.getName())) {
				ps=ps1;
				break;
			}	
			}
		ps.setDtr(dr);dr.setPs(ps);
		
	 sessionfactory.getCurrentSession().update(dr); sessionfactory.getCurrentSession().update(ps);
	 sessionfactory.getCurrentSession().flush();sessionfactory.getCurrentSession().clear();
	
	}

	@Override
	public void addactive_status(OnlineActiveMode oam) {
		List<OnlineActiveMode> lst = this.sessionfactory.getCurrentSession().createQuery("from OnlineActiveMode ").list();
		this.sessionfactory.getCurrentSession().flush();this.sessionfactory.getCurrentSession().clear();	
		int exist_id=0,updatableperson_id=0;
		if(lst.isEmpty()) {
			
			this.sessionfactory.getCurrentSession().save(oam);
		}
		else {
			for(OnlineActiveMode oam1 : lst) {
				if(oam1.getPerson_id()==oam.getPerson_id()) {
					exist_id=1; updatableperson_id=oam1.getOaid();
					break;
				}
					}
			if(exist_id==0) {
				this.sessionfactory.getCurrentSession().save(oam);
			}
			else {
				oam.setOaid(updatableperson_id);
				this.sessionfactory.getCurrentSession().saveOrUpdate(oam);
				
			}
		}
		
		this.sessionfactory.getCurrentSession().flush();this.sessionfactory.getCurrentSession().clear();	
		
	}
	@Override
	public List<OnlineActiveMode> activelistofdoctor() {
		List<OnlineActiveMode> lst = this.sessionfactory.getCurrentSession().createQuery("from OnlineActiveMode").list();
		List<OnlineActiveMode> lst1 =new ArrayList<OnlineActiveMode>();
		for(OnlineActiveMode oam : lst) {
		
		if(oam.getDesignation().equalsIgnoreCase("doctor") && oam.getActive_status().equals("active")) {
			lst1.add(oam);
		}
	}
		this.sessionfactory.getCurrentSession().flush();
		this.sessionfactory.getCurrentSession().clear();	
	return lst1;			
					}

	@Override
	@SuppressWarnings("unchecked")
	public ModelMap listofknockedpatient(int did) {
		ModelMap map = new ModelMap();
		List<StudPsSms> objs = new ArrayList<StudPsSms>();
	    List<Student> objs1 = new ArrayList<Student>();
		List<StudPsSms> lst = this.sessionfactory.getCurrentSession().createQuery("from StudPsSms S where S.aid="+did).list();
		List<StudPsSms> lst2 = new ArrayList<StudPsSms>();
		int sizeoflst = lst.size(); int arr[] = new int[sizeoflst]; 
		int counter=0;
		for(StudPsSms pst : lst) {
			int temp = pst.getSid();
			int count = 0;
	     for(int a=0;a<sizeoflst;a++) {
	    	 if(arr[a]==temp) {
	    	 count++;
	     }
	     }
	    	 if(count!=0) {
	    	
	    				
	    	 }else {
	    		 lst2.add(pst);  
	    		 arr[counter]=pst.getSid();
	    		 counter++;
	    	 }
	    	   	 }
		
	
		List<Student> lststud= new ArrayList<Student>();
		for(StudPsSms ps : lst2) {
			Student st = new Student();
			st = (Student) this.sessionfactory.getCurrentSession().get(Student.class, ps.getSid());
			lststud.add(st);
		}
		//map.addAttribute("patients", lststud);map.addAttribute("didspatient",lst);
		map.put("dids", lst2);map.put("pids", lststud);
		return map;
	}

	@Override
	public Doctor getdoctorbyid(int did) {
	
	Doctor	dr = (Doctor) this.sessionfactory.getCurrentSession().get(Doctor.class,did);
		return dr;
	}

	@Override
	public Student getpatientbyid(int sid) {
		Student	st = (Student) this.sessionfactory.getCurrentSession().get(Student.class, sid);
		return st;
	}

	@Override
	public void adddpress(Fpdoct p, List<Drug> lst) {
		
		this.sessionfactory.getCurrentSession().save(p);
	}

	@Override
	public String existPrescriptionOrNot(int did, int sid) {
	List<Fpdoct> lst = this.sessionfactory.getCurrentSession().createQuery("from Fpdoct S where S.idpx="+sid).list();
	String exist="not";
	for(Fpdoct pr : lst) {
	      if(lst.isEmpty()) {
	     System.out.println("empty list");	 
	    	  break;
	  	  }else {
	    	if(pr.getIddx()==did) {
	   		exist=pr.getPlink();
	   	}  
	    	}
	     }
	System.out.println(exist);
	return exist;
	}

	@Override
	public List<Fpdoct> searchpatient(int pid) {
		List<Fpdoct> plist = this.sessionfactory.getCurrentSession().createQuery("from Fpdoct S where S.idpx="+pid).list();
		return plist;
	}

	@Override
	public List<Fpdoct> listofprescribedpatient(int did) {
		List<Fpdoct> dplist = this.sessionfactory.getCurrentSession().createQuery("from Fpdoct S where S.iddx="+did).list();
		return dplist;
	}

	@Override
	public Appointment reqappointment(Appointment app) {
		
		this.sessionfactory.getCurrentSession().save(app);
		
		return app;
	}

	@Override
	public List<Appointment> appreqlist(int did) {
		return  this.sessionfactory.getCurrentSession().createQuery("from Appointment x where x.reqto="+did).list();

	}

	@Override
	public void confirmappointment(int app_id,String meet_date) {
	    Appointment app = new Appointment();
		app = (Appointment) this.sessionfactory.getCurrentSession().get(Appointment.class,app_id);
	app.setMeet_date(meet_date);
	this.sessionfactory.getCurrentSession().update(app);
	}

	@Override
	public List<Appointment> appletter(int sid) {
		
	return  this.sessionfactory.getCurrentSession().createQuery("from Appointment a where a.reqby="+sid).list();
	
	}

	@Override
	public String createuniquepres() {
		// TODO Auto-generated method stub
		int size=0;
		String s="1";
		List<Fpdoct> lst = this.sessionfactory.getCurrentSession().createQuery("from Fpdoct").list();
		if(lst.isEmpty()) {
			
			
		}else {
		size=lst.size()+1	;
		s = Integer.toString(size);	
		}
		return s;
	}

	@Override
	public List<Drug> provideddrugs(int drug_id) {
		
	Fpdoct fp = (Fpdoct) this.sessionfactory.getCurrentSession().get(Fpdoct.class, drug_id);
	List<Drug> lst = fp.getDlist();	
	
	return lst ;
	}

	@Override
	public List<Doctor> getDoctorBydisname(String disname) {
	// Criteria crit= this.sessionfactory.getCurrentSession().createCriteria(Doctor.class);
	// crit.add(Restrictions.eq("expertint",disname));
	// List<Doctor> lst = crit.list();
	List<Doctor> lst =this.sessionfactory.getCurrentSession().createQuery("from Doctor").list();
	List<Doctor>lst2=new ArrayList<Doctor>();
	for(Doctor dr : lst) {
		if(dr.getExpertint().contains(disname)) {
			lst2.add(dr);
		}
		}
		return lst2;
	}

	@Override
	public void formblood(Blood b) {
	
		this.sessionfactory.getCurrentSession().save(b);
	}

	@Override
	public void giveTest(Contest con) {
		this.sessionfactory.getCurrentSession().save(con);
		
	}

	@Override
	public List<Contest> tests(int pid) {
		// TODO Auto-generated method stub
		 Criteria crit= this.sessionfactory.getCurrentSession().createCriteria(Contest.class);
		 crit.add(Restrictions.eq("idofp",pid));
		return crit.list();
	}

	@Override
	public List<Contest> onlinetestrecord(int did) {
		
		return this.sessionfactory.getCurrentSession().createQuery("from Contest c where c.idofd="+did).list();
	}

	@Override
	public int countappforadate(Date d,int did) {
	Criteria crit = this.sessionfactory.getCurrentSession().createCriteria(ChooseAppointment.class);
	 crit.add(Restrictions.eq("chdate",d));
		List<ChooseAppointment> lst=crit.list();
	 int count=0;
	 for(ChooseAppointment c : lst) {
		 if(did==c.getChdid()){
			 count++;
		 }
	 }
		return count+1;
	}

	@Override
	public List<ChooseAppointment> lstofchooseapp() {
		
return this.sessionfactory.getCurrentSession().createQuery("from ChooseAppointment").list();

	}

	@Override
	public void insertchapp(ChooseAppointment chp) {
		this.sessionfactory.getCurrentSession().save(chp);
		
	}

	@SuppressWarnings("unchecked")
	@Override
	  public boolean samedateduplicatepatient(int sid,int did,Date d){
		Criteria crit = this.sessionfactory.getCurrentSession().createCriteria(ChooseAppointment.class);
List<ChooseAppointment> lst = crit.add(Restrictions.eq("chdate", d)).list();
	   for(ChooseAppointment ch : lst) {
		if(ch.getChsid()==sid && ch.getChdid()==did) {
		return false;
		}
		}
	return true;
	
	}

	@Override
	public List<ChooseAppointment> lstofchooseappbyid(int id) {
	
return  this.sessionfactory.getCurrentSession().createQuery("from ChooseAppointment c where c.chsid="+id).list();
	}

	@Override
	public String nullreqtoadate(Date date, int did) {
	String y="yesnull";
	Criteria crit = this.sessionfactory.getCurrentSession().createCriteria(ChooseAppointment.class);
	List<ChooseAppointment> lst = crit.add(Restrictions.eq("chdate", date)).list();
	 for(ChooseAppointment ch : lst) {
			if(ch.getChdid()==did) {
			y="nonull";
			break;
			}
			
			}
		return y;
	}

	@Override
	public List<Fpdoct> listofprescribedpatient() {
		
return this.sessionfactory.getCurrentSession().createQuery("from Fpdoct").list();
	}

	@Override
	public List<OnlineActiveMode> listofactivepatient(int did) {
List<StudPsSms> lst=this.sessionfactory.getCurrentSession().createQuery("from StudPsSms s where s.aid="+did).list();
Criteria crit = this.sessionfactory.getCurrentSession().createCriteria(OnlineActiveMode.class);
List<OnlineActiveMode> acs = crit.add(Restrictions.eq("active_status","active")).list();
List<OnlineActiveMode> acs2 = new ArrayList<OnlineActiveMode>();
List<OnlineActiveMode> acsf = new ArrayList<OnlineActiveMode>();
for(OnlineActiveMode oa : acs) {
	if(oa.getDesignation().equalsIgnoreCase("patient")) {
		acs2.add(oa);
	}
}

for(StudPsSms sp : lst) {
	
for(OnlineActiveMode ac : acs2) {
	if(ac.getPerson_id()==sp.getSid()) {
		acsf.add(ac);
		break;
	}
}
	
	
}


return acsf;
	}

	@Override
	public List<ChooseAppointment> doctorapp(Date d) {
		
Criteria crit = this.sessionfactory.getCurrentSession().createCriteria(ChooseAppointment.class).addOrder(Order.desc("chdate"));
return crit.list();
	}
}
