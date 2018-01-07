CREATE TABLE Poslovnice (
  id INTEGER PRIMARY KEY NOT NULL,
  id_nadredjene_poslovnice INTEGER,
  tip_poslovnice VARCHAR(255) NOT NULL ,
  sjediste VARCHAR(255) NOT NULL ,
  raspoloziva_sredstva FLOAT NOT NULL ,
  porez_na_dobitak FLOAT NOT NULL
);

ALTER TABLE Poslovnice ADD CONSTRAINT strani_kljuc_poslovnice FOREIGN KEY(id_nadredjene_poslovnice) REFERENCES Poslovnice(id);

CREATE SEQUENCE incrementer INCREMENT BY 1 START WITH 0 MINVALUE 0 NOCACHE NOCYCLE;

SELECT *
  FROM user_cons_columns
 WHERE table_name = 'ZAPOSLENI';

INSERT INTO Poslovnice(id, tip_poslovnice, sjediste, raspoloziva_sredstva, porez_na_dobitak) VALUES
  (incrementer.nextval, 'glavna', 'Ciuadad de Juarez', 999999999.15, 0.025);
INSERT INTO Poslovnice(id, id_nadredjene_poslovnice, tip_poslovnice, sjediste, raspoloziva_sredstva, porez_na_dobitak) VALUES
  (incrementer.nextval, 0, 'regionalna centralna', 'Kosovo', 554687.12, 0.03);
INSERT INTO Poslovnice(id, id_nadredjene_poslovnice, tip_poslovnice, sjediste, raspoloziva_sredstva, porez_na_dobitak) VALUES
  (incrementer.nextval, 0, 'regionalna centralna', 'Berlin', 9455123.18, 0.11);
INSERT INTO Poslovnice(id, id_nadredjene_poslovnice, tip_poslovnice, sjediste, raspoloziva_sredstva, porez_na_dobitak) VALUES
  (incrementer.nextval, 0, 'regionalna centralna', 'Cuba', 10465123.25, 0.22);
INSERT INTO Poslovnice(id, id_nadredjene_poslovnice, tip_poslovnice, sjediste, raspoloziva_sredstva, porez_na_dobitak) VALUES
  (incrementer.nextval, 2, 'obicna', 'Amsterdam', 645123.18, 0.11);
INSERT INTO Poslovnice(id, id_nadredjene_poslovnice, tip_poslovnice, sjediste, raspoloziva_sredstva, porez_na_dobitak) VALUES
  (incrementer.nextval, 2, 'obicna', 'Paris', 765123.22, 0.11);
INSERT INTO Poslovnice(id, id_nadredjene_poslovnice, tip_poslovnice, sjediste, raspoloziva_sredstva, porez_na_dobitak) VALUES
  (incrementer.nextval, 1, 'obicna', 'Sarajevo', 210135.22, 0.03);
INSERT INTO Poslovnice(id, id_nadredjene_poslovnice, tip_poslovnice, sjediste, raspoloziva_sredstva, porez_na_dobitak) VALUES
  (incrementer.nextval, 1, 'obicna', 'Beograd', 546123.22, 0.03);
INSERT INTO Poslovnice(id, id_nadredjene_poslovnice, tip_poslovnice, sjediste, raspoloziva_sredstva, porez_na_dobitak) VALUES
  (incrementer.nextval, 2, 'obicna', 'Paris', 765123.22, 0.11);
INSERT INTO Poslovnice(id, id_nadredjene_poslovnice, tip_poslovnice, sjediste, raspoloziva_sredstva, porez_na_dobitak) VALUES
  (incrementer.nextval, 2, 'obicna', 'London', 664123.22, 0.11);
INSERT INTO Poslovnice(id, id_nadredjene_poslovnice, tip_poslovnice, sjediste, raspoloziva_sredstva, porez_na_dobitak) VALUES
  (incrementer.nextval, 3, 'obicna', 'Kingston', 312123.22, 0.22);
INSERT INTO Poslovnice(id, id_nadredjene_poslovnice, tip_poslovnice, sjediste, raspoloziva_sredstva, porez_na_dobitak) VALUES
  (incrementer.nextval, 3, 'obicna', 'Guatemala', 212123.22, 0.22);

SELECT *
FROM Poslovnice;

CREATE TABLE Klijenti (
  id      INTEGER PRIMARY KEY NOT NULL,
  ime     VARCHAR(255),
  prezime VARCHAR(255),
  dostupna_sredstva FLOAT,
  povecana_stopa_dobitka FLOAT,
  smanjenje_poreza FLOAT,
  poslovnica_id INTEGER NOT NULL
);

alter table Klijenti add CONSTRAINT sk_poslovnica FOREIGN KEY(poslovnica_id) REFERENCES poslovnice(id);

CREATE SEQUENCE inc22 INCREMENT BY 1 MINVALUE 0 NOCACHE  NOCYCLE;

INSERT INTO Klijenti (id, ime, prezime, dostupna_sredstva, poslovnica_id) VALUES
  (inc22.nextval, 'Reynaldo', 'Arata', 1204.4, 0);
