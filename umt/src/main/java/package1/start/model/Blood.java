package package1.start.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table
public class Blood {
private int blood_id;
private String uname;
private String user_status;
private int userid;
private String bgroop;
private String cellno;
private String sold;

public String getSold() {
	return sold;
}
public void setSold(String sold) {
	this.sold = sold;
}
@Id
@GeneratedValue(strategy=GenerationType.IDENTITY)
public int getBlood_id() {
	return blood_id;
}
public void setBlood_id(int blood_id) {
	this.blood_id = blood_id;
}
public String getUser_status() {
	return user_status;
}
public void setUser_status(String user_status) {
	this.user_status = user_status;
}
public int getUserid() {
	return userid;
}
public void setUserid(int userid) {
	this.userid = userid;
}
public String getCellno() {
	return cellno;
}
public void setCellno(String cellno) {
	this.cellno = cellno;
}
public Date getDate() {
	return date;
}
public void setDate(Date date) {
	this.date = date;
}
private Date date;
public String getUname() {
	return uname;
}
public void setUname(String uname) {
	this.uname = uname;
}
public String getBgroop() {
	return bgroop;
}

public void setBgroop(String bgroop) {
	this.bgroop = bgroop;
}

}
