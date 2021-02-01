package com.hcl.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name="productsMS")
public class Product {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long id;
	private String name;
	private String category;
	private String pcondition;
	private String imageLink;
	private int price;
	@Column(name="quantity",columnDefinition = "int default 0")
	private int quantity = 0;
	@Override
	public boolean equals(Object obj) {
		Product other = (Product) obj;
		if( this.id == other.id) {
			return true;
		} else {
			return false;
		}
	}
	
}
