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
		Tea tea = em.find(Tea.class, 1);
		assertEquals(1, tea.getId());
		assertEquals("Classic Chai", tea.getName());
		assertNotNull(tea.getDescription());
		assertEquals(1.99, tea.getPrice());
		assertEquals(14, tea.getQty());
		assertNotNull(tea.getImg());
	}

	@Test
	void test_Tea_has_Categories() {
		Tea tea = em.find(Tea.class, 1);
		assertEquals(3, tea.getCategories().size());

	}

	@Test
	void test_Tea_has_Suppliers() {
		Tea tea = em.find(Tea.class, 1);
		assertEquals(1, tea.getSuppliers().size());

	}

	@Test
	void test_Tea_has_Reviews() {
		Tea tea = em.find(Tea.class, 1);
		assertEquals(2, tea.getReviews().size());

	}

}
