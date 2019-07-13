package com.skilldistillery.jpacrudproject.data;

import java.util.List;

import com.skilldistillery.jpacrudproject.entities.Category;
import com.skilldistillery.jpacrudproject.entities.Review;
import com.skilldistillery.jpacrudproject.entities.Supplier;
import com.skilldistillery.jpacrudproject.entities.Tea;

public interface TeaDAO {

	public Tea findTeaById(int id);

	public List<Tea> findTeas();
	
	public List<Category> findCategories();

	public boolean updateTea(Tea tea);

	public boolean deleteTea(int id);

	public Tea createTea(Tea tea);

	public Supplier createSupplier(Supplier tea);
	
	public Review createReview(Review review);

	public Category createCategory(Category category);

}
