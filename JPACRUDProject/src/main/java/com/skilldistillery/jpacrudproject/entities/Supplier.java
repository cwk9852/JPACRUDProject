package com.skilldistillery.jpacrudproject.entities;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;

@Entity
public class Supplier {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "company_name")
	private String name;

	@Column(name = "create_date")
	@Temporal(TemporalType.TIMESTAMP)
	@CreationTimestamp
	private Date dateAcquired;

	@ManyToMany(mappedBy = "suppliers")
	private Set<Tea> teas;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getDateAcquired() {
		return dateAcquired;
	}

	public void setDateAcquired(Date dateAcquired) {
		this.dateAcquired = dateAcquired;
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
		Supplier other = (Supplier) obj;
		if (id != other.id)
			return false;
		return true;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Supplier [id=").append(id).append(", name=").append(name).append(", dateAcquired=")
				.append(dateAcquired).append("]");
		return builder.toString();
	}

	public Set<Tea> getTeas() {
		return teas;
	}

	public void setTeas(HashSet<Tea> teas) {
		this.teas = teas;
	}

	public void addTea(Tea tea) {
		if (teas == null)
			teas = new HashSet<>();
		if (!teas.contains(tea)) {
			teas.add(tea);
			tea.addSupplier(this);
			;
		}
	}

	public void removeTea(Tea tea) {
		if (teas != null && teas.contains(tea)) {
			teas.remove(tea);
			tea.removeSupplier(this);
		}
	}

	public Supplier() {
		super();
	}

	public Supplier(int id) {
		super();
		this.id = id;
	}

	public void setTeas(Set<Tea> teas) {
		this.teas = teas;
	}

}
