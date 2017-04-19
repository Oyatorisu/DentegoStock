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


CREATE TABLE `stock` 
(
  `id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT
  `NomObjet` varchar(50) NOT NULL,
  `Quantite` int(11) NOT NULL,
  `PrixUnitaire` float(11) NOT NULL,
  `id_site` int(11) NOT NULL,
  `id_cat` int(11) NOT NULL,
  `id_four` int(11) NOT NULL,
  CONSTRAINT FK_idsite FOREIGN KEY (id_site) REFERENCES site(id),
  CONSTRAINT FK_idcat FOREIGN KEY (id_cat) REFERENCES categorie(id),
  CONSTRAINT FK_idfour FOREIGN KEY (id_four) REFERENCES fournisseur(id)
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

CREATE TABLE `categorie`
(
    `id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nom` varchar(50)
)

CREATE TABLE `fournisseur`
(
    `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nom` varchar(50),
    `adresse` varchar(80),
    `ville` varchar(50),
    `codepostal` varchar(6),
    `telephone` varchar(10)
)


INSERT INTO `stock` (`id`,`NomObjet`,`Quantite`,`PrixUnitaire`,`id_site`) VALUES (1,"Scarlett",5,"25.22",3),(2,"Eagan",34,"8.30",1),(3,"Rachel",50,"18.29",4),(4,"Lareina",40,"8.74",7),(5,"Ila",8,"11.10",2),(6,"May",35,"19.12",9),(7,"Sacha",9,"5.02",5),(8,"Quinn",20,"29.33",1),(9,"Kaseem",6,"10.22",9),(10,"MacKenzie",47,"26.68",3);
INSERT INTO `stock` (`id`,`NomObjet`,`Quantite`,`PrixUnitaire`,`id_site`) VALUES (11,"Remedios",40,"8.78",1),(12,"Carlos",25,"20.31",8),(13,"Preston",50,"27.18",9),(14,"Brittany",44,"20.61",4),(15,"Maggie",18,"21.19",1),(16,"Imelda",22,"22.74",4),(17,"Abdul",40,"29.25",6),(18,"Colleen",9,"7.66",8),(19,"Buffy",15,"18.37",2),(20,"Robert",18,"9.90",6);
INSERT INTO `stock` (`id`,`NomObjet`,`Quantite`,`PrixUnitaire`,`id_site`) VALUES (21,"Blake",50,"21.21",3),(22,"Colorado",42,"14.68",2),(23,"Brenda",39,"21.80",1),(24,"Simon",27,"1.66",2),(25,"Mufutau",6,"17.28",4),(26,"Daniel",19,"26.22",3),(27,"Chadwick",40,"14.30",8),(28,"Jonah",14,"17.87",5),(29,"Irene",41,"21.96",8),(30,"Quinn",23,"27.68",7);
INSERT INTO `stock` (`id`,`NomObjet`,`Quantite`,`PrixUnitaire`,`id_site`) VALUES (31,"Kathleen",27,"29.17",3),(32,"Abigail",27,"22.04",7),(33,"Ronan",17,"13.12",2),(34,"Zena",42,"21.56",9),(35,"Tanya",6,"29.90",1),(36,"Olivia",29,"21.63",8),(37,"Tanek",50,"4.88",7),(38,"Mark",15,"13.47",4),(39,"Kuame",27,"25.09",5),(40,"MacKensie",32,"12.52",3);
INSERT INTO `stock` (`id`,`NomObjet`,`Quantite`,`PrixUnitaire`,`id_site`) VALUES (41,"Beatrice",32,"16.05",5),(42,"Hadassah",49,"12.96",6),(43,"Kelsie",20,"16.66",7),(44,"Alfonso",13,"20.48",5),(45,"Adria",27,"2.66",3),(46,"Fitzgerald",40,"24.46",7),(47,"Maisie",50,"20.35",1),(48,"Clare",6,"19.68",7),(49,"Abdul",18,"5.34",4),(50,"Abbot",23,"26.40",8);
INSERT INTO `stock` (`id`,`NomObjet`,`Quantite`,`PrixUnitaire`,`id_site`) VALUES (51,"Lavinia",31,"21.22",9),(52,"Roanna",16,"2.67",1),(53,"Tyler",17,"17.69",4),(54,"Gregory",48,"25.91",4),(55,"TaShya",10,"8.15",1),(56,"Zephania",6,"21.98",9),(57,"Emma",40,"7.25",9),(58,"Jerome",11,"8.16",2),(59,"Christine",13,"12.61",7),(60,"Xenos",14,"2.33",3);
INSERT INTO `stock` (`id`,`NomObjet`,`Quantite`,`PrixUnitaire`,`id_site`) VALUES (61,"Kendall",19,"6.87",4),(62,"Rhonda",19,"8.49",9),(63,"Gareth",18,"2.46",4),(64,"Lance",12,"16.43",6),(65,"Brian",43,"9.09",9),(66,"Arden",8,"27.62",4),(67,"Holly",42,"12.67",4),(68,"Mufutau",36,"2.93",5),(69,"Maggy",37,"5.98",4),(70,"Brock",22,"7.56",7);
INSERT INTO `stock` (`id`,`NomObjet`,`Quantite`,`PrixUnitaire`,`id_site`) VALUES (71,"Erich",36,"16.27",1),(72,"Xena",42,"1.66",7),(73,"Alana",38,"20.11",8),(74,"Colleen",30,"15.91",7),(75,"Remedios",27,"13.33",9),(76,"Anjolie",10,"10.61",8),(77,"Hiroko",12,"19.12",1),(78,"Alexandra",12,"1.09",7),(79,"Kasimir",15,"20.71",8),(80,"Sierra",49,"15.13",4);
INSERT INTO `stock` (`id`,`NomObjet`,`Quantite`,`PrixUnitaire`,`id_site`) VALUES (81,"Zena",14,"11.52",1),(82,"Adele",14,"20.03",7),(83,"Jamal",25,"10.29",5),(84,"Samantha",39,"12.37",2),(85,"Cameron",33,"4.98",5),(86,"Kylee",13,"22.20",5),(87,"Aileen",36,"26.49",4),(88,"Carlos",40,"11.80",6),(89,"Aline",13,"29.82",5),(90,"Alec",31,"9.18",3);
INSERT INTO `stock` (`id`,`NomObjet`,`Quantite`,`PrixUnitaire`,`id_site`) VALUES (91,"Jolie",30,"26.48",9),(92,"Harper",40,"3.39",6),(93,"Phillip",22,"9.55",8),(94,"Keefe",48,"28.93",9),(95,"Leonard",29,"4.79",8),(96,"Riley",50,"10.52",5),(97,"Xanthus",37,"1.39",4),(98,"Logan",29,"17.18",2),(99,"Selma",7,"28.33",7),(100,"Allegra",14,"12.03",6);


INSERT INTO `site`(`id`,`Libelle`) VALUES 
(1,"Champerret"),
(2,"Marcel Sembat"),
(3,"Cannes"),
(4,"Chalons sur Saone"),
(5,"Hotel de Ville"),
(6,"Nice"),
(7,"Porte d'Orléans"),
(8,"Voltaire"),
(9,"Keter");