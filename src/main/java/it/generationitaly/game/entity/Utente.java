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
@Table(name="utente")
public class Utente {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false)
	private long id;
	
	@Column(name = "nome", nullable = false, length = 50)
    private String nome;

    @Column(name = "cognome", nullable = false, length = 50)
    private String cognome;
	
	@Column(name = "username", nullable = false,length=50)	
	private String username;
	
	@Column(name = "password", nullable = false,length=255)
	private String password;
	
	@Column(name = "email", nullable = false,length=255)
	private String email;
	
	@Column(name = "foto", nullable = false,length=255)
	private String foto;
	
	@OneToMany(mappedBy="utente",fetch=FetchType.EAGER)
	private List<Preferito> preferiti= new ArrayList<Preferito>();
	
	@OneToMany(mappedBy="utente",fetch=FetchType.EAGER)
	private List<Recensione> recensioni= new ArrayList<Recensione>();

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}
	

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCognome() {
		return cognome;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
	}


	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFoto() {
		return foto;
	}

	public void setFoto(String foto) {
		this.foto = foto;
	}

	public List<Preferito> getPreferiti() {
		return preferiti;
	}

	public void setPreferiti(List<Preferito> preferiti) {
		this.preferiti = preferiti;
	}

	public List<Recensione> getRecensioni() {
		return recensioni;
	}

	public void setRecensioni(List<Recensione> recensioni) {
		this.recensioni = recensioni;
	}

	@Override
	public String toString() {
		return "Utente [id=" + id + ", username=" + username + ", password=" + password + ", email=" + email + ", foto="
				+ foto + "]";
	}
	
	
	
	
}
