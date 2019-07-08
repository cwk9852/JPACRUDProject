package com.skilldistillery.jpacrudproject.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.jpacrudproject.data.ProductDAO;
import com.skilldistillery.jpacrudproject.entities.Product;

@Controller
public class ProductController {

	@Autowired
	private ProductDAO dao;

	@RequestMapping(value = { "/", "home.do" })
	public String index(Model model) {
		List<Product> products = dao.findAll();
		model.addAttribute("products", products);
		return "WEB-INF/index.jsp";
	}

	@RequestMapping(path = "browse.do")
	public String browse(Model model) {
		List<Product> products = dao.findAll();
		model.addAttribute("products", products);
		return "WEB-INF/product/browse.jsp";
	}

	@RequestMapping(path = "addProduct.do")
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

	@RequestMapping(path = "updateProduct.do", params = "id", method = RequestMethod.GET)
	public String update(@RequestParam("id") Integer id, Model model) {
		System.err.println("********* update 1");
		Product product = dao.findById(id);
		model.addAttribute("product", product);
		return "WEB-INF/product/update.jsp";
	}

	@RequestMapping(path = "updateProduct.do", method = RequestMethod.GET)
	public String update(Model model, Product product) {
		System.err.println("********* update 2");
		model.addAttribute("product", product);
		return "WEB-INF/product/update.jsp";
	}

	@RequestMapping(path = "updateProduct.do", method = RequestMethod.POST)
	public ModelAndView updateProduct(Product product) {
		System.err.println("********* update 3");
		ModelAndView model = new ModelAndView();
		Product updated = dao.update(product);
		model.addObject("product", updated);
		model.setViewName("WEB-INF/product/result.jsp");
		return model;
	}

	@RequestMapping(path = "deleteProduct.do", params = "id", method = RequestMethod.POST)
	public String deleteProduct(Model model, Integer id) {
		Boolean updated = dao.delete(id);
		model.addAttribute("updated", updated);
		return "WEB-INF/product/result.jsp";
	}

	@RequestMapping(path = "getProduct.do", params = "id")
	public String showProduct(@RequestParam("id") Integer id, Model model) {
		Product product = dao.findById(id);
		model.addAttribute("product", product);
		return "WEB-INF/product/result.jsp";
	}

}
