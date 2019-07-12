package com.skilldistillery.jpacrudproject.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class TeaTest {
	private static EntityManagerFactory emf;
	private EntityManager em;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("TeaStore");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
	}

	@Test
	void test_Tea_mappings() {
		Tea product = em.find(Tea.class, 1);
		assertEquals(1, product.getId());
		assertEquals("Classic Chai", product.getName());
		assertNotNull(product.getDescription());
		assertEquals(1.99, product.getPrice());
		assertEquals(14, product.getQty());
		assertNotNull(product.getImg());
	}

	@Test
	void test_Tea_has_Categories() {
		Tea product = em.find(Tea.class, 1);
		assertEquals(3, product.getCategories().size());

	}

	@Test
	void test_Tea_has_Suppliers() {
		Tea product = em.find(Tea.class, 1);
		assertEquals(2, product.getSuppliers().size());

	}
	
	@Test
	void test_Tea_has_Reviews() {
		Tea product = em.find(Tea.class, 1);
		assertEquals(2, product.getReviews().size());
		
	}
	
	

}
