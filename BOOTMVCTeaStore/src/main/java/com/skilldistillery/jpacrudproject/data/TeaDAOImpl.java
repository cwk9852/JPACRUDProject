package com.skilldistillery.jpacrudproject.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.jpacrudproject.entities.Category;
import com.skilldistillery.jpacrudproject.entities.Review;
import com.skilldistillery.jpacrudproject.entities.Supplier;
import com.skilldistillery.jpacrudproject.entities.Tea;

@Transactional
@Service
public class TeaDAOImpl implements TeaDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public Tea findTea(int id) {
		return em.find(Tea.class, id);
	}

	@Override
	public List<Tea> findTeas() {
		String query = "SELECT tea FROM Tea tea";
		List<Tea> teas = em.createQuery(query, Tea.class).getResultList();
		return teas;
	}

	public List<Category> findCategories() {
		String query = "SELECT cat FROM Category cat";
		List<Category> categories = em.createQuery(query, Category.class).getResultList();
		return categories;
	}
	
	@Override
	public List<Tea> findTeaByKeyword(String keyword) {
		String query = "SELECT tea FROM Tea tea WHERE tea.description = :keyword";
		List<Tea> teas = em.createQuery(query, Tea.class).setParameter("keyword", "%" + keyword + "%" ).getResultList();
		return teas;
	}

	@Override
	public Category findCategoryByName(String category) {
		String query = "SELECT category FROM Category category WHERE category.name = :category";
		Category cat = em.createQuery(query, Category.class).setParameter("category", category).getSingleResult();
		return cat;
	}

	@Override
	public boolean updateTea(Tea tea) {
		Tea updated = em.find(Tea.class, tea.getId());
		updated.setName(tea.getName());
		updated.setDescription(tea.getDescription());
		updated.setPrice(tea.getPrice());
		updated.setQty(tea.getQty());
		updated.setImg(tea.getImg());
		updated.setReviews(tea.getReviews());
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
	public Tea createTea(Tea tea) {
		em.persist(tea);
		return tea;
	}

	@Override
	public Review createReview(Review review) {
		em.persist(review);
		return review;
	}

	@Override
	public List<Supplier> findSuppliers() {
		String query = "SELECT sup FROM Supplier sup";
		List<Supplier> suppliers = em.createQuery(query, Supplier.class).getResultList();
		return suppliers;
	}

	@Override
	public void addCategoriesById(Tea tea, Integer[] categoryIds) {
		for (Integer cid : categoryIds) {
			tea.addCategory(em.find(Category.class, cid));
		}
		
	}

	
	@Override
	public void addSuppliersById(Tea tea, Integer[] supplierIds) {
		for (Integer cid : supplierIds) {
			tea.addSupplier(em.find(Supplier.class, cid));
		}
		
	}

}
