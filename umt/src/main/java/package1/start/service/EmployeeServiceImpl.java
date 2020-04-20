package package1.start.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import package1.start.dao.EmployeeDAO;
import package1.start.model.ItemBuy;
import package1.start.model.Product;

@Service
@Transactional
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	private EmployeeDAO employeeDAO;

	@Override
	public void addproduct(Product product) {
	employeeDAO.addproduct(product);
		
	}

	@Override
	public Product getproduct(int pid) {
		
		return employeeDAO.getproduct(pid);
	}

	@Override
	public void additem(ItemBuy ib) {
	employeeDAO.additem(ib);
		
	}

	@Override
	public List<ItemBuy> getallItem() {
		
		return employeeDAO.getallItem();
	}

	@Override
	public void updateitem(ItemBuy ib) {
		employeeDAO.updateitem(ib);
		
	}

	@Override
	public List<Product> getallproduct() {
		// TODO Auto-generated method stub
		return employeeDAO.getallproduct();
	}

	@Override
	public ItemBuy getItem(int item_id) {
	
		return employeeDAO.getItem(item_id);
	
	}

	@Override
	public void deleteItem(ItemBuy ib) {
		employeeDAO.deleteItem(ib);
		
	}

}
