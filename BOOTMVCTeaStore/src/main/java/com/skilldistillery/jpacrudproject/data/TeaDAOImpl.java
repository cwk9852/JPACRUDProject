package com.skilldistillery.jpacrudproject.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

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
		String query = "SELECT p FROM Product p";
		List<Tea> products = em.createQuery(query, Tea.class).getResultList();
		return products;
	}

	@Override
	public Tea update(Tea product) {
		Tea updated = em.find(Tea.class, product.getId());
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
		Tea product = em.find(Tea.class, id);
		em.remove(product);
		return true;
	}

	@Override
	public Tea create(Tea product) {
		em.persist(product);
		return product;
	}

}
