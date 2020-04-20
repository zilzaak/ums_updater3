package package1.start.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table
public class Product {

private int pid,price;
private String product_name;
@Id
@GeneratedValue(strategy=GenerationType.IDENTITY)
public int getPid() {
	return pid;
}
public void setPid(int pid) {
	this.pid = pid;
}
public int getPrice() {
	return price;
	
}
public void setPrice(int price) {
	this.price = price;
	
}
public String getProduct_name() {
	return product_name;
	
}
public void setProduct_name(String product_name) {
	this.product_name = product_name;
	
}
	
}
