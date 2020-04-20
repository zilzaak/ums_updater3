package package1.start.dao;

import java.util.Date;
import java.util.List;

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

public interface RegisterLLDao {
	 public void formblood(Blood b);
	public void studentreg(Student st);
	public void doctorreg(Doctor dr,PersonalAssist ps);
	public void studentupdate(Student st);
	public void doctorupdate(Doctor dr);
	public String checkuniquestudent(String name , String password);
	public String checkuniquedoctor(String name , String password);
	public String verifyloginstudent(String uname,String password);
	public String verifylogindoctor(String uname,String password);
	public List<Doctor> getalldoctor();
	public void addspsmsg(StudPsSms sps,String sender);
	public Student searchstudent(String name);
	public String invalidSIDwhilesms(String password,int sid);
	public int getStudId(String password);
	public int getDocId(String password);
	public void addphotodr(String path,String filename, int did);
	public void addactive_status(OnlineActiveMode oam);
    public List<OnlineActiveMode> activelistofdoctor();
    public ModelMap listofknockedpatient(int did);
    public Doctor getdoctorbyid(int did);
	public Student getpatientbyid(int sid);
	public String existPrescriptionOrNot(int did,int sid);
	public void adddpress(Fpdoct p ,List<Drug> lst);
	public List<Fpdoct> searchpatient(int pid);
	public List<Fpdoct> listofprescribedpatient(int did);
	public List<Fpdoct> listofprescribedpatient();
	public Appointment reqappointment(Appointment app);
	public List<Appointment> appreqlist(int did);
	public void confirmappointment(int app_id,String meet_date);
	public List<Appointment> appletter(int sid);
	public String createuniquepres();
	public List<Drug> provideddrugs(int drug_id);
	public List<Doctor> getDoctorBydisname(String disname);
	public void giveTest(Contest con);
	public List<Contest> tests(int pid);
	public List<Contest> onlinetestrecord(int did);
	public int countappforadate(Date d,int did);
	public List<ChooseAppointment> lstofchooseapp();
	public void insertchapp(ChooseAppointment chp);
	public boolean samedateduplicatepatient(int sid,int did,Date d);	   
	public List<ChooseAppointment> lstofchooseappbyid(int id);
    public String nullreqtoadate(Date date,int did);
	public List<OnlineActiveMode> listofactivepatient(int did);
	 public List<ChooseAppointment> doctorapp(Date d);
}
