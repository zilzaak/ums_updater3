package package1.start.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table
public class PersonalAssist {
private int aid;
private String psname;
private Doctor dtr;

@Id
@GeneratedValue(strategy=GenerationType.AUTO)
public int getAid() {
	return aid;
}
public void setAid(int aid) {
	this.aid = aid;
}
public String getName() {
	return psname;
}
public void setName(String psname) {
	this.psname = psname;
}
@OneToOne(mappedBy="ps",cascade=CascadeType.ALL)
public Doctor getDtr() {
	return dtr;
}
public void setDtr(Doctor dtr) {
	this.dtr = dtr;
}


}
