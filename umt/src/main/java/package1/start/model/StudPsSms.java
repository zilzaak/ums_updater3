package package1.start.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table
public class StudPsSms {
     private int id; 
 	 private int sid,aid;
 	 private String studsms,pssms,date;
     @Id
     @GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	
	public int getSid() {
		return sid;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public int getAid() {
		return aid;
	}
	public void setAid(int aid) {
		this.aid = aid;
	}
	public String getStudsms() {
		return studsms;
	}
	public void setStudsms(String studsms) {
		this.studsms = studsms;
	}
	public String getPssms() {
		return pssms;
	}
	public void setPssms(String pssms) {
		this.pssms = pssms;
	}
	
	
	
}
