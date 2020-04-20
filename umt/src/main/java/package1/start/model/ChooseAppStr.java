package package1.start.model;

import java.util.Date;

public class ChooseAppStr {


 	 private int chsid;
 	 private int chdid;
 	 private String chdate;
	public int getChsid() {
		return chsid;
	}
	public void setChsid(int chsid) {
		this.chsid = chsid;
	}
	public int getChdid() {
		return chdid;
	}
	public void setChdid(int chdid) {
		this.chdid = chdid;
	}
	public String getChdate() {
		return chdate;
	}
	public ChooseAppStr(int chsid, int chdid, String chdate) {
		super();
		this.chsid = chsid;
		this.chdid = chdid;
		this.chdate = chdate;
	}
	public void setChdate(String chdate) {
		this.chdate = chdate;
	}
	public ChooseAppStr() {
		super();
		// TODO Auto-generated constructor stub
	}
 	 
 	 
 	 
}
