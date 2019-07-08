package com.skilldistillery.jpacrudproject.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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

	@RequestMapping(path = "/browse")
	public String browse(Model model) {
		List<Product> products = dao.findAll();
		model.addAttribute("products", products);
		return "WEB-INF/product/browse.jsp";
	}

	@RequestMapping(path = "/add")
	public String crud(Model model) {
		List<Product> products = dao.findAll();
		model.addAttribute("products", products);
		return "WEB-INF/product/add.jsp";
	}

	@RequestMapping(path = "addProduct.do", method = RequestMethod.POST)
	public String addProduct(Model model, Product product) {
		Product added = dao.create(product);
		model.addAttribute("product", added);
		return "WEB-INF/product/result.jsp";
	}
	@RequestMapping(path = "/update", method = RequestMethod.GET)
	public String update(Model model) {
		List<Product> products = dao.findAll();
		model.addAttribute("products", products);
		return "WEB-INF/product/update.jsp";
	}
	
	@RequestMapping(path = "updateProduct.do", method = RequestMethod.POST)
	public String updateProduct(Model model, Product product) {
		Product updated = dao.update(product.getId(), product);
		model.addAttribute("product", updated);
		return "WEB-INF/product/result.jsp";
	}
	
	@RequestMapping(path = "deleteProduct.do", method = RequestMethod.POST)
	public String deleteProduct(Model model, int id) {
		Boolean updated = dao.delete(id);
		model.addAttribute("updated", updated);
		return "WEB-INF/product/result.jsp";
	}

	@RequestMapping(path = "getProduct.do", params = "pid")
	public String showProduct(@RequestParam("pid") Integer pid, Model model) {
		Product product = dao.findById(pid);
		model.addAttribute("product", product);
		return "WEB-INF/product/result.jsp";
	}

}
