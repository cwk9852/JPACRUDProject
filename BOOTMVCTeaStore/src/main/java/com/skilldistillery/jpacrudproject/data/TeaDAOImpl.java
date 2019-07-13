package com.skilldistillery.jpacrudproject.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.jpacrudproject.entities.Review;
import com.skilldistillery.jpacrudproject.entities.Supplier;
import com.skilldistillery.jpacrudproject.entities.Tea;

@Transactional
@Service
public class TeaDAOImpl implements TeaDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public Tea findById(int id) {
		return em.find(Tea.class, id);
	}

	@Override
	public List<Tea> findAll() {
		String query = "SELECT tea FROM Tea tea";
		List<Tea> products = em.createQuery(query, Tea.class).getResultList();
		return products;
	}

	@Override
	public boolean update(Tea product) {
		Tea updated = em.find(Tea.class, product.getId());
		updated.setName(product.getName());
		updated.setDescription(product.getDescription());
		updated.setPrice(product.getPrice());
		updated.setQty(product.getQty());
		updated.setImg(product.getImg());
		em.persist(updated);
		return true;
	}

	@Override
	public boolean deleteTea(int id) {
		Tea product = em.find(Tea.class, id);
		em.remove(product);
		return true;
	}

	@Override
	public Tea create(Tea product) {
		em.persist(product);
		return product;
	}

	@Override
	public Supplier create(Supplier supplier) {
		em.persist(supplier);
		return supplier;
	}

	@Override
	public Review create(Review review) {
		em.persist(review);
		return review;
	}

}
