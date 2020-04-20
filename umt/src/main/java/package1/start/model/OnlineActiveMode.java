package package1.start.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table
public class OnlineActiveMode {

	private int oaid;
	private int person_id;
	private String designation;
	private String active_status;
	private String name;
	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	
	public int getOaid() {
		return oaid;
	}


	public void setOaid(int oaid) {
		this.oaid = oaid;
	}


	public OnlineActiveMode() {
		
		
	}
	
	
	public int getPerson_id() {
		return person_id;
	}
	public OnlineActiveMode(int person_id, String designation, String active_status,String name) {
		this.person_id = person_id;
		this.designation = designation;
	this.active_status = active_status;
	    this.name =name;	
	}
	public void setPerson_id(int person_id) {
		this.person_id = person_id;
	}
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	public String getActive_status() {
		return active_status;
	}
	public void setActive_status(String active_status) {
		this.active_status = active_status;
	}
	
	
}
