package package1.start.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import package1.start.model.ItemBuy;
import package1.start.model.Product;


@Repository
public class EmployeeDAOImpl implements EmployeeDAO {

	@Autowired
	private SessionFactory sessionFactory;

	
	@Override
	public void addproduct(Product product) {
		sessionFactory.getCurrentSession().save(product);
		    
		      }

	@Override
	public Product getproduct(int pid) {
		
		return (Product) sessionFactory.getCurrentSession().get(Product.class, pid);
	}

	@Override
	public void additem(ItemBuy ib) {
		sessionFactory.getCurrentSession().save(ib);	
		
	}

	@Override
	public List<ItemBuy> getallItem() {
		
		return sessionFactory.getCurrentSession().createQuery("from ItemBuy").list();
	}

	@Override
	public void updateitem(ItemBuy ib) {
		sessionFactory.getCurrentSession().update(ib);	
			
		
	}

	@Override
	public List<Product> getallproduct() {
	
		return  sessionFactory.getCurrentSession().createQuery("from Product").list();
	}

	@Override
	public ItemBuy getItem(int item_id) {
		
		return (ItemBuy) sessionFactory.getCurrentSession().get(ItemBuy.class, item_id);
	}

	@Override
	public void deleteItem(ItemBuy ib) {
		this.sessionFactory.getCurrentSession().delete(ib);
		
	}

}