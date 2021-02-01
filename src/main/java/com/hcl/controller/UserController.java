package com.hcl.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hcl.model.Product;
import com.hcl.model.User;
import com.hcl.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService service;

	@GetMapping("/home")
	public ModelAndView getHome() {
		return new ModelAndView("homepage");
	}

	@GetMapping("/registration")
	public ModelAndView getRegistration() {
		System.out.println("----------------------hereeeee---------------");
		User e = new User();
		return new ModelAndView("registerform", "reg", e);
	}

	@PostMapping("/registration")
	public ModelAndView postRegistration(@ModelAttribute("emp") User emp) {
		try {

			emp.setRole("USER");
			service.saveUser(emp);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return new ModelAndView("registered", "correctemp", emp);
	}

	@GetMapping("/login")
	public ModelAndView getLogin() {
		return new ModelAndView("loginform");
	}

	@PostMapping("/login")
	public ModelAndView postLogin(@RequestParam String username, @RequestParam String password,
			HttpServletRequest request) {
		System.out.println("top*****************************************************");
		List<User> emps = service.findAllUsers();
		System.out.println("userssssssssssssssssss: " + emps);
		for (User e : emps) {
			if (e.getUsername().equals(username) && e.getPassword().equals(password)) {
				if (e.getRole().equals("ADMIN")) {
					request.getSession().setAttribute("user", e);
					return new ModelAndView("/adminhomepage");
				}
				List<Product> cart = new ArrayList<>();
				request.getSession().setAttribute("cart", cart);
				request.getSession().setAttribute("user", e);
				return new ModelAndView("welcome", "correctemp", e);
			}
		}
		return new ModelAndView("wrong");
	}

	@GetMapping("/logout")
	public ModelAndView getLogout(HttpServletRequest request) {
		request.getSession().invalidate();
		return new ModelAndView("redirect:/home");
	}

	@GetMapping("/checkingout")
	public ModelAndView getCheckoutPage(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView("address");
		User user = (User) request.getSession().getAttribute("user");
		if (user == null) {
			return new ModelAndView("needslogin");
		}
		mav.addObject("edittsk", user);
		return mav;
	}

	@PostMapping("/checkingout")
	public ModelAndView postCheckoutPage(@ModelAttribute("User") User user, HttpServletRequest request) {
		List<Product> cart = new ArrayList<>();
		request.getSession().setAttribute("cart", cart);
		service.saveUser(user);
		return new ModelAndView("successfulshop");
	}

	@GetMapping("/adminhomepage")
	public ModelAndView goHomePage(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		if (user == null) {
			return new ModelAndView("needslogin");
		}
		return new ModelAndView("adminhomepage");
	}

	@GetMapping("/adminuserslist")
	public ModelAndView adminListUsers(HttpServletRequest request) {
		// List<Employee> allemps = (List<Employee>) repo.findAll();
		User user = (User) request.getSession().getAttribute("user");
		if (user == null) {
			return new ModelAndView("needslogin");
		}
		System.out.println("----------1)inside listTsk");
		List<User> alltsks = (List<User>) service.findAllUsers();
		System.out.println("----------2)inside listTsk");
		return new ModelAndView("adminusers", "tasks", alltsks);

	}

	@GetMapping("/adminuseradd")
	public ModelAndView addnewUser(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		if (user == null) {
			return new ModelAndView("needslogin");
		}
		User t1 = new User();
		return new ModelAndView("adminaddnewuser", "form", t1); // model attribure<form:form modelAttribute="form">
	}

	@PostMapping("/adminuseradd")
	public String newUser(User tsk) {
		service.saveUser(tsk);
		return ("redirect:/adminuserslist");
	}

	@GetMapping("/adminusersedit/{id}")
	public ModelAndView getEditingUser(@PathVariable("id") long id, HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		if (user == null) {
			return new ModelAndView("needslogin");
		}
		ModelAndView mav = new ModelAndView("adminedituser");
		try {
			User tsk = service.findUserById(id).get();
			mav.addObject("edittsk", tsk);

		} catch (Exception e) {
			// throw new WrongInputException("wrong");
			return new ModelAndView("wrong");
		}
		return mav;
	}

	@PostMapping("/adminusersedit/{id}")
	public ModelAndView postgetEditingUser(@ModelAttribute("User") User tsk) {
		service.saveUser(tsk);
		return new ModelAndView("redirect:/adminuserslist");
	}

	@GetMapping("/adminuserdelete/{id}")
	public ModelAndView getDeletingUSer(@PathVariable("id") long id, HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		if (user == null) {
			return new ModelAndView("needslogin");
		}
		ModelAndView mav = new ModelAndView("admindeleteuser");
		try {
			User tsk = service.findUserById(id).get();
			mav.addObject("dlttsk", tsk);

		} catch (Exception e) {
			return new ModelAndView("wrong");
		}
		return mav;
	}

	@PostMapping("/adminuserdelete/{id}")
	public ModelAndView postgetDeletingUSer(@ModelAttribute("User") User tsk) {
		// service.saveTask(tsk);
		service.deleteUser(tsk);

		return new ModelAndView("redirect:/adminuserslist");
	}
	
	
	/////////////////////////////////////////
	
	
	
	

}
