package package1.start.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table
public class Fpdoct {

	private int fpid;
	private int iddx;
	private int idpx;
	private List<Drug> dlist;
	private String xpname;
	@Column(nullable=true)
	private int xpage;
	private String tdisease;
	private String pdate; 
	private String plink; 
	public String getPdate() {
		return pdate;
	}
	public void setPdate(String pdate) {
		this.pdate = pdate;
	}
	public String getPlink() {
		return plink;
	}
	public void setPlink(String plink) {
		this.plink = plink;
	}
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getFpid() {
		return fpid;
	}
	public void setFpid(int fpid) {
		this.fpid = fpid;
	}
	public int getIddx() {
		return iddx;
	}
	public void setIddx(int iddx) {
		this.iddx = iddx;
	}
	public int getIdpx() {
		return idpx;
	}
	public void setIdpx(int idpx) {
		this.idpx = idpx;
	}
	
	@OneToMany(targetEntity=Drug.class,cascade=CascadeType.ALL,mappedBy="fpdoct",fetch=FetchType.EAGER)
	public List<Drug> getDlist() {
		return dlist;
	}
	public void setDlist(List<Drug> dlist) {
		this.dlist = dlist;
	}
	public String getXpname() {
		return xpname;
	}
	public void setXpname(String xpage) {
		this.xpname = xpage;
	}
	
	public int getXpage() {
		return xpage;
	}
	public void setXpage(int xpage) {
		this.xpage = xpage;
	}
	public String getTdisease() {
		return tdisease;
	}
	public void setTdisease(String tdisease) {
		this.tdisease = tdisease;
	}

	
}
