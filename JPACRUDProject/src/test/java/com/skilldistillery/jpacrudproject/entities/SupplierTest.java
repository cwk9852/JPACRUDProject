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

class SupplierTest {
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
	void test_Supplier_mappings() {
		Supplier supplier = em.find(Supplier.class, 1);
		assertEquals(1, supplier.getId());
		assertEquals("Cruddy Tea Supplier", supplier.getName());
		assertNotNull(supplier.getDateAcquired());
	}

	@Test
	void test_Supplier_has_Teas() {
		Supplier supplier = em.find(Supplier.class, 1);
		assertEquals(3, supplier.getTeas().size());
	}

}
