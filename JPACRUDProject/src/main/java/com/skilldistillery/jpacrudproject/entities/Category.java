package com.skilldistillery.jpacrudproject.entities;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

@Entity
public class Category {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String name;

	private String description;

	@Column(name = "short_desc")
	private String shortDescription;

	@ManyToMany(mappedBy = "categories")
	private Set<Tea> teas;

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

	public Set<Tea> getTeas() {
		return teas;
	}

	public void setTeas(Set<Tea> teas) {
		this.teas = teas;
	}

	public void addTea(Tea tea) {
		if (teas == null)
			teas = new HashSet<>();
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

	public Category() {
		super();
	}

	public Category(int id) {
		super();
		this.id = id;
	}

	public String getShortDescription() {
		return shortDescription;
	}

	public void setShortDescription(String shortDescription) {
		this.shortDescription = shortDescription;
	}

}
