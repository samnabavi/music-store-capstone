package com.hcl.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hcl.dao.UserRepository;
import com.hcl.model.User;

@Service
public class UserService {

	@Autowired
	private UserRepository repo;
	
	public void saveUser(User emp) {
	
			repo.save(emp);
	
	}
	
	public List<User> findAllUsers() {
		return (List<User>) repo.findAll();
	}
	
	public Optional<User> findUserById(long id) {
		return repo.findById(id);
	}
	
	public void deleteUser(User emp){
		
			repo.delete(emp);
		
	}
}
