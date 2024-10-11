package it.generationitaly.game.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name="videogame_genere")
public class VideogameGenere {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false)
	private long id;
	
	@ManyToOne
	@JoinColumn(name="genere_id",nullable=false)
	private Genere genere;
	
	@ManyToOne
	@JoinColumn(name="videogame_id",nullable=false)
	private Videogame videogame;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Genere getGenere() {
		return genere;
	}

	public void setGenere(Genere genere) {
		this.genere = genere;
	}

	public Videogame getVideogame() {
		return videogame;
	}

	public void setVideogame(Videogame videogame) {
		this.videogame = videogame;
	}

}
