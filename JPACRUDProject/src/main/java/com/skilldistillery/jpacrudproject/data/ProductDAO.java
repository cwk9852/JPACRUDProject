package com.skilldistillery.jpacrudproject.data;

import java.util.List;

import com.skilldistillery.jpacrudproject.entities.Product;

public interface ProductDAO {

	public Product findById(int id);

	public List<Product> findAll();

	public Product update(int id, Product product);

	public boolean delete(int id);
	
	public Product create(Product product);

}
