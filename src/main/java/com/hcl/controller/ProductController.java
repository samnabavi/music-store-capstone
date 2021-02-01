package com.hcl.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hcl.model.Product;
import com.hcl.model.Task;
import com.hcl.model.User;
import com.hcl.service.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService service;
	

	@GetMapping("/productlist")
	public ModelAndView listProduct(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		if( user == null) {
			return new ModelAndView("needslogin");
		}
		List<Product> alltsks = (List<Product>) service.findAllProducts();
		return new ModelAndView("products", "tasks", alltsks);
		
	}
	@GetMapping("/productlist/{id}")
	public ModelAndView listSingleProduct(@PathVariable("id") long id, HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		if( user == null) {
			return new ModelAndView("needslogin");
		}
		ModelAndView mav = new ModelAndView("productitem");
		try {
			Product p = service.findProductById(id).get();
			mav.addObject("prd", p);

		} catch (Exception e) {
			//throw new WrongInputException("wrong");
			return new ModelAndView("wrong");
		}
		return mav;
		
	}
	@GetMapping("/productlistall")
	public ModelAndView listProductAll() {
		List<Product> alltsks = (List<Product>) service.findAllProducts();
		return new ModelAndView("productsall", "tasks", alltsks);
		
	}
	@GetMapping("/productlistall/{id}")
	public ModelAndView listSingleProductAll(@PathVariable("id") long id) {
		ModelAndView mav = new ModelAndView("productitemall");
		try {
			Product p = service.findProductById(id).get();
			mav.addObject("prd", p);

		} catch (Exception e) {
			//throw new WrongInputException("wrong");
			return new ModelAndView("wrong");
		}
		return mav;
		
	}
	@GetMapping("/productadded/{id}")
	public ModelAndView getAddItemToCart(@PathVariable("id") long id, HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		if( user == null) {
			return new ModelAndView("needslogin");
		}
		ModelAndView mav = new ModelAndView("productcart");
		try {
			Product p = service.findProductById(id).get();
			List<Product> cart = (List<Product>) request.getSession().getAttribute("cart");
			//
			boolean flag = false;
			for(Product product: cart) {
				if(p.equals(product)) {
					product.setQuantity(product.getQuantity()+1);
					flag = true;
				}
			}
			if(flag == false) {
				cart.add(p);
				p.setQuantity(1);
			}
		
			System.out.println("*************** cart: " + cart);
			request.getSession().setAttribute("cart", cart);
			mav.addObject("prd", p);

		} catch (Exception e) {
			//throw new WrongInputException("wrong");
			return new ModelAndView("wrong");
		}
		return mav;
	}
	
	@GetMapping("/cart")
	public ModelAndView showCart(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		if( user == null) {
			return new ModelAndView("needslogin");
		}
		List<Product> cart = (List<Product>) request.getSession().getAttribute("cart");
		
		int total = 0;
		for(Product p: cart) {
			int price = p.getPrice() * p.getQuantity();
			total = total + price;
		}
		request.getSession().setAttribute("total", total);
		return new ModelAndView("shoppingcart", "tasks", cart);
	}
	

	
	@GetMapping("/removeitemfromcart/{id}")
	public ModelAndView getRemoveFromCart(@PathVariable("id") long id, HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		if( user == null) {
			return new ModelAndView("needslogin");
		}
		ModelAndView mav = new ModelAndView("cartdeleting");
		try {
			List<Product> cart = (List<Product>) request.getSession().getAttribute("cart");
			boolean flag = false;
			Product temp = null;
			for(Product p: cart) {
				if(p.getId() == id && !flag) {
					flag = true;
					temp = p;
					mav.addObject("dlttsk", p);
					
				}
			}
			cart.remove(temp);
			request.getSession().setAttribute("cart", cart);
			
			//Task tsk = service.findTaskById(id).get();
			

		} catch (Exception e) {
			return new ModelAndView("wrong");
		}
		return mav;
	}
	@PostMapping("/removeitemfromcart/{id}")
	public ModelAndView getRemoveFromCart(@ModelAttribute("Product") Product tsk) {
		return new ModelAndView("redirect:/cart");
	}
	
	
	
	
	
	////////////////////////////////////
	@GetMapping("/adminproductslist")
	public ModelAndView adminListProducts(HttpServletRequest request) {
		// List<Employee> allemps = (List<Employee>) repo.findAll();
		User user = (User) request.getSession().getAttribute("user");
		if( user == null) {
			return new ModelAndView("needslogin");
		}
		System.out.println("----------1)inside listTsk");
		List<Product> alltsks = (List<Product>) service.findAllProducts();
		System.out.println("----------2)inside listTsk");
		return new ModelAndView("adminproducts", "tasks", alltsks);

	}

	@GetMapping("/adminproductadd")
	public ModelAndView addnewUser(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		if( user == null) {
			return new ModelAndView("needslogin");
		}
		Product t1 = new Product();
		return new ModelAndView("adminaddnewproduct", "form", t1); // model attribure<form:form modelAttribute="form">
	}

	@PostMapping("/adminproductadd")
	public String newUser(Product tsk) {
		service.saveProduct(tsk);
		return ("redirect:/adminproductslist");
	}

	@GetMapping("/adminproductsedit/{id}")
	public ModelAndView getEditingUser(@PathVariable("id") long id, HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		if( user == null) {
			return new ModelAndView("needslogin");
		}
		ModelAndView mav = new ModelAndView("admineditproduct");
		try {
			Product tsk = service.findProductById(id).get();
			mav.addObject("edittsk", tsk);

		} catch (Exception e) {
			// throw new WrongInputException("wrong");
			return new ModelAndView("wrong");
		}
		return mav;
	}

	@PostMapping("/adminproductsedit/{id}")
	public ModelAndView postgetEditingUser(@ModelAttribute("Product") Product tsk) {
		service.saveProduct(tsk);
		return new ModelAndView("redirect:/adminproductslist");
	}

	@GetMapping("/adminproductdelete/{id}")
	public ModelAndView getDeletingUSer(@PathVariable("id") long id, HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		if( user == null) {
			return new ModelAndView("needslogin");
		}
		ModelAndView mav = new ModelAndView("admindeleteproduct");
		try {
			Product tsk = service.findProductById(id).get();
			mav.addObject("dlttsk", tsk);

		} catch (Exception e) {
			return new ModelAndView("wrong");
		}
		return mav;
	}

	@PostMapping("/adminproductdelete/{id}")
	public ModelAndView postgetDeletingUSer(@ModelAttribute("Product") Product tsk) {
		// service.saveTask(tsk);
		service.deleteProduct(tsk);

		return new ModelAndView("redirect:/adminproductslist");
	}
	
	
	
	
	
