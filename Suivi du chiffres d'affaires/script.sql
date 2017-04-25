#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: CatSoin
#------------------------------------------------------------

CREATE TABLE CatSoin(
        id  Int NOT NULL ,
        Nom Varchar (70) ,
        PRIMARY KEY (id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: TypeSoin
#------------------------------------------------------------

CREATE TABLE TypeSoin(
        Id          Int NOT NULL ,
        Nom         Varchar (70) ,
        Description Varchar (100) ,
        NumDent     Int ,
        id          Int ,
        PRIMARY KEY (Id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Devis
#------------------------------------------------------------

CREATE TABLE Devis(
        Id              Int NOT NULL ,
        DateSaisie      Date ,
        Montant         Float ,
        DateAcceptation Date ,
        DPEC            Bool ,
        PRIMARY KEY (Id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Composante
#------------------------------------------------------------

CREATE TABLE Composante(
        Id  Int NOT NULL ,
        Nom Varchar (70) ,
        PRIMARY KEY (Id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Reglement
#------------------------------------------------------------

CREATE TABLE Reglement(
        Id   Int NOT NULL ,
        Mode Varchar (20) ,
        PRIMARY KEY (Id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Facture
#------------------------------------------------------------

CREATE TABLE Facture(
        Id              Int NOT NULL ,
        Montant         Float ,
        DateFacturation Date ,
        Paye            Bool ,
        Description     Varchar (100) ,
        Id_FSE          Int ,
        Id_Praticien    Int ,
        Id_Personne     Int ,
        Id_Site         Int ,
        PRIMARY KEY (Id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Encaissement
#------------------------------------------------------------

CREATE TABLE Encaissement(
        Id               Int NOT NULL ,
        Montant          Double ,
        DateEncaissement Date ,
        DateDepot        Date ,
        Id_Facture       Int ,
        Id_Reglement	 Int,
        PRIMARY KEY (Id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Tiers Payeur
#------------------------------------------------------------

CREATE TABLE Tiers_Payeur(
        Id          Int NOT NULL ,
        Nom         Varchar (70) ,
        Adresse     Varchar (100) ,
        Code_Postal Varchar (25) ,
        Ville       Varchar (50) ,
        Mail        Varchar (50) ,
        Tel         Int ,
        PRIMARY KEY (Id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: FSE
#------------------------------------------------------------

CREATE TABLE FSE(
        Id         Int NOT NULL ,
        DateFSE    Date ,
        PRIMARY KEY (Id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Personne
#------------------------------------------------------------

CREATE TABLE Personne(
        Id           Int NOT NULL ,
        Nom          Varchar (70) ,
        Prenom       Varchar (70) ,
        NumeroSS     Int ,
        Adresse      Varchar (100) ,
        CodePostal   Varchar (25) ,
        Ville        Varchar (50) ,
        Tel          Int ,
        Mail         Varchar (50) ,
        Payeur       Bool ,
        Patient      Bool ,
        Beneficiaire Bool ,
        Assure       Bool ,
        PRIMARY KEY (Id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Praticien
#------------------------------------------------------------

CREATE TABLE Praticien(
        Id         Int NOT NULL ,
        Nom        Varchar (50) ,
        Prenom     Varchar (50) ,
        Adresse    Varchar (100) ,
        CodePostal Varchar (25) ,
        Ville      Varchar (50) ,
        PRIMARY KEY (Id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Specialite
#------------------------------------------------------------

CREATE TABLE Specialite(
        Id          Int NOT NULL ,
        Description Varchar (100) ,
        PRIMARY KEY (Id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Site
#------------------------------------------------------------

CREATE TABLE Site(
        Id         Int NOT NULL ,
        Libelle    Varchar (50) ,
        Adresse    Varchar (100) ,
        CodePostal Varchar (25) ,
        Ville      Varchar (70) ,
        Tel        Int ,
        Fax        Int ,
        Mail       Varchar (50) ,
        PRIMARY KEY (Id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: RDV
#------------------------------------------------------------

CREATE TABLE RDV(
        Id           Int NOT NULL ,
        DateHeure    Datetime ,
        Annule       Bool ,
        Honore       Bool ,
        DateReport   Date ,
        Duree        Int ,
        Id_Praticien Int ,
        Id_Personne  Int ,
        Id_Site 	 Int ,
        Id_TypeSoin	 Int , 
        PRIMARY KEY (Id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Personnel
#------------------------------------------------------------

CREATE TABLE Personnel(
        Id         Int NOT NULL ,
        Nom        Varchar (70) ,
        Prenom     Varchar (70) ,
        Adresse    Varchar (100) ,
        CodePostal Varchar (25) ,
        Ville      Varchar (50) ,
        Tel        Int ,
        Mail       Varchar (70) ,
        Salaire    Double ,
        Id_Site    Int ,
        PRIMARY KEY (Id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: relation1
#------------------------------------------------------------

CREATE TABLE relation1(
        Id              Int NOT NULL ,
        Id_Encaissement Int NOT NULL ,
        PRIMARY KEY (Id ,Id_Encaissement )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: relation2
#------------------------------------------------------------

CREATE TABLE relation2(
        Id              Int NOT NULL ,
        Id_Tiers_Payeur Int NOT NULL ,
        PRIMARY KEY (Id ,Id_Tiers_Payeur )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: relation5
#------------------------------------------------------------

CREATE TABLE relation5(
        id Int NOT NULL ,
        Id Int NOT NULL ,
        PRIMARY KEY (id ,Id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: relation9
#------------------------------------------------------------

CREATE TABLE relation9(
        Id       Int NOT NULL ,
        Id_Devis Int NOT NULL ,
        PRIMARY KEY (Id ,Id_Devis )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: relation10
#------------------------------------------------------------

CREATE TABLE relation10(
        Id Int NOT NULL ,
        id Int NOT NULL ,
        PRIMARY KEY (Id ,id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: relation11
#------------------------------------------------------------

CREATE TABLE relation11(
        Id         Int NOT NULL ,
        Id_Facture Int NOT NULL ,
        PRIMARY KEY (Id ,Id_Facture )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: relation13
#------------------------------------------------------------

CREATE TABLE relation13(
        Id           Int NOT NULL ,
        Id_Praticien Int NOT NULL ,
        PRIMARY KEY (Id ,Id_Praticien )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: relation16
#------------------------------------------------------------

CREATE TABLE relation16(
        Id Int NOT NULL ,
        id Int NOT NULL ,
        PRIMARY KEY (Id ,id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: relation14
#------------------------------------------------------------

CREATE TABLE relation14(
        Id           Int NOT NULL ,
        Id_Praticien Int NOT NULL ,
        PRIMARY KEY (Id ,Id_Praticien )
)ENGINE=InnoDB;

ALTER TABLE TypeSoin ADD CONSTRAINT FK_TypeSoin_id FOREIGN KEY (id) REFERENCES CatSoin(id);
ALTER TABLE Facture ADD CONSTRAINT FK_Facture_Id_FSE FOREIGN KEY (Id_FSE) REFERENCES FSE(Id);
ALTER TABLE Facture ADD CONSTRAINT FK_Facture_Id_Praticien FOREIGN KEY (Id_Praticien) REFERENCES Praticien(Id);
ALTER TABLE Facture ADD CONSTRAINT FK_Facture_Id_Personne FOREIGN KEY (Id_Personne) REFERENCES Personne(Id);
ALTER TABLE Facture ADD CONSTRAINT FK_Facture_Id_Site FOREIGN KEY (Id_Site) REFERENCES Site(Id);
ALTER TABLE Encaissement ADD CONSTRAINT FK_Encaissement_Id_Facture FOREIGN KEY (Id_Facture) REFERENCES Facture(Id);
ALTER TABLE FSE ADD CONSTRAINT FK_FSE_Id_Facture FOREIGN KEY (Id_Facture) REFERENCES Facture(Id);
ALTER TABLE RDV ADD CONSTRAINT FK_RDV_Id_Praticien FOREIGN KEY (Id_Praticien) REFERENCES Praticien(Id);
ALTER TABLE RDV ADD CONSTRAINT FK_RDV_Id_Personne FOREIGN KEY (Id_Personne) REFERENCES Personne(Id);
ALTER TABLE Personnel ADD CONSTRAINT FK_Personnel_Id_Site FOREIGN KEY (Id_Site) REFERENCES Site(Id);
ALTER TABLE relation1 ADD CONSTRAINT FK_relation1_Id FOREIGN KEY (Id) REFERENCES Reglement(Id);
ALTER TABLE relation1 ADD CONSTRAINT FK_relation1_Id_Encaissement FOREIGN KEY (Id_Encaissement) REFERENCES Encaissement(Id);
ALTER TABLE relation2 ADD CONSTRAINT FK_relation2_Id FOREIGN KEY (Id) REFERENCES Facture(Id);
ALTER TABLE relation2 ADD CONSTRAINT FK_relation2_Id_Tiers_Payeur FOREIGN KEY (Id_Tiers_Payeur) REFERENCES Tiers_Payeur(Id);
ALTER TABLE relation5 ADD CONSTRAINT FK_relation5_id FOREIGN KEY (id) REFERENCES CatSoin(id);
ALTER TABLE relation5 ADD CONSTRAINT FK_relation5_Id FOREIGN KEY (Id) REFERENCES Devis(Id);
ALTER TABLE relation9 ADD CONSTRAINT FK_relation9_Id FOREIGN KEY (Id) REFERENCES Facture(Id);
ALTER TABLE relation9 ADD CONSTRAINT FK_relation9_Id_Devis FOREIGN KEY (Id_Devis) REFERENCES Devis(Id);
ALTER TABLE relation10 ADD CONSTRAINT FK_relation10_Id FOREIGN KEY (Id) REFERENCES Facture(Id);
ALTER TABLE relation10 ADD CONSTRAINT FK_relation10_id FOREIGN KEY (id) REFERENCES CatSoin(id);
ALTER TABLE relation11 ADD CONSTRAINT FK_relation11_Id FOREIGN KEY (Id) REFERENCES Composante(Id);
ALTER TABLE relation11 ADD CONSTRAINT FK_relation11_Id_Facture FOREIGN KEY (Id_Facture) REFERENCES Facture(Id);
ALTER TABLE relation13 ADD CONSTRAINT FK_relation13_Id FOREIGN KEY (Id) REFERENCES Specialite(Id);
ALTER TABLE relation13 ADD CONSTRAINT FK_relation13_Id_Praticien FOREIGN KEY (Id_Praticien) REFERENCES Praticien(Id);
ALTER TABLE relation16 ADD CONSTRAINT FK_relation16_Id FOREIGN KEY (Id) REFERENCES RDV(Id);
ALTER TABLE relation16 ADD CONSTRAINT FK_relation16_id FOREIGN KEY (id) REFERENCES CatSoin(id);
ALTER TABLE relation14 ADD CONSTRAINT FK_relation14_Id FOREIGN KEY (Id) REFERENCES Site(Id);
ALTER TABLE relation14 ADD CONSTRAINT FK_relation14_Id_Praticien FOREIGN KEY (Id_Praticien) REFERENCES Praticien(Id);
