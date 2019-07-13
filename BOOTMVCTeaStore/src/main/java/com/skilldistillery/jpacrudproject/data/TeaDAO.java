package com.skilldistillery.jpacrudproject.data;

import java.util.List;

import com.skilldistillery.jpacrudproject.entities.Review;
import com.skilldistillery.jpacrudproject.entities.Supplier;
import com.skilldistillery.jpacrudproject.entities.Tea;

public interface TeaDAO {

	public Tea findById(int id);

	public List<Tea> findAll();

	public boolean update(Tea product);

	public boolean deleteTea(int id);

	public Tea create(Tea product);

	public Supplier create(Supplier supplier);
	
	public Review create(Review review);

}
