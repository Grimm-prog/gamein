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

@Entity
@Table(name="sviluppatore")
public class Sviluppatore {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false)
	private long id;
	
	@Column(name = "nome", nullable = false,length=255)
	private String name;
	
	@OneToMany(mappedBy="sviluppatore",fetch=FetchType.EAGER)
	private List<VideogameSviluppatore> sviluppatori= new ArrayList<VideogameSviluppatore>();

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

	public List<VideogameSviluppatore> getSviluppatori() {
		return sviluppatori;
	}

	public void setSviluppatori(List<VideogameSviluppatore> sviluppatori) {
		this.sviluppatori = sviluppatori;
	}

	@Override
	public String toString() {
		return "Sviluppatore [name=" + name + "]";
	}
	
	
	
}
