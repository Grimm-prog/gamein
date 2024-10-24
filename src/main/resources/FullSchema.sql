CREATE SCHEMA jaita129_videogames;
DROP SCHEMA jaita129_videogames;
USE jaita129_videogames;

CREATE TABLE videogame (
    id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    titolo VARCHAR(255) NOT NULL,
    descrizione VARCHAR(2048) NOT NULL,
    data_uscita DATE NOT NULL,
    classificazione_pegi CHAR(3) NOT NULL,
    foto VARCHAR(2048) NOT NULL,
    multiplayer BOOL NOT NULL
);

CREATE TABLE utente (
    id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR (50)  NOT NULL,
	cognome VARCHAR (50)  NOT NULL,
    username VARCHAR(50) UNIQUE NOT NULL, 
    password VARCHAR(255) NOT NULL, 
    email VARCHAR(255) UNIQUE NOT NULL, 
    foto VARCHAR(2048) NOT NULL
);

CREATE TABLE recensione (
    id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    videogame_id BIGINT NOT NULL,
    utente_id BIGINT NOT NULL,
    commento VARCHAR(2048) NOT NULL,
    voto INT NOT NULL CHECK (voto BETWEEN 1 AND 5) ,
    difficolta INT NOT NULL CHECK (difficolta BETWEEN 1 AND 5),
    tempo_di_gioco INT NOT NULL,
    FOREIGN KEY (videogame_id) REFERENCES videogame(id),
    FOREIGN KEY (utente_id) REFERENCES utente(id)
);

CREATE TABLE genere (
    id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL
);

