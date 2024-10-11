package it.generationitaly.game.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;


@Entity
@Table(name="videogame")
public class Videogame {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false)
	private long id;
	
	@Column(name = "titolo", nullable = false,length=255)
	private String titolo;

	@Column(name = "descrizione",nullable=false)
	private String descrizione;
	
	@Temporal(TemporalType.DATE)
	@Column(name = "anno_uscita",nullable=false)
	private Date annoUscita;
	
	@Column(name = "classificazione_pegi", length=3)
	private String classificazionePegi;
	
	@Column(name = "foto",length=2048)
	private String foto;
	
	@Column(name = "multiplayer")
	private boolean multiplayer;
	
	@OneToMany(mappedBy="videogame",fetch=FetchType.EAGER)
	private List<Preferito> preferiti= new ArrayList<Preferito>();
	
	@OneToMany(mappedBy="videogame",fetch=FetchType.EAGER)
	private List<Recensione> recensioni= new ArrayList<Recensione>();
	
	@OneToMany(mappedBy="videogame",fetch=FetchType.EAGER)
	private List<VideogameGenere> generi= new ArrayList<VideogameGenere>();
	
	@OneToMany(mappedBy="videogame",fetch=FetchType.EAGER)
	private List<VideogameSviluppatore> sviluppatori= new ArrayList<VideogameSviluppatore>();

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getTitolo() {
		return titolo;
	}

	public void setTitolo(String titolo) {
		this.titolo = titolo;
	}

	public String getDescrizione() {
		return descrizione;
	}

	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}

	public Date getAnnoUscita() {
		return annoUscita;
	}

	public void setAnnoUscita(Date annoUscita) {
		this.annoUscita = annoUscita;
	}

	public String getClassificazionePegi() {
		return classificazionePegi;
	}

	public void setClassificazionePegi(String classificazionePegi) {
		this.classificazionePegi = classificazionePegi;
	}

	public String getFoto() {
		return foto;
	}

	public void setFoto(String foto) {
		this.foto = foto;
	}

	public boolean isMultiplayer() {
		return multiplayer;
	}

	public void setMultiplayer(boolean multiplayer) {
		this.multiplayer = multiplayer;
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

	public List<VideogameGenere> getGeneri() {
		return generi;
	}

	public void setGeneri(List<VideogameGenere> generi) {
		this.generi = generi;
	}

	public List<VideogameSviluppatore> getSviluppatori() {
		return sviluppatori;
	}

	public void setSviluppatori(List<VideogameSviluppatore> sviluppatori) {
		this.sviluppatori = sviluppatori;
	}

	@Override
	public String toString() {
		return "Videogame [id=" + id + ", titolo=" + titolo + ", descrizione=" + descrizione + ", annoUscita="
				+ annoUscita + ", classificazionePegi=" + classificazionePegi + ", foto=" + foto + ", multiplayer="
				+ multiplayer + "]";
	}
	
	
	
}
