package it.generationitaly.game.entity;

import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;



@Table
@Entity(name="recensione")
public class Recensione {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false)
	private long id;
	
	@Column(name = "commento", nullable = false,length=2048)
	private String commento;

	@Column(name = "voto", nullable = false)
	private int voto;
	
	@Column(name = "difficolta", nullable = false)
	private int difficolta;
	
	@Column(name = "tempo_di_gioco", nullable = false)
	private int tempoDiGioco;
	
	@ManyToOne
	@JoinColumn(name="videogame_id",nullable=false)
	private List<Videogame> videogames=new ArrayList<Videogame>();
	
	@OneToOne
	@JoinColumn(name="utente_id",nullable=false,unique=true)
	private Utente utente;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getCommento() {
		return commento;
	}

	public void setCommento(String commento) {
		this.commento = commento;
	}

	public int getVoto() {
		return voto;
	}

	public void setVoto(int voto) {
		this.voto = voto;
	}

	public int getDifficolta() {
		return difficolta;
	}

	public void setDifficolta(int difficolta) {
		this.difficolta = difficolta;
	}

	public int getTempoDiGioco() {
		return tempoDiGioco;
	}

	public void setTempoDiGioco(int tempoDiGioco) {
		this.tempoDiGioco = tempoDiGioco;
	}

	public List<Videogame> getVideogames() {
		return videogames;
	}

	public void setVideogames(List<Videogame> videogames) {
		this.videogames = videogames;
	}

	public Utente getUtente() {
		return utente;
	}

	public void setUtente(Utente utente) {
		this.utente = utente;
	}

	@Override
	public String toString() {
		return "Recensione [id=" + id + ", commento=" + commento + ", voto=" + voto + ", difficolta=" + difficolta
				+ ", tempoDiGioco=" + tempoDiGioco + "]";
	}
	
	

}
