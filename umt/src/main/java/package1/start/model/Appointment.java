package package1.start.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table
public class Appointment {
private int  app_id;
private String req_date;
private int reqby;
private int reqto;
private String problem;
private String contact;
private String meet_date;
private String patientname;
private String doctorName;
@Id
@GeneratedValue(strategy=GenerationType.IDENTITY)
public int getApp_id() {
	return app_id;
}
public void setApp_id(int app_id) {
	this.app_id = app_id;
}
public String getReq_date() {
	return req_date;
}
public void setReq_date(String req_date) {
	this.req_date = req_date;
}
public int getReqby() {
	return reqby;
}
public void setReqby(int reqby) {
	this.reqby = reqby;
}
public int getReqto() {
	return reqto;
}
public void setReqto(int reqto) {
	this.reqto = reqto;
}
public String getProblem() {
	return problem;
}
public Appointment(int app_id, int reqby, int reqto, String problem, String contact,
		String meet_date) {
	super();
	this.app_id = app_id;
	this.reqby = reqby;
	this.reqto = reqto;
	this.problem = problem;
	this.contact = contact;
	this.meet_date = meet_date;
}
public Appointment() {
	super();
	// TODO Auto-generated constructor stub
}
public String getPatientname() {
	return patientname;
}
public void setPatientname(String patientname) {
	this.patientname = patientname;
}
public String getDoctorName() {
	return doctorName;
}
public void setDoctorName(String doctorName) {
	this.doctorName = doctorName;
}
public void setProblem(String problem) {
	this.problem = problem;
}
public String getContact() {
	return contact;
}
public void setContact(String contact) {
	this.contact = contact;
}
public String getMeet_date() {
	return meet_date;
}
public void setMeet_date(String meet_date) {
	this.meet_date = meet_date;
}


}
