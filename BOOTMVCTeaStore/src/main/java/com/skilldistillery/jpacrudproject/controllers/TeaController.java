package com.skilldistillery.jpacrudproject.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.jpacrudproject.data.TeaDAO;
import com.skilldistillery.jpacrudproject.entities.Category;
import com.skilldistillery.jpacrudproject.entities.Supplier;
import com.skilldistillery.jpacrudproject.entities.Tea;

@Controller
public class TeaController {

	@Autowired
	private TeaDAO dao;

	@RequestMapping(value = { "/", "index", "home.do" })
	public String index(Model model) {
		List<Tea> teas = dao.findTeas();
		model.addAttribute("teas", teas);
		return "WEB-INF/index.jsp";
	}

	@RequestMapping(path = "viewAllTea.do")
	public String viewAllTea(Model model) {
		List<Tea> teas = dao.findTeas();
		model.addAttribute("teas", teas);
		return "WEB-INF/tea/viewAllTea.jsp";
	}

	@RequestMapping(path = "viewCategories.do")
	public String viewCategories(Model model) {
		List<Category> categories = dao.findCategories();
		model.addAttribute("categories", categories);
		return "WEB-INF/tea/viewTea.jsp";
	}

	@RequestMapping(path = "addTea.do")
	public String addTea() {
		return "WEB-INF/tea/addTea.jsp";
	}

	@RequestMapping(path = "addTea.do", method = RequestMethod.POST)
	public String addTea(Model model, Tea tea) {
		tea = dao.createTea(tea);
		model.addAttribute("tea", tea);
		return "WEB-INF/tea/viewTea.jsp";
	}

	@RequestMapping(path = "addSupplier.do")
	public String addSupplier() {
		return "WEB-INF/tea/addSupplier.jsp";
	}

	@RequestMapping(path = "addSupplier.do", method = RequestMethod.POST)
	public String addSupplier(Model model, Supplier supplier) {
		supplier = dao.createSupplier(supplier);
		model.addAttribute("supplier", supplier);
		return "WEB-INF/tea/viewTea.jsp";
	}

	@RequestMapping(path = "addCategory.do")
	public String addCategory() {
		return "WEB-INF/tea/addCategory.jsp";
	}

	@RequestMapping(path = "addCategory.do", method = RequestMethod.POST)
	public String addCategory(Model model, Category category) {
		category = dao.createCategory(category);
		model.addAttribute("category", category);
		return "WEB-INF/tea/viewTea.jsp";
	}

	@RequestMapping(path = "updateTea.do", params = "id", method = RequestMethod.GET)
	public String updateTea(Model model, @RequestParam("id") Integer id) {
		Tea tea = dao.findTeaById(id);
		model.addAttribute("tea", tea);
		return "WEB-INF/tea/updateTea.jsp";
	}

	@RequestMapping(path = "updateTea.do", method = RequestMethod.POST)
	public String updateTea(Model model, Tea tea) {
		Boolean updated = dao.updateTea(tea);
		tea = dao.findTeaById(tea.getId());
		model.addAttribute("updated", updated);
		model.addAttribute("tea", tea);
		return "WEB-INF/tea/viewTea.jsp";
	}

	@RequestMapping(path = "deleteTea.do", params = "id")
	public String deleteTea(Model model, @RequestParam("id") Integer id) {
		Tea tea = dao.findTeaById(id);
		Boolean deleted = dao.deleteTea(id);
		model.addAttribute("deleted", deleted);
		model.addAttribute("tea", tea);
		return "WEB-INF/tea/viewTea.jsp";
	}

	@RequestMapping(path = "findTea.do", params = "id")
	public String findTea(Model model, @RequestParam("id") Integer id) {
		Tea tea = dao.findTeaById(id);
		model.addAttribute("tea", tea);
		return "WEB-INF/tea/viewTea.jsp";
	}

}
