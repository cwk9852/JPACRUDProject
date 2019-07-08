package com.skilldistillery.jpacrudproject.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.jpacrudproject.data.ProductDAO;
import com.skilldistillery.jpacrudproject.entities.Product;

@Controller
public class ProductController {
	
	@Autowired
	private ProductDAO dao;
	
	@RequestMapping(path = "/")
	public String index(Model model) {
		List<Product> products = dao.findAll();
		model.addAttribute("products", products);
		return "WEB-INF/index.jsp";
	}

	@RequestMapping(path = "getProduct.do", params="pid")
	public String showFilm(@RequestParam("pid") Integer pid, Model model) {
		Product product = dao.findById(pid);
		model.addAttribute("product", product);
		return "WEB-INF/product/result.jsp";
	}

}
