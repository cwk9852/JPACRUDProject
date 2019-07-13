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
		List<Tea> teas = em.createQuery(query, Tea.class).getResultList();
		return teas;
	}

	@Override
	public boolean update(Tea tea) {
		Tea updated = em.find(Tea.class, tea.getId());
		updated.setName(tea.getName());
		updated.setDescription(tea.getDescription());
		updated.setPrice(tea.getPrice());
		updated.setQty(tea.getQty());
		updated.setImg(tea.getImg());
		em.persist(updated);
		return true;
	}

	@Override
	public boolean deleteTea(int id) {
		Tea tea = em.find(Tea.class, id);
		tea.setCategories(null);
		tea.setSuppliers(null);
		tea.setReviews(null);
		em.remove(tea);
		return true;
	}

	@Override
	public Tea create(Tea tea) {
		em.persist(tea);
		return tea;
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
