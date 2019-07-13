package com.skilldistillery.jpacrudproject.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.jpacrudproject.data.TeaDAO;
import com.skilldistillery.jpacrudproject.entities.Supplier;
import com.skilldistillery.jpacrudproject.entities.Tea;

@Controller
public class TeaController {

	@Autowired
	private TeaDAO dao;

	@RequestMapping(value = { "/", "home.do" })
	public String index(Model model) {
		List<Tea> teas = dao.findAll();
		model.addAttribute("teas", teas);
		return "WEB-INF/index.jsp";
	}

	@RequestMapping(path = "browse.do")
	public String browse(Model model) {
		List<Tea> teas = dao.findAll();
		model.addAttribute("teas", teas);
		return "WEB-INF/tea/browse.jsp";
	}

	@RequestMapping(path = "addTea.do")
	public String addTea() {
		return "WEB-INF/tea/addTea.jsp";
	}

	@RequestMapping(path = "addTea.do", method = RequestMethod.POST)
	public String addTea(Model model, Tea tea) {
		tea = dao.create(tea);
		model.addAttribute("tea", tea);
		return "WEB-INF/tea/result.jsp";
	}

	@RequestMapping(path = "addSupplier.do")
	public String addSupplier() {
		return "WEB-INF/tea/addSupplier.jsp";
	}

	@RequestMapping(path = "addSupplier.do", method = RequestMethod.POST)
	public String addSupplier(Model model, Supplier supplier) {
		supplier = dao.create(supplier);
		model.addAttribute("supplier", supplier);
		return "WEB-INF/tea/result.jsp";
	}

	@RequestMapping(path = "updateTea.do", params = "id", method = RequestMethod.GET)
	public String update(Model model, @RequestParam("id") Integer id) {
		Tea tea = dao.findById(id);
		model.addAttribute("tea", tea);
		return "WEB-INF/tea/update.jsp";
	}

	@RequestMapping(path = "updateTea.do", method = RequestMethod.POST)
	public String updatetea(Model model, Tea tea) {
		Boolean updated = dao.update(tea);
		tea = dao.findById(tea.getId());
		model.addAttribute("updated", updated);
		model.addAttribute("tea", tea);
		return "WEB-INF/tea/result.jsp";
	}

	@RequestMapping(path = "deleteTea.do", params = "id")
	public String deletetea(Model model, @RequestParam("id") Integer id) {
		Tea tea = dao.findById(id);
		Boolean deleted = dao.deleteTea(id);
		model.addAttribute("deleted", deleted);
		model.addAttribute("tea", tea);
		return "WEB-INF/tea/result.jsp";
	}

	@RequestMapping(path = "findTea.do", params = "id")
	public String showtea(Model model, @RequestParam("id") Integer id) {
		Tea tea = dao.findById(id);
		model.addAttribute("tea", tea);
		return "WEB-INF/tea/result.jsp";
	}

}
