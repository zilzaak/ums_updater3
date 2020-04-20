package package1.start.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table
public class Contest{
	private int testId;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
public int getTestId() {
		return testId;
	}
	public void setTestId(int testId) {
		this.testId = testId;
	}
private int idofp;
private int idofd;
private String nameofd;
private String nameofp;
private String testname;
public int getIdofp() {
	return idofp;
}
public void setIdofp(int idofp) {
	this.idofp = idofp;
}
public int getIdofd() {
	return idofd;
}
public void setIdofd(int idofd) {
	this.idofd = idofd;
}
public String getNameofd() {
	return nameofd;
}
public void setNameofd(String nameofd) {
	this.nameofd = nameofd;
}
private String date;

public String getNameofp() {
	return nameofp;
}
public void setNameofp(String nameofp) {
	this.nameofp = nameofp;
}
public String getTestname() {
	return testname;
}
public void setTestname(String testname) {
	this.testname = testname;
}
public String getDate() {
	return date;
}
public void setDate(String date) {
	this.date = date;
}


}