//	@PostMapping("/productadded/{id}")
//	public String addItemToCart(@ModelAttribute("Product") Product p, HttpServletRequest request) {
//		System.out.println("|||||||||||||||||||||||||||||   1");
//
//		List<Product> cart = (List<Product>) request.getSession().getAttribute("cart");
//		System.out.println("|||||||||||||||||||||||||||||   2");
//
//		cart.add(p);
//		System.out.println("|||||||||||||||||||||||||||||   3");
//
//		System.out.println("*************** cart: " + cart);
//		request.getSession().setAttribute("cart", cart);
//		System.out.println("|||||||||||||||||||||||||||||   5");
//		return ("redirect://productlist");
//		
//	}
//	@GetMapping("/addtsk")
//	public ModelAndView addnewTsk() {
//		
//		Task t1 = new Task();
//		return new ModelAndView("newtsk", "form", t1);  //model attribure<form:form modelAttribute="form">
//	}
//	@PostMapping("/addtsk")
//	public String newTsk(Task tsk) {
//		//repo.save(emp);
//		try {
//			service.saveTask(tsk);
//		} catch (FailedDatabaseActionException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		System.out.println("--------------BEFORE REDIRECTING----------");
//		return ("redirect:/listtsk");
//	}
//	
//	@GetMapping("/edittsk")
//	public ModelAndView getEditTsk() {
//		Task t1 = new Task();
//		System.out.println("--------------INSIDE EDITPOST----------");
//		return new ModelAndView("taskeditform", "form", t1);
//	}
//	@PostMapping("/edittsk")
//	public ModelAndView postEditTsk(@ModelAttribute("Task") Task tsk) {
//		
//
//		try {
//			Task t = service.findTaskById(tsk.getId()).get();
//			long id = t.getId();
//			return new ModelAndView("redirect:/editingtsk/" + id);
//		} catch (Exception e) {
//			return new ModelAndView("wrong");
//			//throw new WrongInputException("wrong");
//			
//		}
//	}
////	@GetMapping("/editingtsk")
////	public ModelAndView getEditingTsk(@RequestParam("id") long id)  {
////		System.out.println("toooooooooooooodaaaaaaaaaaaaaaaaaaaaaaaaaaaayyyyyyyyyyyyyyyyyyyyyy");
////		Optional<Task> tsk = service.findTaskById(id);
////		return new ModelAndView("taskediting", "edittsk", tsk);
////	}
////	
//	
//	
//	@GetMapping("/editingtsk/{id}")
//	public ModelAndView getEditingTsk(@PathVariable("id") long id)  {
//		ModelAndView mav = new ModelAndView("taskediting");
//		try {
//			Task tsk = service.findTaskById(id).get();
//			mav.addObject("edittsk", tsk);
//
//		} catch (Exception e) {
//			//throw new WrongInputException("wrong");
//			return new ModelAndView("wrong");
//		}
//		return mav;
//	}
//	@PostMapping("/editingtsk/{id}")
//	public ModelAndView postgetEditingTsk(@ModelAttribute("Task") Task tsk) {
//		try {
//			service.saveTask(tsk);
//		} catch (FailedDatabaseActionException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return new ModelAndView("redirect:/listtsk");
//	}
//	/////////////////////
//	/////////////////////
//	@GetMapping("/deletetsk")
//	public ModelAndView getDeleteTsk() {
//		Task t1 = new Task();
//		System.out.println("--------------INSIDE EDITPOST----------");
//		return new ModelAndView("taskdeleteform", "form", t1);
//	}
//	@PostMapping("/deletetsk")
//	public ModelAndView postDeleteTsk(@ModelAttribute("Task") Task tsk) {
//		try {
//			Task t = service.findTaskById(tsk.getId()).get();
//			long id = t.getId();
//			return new ModelAndView("redirect:/deletingtsk/" + id);
//		} catch (Exception e) {
//			return new ModelAndView("wrong");
//		}
//	}
//	@GetMapping("/deletingtsk/{id}")
//	public ModelAndView getDeletingTsk(@PathVariable("id") long id) {
//		ModelAndView mav = new ModelAndView("taskdeleting");
//		try {
//			Task tsk = service.findTaskById(id).get();
//			mav.addObject("dlttsk", tsk);
//
//		} catch (Exception e) {
//			return new ModelAndView("wrong");
//		}
//		return mav;
//	}
//	@PostMapping("/deletingtsk/{id}")
//	public ModelAndView postgetDeletingTsk(@ModelAttribute("Task") Task tsk) {
//		//service.saveTask(tsk);
//		try {
//			service.deleteTask(tsk);
//		} catch (FailedDatabaseActionException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return new ModelAndView("redirect:/listtsk");
//	}
//	
//	
	
}