INSERT INTO Klijenti (id, ime, prezime, dostupna_sredstva, poslovnica_id) VALUES
  (inc22.nextval, 'Samantha', 'Swords', 4564.4, 2);
INSERT INTO Klijenti (id, ime, prezime, dostupna_sredstva, poslovnica_id) VALUES
  (inc22.nextval, 'Faith', 'Dalton', 1354.65, 8);
INSERT INTO Klijenti (id, ime, prezime, dostupna_sredstva, poslovnica_id) VALUES
  (inc22.nextval, 'Vernia', 'Rylander', 2354.564, 1);
INSERT INTO Klijenti (id, ime, prezime, dostupna_sredstva, poslovnica_id) VALUES
  (inc22.nextval, 'Lakia', 'Allender', 4512.75, 8);
INSERT INTO Klijenti (id, ime, prezime, dostupna_sredstva, povecana_stopa_dobitka, smanjenje_poreza, poslovnica_id) VALUES
  (inc22.nextval, 'Jessie', 'Constable', 10000.0, 0.02, 0.05, 8);
INSERT INTO Klijenti (id, ime, prezime, dostupna_sredstva, povecana_stopa_dobitka, poslovnica_id) VALUES
  (inc22.nextval, 'Tuan', 'Madera', 1134.11, 0.12, 3);
INSERT INTO Klijenti (id, ime, prezime, dostupna_sredstva, smanjenje_poreza, poslovnica_id) VALUES
  (inc22.nextval, 'Verdell', 'Flom', 9945, 0.31, 3);
INSERT INTO Klijenti (id, ime, prezime, dostupna_sredstva, smanjenje_poreza, poslovnica_id) VALUES
  (inc22.nextval, 'Nanci', 'Lowe', 11111, 0.11, 5);

select * from Klijenti;

CREATE TABLE Odjeli(
  id INTEGER PRIMARY KEY NOT NULL,
  naziv_odjela VARCHAR(255) NOT NULL ,
  poslovnica_id INTEGER NOT NULL
);

Alter table Odjeli ADD CONSTRAINT sk_poslovnica_id FOREIGN KEY(poslovnica_id) REFERENCES Poslovnice(id);

CREATE SEQUENCE incrementer INCREMENT BY 1 START WITH 0 MINVALUE 0 NOCACHE NOCYCLE;
drop SEQUENCE inc22;
CREATE SEQUENCE inc22 INCREMENT BY 1 START WITH  0 MINVALUE 0 NOCACHE NOCYCLE ;
INSERT INTO Odjeli (id, naziv_odjela, poslovnica_id) VALUES
  (incrementer.nextval, 'javni odnosi', 0);
INSERT INTO Odjeli (id, naziv_odjela, poslovnica_id) VALUES
  (incrementer.nextval, 'menadzment', 0);
INSERT INTO Odjeli (id, naziv_odjela, poslovnica_id) VALUES
  (incrementer.nextval, 'javni odnosi', 1);
INSERT INTO Odjeli (id, naziv_odjela, poslovnica_id) VALUES
  (incrementer.nextval, 'javni odnosi', 2);
INSERT INTO Odjeli (id, naziv_odjela, poslovnica_id) VALUES
  (incrementer.nextval, 'javni odnosi', 3);
INSERT INTO Odjeli (id, naziv_odjela, poslovnica_id) VALUES
  (incrementer.nextval, 'podrska', inc22.nextval);
INSERT INTO Odjeli (id, naziv_odjela, poslovnica_id) VALUES
  (incrementer.nextval, 'glavni odbor', 0);

drop SEQUENCE inc22;

SELECT *
FROM Odjeli;

CREATE TABLE Poslovi(
  id INTEGER PRIMARY KEY NOT NULL ,
  naziv_posla VARCHAR(255) UNIQUE NOT NULL ,
  plata FLOAT NOT NULL
);

CREATE SEQUENCE inc INCREMENT BY 1 MINVALUE 0 NOCACHE  NOCYCLE ;

INSERT INTO Poslovi(id, naziv_posla, plata) VALUES (inc.nextval, 'online podrska', 2000);
INSERT INTO Poslovi(id, naziv_posla, plata) VALUES (inc.nextval, 'terenska podrska', 2500);
INSERT INTO Poslovi(id, naziv_posla, plata) VALUES (inc.nextval, 'sef', 7000);
INSERT INTO Poslovi(id, naziv_posla, plata) VALUES (inc.nextval, 'ekonomski menadzer', 3000);
INSERT INTO Poslovi(id, naziv_posla, plata) VALUES (inc.nextval, 'menadzer osoblja', 3300);
INSERT INTO Poslovi(id, naziv_posla, plata) VALUES (inc.nextval, 'zamjenik sefa', 4500);

SELECT * from Poslovi;

CREATE TABLE Zaposleni(
  id INTEGER PRIMARY KEY NOT NULL,
  ime VARCHAR(255) NOT NULL,
  prezime VARCHAR(255) NOT NULL,
  odjel_id INTEGER NOT NULL,
  posao_id INTEGER NOT NULL,
  datum_zaposlenja date NOT NULL
);

