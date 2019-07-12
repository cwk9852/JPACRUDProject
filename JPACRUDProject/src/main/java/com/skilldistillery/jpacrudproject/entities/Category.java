package com.skilldistillery.jpacrudproject.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;

@Entity
public class Category {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String name;

	private String description;

	@ManyToMany(cascade = { CascadeType.PERSIST, CascadeType.REMOVE })
	@JoinTable(name = "tea_has_category",
	joinColumns = { @JoinColumn(name = "category_id") },
	inverseJoinColumns = { @JoinColumn(name = "tea_id") })
	private List<Tea> teas;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
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
		Category other = (Category) obj;
		if (id != other.id)
			return false;
		return true;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Category [id=").append(id).append(", name=").append(name).append(", description=")
				.append(description).append("]");
		return builder.toString();
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

	public List<Tea> getTeas() {
		return teas;
	}

	public void setTeas(List<Tea> teas) {
		this.teas = teas;
	}

	public void addTea(Tea tea) {
		if (teas == null)
			teas = new ArrayList<>();
		if (!teas.contains(tea)) {
			teas.add(tea);
			tea.addCategory(this);
			;
		}
	}

	public void removeTea(Tea tea) {
		if (teas != null && teas.contains(tea)) {
			teas.remove(tea);
			tea.removeCategory(this);
		}
	}

}
