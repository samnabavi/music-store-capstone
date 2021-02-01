package com.hcl.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hcl.dao.ProductRepository;
import com.hcl.model.Product;
import com.hcl.model.Task;

@Service
public class ProductService {

	@Autowired
	private ProductRepository repo;

	public void saveProduct(Product tsk) {
	
			repo.save(tsk);
	
	}

	public List<Product> findAllProducts() {
		return (List<Product>) repo.findAll();
	}

	public Optional<Product> findProductById(long id) {
		return repo.findById(id);
	}

	public void deleteProduct(Product tsk) {
		
			repo.delete(tsk);
		
	}

}
