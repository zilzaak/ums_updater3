package package1.start.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table
public class Doctor {
 
private int did; 
private int drphone;
 private String name,age,degree,
 expertint,password,schedule,day,
 drphotopath,filename;
 
   private PersonalAssist ps;	
  
   public String getFilename() {
	return filename;
}
public void setFilename(String filename) {
	this.filename = filename;
}

  public String getDay() {
	return day;
}
public void setDay(String day) {
	this.day = day;
}
public String getSchedule() {
	return schedule;
}
public void setSchedule(String schedule) {
	this.schedule = schedule;
}

public int getDrphone() {
	return drphone;
}
public void setDrphone(int drphone) {
	this.drphone = drphone;
}
public String getDrphotopath() {
	return drphotopath;
}
public void setDrphotopath(String drphotopath) {
	this.drphotopath = drphotopath;
}
public String getPassword() {
		return password;
	}
@OneToOne(cascade=CascadeType.ALL,fetch=FetchType.EAGER)
@JoinColumn(name="psid")
	public PersonalAssist getPs() {
	return ps;
}
public void setPs(PersonalAssist ps) {
this.ps = ps;
}
	public void setPassword(String password) {
		this.password = password;
	}
@Id
@GeneratedValue(strategy=GenerationType.AUTO)
	public int getDid() {
		return did;
	}
	public void setDid(int did) {
		this.did = did;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getDegree() {
		return degree;
	}
	public void setDegree(String degree) {
		this.degree = degree;
	}
	public String getExpertint() {
		return expertint;
	}
	public void setExpertint(String expertint) {
		this.expertint = expertint;
	}
	
	
	
}
