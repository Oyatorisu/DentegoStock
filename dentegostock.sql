CREATE DATABASE dentegostock;

USE  dentegostock;

CREATE TABLE site
(
	`id` int(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `Libelle` varchar(50),
  `Adresse` varchar(50),
  `CodePostal` varchar(50),
  `Ville` varchar(50),
  `Telephone` int(11),
  `Fax` int(11)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



CREATE TABLE `categorie`
(
    `id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nom` varchar(50)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `fournisseur`
(
    `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nom` varchar(50),
    `adresse` varchar(80),
    `ville` varchar(50),
    `codepostal` varchar(6),
    `telephone` varchar(10)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `stock` 
(
  `id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `NomObjet` varchar(250) NOT NULL,
  `Quantite` int(11) NOT NULL,
  `PrixUnitaire` float NOT NULL,
  `id_site` int(11) NOT NULL,
  `id_cat` int(11) NOT NULL,
  `id_four` int(11) NOT NULL,
  `codearticle` int(11) NOT NULL,
  CONSTRAINT FK_idsite FOREIGN KEY (id_site) REFERENCES site(id),
  CONSTRAINT FK_idcat FOREIGN KEY (id_cat) REFERENCES categorie(id),
  CONSTRAINT FK_idfour FOREIGN KEY (id_four) REFERENCES fournisseur(id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `historique` 
(
  `id` int(11) NOT NULL,
  `EntreeSortie` tinyint(1) NOT NULL,
  `id_stock` int(11) NOT NULL,
  `Quantite_initiale` int(11) NOT NULL,
  `Quantite_modif` int(11) NOT NULL,
  `DateModif` date NOT NULL,
  CONSTRAINT FK_idstock FOREIGN KEY (id_stock) REFERENCES stock(id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;