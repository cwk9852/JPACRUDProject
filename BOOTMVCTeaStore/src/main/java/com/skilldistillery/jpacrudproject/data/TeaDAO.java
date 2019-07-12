package com.skilldistillery.jpacrudproject.data;

import java.util.List;

import com.skilldistillery.jpacrudproject.entities.Tea;

public interface TeaDAO {

	public Tea findById(int id);

	public List<Tea> findAll();

	public Tea update(Tea product);

	public boolean delete(int id);

	public Tea create(Tea product);

}