CREATE TABLE sviluppatore (
    id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE videogame_genere (
	id BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    videogame_id BIGINT NOT NULL,
    genere_id BIGINT NOT NULL,
    UNIQUE (videogame_id, genere_id),
    FOREIGN KEY (videogame_id) REFERENCES videogame(id),
    FOREIGN KEY (genere_id) REFERENCES genere(id)
);

CREATE TABLE videogame_sviluppatore (
	id BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    videogame_id BIGINT NOT NULL,
    sviluppatore_id BIGINT NOT NULL,
    UNIQUE (videogame_id, sviluppatore_id),
    FOREIGN KEY (videogame_id) REFERENCES videogame(id),
    FOREIGN KEY (sviluppatore_id) REFERENCES sviluppatore(id)
);

CREATE TABLE preferito (
	id BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    utente_id BIGINT NOT NULL,
    videogame_id BIGINT NOT NULL,
    UNIQUE (utente_id, videogame_id),
    FOREIGN KEY (utente_id) REFERENCES utente(id),
    FOREIGN KEY (videogame_id) REFERENCES videogame(id)
);


-- Categoria: Fantasy
INSERT INTO videogame VALUES (1, 'Elden Ring', 'In "Elden Ring", esplora un vasto mondo interconnesso creato da Hidetaka Miyazaki e George R.R. Martin. Il gioco combina l\'azione tipica dei soulslike con un\'esperienza open-world, offrendo libertà di esplorazione, combattimenti intensi e una narrativa epica. Affronta nemici temibili, scopri segreti nascosti e diventa il signore dell\'Anello ancestrale. Questo gioco è caratterizzato da un\'ambientazione oscura e mistica, con un complesso sistema di combattimento e personalizzazione del personaggio.', '2022-02-25', '16', 'https://image.api.playstation.com/vulcan/ap/rnd/202107/1612/esnQejHW2fLjVn3QsqMORML0.png', false);
INSERT INTO videogame VALUES (2, 'Final Fantasy XVI', 'Il sedicesimo capitolo della celebre serie di RPG "Final Fantasy" presenta un mondo di magia e politica, in cui le nazioni combattono per il controllo dei Cristalli Madre. La storia segue Clive Rosfield in una ricerca di vendetta e giustizia. Il sistema di combattimento è dinamico, con spettacolari scontri contro enormi creature chiamate Eikon. "Final Fantasy XVI" combina narrazione epica, personaggi memorabili e un mondo ricco di dettagli e storia.', '2023-06-22', '16', 'https://image.api.playstation.com/vulcan/ap/rnd/202211/3007/lgFVhRm5BfoX02pRUt3lSmLV.png', false);
INSERT INTO videogame VALUES (3, 'Baldur\'s Gate III', 'Il terzo capitolo della serie Baldur\'s Gate immerge i giocatori in un vasto mondo fantasy basato sulle regole di Dungeons & Dragons. Con una trama ramificata, scelte morali profonde e combattimenti a turni, il gioco offre un\'esperienza immersiva e personalizzata. I giocatori formano un gruppo di eroi per combattere una minaccia mortale e devono affrontare sfide complesse, enigmi e battaglie strategiche, con numerose opzioni per risolvere le situazioni.', '2023-08-03', '18', 'https://cdn.wccftech.com/wp-content/uploads/2023/08/Baldurs-Gate-3-header-scaled.jpg', false);
INSERT INTO videogame VALUES (4, 'Hogwarts Legacy', 'In "Hogwarts Legacy", esplori il mondo magico del 1800 nei panni di uno studente di Hogwarts con un destino misterioso. Il gioco ti permette di vivere la vita da mago, imparando incantesimi, preparando pozioni e domando creature magiche. La storia ti porterà ad affrontare antiche magie e scoprire segreti nascosti nelle profondità del castello. Oltre alla trama principale, il gioco offre un\'enorme quantità di contenuti secondari, attività e missioni da completare.', '2023-02-10', '12', 'https://image.api.playstation.com/vulcan/ap/rnd/202011/0919/JmxLZt6exeqcKRz7BSmK8aId.png', false);
INSERT INTO videogame VALUES (5, 'Forspoken', 'In "Forspoken", segui la storia di Frey, una giovane donna trasportata da New York al mondo magico di Athia. Equipaggiata con poteri magici, Frey deve affrontare creature pericolose e tiranne che governano questo misterioso regno. Il gioco offre un vasto open-world da esplorare, con una narrazione ricca e dinamica. "Forspoken" combina un sistema di combattimento fluido e spettacolare con elementi di parkour, che rendono l\'esplorazione e gli scontri veloci e intensi.', '2023-01-24', '18', 'https://asset.vg247.com/forspoken_gqTNIaA.jpg/BROK/thumbnail/1600x900/format/jpg/quality/80/forspoken_gqTNIaA.jpg', false);
INSERT INTO videogame VALUES (6, 'The Legend of Zelda: Tears of the Kingdom', 'Sequel di "Breath of the Wild", questo capitolo della serie Zelda amplia l\'esperienza open-world, introducendo nuove meccaniche di gioco e un mondo sopraelevato che aggiunge profondità all\'esplorazione. La trama segue Link nel tentativo di salvare Hyrule da una nuova minaccia. Il gioco introduce anche nuove abilità per risolvere enigmi e affrontare nemici in modi creativi, mantenendo lo stile visivo e l\'atmosfera magica della serie.', '2023-05-12', '12', 'https://bitwares.net/wp-content/uploads/2023/05/Resena-the-legend-of-zelda-tears-of-the-kingdom.webp', false);
INSERT INTO videogame VALUES (7, 'Fable', 'Fable è il reboot della celebre serie di giochi di ruolo ambientata in un mondo fantasy fiabesco. Il gioco mantiene il tono umoristico e lo stile caratteristico della serie originale, ma introduce un mondo aperto ricco di scelte morali e conseguenze. I giocatori assumono il ruolo di un eroe o antieroe in un\'avventura epica che bilancia azione, esplorazione e narrazione coinvolgente. Il mondo è dinamico, con molte opportunità per influenzare il destino delle terre di Albion.', '2024-05-20', '16', 'https://sirus.b-cdn.net/wp-content/uploads/2020/07/fable-04.jpg', false);
INSERT INTO videogame VALUES (8, 'Dragon Age: The Veilguard', 'Il quarto capitolo della saga di Dragon Age si concentra sulla storia di Solas, il misterioso elfo del terzo gioco, e sul suo tentativo di distruggere il mondo. Il gioco offre una trama complessa, piena di intrighi politici e conflitti tra diverse fazioni. Il mondo è vasto e aperto, con molte regioni da esplorare e missioni da completare. Il sistema di combattimento mescola azione in tempo reale e strategia, offrendo una profondità tattica nelle battaglie.', '2024-03-10', '18', 'https://sm.ign.com/ign_it/game/d/dragon-age/dragon-age-4_p2ny.jpg', false);
INSERT INTO videogame VALUES (9, 'Diablo IV', 'Diablo IV riporta i giocatori nel mondo oscuro e infernale di Sanctuary, dove devono affrontare nuove minacce demoniache. Il gioco offre un mondo aperto, con regioni esplorabili e una trama che evolve in base alle azioni del giocatore. Il combattimento è frenetico, con molte opzioni di personalizzazione per i personaggi e abilità spettacolari. Il gioco supporta sia modalità single-player che multiplayer, con eventi globali e dungeon cooperativi da affrontare insieme ad altri giocatori.', '2023-06-06', '18', 'https://bnetcmsus-a.akamaihd.net/cms/page_media/xb/XBMMNKOZ8ILU1625080135362.jpg', true);
INSERT INTO videogame VALUES (10, 'GreedFall 2', 'GreedFall 2 è un prequel dell\'originale gioco di ruolo, ambientato nel continente di Teer Fradee. Il gioco espande l\'universo con nuove storie di colonialismo, magia e conflitti tra fazioni. I giocatori assumono il controllo di un personaggio che cerca di fuggire dall\'oppressione e formare alleanze con le fazioni locali. Con un sistema di combattimento complesso, dialoghi ramificati e scelte morali, "GreedFall 2" offre una narrazione ricca di sfumature e un mondo immersivo.', '2024-12-10', '16', 'https://www.indie-games.eu/wp-content/uploads/2024/02/greedfall2.jpg', false);

-- Categoria: Azione
INSERT INTO videogame VALUES (11, 'Call of Duty: Modern Warfare II', 'Il seguito di uno dei titoli più iconici della serie, "Modern Warfare II" reinventa il gameplay con una campagna avvincente e modalità multiplayer rinnovate. I giocatori possono aspettarsi scontri tattici, una narrativa intensa e un gameplay fluido e coinvolgente. I vari operatori, armi e mappe offrono una personalizzazione senza precedenti, rendendo ogni partita unica. La grafica migliorata e la nuova tecnologia di rendering elevano ulteriormente l\'esperienza visiva.', '2022-10-28', '18', 'https://www.dsogaming.com/wp-content/uploads/2022/05/Call-of-Duty-Modern-Warfare-2-temp.jpg', true);
INSERT INTO videogame VALUES (12, 'Star Wars Jedi: Survivor', 'Seguito di "Star Wars Jedi: Fallen Order", "Survivor" continua le avventure di Cal Kestis mentre combatte l\'Impero e cerca di sopravvivere in una galassia ostile. Il gioco migliora il sistema di combattimento, introducendo nuove abilità e nemici. I giocatori esploreranno nuovi mondi e affronteranno scelte morali significative, mentre cercano di proteggere ciò che resta della Ribellione. La grafica e la colonna sonora immersiva rendono l\'esperienza ancora più coinvolgente.', '2023-04-28', '16', 'https://gameluster.com/wp-content/uploads/2023/04/Jedi-Survivor-e1681245137966.jpg', false);
INSERT INTO videogame VALUES (13, 'Assassin\'s Creed Mirage', 'Ambientato a Baghdad nel IX secolo, "Mirage" torna alle radici della serie "Assassin\'s Creed", enfatizzando il parkour e l\'assassinio stealth. I giocatori vestono i panni di Basim, un giovane ladro che diventa un assassino. La narrativa è profonda e si intreccia con eventi storici, offrendo un viaggio avvincente attraverso un mondo ricco di cultura e misteri. La grafica migliorata e la colonna sonora arricchiscono ulteriormente l\'esperienza.', '2023-10-05', '18', 'https://www.xboxdynasty.de/wp-content/uploads/2022/09/assassins-creed-mirage-18.jpg', false);
INSERT INTO videogame VALUES (14, 'Spider-Man 2', 'In questo sequel di "Spider-Man", i giocatori possono controllare sia Peter Parker che Miles Morales in una nuova avventura attraverso New York City. Con nuovi poteri e abilità, i due Spider-Man affrontano nemici iconici come Venom e Kraven il Cacciatore. La storia profonda e le meccaniche di gioco innovative rendono "Spider-Man 2" un titolo imperdibile per gli appassionati dei supereroi. L\'open-world offre molte opportunità di esplorazione e missioni secondarie coinvolgenti.', '2023-10-20', '12', 'https://image.api.playstation.com/vulcan/ap/rnd/202306/1219/1c7b75d8ed9271516546560d219ad0b22ee0a263b4537bd8.png', false);
INSERT INTO videogame VALUES (15, 'Alan Wake II', 'In questo sequel di "Alan Wake", i giocatori tornano nel misterioso mondo di Bright Falls, dove la realtà e la finzione si intrecciano. Con un gameplay che combina horror psicologico e avventura, i giocatori seguiranno Alan mentre cerca di scoprire la verità dietro la sua sparizione. L\'atmosfera inquietante, la narrativa profonda e i nuovi elementi di gameplay rendono "Alan Wake II" un\'esperienza unica e coinvolgente.', '2023-10-27', '18', 'https://www.xboxygen.com/IMG/motoff702.jpg', false);
INSERT INTO videogame VALUES (16, 'Lies of P', 'Ambientato in una versione alternativa della storia di Pinocchio, "Lies of P" è un RPG d\'azione ispirato ai soulslike. I giocatori esplorano una città vittoriana in rovina e affrontano nemici terrificanti mentre cercano di scoprire la verità sulla loro esistenza. La meccanica di inganno, dove le scelte del giocatore influenzano la narrazione, aggiunge profondità al gameplay. L\'atmosfera cupa e il design artistico rendono il gioco visivamente straordinario.', '2023-09-19', '18', 'https://nichegamer.com/wp-content/uploads/2023/06/lies-of-p-2.jpg', false);
INSERT INTO videogame VALUES (17, 'Mortal Kombat 1', 'Il reboot di "Mortal Kombat" reinventa la saga con una nuova storia e nuovi personaggi. I giocatori possono aspettarsi combattimenti frenetici, meccaniche di gioco rinnovate e una grafica straordinaria. La personalizzazione dei personaggi è ampliata, con molte opzioni per creare il proprio combattente ideale. Con una varietà di modalità di gioco e un roster di personaggi iconici, "Mortal Kombat 1" è un titolo imperdibile per i fan della serie.', '2023-09-19', '18', 'https://cdn1.epicgames.com/offer/fda0f2b4047f46ffb4e94d5595c1468e/EGS_MortalKombat1PremiumEdition_NetherRealmStudios_Editions_S1_2560x1440-43d47cfc125118b13b26cea9c80ae15c', true);
INSERT INTO videogame VALUES (18, 'Armored Core VI: Fires of Rubicon', 'Il ritorno della celebre serie di mech, "Armored Core VI" offre battaglie intense tra robot in un mondo futuristico. I giocatori possono personalizzare il proprio mech e affrontare sfide sia in single-player che in multiplayer. La grafica e la fisica migliorate rendono ogni battaglia unica e coinvolgente. Con una narrazione profonda e una varietà di missioni, il gioco offre un\'esperienza completa per gli appassionati del genere.', '2023-08-25', '16', 'https://assets.altarofgaming.com/wp-content/uploads/2023/06/armored-core-vi-fires-of-rubicon-game-cover-altar-of-gaming-scaled.jpg', false);
INSERT INTO videogame VALUES (19, 'Street Fighter 6', 'Il nuovo capitolo della leggendaria serie di picchiaduro, "Street Fighter 6" introduce nuovi personaggi e meccaniche di combattimento. I giocatori possono sfidarsi in battaglie frenetiche e esplorare una nuova modalità storia, che offre una narrativa più profonda e opzioni di personalizzazione. La grafica aggiornata e le nuove meccaniche di gioco rendono "Street Fighter 6" un titolo imperdibile per i fan del genere.', '2023-06-02', '12', 'https://image.api.playstation.com/vulcan/ap/rnd/202211/1408/l3bg7nmfPpPzam5jOVlaUFww.jpg', true);
INSERT INTO videogame VALUES (20, 'Dead Island 2', 'In "Dead Island 2", i giocatori affrontano un\'epidemia di zombie in una Los Angeles post-apocalittica. Con un gameplay in prima persona, il gioco offre un mix di azione, avventura e horror. I giocatori possono personalizzare il proprio personaggio e combattere contro una varietà di nemici in scenari aperti. La grafica vivida e le meccaniche di combattimento rendono "Dead Island 2" un\'esperienza unica per gli amanti del genere.', '2023-04-21', '18', 'https://cdn.wccftech.com/wp-content/uploads/2023/03/Dead-Island-2.jpg', true);

-- Categoria: Avventura
INSERT INTO videogame VALUES (21, 'Horizon Forbidden West', 'Seguito di "Horizon Zero Dawn", "Forbidden West" porta i giocatori in una nuova avventura nell\'Ovest proibito. Vestendo i panni di Aloy, un\'abile cacciatrice, i giocatori devono esplorare terre selvagge, incontrare nuove tribù e affrontare pericolose macchine. Il mondo di gioco è vasto, ricco di missioni secondarie e segreti da scoprire, e il gameplay combina combattimenti, esplorazione e crafting. Con una grafica mozzafiato e un ambiente ricco di dettagli, ogni angolo del mondo è pieno di vita e storia. Le nuove meccaniche di combattimento permettono di affrontare nemici in modi innovativi e strategici, mentre la colonna sonora immersiva accompagna l\'avventura, rendendo ogni incontro e scoperta memorabili.', '2022-02-18', '16', 'https://nightlygamingbinge.com/wp-content/uploads/2022/02/Horizon-Forbidden-West-Logo.png', false);
INSERT INTO videogame VALUES (22, 'A Plague Tale: Requiem', 'In "A Plague Tale: Requiem", segui Amicia e Hugo in una storia emotiva e avvincente ambientata nella Francia medievale devastata dalla peste. Il gioco combina elementi di stealth e puzzle, mentre i protagonisti devono affrontare orde di ratti e soldati, con Hugo che sviluppa poteri misteriosi legati alla malattia. L\'ambientazione cupa e la narrazione emozionante lo rendono un\'esperienza unica. Con una trama profonda e personaggi ben sviluppati, il gioco esplora temi di amore, sacrificio e resilienza in un mondo in rovina. I paesaggi sono splendidamente realizzati, aumentando il senso di immersione e coinvolgimento nel viaggio di Amicia e Hugo.', '2022-10-18', '18', 'https://m.media-amazon.com/images/I/61sfFdldXFL._UF1000,1000_QL80_.jpg', false);
INSERT INTO videogame VALUES (23, 'Kena: Bridge of Spirits', 'Kena: Bridge of Spirits è un gioco di avventura che segue la giovane guida spirituale Kena nel tentativo di purificare un mondo corrotto. Il gioco combina combattimenti dinamici con esplorazione e risoluzione di enigmi, tutto ambientato in un mondo colorato e pieno di vita. Kena deve liberare gli spiriti tormentati e guidarli verso la pace, affrontando sfide sempre più difficili. Ogni livello presenta un design visivamente stupefacente, con un uso sapiente della luce e dell\'ombra che amplifica l\'atmosfera del gioco. La colonna sonora accompagna perfettamente le emozioni dei personaggi, rendendo l\'esperienza ancora più coinvolgente e indimenticabile.', '2021-09-21', '12', 'https://theculturednerd.org/wp-content/uploads/2020/06/qxLJ1zWQ-scaled.jpeg', false);
INSERT INTO videogame VALUES (24, 'The Pathless', 'In "The Pathless", i giocatori assumono il ruolo di una cacciatrice e del suo fedele aquilone in un vasto mondo aperto. Il gameplay si basa su esplorazione e risoluzione di enigmi, con una meccanica unica di movimento che richiede di colpire bersagli per mantenere la velocità. La cacciatrice deve liberare la terra da una maledizione antica, affrontando spiriti colossali in battaglie intense e strategiche. L\'ambiente aperto offre numerosi segreti e sfide, incoraggiando l\'esplorazione e l\'interazione con il mondo circostante. La combinazione di puzzle e azione rende ogni incontro emozionante e soddisfacente, creando un equilibrio perfetto tra strategia e dinamismo.', '2020-11-12', '7', 'https://image.api.playstation.com/vulcan/ap/rnd/202007/1500/PzzL4lymRdZuLEerjeL58HG8.png', false);
INSERT INTO videogame VALUES (25, 'It Takes Two', 'It Takes Two è un gioco di avventura cooperativa che segue Cody e May, una coppia in crisi, trasformati in bambole magiche. Attraverso vari livelli pieni di enigmi e sfide uniche, devono imparare a collaborare per tornare alla loro forma umana. Il gioco mescola piattaforme, azione e risoluzione di enigmi, offrendo un\'esperienza unica e coinvolgente per due giocatori. Ogni livello presenta un design innovativo che riflette le emozioni della coppia, esplorando temi di amore, conflitto e riconciliazione. La narrazione è arricchita da dialoghi umoristici e toccanti, rendendo l\'intera esperienza divertente e profonda.', '2021-03-26', '12', 'https://image.api.playstation.com/vulcan/ap/rnd/202012/0815/IjqyQi0J2PL7GdEo3K8jKWMh.png', true);
INSERT INTO videogame VALUES (26, 'Ratchet & Clank: Rift Apart', 'In "Rift Apart", Ratchet e Clank tornano in un\'avventura interdimensionale piena di azione e umorismo. Il gioco sfrutta la potenza della PlayStation 5 per offrire un gameplay senza interruzioni tra diverse dimensioni, con un sistema di combattimento frenetico e l\'introduzione di nuovi personaggi. La storia segue la lotta contro un imperatore malvagio che vuole conquistare tutte le dimensioni. Ogni dimensione presenta ambienti unici e nemici, offrendo varietà e sfide nuove. La grafica incredibile e il design dei mondi rendono l\'esperienza visivamente straordinaria, e il senso di scoperta è palpabile in ogni livello.', '2021-06-11', '12', 'https://image.api.playstation.com/vulcan/ap/rnd/202101/2921/DwVjpbKOsFOyPdNzmSTSWuxG.png', false);
INSERT INTO videogame VALUES (27, 'Stray', 'In "Stray", i giocatori vestono i panni di un gatto randagio che si perde in una città cyberpunk abitata da robot. Il gioco è un\'avventura in terza persona che combina esplorazione, risoluzione di enigmi e momenti di platform. Il protagonista deve trovare la via di casa mentre interagisce con il misterioso mondo che lo circonda, in una narrazione emotiva e coinvolgente. Ogni angolo della città è ricco di dettagli e segreti, incoraggiando l\'esplorazione e l\'interazione con i diversi personaggi. La colonna sonora contribuisce a creare un\'atmosfera unica e immersiva, mentre i momenti di tensione e di tranquillità si alternano in modo magistrale.', '2022-07-19', '12', 'https://th.bing.com/th/id/OIP.qYF3Vp2XfP-gjGa0j9pHWgHaEK?rs=1&pid=ImgDetMain', false);
INSERT INTO videogame VALUES (28, 'Immortals Fenyx Rising', 'Immortals Fenyx Rising è un\'avventura d\'azione ambientata in un mondo ispirato alla mitologia greca. I giocatori assumono il ruolo di Fenyx, un giovane eroe che deve salvare gli dei dell\'Olimpo da una maledizione oscura. Il gioco combina combattimenti dinamici, risoluzione di enigmi e un mondo aperto ricco di segreti, tutto con uno stile artistico brillante e un tono umoristico. Le missioni principali e secondarie offrono una varietà di esperienze, mentre i poteri divini conferiscono al giocatore abilità uniche e spettacolari. La narrazione coinvolgente, arricchita da elementi mitologici, rende ogni passo dell\'avventura emozionante e memorabile.', '2020-12-03', '12', 'https://wallpapercave.com/wp/wp7480476.jpg', false);
INSERT INTO videogame VALUES (29, 'Tchia', 'In "Tchia", i giocatori esplorano un mondo tropicale ispirato alla Nuova Caledonia, assumendo il controllo di una giovane ragazza con la capacità di trasferire la propria anima in animali e oggetti. Il gioco mescola esplorazione, avventura e puzzle-solving in un mondo aperto, con una forte enfasi sulla libertà e la creatività del giocatore. Ogni animale e oggetto offre nuove possibilità e modi di interagire con l\'ambiente, creando un senso di meraviglia e scoperta. L\'estetica visiva e sonora è fortemente influenzata dalla cultura locale, rendendo l\'esperienza non solo divertente, ma anche educativa e culturalmente ricca.', '2023-03-21', '7', 'https://www.psu.com/wp/wp-content/uploads/2023/03/Tchia-PS5-Wallpapers-13.jpg', false);
INSERT INTO videogame VALUES (30, 'Little Nightmares II', 'Little Nightmares II è un\'avventura horror che segue Mono, un ragazzo intrappolato in un mondo distorto. Insieme a Six, la protagonista del primo gioco, devono navigare in ambienti surreali e affrontare mostruosi nemici in una narrazione inquietante e misteriosa. Il gameplay si basa su puzzle ed esplorazione, offrendo un\'esperienza intensa e visivamente straordinaria. Ogni livello è un viaggio in un incubo, con una direzione artistica che esalta il terrore e il mistero. Le interazioni tra i personaggi e l\'ambientazione sono profondamente emotive, portando il giocatore a riflettere su temi di paura e vulnerabilità.', '2021-02-11', '16', 'https://image.api.playstation.com/vulcan/ap/rnd/202011/1819/m7gCTrMRQBTPHi87Mi3leVVY.jpg', false);

-- Categoria: Gioco di Ruolo (RPG)
INSERT INTO videogame VALUES (31, 'The Witcher 3: Wild Hunt', 'Nel terzo capitolo della saga di Geralt di Rivia, i giocatori esplorano un vasto mondo aperto pieno di missioni, mostri e complotti politici. "The Witcher 3" è acclamato per la sua narrativa complessa e le sue scelte morali, con una grande varietà di personaggi che interagiscono tra loro. Ogni decisione avrà conseguenze, rendendo l\'esperienza di gioco unica e avvincente. Gli elementi RPG e le missioni secondarie offrono ore di gameplay avvincente.', '2015-05-19', '18', 'https://www.next-stage.fr/wp-content/uploads/2022/11/TvcIHkYqqln1RGbaFqBeuFp6-scaled.jpg', false);
INSERT INTO videogame VALUES (32, 'Persona 5', 'In "Persona 5", i giocatori assumono il controllo di un gruppo di studenti che entrano nei Palazzi mentali di persone corrotte per combattere il male nascosto. Il gioco combina simulazione di vita scolastica e combattimenti a turni. La narrativa è coinvolgente e permette ai giocatori di esplorare le relazioni sociali tra i personaggi, creando un forte legame emotivo. La grafica è stilizzata e unica, arricchendo l\'atmosfera del gioco, mentre le scelte morali influenzano l\'esito della storia.', '2016-09-15', '16', 'https://image.api.playstation.com/cdn/EP4062/CUSA06638_00/0fSaYhFhEVP183JLTwVec7qkzmaHNMS2.png', false);
INSERT INTO videogame VALUES (33, 'Mass Effect Legendary Edition', 'Una remaster della trilogia originale di Mass Effect, in cui i giocatori controllano il comandante Shepard mentre guida un gruppo di eroi interstellari contro una minaccia galattica. Il gioco è noto per la sua narrativa e le scelte morali, con un sistema di dialoghi che permette di personalizzare le interazioni. I mondi da esplorare sono ricchi di dettagli e la caratterizzazione dei personaggi è straordinaria, creando un universo immersivo in cui le decisioni del giocatore plasmano il destino della galassia.', '2021-05-14', '18', 'https://store-images.s-microsoft.com/image/apps.4132.14254372351363255.ac3906d1-13b6-4af0-a00a-e10c8a92007b.834fe893-324e-4c41-9740-bafed4026578', false);
INSERT INTO videogame VALUES (34, 'Divinity: Original Sin 2', 'Un classico gioco di ruolo a turni in cui i giocatori formano una squadra di eroi con poteri unici per esplorare un mondo fantastico e combattere contro nemici. La narrazione è ricca di scelte e conseguenze, dove ogni decisione può influenzare la storia e i rapporti con gli NPC. Il sistema di combattimento è strategico e offre molte possibilità, mentre la grafica è dettagliata e colorata, permettendo ai giocatori di immergersi in un\'avventura epica e coinvolgente. Le missioni secondarie sono altrettanto avvincenti.', '2017-09-14', '16', 'https://gugimages.s3.us-east-2.amazonaws.com/wp-content/uploads/2020/09/29110540/divinity-original-sin-2-definitive-edition-uhd-4k-wallpaper-scaled.jpg', false);
INSERT INTO videogame VALUES (35, 'Final Fantasy VII Remake', 'Una rivisitazione del classico gioco di ruolo giapponese, il Remake di "Final Fantasy VII" offre grafica moderna e una narrazione approfondita, seguendo le avventure di Cloud e dei suoi compagni. La storia è più dettagliata e arricchita, con elementi di azione in tempo reale che rendono il combattimento avvincente e dinamico. I personaggi sono ben sviluppati e il mondo di Midgar è reso in modo spettacolare, offrendo ai giocatori un\'esperienza nostalgica ma innovativa che esplora temi di amicizia, sacrificio e lotta contro l\'ingiustizia.', '2020-04-10', '12', 'https://ffvii-remake.square-enix-games.com/share-images/SEA_END_fb_share_img_1200x630.jpg', false);
INSERT INTO videogame VALUES (36, 'DRAGON BALL: Sparking! ZERO','DRAGON BALL: Sparking! ZERO porta a un livello superiore gli scontri leggendari della serie Budokai Tenkaichi! Scopri e padroneggia un immenso cast di personaggi giocabili, ciascuno con abilità, trasformazioni e tecniche caratteristiche. Scatena il tuo spirito combattivo in arene che crollano e reagiscono ai tuoi colpi durante la battaglia.','2024-10-11','12','https://media-assets.wired.it/photos/6706c9bc9bb75df092f80d74/16:9/w_1280,c_limit/dragon-ball-sparking-zero-cover.jpg',TRUE);
INSERT INTO videogame VALUES (37, 'Monster Hunter: World', 'Un action RPG in cui i giocatori assumono il ruolo di cacciatori di mostri, esplorando un vasto mondo per affrontare creature enormi. Il gioco è noto per la sua meccanica di combattimento e il sistema di crafting, consentendo ai giocatori di personalizzare le proprie armi e armature. Ogni missione offre un\'esperienza unica, e il lavoro di squadra è essenziale per sconfiggere mostri potenti. La grafica è mozzafiato e il mondo è ricco di dettagli, immergendo i giocatori in un ecosistema vivente pieno di sfide e sorprese.', '2018-01-26', '12', 'https://www.idoru.it/wp-content/uploads/2018/09/monster-hunter-world-copertina.jpg', false);
INSERT INTO videogame VALUES (38, 'Cyberpunk 2077', 'Un RPG open-world ambientato in un futuro distopico, dove i giocatori assumono il ruolo di V, un mercenario che cerca di diventare immortale. Il gioco è noto per la sua narrativa profonda e il mondo vasto, con un\'ampia personalizzazione del personaggio e una storia ricca di colpi di scena. Gli ambienti sono dettagliati e vibranti, riflettendo una società in decadenza e temi di tecnologia avanzata e disuguaglianza sociale. Le scelte dei giocatori influenzano attivamente l\'andamento della storia, rendendo ogni partita unica e coinvolgente.', '2020-12-10', '18', 'https://image.api.playstation.com/vulcan/ap/rnd/202111/3013/bxSj4jO0KBqUgAbH3zuNjCje.jpg', false);
INSERT INTO videogame VALUES (39, 'Star Wars Jedi: Fallen Order', 'Un action-adventure RPG ambientato nell\'universo di Star Wars, in cui i giocatori controllano Cal Kestis, un giovane Jedi in fuga. La narrazione e il combattimento sono centrali in questo gioco, offrendo un mix di esplorazione, risoluzione di enigmi e combattimenti emozionanti. La grafica è straordinaria, ricreando fedelmente l\'atmosfera dell\'universo di Star Wars, mentre i poteri della Forza aggiungono profondità alle meccaniche di gioco. I giocatori possono sviluppare il proprio personaggio e scoprire storie avvincenti e personaggi iconici.', '2019-11-15', '16', 'https://i.ytimg.com/vi/78vQacqkCbE/maxresdefault.jpg', false);
INSERT INTO videogame VALUES (40, 'Genshin Impact', 'Un RPG d\'azione open-world in cui i giocatori esplorano un vasto mondo e raccolgono personaggi con abilità uniche. Il gioco è noto per la sua grafica e la meccanica di gacha, permettendo ai giocatori di creare squadre personalizzate. Il sistema di combattimento è dinamico e permette un\'ampia varietà di stili di gioco, incoraggiando la sperimentazione. I mondi da esplorare sono ricchi di dettagli, con missioni avvincenti e segreti da scoprire, creando un\'esperienza immersiva e coinvolgente che continua ad evolversi con aggiornamenti regolari.', '2020-09-28', '7', 'https://www.drcommodore.it/wp-content/uploads/2023/07/genshin-impact-secret-summer-paradise-cover-1.png', false);

 -- Categoria: Sport
INSERT INTO videogame VALUES (41, 'FIFA 24', 'FIFA 24 porta il calcio virtuale a un nuovo livello con miglioramenti nel gameplay, animazioni fluide e una fisica della palla più realistica. Le modalità Ultimate Team, Carriera e Volta Football continuano a evolversi, offrendo nuove opzioni di personalizzazione e tornei. Con licenze ufficiali delle squadre, campionati e stadi, il gioco garantisce un\'esperienza autentica e coinvolgente per i fan del calcio. Le nuove funzionalità tattiche permettono maggiore controllo nelle partite.', '2024-10-01', '3', 'https://pisces.bbystatic.com/image2/BestBuy_US/images/products/6561/6561958_sd.jpg', true);
INSERT INTO videogame VALUES (42, 'NBA 2K24', 'NBA 2K24 celebra la storia della NBA con grafica migliorata, animazioni fluide e nuove modalità di gioco. MyCareer e MyTeam tornano con nuove caratteristiche, offrendo la possibilità di costruire squadre e carriere epiche. L\'introduzione di nuove meccaniche di gioco rende il controllo dei giocatori ancora più realistico e coinvolgente, con la possibilità di rivivere i momenti migliori della carriera di Kobe Bryant.', '2024-09-08', '3', 'https://media.nichegamer.com/wp-content/uploads/2023/07/nba-2k24-07-07-23-1.jpg', true);
INSERT INTO videogame VALUES (43, 'F1 2024', 'F1 2024 ti mette alla guida dei bolidi più veloci del mondo, con tutte le squadre, piloti e circuiti ufficiali del campionato di Formula 1. Il gioco offre una simulazione dettagliata delle corse, con condizioni meteorologiche dinamiche e strategie di gara realistiche. La modalità Carriera ti permette di vivere la vita di un pilota di Formula 1, mentre il multiplayer offre sfide competitive per giocatori di tutto il mondo.', '2024-09-15', '3', 'https://cdn-5.motorsport.com/images/amp/Y9984G7Y/s1000/f1-24-game.jpg', true);
INSERT INTO videogame VALUES (44, 'Madden NFL 24', 'Madden NFL 24 continua a migliorare l\'esperienza del football americano, introducendo nuove meccaniche di gameplay che rendono il controllo del giocatore ancora più intuitivo e realistico. La modalità Franchise permette di gestire una squadra come allenatore, con un focus su tattiche, draft e gestione del personale. Le modalità multiplayer includono tornei online e partite competitive, con miglioramenti nella fisica degli scontri e delle animazioni.', '2024-09-22', '3', 'https://cdn1.epicgames.com/offer/0460f46401ae4bdcadbc931d30028015/EGS_MaddenNFL24_Tiburon_S2_1200x1600-257b71373343e3630860289a12ce93f4', true);
INSERT INTO videogame VALUES (45, 'EA Sports UFC 5', 'UFC 5 porta l\'azione del campionato di arti marziali miste direttamente nel salotto di casa con un motore grafico migliorato e animazioni fluide. Il gameplay è stato reso più realistico con nuove meccaniche di sottomissione e colpi. La modalità Carriera permette ai giocatori di vivere l\'esperienza di un fighter, dall\'allenamento ai titoli mondiali. Il gioco include un roster aggiornato con i migliori atleti di MMA.', '2024-10-05', '16', 'https://media.contentapi.ea.com/content/dam/ufc/ufc-5/alter-egos/champions-1/common/ufc5-prime-alteregos-keyart-1920x1080-feb06.jpg.adapt.crop191x100.1200w.jpg', true);
INSERT INTO videogame VALUES (46, 'eFootball 2024', 'eFootball 2024 offre un\'esperienza calcistica completamente rinnovata con un gameplay fluido e miglioramenti nella fisica della palla. Il gioco è gratuito e si concentra sull\'evoluzione delle squadre, con aggiornamenti costanti per riflettere le performance reali delle squadre di calcio. La modalità multiplayer è al centro dell\'esperienza, con tornei e sfide globali che mettono alla prova le abilità dei giocatori.', '2024-09-12', '3', 'https://streetfootie.net/wp-content/uploads/2023/09/efootball-2024-1536x864.jpg', true);
INSERT INTO videogame VALUES (47, 'MLB The Show 24', 'MLB The Show 24 è la simulazione definitiva del baseball, con una fisica migliorata e un\'attenzione ai dettagli che cattura la tensione e l\'eccitazione del grande campionato. Le modalità Carriera e Franchise offrono nuove opzioni di gestione delle squadre, mentre le modalità online permettono di sfidare giocatori di tutto il mondo. Il gioco presenta tutti i giocatori e le squadre ufficiali della Major League Baseball, con grafica e animazioni potenziate.', '2024-09-30', '3', 'https://gamingbolt.com/wp-content/uploads/2024/01/mlb-the-show-24.jpg', true);
INSERT INTO videogame VALUES (48, 'NHL 24', 'NHL 24 offre un\'esperienza di hockey su ghiaccio ancora più intensa con nuove meccaniche di controllo del disco e animazioni migliorate. La modalità Be A Pro permette ai giocatori di vivere la carriera di un atleta della NHL, con sfide realistiche e la possibilità di guidare la propria squadra alla vittoria della Stanley Cup. Il multiplayer include tornei online e sfide competitive.', '2024-09-28', '3', 'https://image.api.playstation.com/vulcan/ap/rnd/202307/2821/45434acbdde1dd1807ee36c748ec3d182a415cbb1c9aabe7.png', true);
INSERT INTO videogame VALUES (49, 'Riders Republic', 'Riders Republic è un gioco sportivo che combina BMX, snowboard, sci e wingsuit in un\'esperienza adrenalinica ambientata in vasti scenari naturali. Con competizioni multiplayer che supportano fino a 50 giocatori simultaneamente, il gioco offre un mix di corse, acrobazie e sfide estreme. La modalità Carriera permette ai giocatori di diventare i migliori in ciascuna disciplina sportiva.', '2024-09-19', '12', 'https://image.api.playstation.com/vulcan/img/rnd/202112/2100/7eEv1gTTKw9GA5OWi00yyT3s.png', true);
INSERT INTO videogame VALUES (50, 'MotoGP 24', 'MotoGP 24 è la simulazione ufficiale del campionato mondiale di motociclismo, con un gameplay ancora più realistico e un\'attenzione maniacale ai dettagli. Il gioco offre tutte le moto, i piloti e i circuiti ufficiali della stagione. La modalità Carriera permette ai giocatori di vivere la vita di un pilota professionista, con sfide di gara intense e strategie per la gestione della squadra.', '2024-04-26', '3', 'https://gaming-cdn.com/images/products/16249/616x353/motogp-24-pc-gioco-steam-cover.jpg?v=1717081060', true);

INSERT INTO genere VALUES(1, 'Fantasy');
INSERT INTO genere VALUES(2, 'Azione');
INSERT INTO genere VALUES(3, 'Avventura');
INSERT INTO genere VALUES(4, 'RPG');
INSERT INTO genere VALUES(5, 'Sport');
INSERT INTO genere VALUES(6, 'Picchiaduro');

INSERT INTO videogame_genere VALUES(1,1, 1);
INSERT INTO videogame_genere VALUES(2,2, 1);
INSERT INTO videogame_genere VALUES(3,3, 1);
INSERT INTO videogame_genere VALUES(4,4, 1);
INSERT INTO videogame_genere VALUES(5,5, 1);
INSERT INTO videogame_genere VALUES(6,6, 1);
INSERT INTO videogame_genere VALUES(7,7, 1);
INSERT INTO videogame_genere VALUES(8,8, 1);
INSERT INTO videogame_genere VALUES(9,9, 1);
INSERT INTO videogame_genere VALUES(10,10, 1);
INSERT INTO videogame_genere VALUES(11,11, 2);
INSERT INTO videogame_genere VALUES(12,12, 2);
INSERT INTO videogame_genere VALUES(13,13, 2);
INSERT INTO videogame_genere VALUES(14,14, 2);
INSERT INTO videogame_genere VALUES(15,15, 2);
INSERT INTO videogame_genere VALUES(16,16, 2);
INSERT INTO videogame_genere VALUES(17,17, 2);
INSERT INTO videogame_genere VALUES(18,18, 2);
INSERT INTO videogame_genere VALUES(19,19, 2);
INSERT INTO videogame_genere VALUES(20,20, 2);
INSERT INTO videogame_genere VALUES(21,21, 3);
INSERT INTO videogame_genere VALUES(22,22, 3);
INSERT INTO videogame_genere VALUES(23,23, 3);
INSERT INTO videogame_genere VALUES(24,24, 3);
INSERT INTO videogame_genere VALUES(25,25, 3);
INSERT INTO videogame_genere VALUES(26,26, 3);
INSERT INTO videogame_genere VALUES(27,27, 3);
INSERT INTO videogame_genere VALUES(28,28, 3);
INSERT INTO videogame_genere VALUES(29,29, 3);
INSERT INTO videogame_genere VALUES(30,30, 3);
INSERT INTO videogame_genere VALUES(31,31, 4);
INSERT INTO videogame_genere VALUES(32,32, 4);
INSERT INTO videogame_genere VALUES(33,33, 4);
INSERT INTO videogame_genere VALUES(34,34, 4);
INSERT INTO videogame_genere VALUES(35,35, 4);
INSERT INTO videogame_genere VALUES(36,36, 6);
INSERT INTO videogame_genere VALUES(37,37, 4);
INSERT INTO videogame_genere VALUES(38,38, 4);
INSERT INTO videogame_genere VALUES(39,39, 4);
INSERT INTO videogame_genere VALUES(40,40, 4);
INSERT INTO videogame_genere VALUES(41,41, 5);
INSERT INTO videogame_genere VALUES(42,42, 5);
INSERT INTO videogame_genere VALUES(43,43, 5);
INSERT INTO videogame_genere VALUES(44,44, 5);
INSERT INTO videogame_genere VALUES(45,45, 5);
INSERT INTO videogame_genere VALUES(46,46, 5);
INSERT INTO videogame_genere VALUES(47,47, 5);
INSERT INTO videogame_genere VALUES(48,48, 5);
INSERT INTO videogame_genere VALUES(49,49, 5);
INSERT INTO videogame_genere VALUES(50,50, 5);

select * from videogame_genere;


INSERT INTO sviluppatore (id, nome) VALUES (1, 'FromSoftware'); -- Elden Ring
INSERT INTO sviluppatore (id, nome) VALUES (2, 'Square Enix'); -- Final Fantasy XVI/Final Fantasy VII Remake 
INSERT INTO sviluppatore (id, nome) VALUES (3, 'Larian Studios'); -- Baldur's Gate III
INSERT INTO sviluppatore (id, nome) VALUES (4, 'Portkey Games'); -- Hogwarts Legacy
INSERT INTO sviluppatore (id, nome) VALUES (5, 'Luminous Productions'); -- Forspoken
INSERT INTO sviluppatore (id, nome) VALUES (6, 'Nintendo'); -- The Legend of Zelda: Tears of the Kingdom
INSERT INTO sviluppatore (id, nome) VALUES (7, 'Playground Games'); -- Fable
INSERT INTO sviluppatore (id, nome) VALUES (8, 'BioWare'); -- Dragon Age: Dreadwolf/Mass Effect Legendary Edition
INSERT INTO sviluppatore (id, nome) VALUES (9, 'Blizzard Entertainment'); -- Diablo IV
INSERT INTO sviluppatore (id, nome) VALUES (10, 'Spiders'); -- GreedFall 2

INSERT INTO sviluppatore (id, nome) VALUES (11, 'Infinity Ward'); -- Call of Duty: Modern Warfare II
INSERT INTO sviluppatore (id, nome) VALUES (12, 'Respawn Entertainment'); -- Star Wars Jedi: Survivor
INSERT INTO sviluppatore (id, nome) VALUES (13, 'Ubisoft'); -- Assassin's Creed Mirage/Immortals Fenyx Rising/Riders Republic 
INSERT INTO sviluppatore (id, nome) VALUES (14, 'Insomniac Games'); -- Spider-Man 2/ Ratchet & Clank: Rift Apart
INSERT INTO sviluppatore (id, nome) VALUES (15, 'Remedy Entertainment'); -- Alan Wake II
INSERT INTO sviluppatore (id, nome) VALUES (16, 'Neowiz Games'); -- Lies of P
INSERT INTO sviluppatore (id, nome) VALUES (17, 'NetherRealm Studios'); -- Mortal Kombat 1
INSERT INTO sviluppatore (id, nome) VALUES (18, 'FromSoftware'); -- armored 
INSERT INTO sviluppatore (id, nome) VALUES (19, 'Capcom'); -- street fighter/Monster Hunter: World 
INSERT INTO sviluppatore (id, nome) VALUES (20, 'Dambuster Studios'); -- dead island

INSERT INTO sviluppatore (id, nome) VALUES (21, 'Guerrilla Games'); -- Horizon Forbidden West
INSERT INTO sviluppatore (id, nome) VALUES (22, 'Asobo Studio'); -- A Plague Tale: Requiem
INSERT INTO sviluppatore (id, nome) VALUES (23, 'Ember Lab'); -- Kena: Bridge of Spirits
INSERT INTO sviluppatore (id, nome) VALUES (24, 'Giant Squid'); -- the pathless
INSERT INTO sviluppatore (id, nome) VALUES (25, 'Hazelight Studios'); -- It Takes Two 
INSERT INTO sviluppatore (id, nome) VALUES (26, 'BlueTwelve Studio'); -- Stray 

INSERT INTO sviluppatore (id, nome) VALUES (27, 'Awaceb'); -- tchia
INSERT INTO sviluppatore (id, nome) VALUES (28, 'Tarsier Studios'); -- little nightmare2

INSERT INTO sviluppatore (id, nome) VALUES (29, 'CD Projekt Red'); -- tThe Witcher 3: Wild Hun
INSERT INTO sviluppatore (id, nome) VALUES (30, ' Atlus'); -- Persona 5
INSERT INTO sviluppatore (id, nome) VALUES (31, 'Larian Studios'); -- Divinity: Original Sin 2
INSERT INTO sviluppatore (id, nome) VALUES (32, ' CD Projekt Red'); -- cyberpunk
INSERT INTO sviluppatore (id, nome) VALUES (33, 'Respawn Entertainment'); -- Star Wars Jedi: Fallen Order
INSERT INTO sviluppatore (id, nome) VALUES (34, 'miHoYo'); -- Genshin Impact

INSERT INTO sviluppatore (id, nome) VALUES (35, 'EA sport'); -- FIFA 24/Madden NFL 24 /EA Sports UFC 5</NHL 24 
INSERT INTO sviluppatore (id, nome) VALUES (36, ' Visual Concepts'); -- NBA 2K24
INSERT INTO sviluppatore (id, nome) VALUES (37, 'Codemasters'); -- f1
INSERT INTO sviluppatore (id, nome) VALUES (38, 'Konami'); -- efootball
INSERT INTO sviluppatore (id, nome) VALUES (39, ' San Diego Studio'); -- mbl
INSERT INTO sviluppatore (id, nome) VALUES (40, 'Milestone'); -- motogp
INSERT INTO sviluppatore (id, nome) VALUES (41, 'Spike Chunsoft'); -- Dragon Ball: Sparking! Zero



INSERT INTO videogame_sviluppatore VALUES(1,1, 1);
INSERT INTO videogame_sviluppatore VALUES(2,2, 2);
INSERT INTO videogame_sviluppatore VALUES(3,3, 3);
INSERT INTO videogame_sviluppatore VALUES(4,4, 4);
INSERT INTO videogame_sviluppatore VALUES(5,5, 5);
INSERT INTO videogame_sviluppatore VALUES(6,6, 6);
INSERT INTO videogame_sviluppatore VALUES(7,7, 7);
INSERT INTO videogame_sviluppatore VALUES(8,8, 8);
INSERT INTO videogame_sviluppatore VALUES(9,9, 9);
INSERT INTO videogame_sviluppatore VALUES(10,10, 10);

INSERT INTO videogame_sviluppatore VALUES(11,11, 11);
INSERT INTO videogame_sviluppatore VALUES(12,12, 12);
INSERT INTO videogame_sviluppatore VALUES(13,13, 13);
INSERT INTO videogame_sviluppatore VALUES(14,14, 14);
INSERT INTO videogame_sviluppatore VALUES(15,15, 15);
INSERT INTO videogame_sviluppatore VALUES(16,16, 16);
INSERT INTO videogame_sviluppatore VALUES(17,17, 17);
INSERT INTO videogame_sviluppatore VALUES(18,18, 18);
INSERT INTO videogame_sviluppatore VALUES(19,19, 19);
INSERT INTO videogame_sviluppatore VALUES(20,20, 20);

INSERT INTO videogame_sviluppatore VALUES(21,21, 21);
INSERT INTO videogame_sviluppatore VALUES(22,22, 22);
INSERT INTO videogame_sviluppatore VALUES(23,23, 23);
INSERT INTO videogame_sviluppatore VALUES(24,24, 24);
INSERT INTO videogame_sviluppatore VALUES(25,25, 25);
INSERT INTO videogame_sviluppatore VALUES(26,26, 14);
INSERT INTO videogame_sviluppatore VALUES(27,27, 26);
INSERT INTO videogame_sviluppatore VALUES(28,28, 13);

INSERT INTO videogame_sviluppatore VALUES(29,29, 27);
INSERT INTO videogame_sviluppatore VALUES(30,30, 28);
INSERT INTO videogame_sviluppatore VALUES(31,31, 29);
INSERT INTO videogame_sviluppatore VALUES(32,32, 30);
INSERT INTO videogame_sviluppatore VALUES(33,33, 8 );
INSERT INTO videogame_sviluppatore VALUES(34,34, 31);
INSERT INTO videogame_sviluppatore VALUES(35,35, 2);
INSERT INTO videogame_sviluppatore VALUES(36,36, 41);
INSERT INTO videogame_sviluppatore VALUES(37,37, 19);
INSERT INTO videogame_sviluppatore VALUES(38,38, 32);
INSERT INTO videogame_sviluppatore VALUES(39,39, 33);
INSERT INTO videogame_sviluppatore VALUES(40,40, 34);
INSERT INTO videogame_sviluppatore VALUES(41,41, 35);
INSERT INTO videogame_sviluppatore VALUES(42,42, 36);
INSERT INTO videogame_sviluppatore VALUES(43,43, 37);
INSERT INTO videogame_sviluppatore VALUES(44,44, 35);
INSERT INTO videogame_sviluppatore VALUES(45,45, 35);
INSERT INTO videogame_sviluppatore VALUES(46,46, 38);
INSERT INTO videogame_sviluppatore VALUES(47,47, 39);
INSERT INTO videogame_sviluppatore VALUES(48,48, 35);
INSERT INTO videogame_sviluppatore VALUES(49,49, 13);
INSERT INTO videogame_sviluppatore VALUES(50,50, 40);

select * from videogame_sviluppatore;

INSERT INTO utente VALUES (1,'Nome1', 'Cognome1', 'utente1', 'password1', 'utente1@example.com', 'https://upload.wikimedia.org/wikipedia/commons/1/14/Diego_Maradona_2012_2.jpg');
INSERT INTO utente VALUES (2, 'Nome2', 'Cognome2','utente2', 'password2', 'utente2@example.com', 'https://wikibio.in/wp-content/uploads/2019/02/Johnny-Sins.jpg');
INSERT INTO utente VALUES ( 3,'Nome3', 'Cognome3', 'utente3', 'password3', 'utente3@example.com','https://biografieonline.it/img/bio/Lino_Banfi.jpg');


	-- id, videogame id ,utente id, commento , voto(1 a 5), difficolta (1 a 5),tempo di gioco

INSERT INTO recensione VALUES (1,1,1,'È incredibile come ovunque vai c\'è sempre da fare qualcosa, la varietà di bullds è una cosa mai vista prima in un souls. 10 anche se ha problemi di Fps perché è una cosa che stanno risolvendo, come hanno sempre fatto.',5,3,42);
INSERT INTO recensione VALUES (2,1,2,'Gioco molto bello. La grafica è fantastica, il sistema open world funziona benissimo, le boss fight sono impegnative ed è bello il fatto che alcuni nemici forti si possano affrontare in un secondo momento grazie al sistema dell\'open world.',5,4,68);
INSERT INTO recensione VALUES (3,1,3,'Bellissimo, un gioco che presenta comunque i suoi difetti a volte ma che con i vari aggiornamenti nel tempo si risolveranno. Giocarlo porta molte soddisfazioni, specialmente quando uccidi qualche boss. Gioco epico.',4,4,48);  
-- elden ring

INSERT INTO recensione VALUES (4,2,1,'che dire...sono tornato ragazzo rigiocando a questo titolo...come mi ricordavo ottimo titolo rielaborato molto bene per uscire dalla sua comoda casa di psp dei tempi,giocato e rigiocato ho ancora voglia di farlo',5,3,42);
INSERT INTO recensione VALUES (5,2,2,'Il gioco è anche carino, specialmente dopo le ultime uscite fallimentari di FF. Ma su PC a livello di ottimizzazione è un disastro come al solito.',2,4,58);
INSERT INTO recensione VALUES (6,2,3,'Bellissimo gioco con filmati e storia da film.Gameplay da rivedere.. secondo me qualcosa di simile a ff7 remake e gioco capolavoro.. capisco che il gioco a turni sia passato di moda ma secondo me il gameplay alla devil may cry per gli appassionati della serie non è piaciuto più di tanto questa è la mia idea.. comunque il gioco mi è piaciuto lo stessoStoria bellissima .Sistema di combattimento da rivedere',3,3,39);  
-- final fantasy

INSERT INTO recensione VALUES (7, 3, 1, 'Baldur\'s Gate 3 è un capolavoro narrativo con una grande profondità di gioco.', 5, 3, 42);
INSERT INTO recensione VALUES (8, 3, 2, 'Un’esperienza RPG incredibilmente complessa e coinvolgente, ma a volte caotica.', 3, 3, 34); 
-- Baldur's Gate 3
INSERT INTO recensione VALUES (9, 4, 1, 'Hogwarts Legacy è una lettera d’amore ai fan del mondo magico di Harry Potter.', 5, 3, 42);
INSERT INTO recensione VALUES (10, 4, 2, 'Un’avventura magica e divertente, anche se con alcune limitazioni tecniche.', 4, 4, 64); 
-- Hogwarts Legacy
INSERT INTO recensione VALUES (11, 5, 1, 'Forspoken ha un ottimo potenziale ma soffre di una trama poco ispirata.', 3, 3, 36);
INSERT INTO recensione VALUES (12, 5, 2, 'Sembra avere tutte le carte in regola, ma manca di profondità.', 3, 3, 42);  
-- Forspoken
INSERT INTO recensione VALUES (13, 6, 1, 'The Legend of Zelda: Tears of the Kingdom è un capolavoro, migliorando tutto dal gioco precedente.', 5, 4, 42);
INSERT INTO recensione VALUES (14, 6, 2, 'Una vera innovazione nel genere open-world, con un gameplay senza eguali.', 4, 4, 58); 
-- The Legend of Zelda: Tears of the Kingdom

INSERT INTO recensione VALUES (15, 7, 1, 'Fable è un ritorno alle origini, con un umorismo pungente e uno stile grafico affascinante.', 4, 2, 42);
INSERT INTO recensione VALUES (16, 7, 2, 'Un mondo incantevole e divertente, ma potrebbe offrire più sfide.', 4, 3, 42); 
-- Fable

INSERT INTO recensione VALUES (17, 8, 1, 'Dragon Age: Dreadwolf promette di essere una degna erede della serie.', 5, 3, 42);
INSERT INTO recensione VALUES (18, 8, 2, 'Un RPG profondo con scelte morali complesse e personaggi indimenticabili.', 5, 3, 42); 
-- Dragon Age: Dreadwolf

INSERT INTO recensione VALUES (19, 9, 1, 'Diablo IV riporta la serie alle sue radici, con un gameplay solido e una storia avvincente.', 5, 3, 42);
INSERT INTO recensione VALUES (20, 9, 2, 'Il miglior Diablo di sempre, anche se alcuni aspetti del multiplayer potevano essere migliorati.', 5, 3, 42); 
-- Diablo IV

INSERT INTO recensione VALUES (21, 10, 1, 'GreedFall 2 continua con la formula vincente del suo predecessore, aggiungendo nuove meccaniche di gioco.', 4, 3, 42);
INSERT INTO recensione VALUES (22, 10, 2, 'Un RPG ambizioso con una trama ricca, ma potrebbe migliorare il sistema di combattimento.', 4, 3, 42); 
-- GreedFall 2

INSERT INTO recensione VALUES (23, 11, 1, 'Call of Duty: Modern Warfare II è un FPS esplosivo, con una campagna avvincente e multiplayer solido.', 5, 2, 42);
INSERT INTO recensione VALUES (24, 11, 2, 'Un’ottima esperienza FPS, anche se la formula inizia a mostrare segni di stanchezza.', 4, 3, 42);
 -- Call of Duty: Modern Warfare II

INSERT INTO recensione VALUES (25, 12, 1, 'Star Wars Jedi: Survivor è un grande passo avanti rispetto al primo, con un gameplay migliorato e una trama avvincente.', 5, 3, 42);
INSERT INTO recensione VALUES (26, 12, 2, 'Un mix perfetto di combattimento, esplorazione e narrazione nel mondo di Star Wars.', 5, 3, 42); 
-- Star Wars Jedi: Survivor

INSERT INTO recensione VALUES (27, 13, 1, 'Assassin\'s Creed Mirage torna alle radici della serie, offrendo un gameplay stealth ben realizzato.', 4, 2, 42);
INSERT INTO recensione VALUES (28, 13, 2, 'Un ritorno al passato per la serie, con meno enfasi sul combattimento e più su esplorazione e furtività.', 4, 3, 42); 
-- Assassin's Creed Mirage

INSERT INTO recensione VALUES (29, 14, 1, 'Spider-Man 2 offre un gameplay frenetico e una storia coinvolgente, con miglioramenti rispetto al primo.', 5, 3, 42);
INSERT INTO recensione VALUES (30, 14, 2, 'Un seguito straordinario che espande le meccaniche del primo, anche se la formula rimane simile.', 5, 3, 42); 
-- Spider-Man 2

INSERT INTO recensione VALUES (31, 15, 1, 'Alan Wake II è un thriller psicologico incredibile, con una narrazione coinvolgente e atmosfere cupe.', 5, 3, 42);
INSERT INTO recensione VALUES (32, 15, 2, 'Un gioco atmosferico e coinvolgente, che espande la storia di Alan Wake in modi inaspettati.', 5, 3, 42); 
-- Alan Wake II

INSERT INTO recensione VALUES (33, 16, 1, 'Lies of P è un ottimo Soulslike, con un combattimento impegnativo e un’ambientazione affascinante.', 5, 4, 42);
INSERT INTO recensione VALUES (34, 16, 2, 'Un Soulslike sorprendentemente buono, con meccaniche di gioco innovative.', 5, 4, 42); 
-- Lies of P

INSERT INTO recensione VALUES (35, 17, 1, 'Mortal Kombat 1 è un reboot solido, con meccaniche di combattimento raffinate e grafica spettacolare.', 5, 3, 42);
INSERT INTO recensione VALUES (36, 17, 2, 'Un gioco di combattimento eccellente, con un roster variegato e mosse spettacolari.', 5, 3, 42); 
-- Mortal Kombat 1

INSERT INTO recensione VALUES (37, 18, 1, 'Armored Core VI: Fires of Rubicon è un gioco di mecha incredibilmente tecnico, con combattimenti impegnativi.', 5, 4, 42);
INSERT INTO recensione VALUES (38, 18, 2, 'Un ritorno al passato per i fan dei mecha, con un gameplay complesso ma gratificante.', 5, 4, 42); 
-- Armored Core VI: Fires of Rubicon

INSERT INTO recensione VALUES (39, 19, 1, 'Street Fighter 6 è un picchiaduro eccezionale, con un sistema di combattimento fluido e accessibile.', 5, 2, 42);
INSERT INTO recensione VALUES (40, 19, 2, 'Un picchiaduro che combina accessibilità e profondità, perfetto per i fan del genere.', 5, 2, 42); 
-- Street Fighter 6

INSERT INTO recensione VALUES (41, 20, 1, 'Dead Island 2 offre un’ottima esperienza di zombi, con azione frenetica e ambienti dettagliati.', 4, 3, 42);
INSERT INTO recensione VALUES (42, 20, 2, 'Un buon gioco di zombi, anche se non rivoluziona il genere.', 4, 3, 42); 
-- Dead Island 

-- nuove insert di altre recensioni


INSERT INTO recensione VALUES (43, 21, 1, 'Horizon Forbidden West è una vera meraviglia visiva con un mondo vasto e dettagliato.', 5, 3, 42);
INSERT INTO recensione VALUES (44, 21, 2, 'Un gioco eccezionale, ma a volte la trama sembra rallentare il ritmo dell’avventura.', 4, 3, 52);

INSERT INTO recensione VALUES (45, 22, 1, 'A Plague Tale: Requiem è un sequel emozionante con una narrazione potente.', 5, 4, 42);
INSERT INTO recensione VALUES (46, 22, 2, 'Un gioco emozionante con un gameplay profondo, anche se un po’ ripetitivo a tratti.', 4, 4, 60);

INSERT INTO recensione VALUES (47, 23, 1, 'Kena: Bridge of Spirits è una delizia visiva, con un gameplay accessibile e piacevole.', 5, 2, 38);
INSERT INTO recensione VALUES (48, 23, 2, 'Un’avventura incantevole, ma la difficoltà del gioco è leggermente sottotono.', 4, 3, 42);

INSERT INTO recensione VALUES (49, 24, 1, 'The Pathless è un gioco artisticamente affascinante con una narrazione evocativa.', 4, 3, 42);
INSERT INTO recensione VALUES (50, 24, 2, 'Un’esperienza unica e rilassante, anche se non per tutti i gusti.', 4, 3, 39);

INSERT INTO recensione VALUES (51, 25, 1, 'It Takes Two è una cooperativa brillante, con idee creative in ogni livello.', 5, 4, 42);
INSERT INTO recensione VALUES (52, 25, 2, 'Un capolavoro di design cooperativo, ma richiede un partner di gioco per apprezzarlo appieno.', 5, 3, 48);

INSERT INTO recensione VALUES (53, 26, 1, 'Ratchet & Clank: Rift Apart è un’esplosione di divertimento e azione, con un gameplay fluido.', 5, 3, 42);
INSERT INTO recensione VALUES (54, 26, 2, 'Un ottimo capitolo della serie, ma potrebbe offrire più innovazioni.', 4, 3, 44);

INSERT INTO recensione VALUES (55, 27, 1, 'Stray offre un’esperienza unica, con un’ambientazione cyberpunk affascinante e un gameplay emozionante.', 5, 4, 42);
INSERT INTO recensione VALUES (56, 27, 2, 'Un’avventura emozionante e unica, ma a volte un po’ lineare.', 4, 3, 48);

INSERT INTO recensione VALUES (57, 28, 1, 'Immortals Fenyx Rising è un open world divertente, con un umorismo vivace e un gameplay fluido.', 5, 3, 42);
INSERT INTO recensione VALUES (58, 28, 2, 'Un ottimo gioco di avventura, anche se chiaramente ispirato a Zelda.', 4, 3, 48);

INSERT INTO recensione VALUES (59, 29, 1, 'Tchia è un’avventura affascinante e rilassante, con un mondo esotico da esplorare.', 5, 4, 42);
INSERT INTO recensione VALUES (60, 29, 2, 'Un gioco artistico con un gameplay semplice, perfetto per chi cerca un’avventura leggera.', 4, 3, 40);

INSERT INTO recensione VALUES (61, 30, 1, 'Little Nightmares II è un capolavoro dell’horror, con un’atmosfera inquietante e un design geniale.', 5, 4, 42);
INSERT INTO recensione VALUES (62, 30, 2, 'Un’esperienza inquietante e coinvolgente, anche se la durata è piuttosto breve.', 4, 3, 36);

INSERT INTO recensione VALUES (63, 31, 1, 'The Witcher 3: Wild Hunt è un gioco di ruolo incredibilmente dettagliato, con una storia avvincente.', 5, 4, 42);
INSERT INTO recensione VALUES (64, 31, 2, 'Un RPG epico, anche se alcuni aspetti tecnici mostrano segni del tempo.', 4, 3, 48);

INSERT INTO recensione VALUES (65, 32, 1, 'Persona 5 è un JRPG brillante, con uno stile unico e un gameplay profondo.', 5, 4, 42);
INSERT INTO recensione VALUES (66, 32, 2, 'Un’esperienza unica nel suo genere, anche se a volte il ritmo rallenta.', 4, 3, 56);

INSERT INTO recensione VALUES (67, 33, 1, 'Mass Effect Legendary Edition è un ritorno glorioso, con una trilogia indimenticabile migliorata tecnicamente.', 5, 4, 42);
INSERT INTO recensione VALUES (68, 33, 2, 'Un classico rimasterizzato con cura, ma le meccaniche di gioco mostrano un po’ la loro età.', 4, 3, 52);

INSERT INTO recensione VALUES (69, 34, 1, 'Divinity: Original Sin 2 è un capolavoro del genere RPG, con una profondità tattica incredibile.', 5, 4, 42);
INSERT INTO recensione VALUES (70, 34, 2, 'Un RPG strategico incredibilmente complesso e gratificante, ma richiede un grande impegno.', 5, 4, 60);

INSERT INTO recensione VALUES (71, 35, 1, 'Final Fantasy VII Remake è una reimmaginazione epica di un classico senza tempo.', 5, 3, 42);
INSERT INTO recensione VALUES (72, 35, 2, 'Un remake ambizioso, ma che a volte si allontana troppo dall’originale.', 4, 3, 48);

INSERT INTO recensione VALUES (73, 36, 1, 'DRAGON BALL: Sparking! ZERO è un gioco di combattimento dinamico e fedele alla serie.', 5, 3, 42);
INSERT INTO recensione VALUES (74, 36, 2, 'Un ottimo gioco di Dragon Ball, ma la formula non è molto innovativa.', 4, 3, 42);

INSERT INTO recensione VALUES (75, 37, 1, 'Monster Hunter: World è un capolavoro cooperativo, con un gameplay di caccia intenso e soddisfacente.', 5, 3, 42);
INSERT INTO recensione VALUES (76, 37, 2, 'Un’esperienza incredibile per i fan del genere, ma il gioco può essere impegnativo per i neofiti.', 4, 3, 50);

INSERT INTO recensione VALUES (77, 38, 1, 'Cyberpunk 2077 è un gioco ambizioso con una narrazione profonda, ma afflitto da problemi tecnici.', 4, 3, 42);
INSERT INTO recensione VALUES (78, 38, 2, 'Un gioco che ha raggiunto il suo potenziale con le patch successive, ma il lancio è stato deludente.', 3, 3, 56);

INSERT INTO recensione VALUES (79, 39, 1, 'Star Wars Jedi: Fallen Order è un mix perfetto di azione, esplorazione e narrazione.', 5, 3, 42);
INSERT INTO recensione VALUES (80, 39, 2, 'Un grande gioco di Star Wars con meccaniche solide, anche se con qualche problema di performance.', 4, 3, 58);

INSERT INTO recensione VALUES (81, 40, 1, 'Genshin Impact è un mondo aperto straordinariamente vasto, con un sistema di combattimento fluido e avvincente.', 5, 4, 42);
INSERT INTO recensione VALUES (82, 40, 2, 'Un gioco free-to-play incredibilmente ricco di contenuti, ma la monetizzazione è piuttosto aggressiva.', 4, 4, 56);

INSERT INTO recensione VALUES (83, 41, 1, 'FIFA 24 è un altro passo avanti nel realismo del calcio, con movimenti dei giocatori sempre più naturali.', 5, 3, 42);
INSERT INTO recensione VALUES (84, 41, 2, 'Una buona evoluzione della serie, ma la modalità Ultimate Team continua a essere troppo focalizzata sulle microtransazioni.', 4, 3, 45);

INSERT INTO recensione VALUES (85, 42, 1, 'NBA 2K24 offre una simulazione di basket praticamente perfetta, con un gameplay coinvolgente.', 5, 3, 42);
INSERT INTO recensione VALUES (86, 42, 2, 'Un gioco eccellente, ma le microtransazioni restano un problema significativo.', 4, 3, 48);

INSERT INTO recensione VALUES (87, 43, 1, 'F1 2024 è una simulazione impeccabile per gli amanti delle corse, con una fisica realistica e una grafica mozzafiato.', 5, 4, 42);
INSERT INTO recensione VALUES (88, 43, 2, 'Ottima simulazione di Formula 1, anche se alcuni aspetti della modalità carriera potrebbero essere migliorati.', 4, 3, 50);

INSERT INTO recensione VALUES (89, 44, 1, 'Madden NFL 24 continua a migliorare con una fisica dei giocatori più realistica e movimenti raffinati.', 5, 4, 42);
INSERT INTO recensione VALUES (90, 44, 2, 'Un buon gioco di football americano, ma manca ancora un po’ di innovazione rispetto ai titoli precedenti.', 4, 3, 48);

INSERT INTO recensione VALUES (91, 45, 1, 'EA Sports UFC 5 offre combattimenti realistici e dinamici, con un sistema di grappling migliorato.', 5, 3, 42);
INSERT INTO recensione VALUES (92, 45, 2, 'Un ottimo gioco per gli amanti delle arti marziali miste, ma la modalità carriera è un po’ superficiale.', 4, 3, 45);

INSERT INTO recensione VALUES (93, 46, 1, 'eFootball 2024 ha migliorato molto rispetto alle versioni precedenti, con un gameplay più fluido e realistico.', 4, 3, 42);
INSERT INTO recensione VALUES (94, 46, 2, 'Un passo avanti nella serie, ma manca ancora qualcosa rispetto alla concorrenza.', 3, 3, 48);

INSERT INTO recensione VALUES (95, 47, 1, 'MLB The Show 24 è il miglior gioco di baseball sul mercato, con una simulazione quasi perfetta.', 5, 3, 42);
INSERT INTO recensione VALUES (96, 47, 2, 'Un titolo eccellente per i fan del baseball, ma potrebbe fare di più per attrarre nuovi giocatori.', 4, 3, 45);

INSERT INTO recensione VALUES (97, 48, 1, 'NHL 24 offre una simulazione di hockey sul ghiaccio precisa e divertente, con miglioramenti significativi rispetto all’edizione precedente.', 5, 4, 42);
INSERT INTO recensione VALUES (98, 48, 2, 'Un buon gioco di hockey, ma la modalità carriera ha ancora margini di miglioramento.', 4, 3, 50);

INSERT INTO recensione VALUES (99, 49, 1, 'Riders Republic è pura adrenalina, con una varietà di sport estremi che terrà i giocatori incollati allo schermo.', 5, 4, 42);
INSERT INTO recensione VALUES (100, 49, 2, 'Un gioco pieno di energia e divertimento, ma a volte le modalità di gioco possono sembrare un po’ dispersive.', 4, 3, 46);

INSERT INTO recensione VALUES (101, 50, 1, 'MotoGP 24 porta il realismo a un nuovo livello, con una simulazione impeccabile delle moto e delle corse.', 5, 4, 42);
INSERT INTO recensione VALUES (102, 50, 2, 'Un gioco eccezionale per gli appassionati di corse su due ruote, ma potrebbe essere più accessibile ai nuovi giocatori.', 4, 3, 48);

-- insert preferiti
INSERT INTO preferito VALUES (1,1, 3);
INSERT INTO preferito VALUES (2,1, 5);
INSERT INTO preferito VALUES (3,1, 23);
INSERT INTO preferito VALUES (4,1, 22);
INSERT INTO preferito VALUES (5,1, 12);