DROP SEQUENCE  inc;
CREATE SEQUENCE inc INCREMENT BY 1 MINVALUE 0 NOCACHE  NOCYCLE ;

ALTER TABLE Zaposleni drop CONSTRAINT SYS_C00201873;

ALTER TABLE Zaposleni add CONSTRAINT sk_zaposleni_odjel FOREIGN KEY(odjel_id) REFERENCES Odjeli(id);
ALTER TABLE Zaposleni add CONSTRAINT sk_zaposleni_posao FOREIGN KEY(posao_id) REFERENCES Poslovi(id);

INSERT INTO Zaposleni(id, ime, prezime, odjel_id, posao_id, datum_zaposlenja) VALUES (inc.nextval, 'Vedad', 'Fejzagic', 26, 3, TO_DATE('11-11-2016', 'dd-mm-yyyy'));
INSERT INTO Zaposleni(id, ime, prezime, odjel_id, posao_id, datum_zaposlenja) VALUES (inc.nextval, 'Abena', 'Pasternack', 11, 3, current_date);
INSERT INTO Zaposleni(id, ime, prezime, odjel_id, posao_id, datum_zaposlenja) VALUES (inc.nextval, 'Agung', 'Rahman', 11, 4, current_date);
INSERT INTO Zaposleni(id, ime, prezime, odjel_id, posao_id, datum_zaposlenja) VALUES (inc.nextval, 'Aditya', 'Bagus', 11, 5, current_date);
INSERT INTO Zaposleni(id, ime, prezime, odjel_id, posao_id, datum_zaposlenja) VALUES (inc.nextval, 'Raja', 'Guntur', 23, 1, current_date);
INSERT INTO Zaposleni(id, ime, prezime, odjel_id, posao_id, datum_zaposlenja) VALUES (inc.nextval, 'Wira', 'Abdullah', 23, 2, current_date);
INSERT INTO Zaposleni(id, ime, prezime, odjel_id, posao_id, datum_zaposlenja) VALUES (inc.nextval, 'Taufik', 'Dewi', 26, 6, current_date);
INSERT INTO Zaposleni(id, ime, prezime, odjel_id, posao_id, datum_zaposlenja) VALUES (inc.nextval, 'Cahaya', 'Widya', 14, 4, current_date);
INSERT INTO Zaposleni(id, ime, prezime, odjel_id, posao_id, datum_zaposlenja) VALUES (inc.nextval, 'Vina', 'Ibrahim', 15, 4, current_date);

SELECT * from Zaposleni;

CREATE TABLE OpkladeIgraci(
  id INTEGER PRIMARY KEY,
  uplaceno_novca FLOAT,
  datum_uplate DATE,
  odabrani_igrac_id INTEGER,
  odabrana_utakmica_id INTEGER,
  broj_poena INTEGER,
  poslovnica_id INTEGER,
  klijent_id INTEGER
);

CREATE TABLE OpkladeUtakmice(
  id INTEGER PRIMARY KEY,
  uplaceno_novca FLOAT,
  datum_uplate DATE,
  odabrana_utakmica_id INTEGER,
  poeni_domaci INTEGER,
  poeni_gost INTEGER,
  poslovnica_id INTEGER,
  klijent_id INTEGER
);

CREATE TABLE OpkladeMecevi(
  id INTEGER PRIMARY KEY,
  uplaceno_novca FLOAT,
  datum_uplate DATE,
  odabrani_mec_id INTEGER,
  poeni_domaci INTEGER,
  poeni_gost INTEGER,
  poslovnica_id INTEGER,
  klijent_id INTEGER
);

CREATE TABLE IgraciEfikasnost(
  id INTEGER PRIMARY KEY,
  igrac_id INTEGER,
  utakmica_id INTEGER,
  broj_poena INTEGER
);

CREATE TABLE Igraci(
  id INTEGER PRIMARY KEY,
  ime VARCHAR(100),
  prezime VARCHAR(100),
  poeni_ove_sezone INTEGER,
  tim_id INTEGER
);

CREATE TABLE Mecevi(
  id INTEGER PRIMARY KEY,
  igrac_domaci_id INTEGER,
  igrac_gost_id INTEGER,
  poeni_domaci INTEGER,
  poeni_gost INTEGER
);

CREATE TABLE  Timovi(
  id INTEGER PRIMARY KEY,
  naziv VARCHAR(100),
  poeni_ove_sezone VARCHAR(100),
  trener VARCHAR(100),
  liga_id INTEGER
);

CREATE TABLE Utakmice(
  id INTEGER PRIMARY KEY ,
  tim_domaci_id INTEGER,
  tim_gost_id INTEGER,
  poeni_domacin INTEGER,
  poeni_gost INTEGER
);

CREATE TABLE Lige(
  id INTEGER PRIMARY KEY,
  ime VARCHAR(100),
  sport VARCHAR(100)
);

SELECT table_name FROM user_tables;

SELECT * FROM Klijenti;