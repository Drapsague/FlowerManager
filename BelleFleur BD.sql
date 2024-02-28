DROP DATABASE IF EXISTS FleurDB;
CREATE DATABASE IF NOT EXISTS FleurDB;
USE FleurDB;


DROP TABLE IF EXISTS Clients;
CREATE TABLE Clients (
    ClientID INT AUTO_INCREMENT PRIMARY KEY,
    Nom VARCHAR(50),
    Prenom VARCHAR(50),
    NumeroTelephone VARCHAR(20),
    Courriel VARCHAR(100) UNIQUE,
    MotDePasse VARCHAR(255),
    AdresseFacturation VARCHAR(255),
    CarteCredit VARCHAR(20),
    StatutFidelite VARCHAR(50),
    DateInscription DATETIME
);
DROP TABLE IF EXISTS EtatsCommande;
CREATE TABLE EtatsCommande (
    CodeEtat VARCHAR(5) PRIMARY KEY,
    Etat VARCHAR(100)
    
);
INSERT INTO EtatsCommande (CodeEtat, Etat) VALUES ('VINV', 'Commande standard pour laquelle un employé doit vérifier l’inventaire.');
INSERT INTO EtatsCommande (CodeEtat, Etat) VALUES ('CC', 'Commande complète. ');
INSERT INTO EtatsCommande (CodeEtat, Etat) VALUES ('CPAV', 'Commande personnalisée à vérifier.  ');
INSERT INTO EtatsCommande (CodeEtat, Etat) VALUES ('CAL', 'Commande à livrer. La commande est prête ! ');
INSERT INTO EtatsCommande (CodeEtat, Etat) VALUES ('CL', 'Commande livrée. La commande a été livrée à l’adresse indiquée par le client.');

DROP TABLE IF EXISTS Commandes;
CREATE TABLE Commandes (
    CommandeID INT AUTO_INCREMENT PRIMARY KEY,
    ClientID INT,
    BouquetID INT,
    CodeEtat VARCHAR(50),
    AdresseLivraison VARCHAR(255),
    Message TEXT,
    TypeCommande VARCHAR(50),
    DateLivraison DATETIME,
    DateCommande DATETIME,
    
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID),
    FOREIGN KEY (CodeEtat) REFERENCES EtatsCommande(CodeEtat)
);
ALTER TABLE Commandes ADD COLUMN Composition VARCHAR(255) NULL;


#SELECT CommandeID, DateCommande, DateLivraison, AdresseLivraison, Message, TypeCommande, Etat
#FROM Commandes
#INNER JOIN EtatsCommande ON Commandes.CodeEtat = EtatsCommande.CodeEtat;

#INSERT INTO Commandes (ClientID, CodeEtat, AdresseLivraison, Message, TypeCommande, DateLivraison, DateCommande) 
#VALUES (@ClientID, @CodeEtat, @adresseLivraison, @message, @TypeCommande, DATE_ADD(CURDATE(), INTERVAL 2 DAY), CURDATE());


DROP TABLE IF EXISTS BouquetsStandards;
CREATE TABLE BouquetsStandards (
    BouquetID INT PRIMARY KEY,
    Nom VARCHAR(100),
    Prix INTEGER,
    Categorie VARCHAR(100)
);

DROP TABLE IF EXISTS Fleurs;
CREATE TABLE Fleurs (
    FleurID INT AUTO_INCREMENT PRIMARY KEY,
    Nom VARCHAR(50),
    Prix DECIMAL(10, 2),
    Disponibilite VARCHAR(50)
);

DROP TABLE IF EXISTS ItemsCommande;
CREATE TABLE ItemsCommande (
    ItemID INT AUTO_INCREMENT PRIMARY KEY,
    CommandeID INT,
    Type VARCHAR(50),
    ProduitID INT,
    Quantite INT,
    FOREIGN KEY (CommandeID) REFERENCES Commandes(CommandeID)
);

DROP TABLE IF EXISTS Stocks;
CREATE TABLE Stocks (
    StockID INT AUTO_INCREMENT PRIMARY KEY,
    ProduitID INT,
    Quantite INT,
    SeuilAlerte INT
);

DROP TABLE IF EXISTS Bouquets;
CREATE TABLE Bouquets (
    ID int NOT NULL AUTO_INCREMENT,
    Nom varchar(50) NOT NULL,
    CompositionFleurs varchar(255) NOT NULL,
    Prix decimal(10, 2) NOT NULL,
    Categorie varchar(50) NOT NULL,
    PRIMARY KEY (ID)
);


INSERT INTO Clients VALUES (1,'Doe', 'John', '0123456789', 'jane.smith@example.com', 'password1', '123 Rue de la Paix', '1111222233334444', 'Standard', '2021-01-01');
INSERT INTO Clients VALUES (2,'Smith', 'Jane', '0987654321', 'jan.smith@exampe.com', 'password2', '456 Rue des Fleurs', '2222333344445555', 'Premium', '2021-03-15');
INSERT INTO Clients VALUES (3,'Martin', 'Pierre', '0345678912', 'pierre.martin@example.com', 'password3', '789 Boulevard des Roses', '3333444455556666', 'Standard', '2021-06-30');
INSERT INTO Clients VALUES (4,'Dupont', 'Alice', '0765432189', 'alice.dupont@example.com', 'password4', '135 Avenue des Orchidées', '4444555566667777', 'Premium', '2021-09-01');
INSERT INTO Clients VALUES (5,'Lopez', 'Carlos', '0524789631', 'carlos.lopez@example.com', 'password5', '246 Rue des Tulipes', '5555666677778888', 'Standard', '2021-12-15');


INSERT INTO Commandes (CommandeID, ClientID, CodeEtat, AdresseLivraison, Message, TypeCommande, DateLivraison, DateCommande) VALUES
(1, 1, 'CL', '123 Rue de la Paix', 'Message 1', 'Commande personnalisée', DATE_ADD(CURDATE(), INTERVAL 2 DAY), CURDATE()),
(2, 2, 'VINV', '456 Rue des Fleurs', 'Message 2', 'Commande standard', DATE_ADD(CURDATE(), INTERVAL 3 DAY), CURDATE()),
(3, 2, 'CPAV', '789 Avenue des Roses', 'Message 3', 'Commande personnalisée', DATE_ADD(CURDATE(), INTERVAL 4 DAY), CURDATE()),
(4, 3, 'CC', '1011 Rue des Jardins', 'Message 4', 'Commande standard', DATE_ADD(CURDATE(), INTERVAL 5 DAY), CURDATE());

INSERT INTO BouquetsStandards VALUES (1, 'Gros Merci', 45, 'Toute occasion');
INSERT INTO BouquetsStandards VALUES (2, 'L’amoureux', 65, 'St-Valentin');
INSERT INTO BouquetsStandards VALUES (3, 'L’Exotique', 40, 'Toute occasion');
INSERT INTO BouquetsStandards VALUES (4, 'Maman', 80, 'Fête des mères');
INSERT INTO BouquetsStandards VALUES (5, 'Vive la mariée', 120, 'Mariage ');


