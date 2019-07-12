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
		String query = "SELECT tea FROM Tea tea";
		List<Tea> products = em.createQuery(query, Tea.class).getResultList();
		return products;
	}

	@Override
	public Tea update(Tea tea) {
		Tea updated = em.find(Tea.class, tea.getId());
		updated.setName(tea.getName());
		updated.setDescription(tea.getDescription());
		updated.setPrice(tea.getPrice());
		updated.setQty(tea.getQty());
		updated.setImg(tea.getImg());
		em.persist(updated);
		return updated;
	}

	@Override
	public boolean delete(int id) {
		Tea tea = em.find(Tea.class, id);
		em.remove(tea);
		return true;
	}

	@Override
	public Tea create(Tea tea) {
		em.persist(tea);
		return tea;
	}

}
