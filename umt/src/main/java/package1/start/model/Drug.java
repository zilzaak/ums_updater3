package package1.start.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table
public class Drug {

	private int drugid;
	private Fpdoct fpdoct;
	private String sdrug;
	private String ddrug;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getDrugid() {
		return drugid;
	}
	public void setDrugid(int drugid) {
		this.drugid = drugid;
	}
	
	@ManyToOne
	@JoinColumn(name="drug_id_fk")
	public Fpdoct getFpdoct() {
		return fpdoct;
	}
	public void setFpdoct(Fpdoct fpdoct) {
		this.fpdoct = fpdoct;
	}
	public String getSdrug() {
		return sdrug;
	}
	public void setSdrug(String sdrug) {
		this.sdrug = sdrug;
	}
	public String getDdrug() {
		return ddrug;
	}
	public void setDdrug(String ddrug) {
		this.ddrug = ddrug;
	}
	public String getCdrug() {
		return cdrug;
	}
	public void setCdrug(String cdrug) {
		this.cdrug = cdrug;
	}
	public String getNdrug() {
		return ndrug;
	}
	public void setNdrug(String ndrug) {
		this.ndrug = ndrug;
	}
	private String cdrug;
	private String ndrug;
}
