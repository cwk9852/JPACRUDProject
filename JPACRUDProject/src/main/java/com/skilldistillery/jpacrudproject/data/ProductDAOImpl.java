package com.skilldistillery.jpacrudproject.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;

import com.skilldistillery.jpacrudproject.entities.Product;

public class ProductDAOImpl implements ProductDAO {

	private EntityManagerFactory emf = Persistence.createEntityManagerFactory("TeaStore");

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
	public Product update(int id, Product product) {
		EntityManager em = emf.createEntityManager();
		em.getTransaction().begin();

		Product updated = em.find(Product.class, id);
		updated.setName(product.getName());
		updated.setDescription(product.getDescription());

		em.getTransaction().commit();
		em.close();
		return updated;
	}

	@Override
	public boolean delete(int id) {
		EntityManager em = emf.createEntityManager();
		Product product = em.find(Product.class, id);
		em.getTransaction().begin();

		em.remove(product);
		em.getTransaction().commit();
		em.close();
		return true;
	}

	@Override
	public Product create(Product product) {
		EntityManager em = emf.createEntityManager();
		em.getTransaction().begin();
		em.persist(product);
		em.flush();
		em.getTransaction().commit();
		em.close();
		return product;
	}

}
