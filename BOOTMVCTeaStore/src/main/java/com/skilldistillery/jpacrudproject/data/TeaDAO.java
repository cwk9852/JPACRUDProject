package com.skilldistillery.jpacrudproject.data;

import java.util.List;

import com.skilldistillery.jpacrudproject.entities.Category;
import com.skilldistillery.jpacrudproject.entities.Review;
import com.skilldistillery.jpacrudproject.entities.Tea;

public interface TeaDAO {

	public Tea findTea(int id);

	public List<Tea> findTeas();

	public List<Tea> findTeaByKeyword(String keyword);

	public List<Category> findCategories();

	public Category findCategoryByName(String category);

	public boolean updateTea(Tea tea);

	public boolean deleteTea(int id);

	public Tea createTea(Tea tea);

	public Review createReview(Review review);

}