package com.skilldistillery.jpacrudproject.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.jpacrudproject.entities.Product;

@Transactional
@Service
public class ProductDAOImpl implements ProductDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public Product findById(int id) {
		return em.find(Product.class, id);
	}

	@Override
	public List<Product> findAll() {
		String query = "SELECT p FROM Product p";
		List<Product> products = em.createQuery(query, Product.class).getResultList();
		return products;
	}

	@Override
	public Product update(Product product) {
		Product updated = em.find(Product.class, product.getId());
		updated.setName(product.getName());
		updated.setDescription(product.getDescription());
		updated.setPrice(product.getPrice());
		updated.setQty(product.getQty());
		updated.setImg(product.getImg());
		em.persist(updated);
		return updated;
	}

	@Override
	public boolean delete(int id) {
		Product product = em.find(Product.class, id);
		em.remove(product);
		return true;
	}

	@Override
	public Product create(Product product) {
		em.persist(product);
		return product;
	}

}
