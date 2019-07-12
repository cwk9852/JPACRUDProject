package com.skilldistillery.jpacrudproject.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.jpacrudproject.data.TeaDAO;
import com.skilldistillery.jpacrudproject.entities.Tea;

@Controller
public class TeaController {

	@Autowired
	private TeaDAO dao;

	@RequestMapping(value = { "/", "home.do" })
	public String index(Model model) {
		List<Tea> products = dao.findAll();
		model.addAttribute("products", products);
		return "WEB-INF/index.jsp";
	}

	@RequestMapping(path = "browse.do")
	public String browse(Model model) {
		List<Tea> products = dao.findAll();
		model.addAttribute("products", products);
		return "WEB-INF/product/browse.jsp";
	}

	@RequestMapping(path = "addProduct.do")
	public String crud(Model model) {
		List<Tea> products = dao.findAll();
		model.addAttribute("products", products);
		return "WEB-INF/product/add.jsp";
	}

	@RequestMapping(path = "addProduct.do", method = RequestMethod.POST)
	public String addProduct(Model model, Tea product) {
		Tea added = dao.create(product);
		model.addAttribute("product", added);
		return "WEB-INF/product/result.jsp";
	}

	@RequestMapping(path = "updateProduct.do", params = "id", method = RequestMethod.GET)
	public String update(@RequestParam("id") Integer id, Model model) {
		Tea product = dao.findById(id);
		model.addAttribute("product", product);
		return "WEB-INF/product/update.jsp";
	}

	@RequestMapping(path = "updateProduct.do", method = RequestMethod.POST)
	public ModelAndView updateProduct(Tea product) {
		ModelAndView model = new ModelAndView();
		Tea updated = dao.update(product);
		model.addObject("product", updated);
		model.setViewName("WEB-INF/product/result.jsp");
		return model;
	}

	@RequestMapping(path = "deleteProduct.do", params = "id", method = RequestMethod.POST)
	public String deleteProduct(Model model, @RequestParam("id") Integer id) {
		Boolean updated = dao.delete(id);
		model.addAttribute("updated", updated);
		return "WEB-INF/product/result.jsp";
	}

	@RequestMapping(path = "getProduct.do", params = "id")
	public String showProduct(@RequestParam("id") Integer id, Model model) {
		Tea product = dao.findById(id);
		model.addAttribute("product", product);
		return "WEB-INF/product/result.jsp";
	}

}
