package package1.start.model;

import java.util.Date;

public class SholdItem {
private int shid;
private String BuyerId;
private String nameOfpro,quantity,price;
private Date date;
public int getShid() {
	return shid;
}
public void setShid(int shid) {
	this.shid = shid;
}
public String getBuyerId() {
	return BuyerId;
}
public void setBuyerId(String buyerId) {
	BuyerId = buyerId;
}
public String getNameOfpro() {
	return nameOfpro;
}
public void setNameOfpro(String nameOfpro) {
	this.nameOfpro = nameOfpro;
}
public String getQuantity() {
	return quantity;
}
public void setQuantity(String quantity) {
	this.quantity = quantity;
}
public String getPrice() {
	return price;
}
public void setPrice(String price) {
	this.price = price;
}
public Date getDate() {
	return date;
}
public void setDate(Date date) {
	this.date = date;
}

}
