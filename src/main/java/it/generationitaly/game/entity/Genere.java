package it.generationitaly.game.entity;

import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Table
@Entity(name="genere")
public class Genere {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false)
	private long id;
	
	@Column(name = "name", nullable = false,length=100)
	private String name;
	
	@OneToMany(mappedBy="genere",fetch=FetchType.EAGER)
	private List<VideogameGenere> generi= new ArrayList<VideogameGenere>();

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<VideogameGenere> getGeneri() {
		return generi;
	}

	public void setGeneri(List<VideogameGenere> generi) {
		this.generi = generi;
	}

	@Override
	public String toString() {
		return "Genere [name=" + name + "]";
	}
	
	
	
	

}
