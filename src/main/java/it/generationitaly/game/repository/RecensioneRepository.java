package it.generationitaly.game.repository;
import java.util.List;

import it.generationitaly.game.entity.Recensione;


public interface RecensioneRepository extends JpaRepository<Recensione, Long> {

    List<Recensione> findByVoto(int voto);
    
    List<Recensione> findByDifficolta(int difficolta);
     
    
}

