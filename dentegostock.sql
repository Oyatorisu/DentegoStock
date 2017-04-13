CREATE DATABASE dentegostock;

USE DATABASE dentegostock;

CREATE TABLE site
(
	`id` int(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `Libelle` varchar(50),
  `Adresse` varchar(50),
  `CodePostal` varchar(50),
  `Ville` varchar(50),
  `Telephone` int(11),
  `Fax` int(11),
  `Mail` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

)


CREATE TABLE `stock` 
(
  `id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT
  `NomObjet` varchar(50) NOT NULL,
  `Quantite` int(11) NOT NULL,
  `PrixUnitaire` float(11) NOT NULL,
  `id_site` int(11) NOT NULL,
  CONSTRAINT FK_idsite FOREIGN KEY (id_site) REFERENCES site(id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `historique` 
(
  `id` int(11) NOT NULL,
  `Entree` tinyint(1) NOT NULL,
  `Sortie` tinyint(1) NOT NULL,
  `id_stock` int(11) NOT NULL,
  `Quantite_initiale` int(11) NOT NULL,
  `Quantite_modif` int(11) NOT NULL,
  `DateModif` date NOT NULL,
  CONSTRAINT FK_idstock FOREIGN KEY (id_stock) REFERENCES stock(id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
