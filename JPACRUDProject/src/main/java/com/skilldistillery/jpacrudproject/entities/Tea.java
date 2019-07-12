package com.skilldistillery.jpacrudproject.entities;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Tea {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String name;

	private String description;

	private double price;

	@Column(name = "kg_on_hand")
	private int qty;

	@Column(name = "img_url")
	private String img;

	@Column(name = "update_time")
	@Temporal(TemporalType.TIMESTAMP)
	private Date updateTime;

	@OneToMany(mappedBy = "tea")
	private List<Review> reviews;

	@ManyToMany(mappedBy = "teas")
	private List<Category> categories;

	@ManyToMany(mappedBy = "teas")
	private List<Supplier> suppliers;

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public Tea() {

	}

	public Tea(String name, String description, double price, int qty, String img) {
		this.name = name;
		this.description = description;
		this.price = price;
		this.qty = qty;
		this.img = img;
	}

	public Tea(int id, String name, String description, double price, int qty) {
		this.id = id;
		this.name = name;
		this.description = description;
		this.price = price;
		this.qty = qty;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public void setId(int id) {
		System.err.println("************");
		System.err.println(id);
		this.id = id;
	}

	public int getId() {
		return id;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((description == null) ? 0 : description.hashCode());
		result = prime * result + id;
		result = prime * result + ((img == null) ? 0 : img.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		long temp;
		temp = Double.doubleToLongBits(price);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + qty;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Tea other = (Tea) obj;
		if (description == null) {
			if (other.description != null)
				return false;
		} else if (!description.equals(other.description))
			return false;
		if (id != other.id)
			return false;
		if (img == null) {
			if (other.img != null)
				return false;
		} else if (!img.equals(other.img))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (Double.doubleToLongBits(price) != Double.doubleToLongBits(other.price))
			return false;
		if (qty != other.qty)
			return false;
		return true;
	}

	public List<Review> getReviews() {
		return reviews;
	}

	public void setReviews(List<Review> reviews) {
		this.reviews = reviews;
	}

	public List<Category> getCategories() {
		return categories;
	}

	public void setCategories(List<Category> categories) {
		this.categories = categories;
	}

	public List<Supplier> getSuppliers() {
		return suppliers;
	}

	public void setSuppliers(List<Supplier> suppliers) {
		this.suppliers = suppliers;
	}

	public void addReview(Review review) {
		if (reviews == null)
			reviews = new ArrayList<>();
		if (!reviews.contains(review)) {
			reviews.add(review);
			review.setTea(this);
		}
	}

	public void removeReview(Review review) {
		if (reviews != null && reviews.contains(review)) {
			reviews.remove(review);
			review.setTea(this);
		}
	}

	public void addCategory(Category category) {
		if (categories == null)
			categories = new ArrayList<>();
		if (!categories.contains(category)) {
			categories.add(category);
			category.addTea(this);
			;
		}
	}

	public void removeCategory(Category category) {
		if (categories != null && categories.contains(category)) {
			categories.remove(category);
			category.removeTea(this);
		}
	}

	public void addSupplier(Supplier supplier) {
		if (suppliers == null)
			suppliers = new ArrayList<>();
		if (!suppliers.contains(supplier)) {
			suppliers.add(supplier);
			supplier.addTea(this);
			;
		}
	}

	public void removeSupplier(Supplier supplier) {
		if (suppliers != null && suppliers.contains(supplier)) {
			suppliers.remove(supplier);
			supplier.removeTea(this);
		}
	}
}
