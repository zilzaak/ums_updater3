package package1.start.dao;

import java.util.List;

import package1.start.model.ItemBuy;
import package1.start.model.Product;

public interface EmployeeDAO {

	public void addproduct(Product product);
	public Product getproduct(int pid);
	public void additem(ItemBuy ib);
	public List<ItemBuy> getallItem();
	public void updateitem(ItemBuy ib);
	public List<Product> getallproduct();
	public ItemBuy getItem(int item_id);
	public void deleteItem(ItemBuy ib);
	
}
