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
  id INTEGER PRIMARY KEY NOT NULL,
  uplaceno_novca FLOAT NOT NULL,
  datum_uplate DATE NOT NULL,
  odabrani_igrac_id INTEGER NOT NULL,
  odabrana_utakmica_id INTEGER NOT NULL,
  broj_poena INTEGER NOT NULL,
  poslovnica_id INTEGER NOT NULL,
  klijent_id INTEGER NOT NULL
);

alter table OpkladeIgraci add CONSTRAINT fk_poslovnica_id FOREIGN KEY(poslovnica_id) REFERENCES Poslovnice(id);
alter table OpkladeIgraci add CONSTRAINT fk_klijent_id FOREIGN KEY (klijent_id) REFERENCES Klijenti(id);
ALTER TABLE OpkladeIgraci add CONSTRAINT fk_odabrani_igrac FOREIGN KEY (odabrani_igrac_id) REFERENCES Igraci(id);
ALTER TABLE OpkladeIgraci add CONSTRAINT fk_odabrana_utakmica FOREIGN KEY (odabrana_utakmica_id) REFERENCES Utakmice(id);

DROP SEQUENCE inc;
CREATE SEQUENCE inc INCREMENT BY 1 MINVALUE 0 NOCACHE  NOCYCLE ;

INSERT INTO OpkladeIgraci (id, uplaceno_novca, datum_uplate, odabrani_igrac_id, odabrana_utakmica_id, broj_poena, poslovnica_id, klijent_id)
  VALUES (inc.nextval, 600, current_date, 1, 1, 11, 0, 1);
INSERT INTO OpkladeIgraci (id, uplaceno_novca, datum_uplate, odabrani_igrac_id, odabrana_utakmica_id, broj_poena, poslovnica_id, klijent_id)
  VALUES (inc.nextval, 400, current_date, 8, 4, 8, 0, 1);
INSERT INTO OpkladeIgraci (id, uplaceno_novca, datum_uplate, odabrani_igrac_id, odabrana_utakmica_id, broj_poena, poslovnica_id, klijent_id)
  VALUES (inc.nextval, 600, current_date, 15, 11, 1, 0, 2);


CREATE TABLE OpkladeUtakmice(
  id INTEGER PRIMARY KEY NOT NULL ,
  uplaceno_novca FLOAT NOT NULL ,
  datum_uplate DATE NOT NULL ,
  odabrana_utakmica_id INTEGER NOT NULL ,
  poeni_domaci INTEGER NOT NULL ,
  poeni_gost INTEGER NOT NULL ,
  poslovnica_id INTEGER NOT NULL ,
  klijent_id INTEGER NOT NULL
);

ALTER TABLE OpkladeUtakmice add CONSTRAINT fk_poslovnica2_id FOREIGN KEY(poslovnica_id) REFERENCES Poslovnice(id);
ALTER TABLE OpkladeUtakmice add CONSTRAINT fk_klijent2_id FOREIGN KEY (klijent_id) REFERENCES Klijenti(id);
ALTER TABLE OpkladeUtakmice add CONSTRAINT fk_odabrana2_utakmica FOREIGN KEY (odabrana_utakmica_id) REFERENCES Utakmice(id);

DROP SEQUENCE inc;
CREATE SEQUENCE inc INCREMENT BY 1 MINVALUE 0 NOCACHE  NOCYCLE ;

INSERT INTO OpkladeUtakmice (id, uplaceno_novca, datum_uplate, odabrana_utakmica_id, poeni_domaci, poeni_gost, poslovnica_id, klijent_id) VALUES
  (inc.nextval, 5000, current_date, 3, 2, 3, 8, 6);
INSERT INTO OpkladeUtakmice (id, uplaceno_novca, datum_uplate, odabrana_utakmica_id, poeni_domaci, poeni_gost, poslovnica_id, klijent_id) VALUES
  (inc.nextval, 200, current_date, 7, 8, 10, 3,7);

CREATE TABLE OpkladeMecevi(
  id INTEGER PRIMARY KEY NOT NULL ,
  uplaceno_novca FLOAT NOT NULL ,
  datum_uplate DATE NOT NULL ,
  odabrani_mec_id INTEGER NOT NULL ,
  poeni_domaci INTEGER NOT NULL ,
  poeni_gost INTEGER NOT NULL ,
  poslovnica_id INTEGER NOT NULL ,
  klijent_id INTEGER NOT NULL
);

ALTER TABLE OpkladeMecevi add CONSTRAINT fk_poslovnica3_id FOREIGN KEY(poslovnica_id) REFERENCES Poslovnice(id);
ALTER TABLE OpkladeMecevi add CONSTRAINT fk_klijent3_id FOREIGN KEY (klijent_id) REFERENCES Klijenti(id);
ALTER TABLE OpkladeMecevi add CONSTRAINT fk_odabrani_mec FOREIGN KEY (odabrani_mec_id) REFERENCES Mecevi(id);

DROP SEQUENCE inc;
CREATE SEQUENCE inc INCREMENT BY 1 MINVALUE 0 NOCACHE  NOCYCLE ;

INSERT INTO OpkladeMecevi (id, uplaceno_novca, datum_uplate, odabrani_mec_id, poeni_domaci, poeni_gost, poslovnica_id, klijent_id) VALUES
  (inc.nextval, 1200, current_date, 1, 1, 0, 5, 9);
INSERT INTO OpkladeMecevi (id, uplaceno_novca, datum_uplate, odabrani_mec_id, poeni_domaci, poeni_gost, poslovnica_id, klijent_id) VALUES
  (inc.nextval, 1200, current_date, 2, 1, 2, 8, 6);

SELECT * FROM Klijenti;


CREATE TABLE IgraciEfikasnost(
  id INTEGER PRIMARY KEY NOT NULL ,
  igrac_id INTEGER NOT NULL ,
  utakmica_id INTEGER NOT NULL ,
  broj_poena INTEGER NOT NULL
);

alter table IgraciEfikasnost add CONSTRAINT fk_igrac_id FOREIGN KEY(igrac_id) REFERENCES Igraci(id);
alter table IgraciEfikasnost add CONSTRAINT fk_utakmica_id FOREIGN KEY(utakmica_id) REFERENCES Utakmice(id);

drop SEQUENCE inc;
CREATE SEQUENCE inc INCREMENT BY 1 MINVALUE 0 nocache NOCYCLE ;

insert into IgraciEfikasnost (id, igrac_id, utakmica_id, broj_poena) VALUES (inc.nextval, 1, 1, 3);
insert into IgraciEfikasnost (id, igrac_id, utakmica_id, broj_poena) VALUES (inc.nextval, 8, 4, 1);
insert into IgraciEfikasnost (id, igrac_id, utakmica_id, broj_poena) VALUES (inc.nextval, 15, 11, 0);

CREATE TABLE Igraci(
  id INTEGER PRIMARY KEY NOT NULL ,
  ime VARCHAR(100) NOT NULL ,
  prezime VARCHAR(100) NOT NULL ,
  poeni_ove_sezone INTEGER NOT NULL ,
  tim_id INTEGER
);

drop SEQUENCE inc;
CREATE SEQUENCE inc INCREMENT BY 1 MINVALUE 0 NOCACHE NOCYCLE ;

alter table Igraci add CONSTRAINT fk_tim_id FOREIGN KEY(tim_id) REFERENCES Timovi(id);

INSERT INTO Igraci (id, ime, prezime, poeni_ove_sezone, tim_id) VALUES (inc.nextval, 'Joel', 'Buchanan', 12, 1);
INSERT INTO Igraci (id, ime, prezime, poeni_ove_sezone, tim_id) VALUES (inc.nextval, 'Pat', 'Grant', 5, 1);

INSERT INTO Igraci (id, ime, prezime, poeni_ove_sezone) VALUES (inc.nextval, 'Tyrone', 'Reyes', 10);
INSERT INTO Igraci (id, ime, prezime, poeni_ove_sezone) VALUES (inc.nextval, 'Chris', 'Hall', 13);

INSERT INTO Igraci (id, ime, prezime, poeni_ove_sezone, tim_id) VALUES (inc.nextval, 'Flora', 'Hale', 1, 2);
INSERT INTO Igraci (id, ime, prezime, poeni_ove_sezone, tim_id) VALUES (inc.nextval, 'Debbie', 'Wise', 11, 2);

INSERT INTO Igraci (id, ime, prezime, poeni_ove_sezone, tim_id) VALUES (inc.nextval, 'Susie', 'Wells', 51, 3);

INSERT INTO Igraci (id, ime, prezime, poeni_ove_sezone, tim_id) VALUES (inc.nextval, 'Flora', 'Hale', 32, 4);

INSERT INTO Igraci (id, ime, prezime, poeni_ove_sezone, tim_id) VALUES (inc.nextval, 'Joey', 'Ball', 22, 5);

INSERT INTO Igraci (id, ime, prezime, poeni_ove_sezone, tim_id) VALUES (inc.nextval, 'Gilbert', 'Moran', 18, 6);

INSERT INTO Igraci (id, ime, prezime, poeni_ove_sezone, tim_id) VALUES (inc.nextval, 'Ignacio', 'Blake', 11, 9);

INSERT INTO Igraci (id, ime, prezime, poeni_ove_sezone, tim_id) VALUES (inc.nextval, 'Chris', 'Scott', 12, 10);

INSERT INTO Igraci (id, ime, prezime, poeni_ove_sezone, tim_id) VALUES (inc.nextval, 'Agnes', 'Lawson', 13, 11);

INSERT INTO Igraci (id, ime, prezime, poeni_ove_sezone, tim_id) VALUES (inc.nextval, 'Jeremy', 'Lindsey', 14, 12);

INSERT INTO Igraci (id, ime, prezime, poeni_ove_sezone, tim_id) VALUES (inc.nextval, 'Maurice', 'May', 15, 13);

INSERT INTO Igraci (id, ime, prezime, poeni_ove_sezone, tim_id) VALUES (inc.nextval, 'Beatry', 'Luna', 16, 14);

INSERT INTO Igraci (id, ime, prezime, poeni_ove_sezone, tim_id) VALUES (inc.nextval, 'Milton', 'Williamson', 17, 15);

SELECT * from Igraci;

CREATE TABLE Mecevi(
  id INTEGER PRIMARY KEY NOT NULL ,
  igrac_domaci_id INTEGER NOT NULL ,
  igrac_gost_id INTEGER NOT NULL ,
  poeni_domaci INTEGER NOT NULL ,
  poeni_gost INTEGER NOT NULL
);

ALTER TABLE Mecevi add CONSTRAINT fk_igrac_domaci_id FOREIGN KEY(igrac_domaci_id) REFERENCES Igraci(id);
ALTER TABLE Mecevi add CONSTRAINT fk_igrac_gost_id FOREIGN KEY(igrac_gost_id) REFERENCES Igraci(id);

drop SEQUENCE inc;
CREATE SEQUENCE inc INCREMENT BY 1 MINVALUE 0 NOCACHE NOCYCLE ;

INSERT INTO Mecevi (id, igrac_domaci_id, igrac_gost_id, poeni_domaci, poeni_gost) VALUES
  (inc.nextval, 3, 4, 1, 1);
INSERT INTO Mecevi (id, igrac_domaci_id, igrac_gost_id, poeni_domaci, poeni_gost) VALUES
  (inc.nextval, 4, 3, 2, 1);


CREATE TABLE  Timovi(
  id INTEGER PRIMARY KEY NOT NULL ,
  naziv VARCHAR(100) NOT NULL ,
  poeni_ove_sezone VARCHAR(100) NOT NULL ,
  trener VARCHAR(100) NOT NULL ,
  liga_id INTEGER NOT NULL
);

drop SEQUENCE inc;
CREATE SEQUENCE inc INCREMENT BY 1 MINVALUE 0 NOCACHE NOCYCLE ;

alter table Timovi add CONSTRAINT fk_liga_id FOREIGN KEY(liga_id) REFERENCES Lige(id);
alter table Timovi add CONSTRAINT uniq_naziv UNIQUE(naziv);

INSERT INTO Timovi (id, naziv, poeni_ove_sezone, trener, liga_id) VALUES (inc.nextval, 'Real Madrid', 22, 'Zinedine Zidane', 1);
insert into Timovi (id, naziv, poeni_ove_sezone, trener, liga_id) VALUES (inc.nextval, 'Barcelona', 23, 'Roberto Carlos', 1);
insert into Timovi (id, naziv, poeni_ove_sezone, trener, liga_id) VALUES (inc.nextval, 'Inter', 18, 'Luis Enrique', 1);

insert into Timovi (id, naziv, poeni_ove_sezone, trener, liga_id) VALUES (inc.nextval, 'Sarajevo', 11, 'Husen Kapetan', 2);
insert into Timovi (id, naziv, poeni_ove_sezone, trener, liga_id) VALUES (inc.nextval, 'Crvena Zvezda', 13, 'Vladan Milojevic', 2);
insert into Timovi (id, naziv, poeni_ove_sezone, trener, liga_id) VALUES (inc.nextval, 'Hajduk', 11, 'Zeljko Kopic', 2);

insert into Timovi (id, naziv, poeni_ove_sezone, trener, liga_id) VALUES (inc.nextval, 'LA Lakers', 23, 'Leona Castillo', 4);
insert into Timovi (id, naziv, poeni_ove_sezone, trener, liga_id) VALUES (inc.nextval, 'Golden State Warriors', 28, 'Roberto Carlos', 4);
insert into Timovi (id, naziv, poeni_ove_sezone, trener, liga_id) VALUES (inc.nextval, 'Boston Celtics', 20, 'Margarita Ross', 4);
insert into Timovi (id, naziv, poeni_ove_sezone, trener, liga_id) VALUES (inc.nextval, 'Oklahoma City Thunder', 31, 'Casey Stone', 4);

insert into Timovi (id, naziv, poeni_ove_sezone, trener, liga_id) VALUES (inc.nextval, 'New York Knicks', 16, 'Terrance King', 5);
insert into Timovi (id, naziv, poeni_ove_sezone, trener, liga_id) VALUES (inc.nextval, 'Chicago Bulls', 17, 'Annete Lawson', 5);
insert into Timovi (id, naziv, poeni_ove_sezone, trener, liga_id) VALUES (inc.nextval, 'Toronto Raptors', 18, 'Patty Drake', 5);

SELECT * FROM Timovi;

CREATE TABLE Utakmice(
  id INTEGER PRIMARY KEY NOT NULL ,
  tim_domaci_id INTEGER NOT NULL ,
  tim_gost_id INTEGER NOT NULL ,
  poeni_domacin INTEGER NOT NULL ,
  poeni_gost INTEGER NOT NULL
);

drop SEQUENCE inc;
CREATE SEQUENCE inc INCREMENT BY 1 MINVALUE 0 NOCACHE NOCYCLE ;

alter TABLE Utakmice add CONSTRAINT fk_domacin_id FOREIGN KEY(tim_domaci_id) REFERENCES Timovi(id);
alter TABLE Utakmice add CONSTRAINT fk_gost_id FOREIGN KEY(tim_gost_id) REFERENCES Timovi(id);

insert into Utakmice (id, tim_domaci_id, tim_gost_id, poeni_domacin, poeni_gost) VALUES
  (inc.nextval, 1, 2, 2, 2);
insert into Utakmice (id, tim_domaci_id, tim_gost_id, poeni_domacin, poeni_gost) VALUES
  (inc.nextval, 1, 3, 1, 2);
insert into Utakmice (id, tim_domaci_id, tim_gost_id, poeni_domacin, poeni_gost) VALUES
  (inc.nextval, 2, 3, 2, 3);

insert into Utakmice (id, tim_domaci_id, tim_gost_id, poeni_domacin, poeni_gost) VALUES
  (inc.nextval, 4, 5, 1, 1);
insert into Utakmice (id, tim_domaci_id, tim_gost_id, poeni_domacin, poeni_gost) VALUES
  (inc.nextval, 4, 6, 2, 1);
insert into Utakmice (id, tim_domaci_id, tim_gost_id, poeni_domacin, poeni_gost) VALUES
  (inc.nextval, 5, 6, 4, 2);

insert into Utakmice (id, tim_domaci_id, tim_gost_id, poeni_domacin, poeni_gost) VALUES
  (inc.nextval, 9, 10, 22, 36);
insert into Utakmice (id, tim_domaci_id, tim_gost_id, poeni_domacin, poeni_gost) VALUES
  (inc.nextval, 9, 11, 44, 42);
insert into Utakmice (id, tim_domaci_id, tim_gost_id, poeni_domacin, poeni_gost) VALUES
  (inc.nextval, 12, 9, 51, 34);
insert into Utakmice (id, tim_domaci_id, tim_gost_id, poeni_domacin, poeni_gost) VALUES
  (inc.nextval, 11, 12, 47, 44);

insert into Utakmice (id, tim_domaci_id, tim_gost_id, poeni_domacin, poeni_gost) VALUES
  (inc.nextval, 13, 14, 1, 1);
insert into Utakmice (id, tim_domaci_id, tim_gost_id, poeni_domacin, poeni_gost) VALUES
  (inc.nextval, 14, 13, 1, 1);

select * from Utakmice;

CREATE TABLE Lige(
  id INTEGER PRIMARY KEY NOT NULL ,
  ime VARCHAR(100) NOT NULL ,
  sport VARCHAR(100) NOT NULL
);

drop SEQUENCE inc;
CREATE SEQUENCE inc INCREMENT BY 1 MINVALUE 0 NOCACHE NOCYCLE ;

insert into Lige (id, ime, sport) VALUES (inc.nextval, 'Liga A', 'Fudbal');
insert into Lige (id, ime, sport) VALUES (inc.nextval, 'Liga B', 'Fudbal');
insert into Lige (id, ime, sport) VALUES (inc.nextval, 'Liga C', 'Fudbal');
insert into Lige (id, ime, sport) VALUES (inc.nextval, 'A Liga', 'Kosarka');
insert into Lige (id, ime, sport) VALUES (inc.nextval, 'B Liga', 'Kosarka');

SELECT * from Lige;

SELECT table_name FROM user_tables;

SELECT * FROM Klijenti;

/*1 Odjeli u glavnoj poslovnici*/

SELECT o.naziv_odjela from Odjeli o, Poslovnice p where o.poslovnica_id = p.id AND p.sjediste = 'Ciuadad de Juarez';

/*2 Klijenti koji nemaju smanjenje poreza sortirani prema opadajucem redoslijedu*/

SELECT k.ime || ' ' || k.prezime "Naziv klijenta" , k.smanjenje_poreza"Procenat smanjenja poreza" FROM Klijenti k, Poslovnice p
WHERE k.poslovnica_id = p.id
AND k.smanjenje_poreza IS NOT NULL
ORDER BY k.smanjenje_poreza DESC;

/*3 Prosjecna vrijednost dostupnih sredstava klijenata u poslovnici u Havani*/

SELECT ROUND(AVG(k.dostupna_sredstva), 2) "Dostupna sredstva prosjek" FROM Klijenti k, Poslovnice p
WHERE k.poslovnica_id = p.id
AND p.sjediste LIKE '%Havana%';

/*4 Naziv sefa glavne poslovnice*/

SELECT z.ime || ' ' || z.prezime "Naziv sefa" FROM Zaposleni z, Poslovi p, Odjeli o, Poslovnice l
WHERE p.id = z.posao_id
AND o.id = z.odjel_id
AND o.poslovnica_id = l.id
AND l.tip_poslovnice LIKE 'glavna'
AND p.naziv_posla LIKE 'sef';

/*5 Svi zaposleni, njihovi poslovi i plate koji rade u odjelu podrska u Sarajevu */

SELECT z.ime || ' ' || z.prezime "Naziv" , p.naziv_posla,  p.plata FROM Zaposleni z, Poslovi p, Poslovnice l, Odjeli o
WHERE l.id = o.poslovnica_id
AND o.id = z.odjel_id
AND o.naziv_odjela LIKE 'podrska'
AND l.sjediste LIKE 'Sarajevo'
AND z.posao_id = p.id;

/*6 Igraci koji nemaju tim*/

SELECT i.ime || ' ' || i.prezime "Naziv igraca", i.poeni_ove_sezone "Poeni" FROM Igraci i WHERE i.tim_id IS NULL ;

/*7 Prikaz tima igraca i njihovih imena kojima se pratila efikasnost*/

SELECT t.naziv "Naziv tima", i.ime || ' ' || i.prezime "Naziv igraca"
  FROM Timovi t, Igraci i, IgraciEfikasnost ie
WHERE ie.igrac_id = i.id
AND i.tim_id = t.id;

/*8 Prikaz klijenata koji se nisu kladili*/

SELECT DISTINCT k.ime ||' '|| k.prezime "Naziv klijenta", p.sjediste "Sjediste poslovnice"
  FROM Klijenti k, Poslovnice p, OpkladeIgraci oi
WHERE oi.klijent_id <> k.id
AND k.poslovnica_id = p.id;

/*9 Klijenti koji su pogodili ishod opklade na utakmice*/

SELECT k.ime ||' '|| k.prezime "Naziv klijenta", ou.uplaceno_novca "Uplaceno novca"
FROM Klijenti k, OpkladeUtakmice ou, Utakmice u
WHERE k.id = ou.klijent_id
AND ou.odabrana_utakmica_id = u.id
AND ou.poeni_domaci = u.poeni_domacin
AND ou.poeni_gost = u.poeni_gost;

/*10 Naziv klijenta i njihov potencijalni dobitak sa uracunatom povecanom stopom dobitka i smanjenja poreza ako su uplatili 4000 pod uslovom da imaju toliko dostupnih sredstava*/

SELECT k.ime || ' ' || k.prezime "Naziv klijenta", 4000 + (1000 * Nvl(k.povecana_stopa_dobitka,0)) + (1000 * Nvl(k.smanjenje_poreza,0)) Dobitak
FROM Klijenti k
WHERE k.dostupna_sredstva >= 4000;

/*UPITI SA GRUPNIM FUNKCIJAMA*/

/*1. suma raspolozivih sredstava svih poslovnica */

SELECT Sum(raspoloziva_sredstva)"Suma raspolozivih sredstava" FROM Poslovnice;

/*2. Srednja vrijednost i suma dostupnih sredstava klijenata na 2 decimale */

SELECT Round(Avg(k.dostupna_sredstva), 2) "Srednja vrijednost", Round(Sum(k.dostupna_sredstva), 2) "Suma dostupnih sredstava"
FROM Klijenti k;

/*3. Broj zaposlenih po odjelima pri cemu je broj zaposlenih manji od srednje vrijednosti svih zaposlenih */

SELECT Count(z.id) "Broj zaposlenih", o.naziv_odjela "Naziv odjela"
  FROM Zaposleni z, Odjeli o
WHERE z.odjel_id = o.id
GROUP BY o.naziv_odjela
HAVING Avg(z.id) > Count(z.id);

/*4. Sjediste Poslovnica koje imaju raspolozivih sredstava vise od zbira suma opklada igraca i opklada utakmica */

SELECT p.sjediste, Sum(ou.uplaceno_novca) + Sum(oi.uplaceno_novca) + Sum(om.uplaceno_novca)"Suma"
  FROM OpkladeUtakmice ou, OpkladeIgraci oi, OpkladeMecevi om, Poslovnice p
HAVING p.raspoloziva_sredstva > Sum(ou.uplaceno_novca) + Sum(oi.uplaceno_novca) + Sum(om.uplaceno_novca)
GROUP BY p.sjediste, p.raspoloziva_sredstva;

/*5. Najvise odjela u poslovnici */

SELECT Max(Count(o.id)) "Broj odjela"
  FROM Poslovnice p, Odjeli o
WHERE p.id = o.poslovnica_id
GROUP BY o.poslovnica_id;

/*UPITI SA PODUTPITIMA*/

/*1. Zaposleni koji zaradjuju platu vecu od prosjecne plate zaposlenih u odjelima 23 i 11 sortirano u opadajucem redoslijedu*/

SELECT z.ime || ' ' || z.prezime "Naziv zaposlenog", p.plata "Plata"
  FROM Zaposleni z, Poslovi p
WHERE z.posao_id = p.id
AND p.plata > (SELECT Avg(p.plata)
                FROM Zaposleni z, Poslovi p
                WHERE z.posao_id = p.id
                AND (z.odjel_id = 23 OR z.odjel_id = 11)
                )
ORDER BY p.plata DESC;

/*2. Zaposleni koji rade u istom odjelu kao i neki od zaposlenih cije ime pocinje sa 'A'*/

SELECT z.ime || ' ' || z.prezime "Naziv zaposlenog", z.odjel_id "Odjel"
  FROM Zaposleni z
WHERE z.odjel_id = ANY (SELECT o.id
                        FROM Odjeli o, Zaposleni z
                        WHERE z.odjel_id = o.id
                        AND z.ime LIKE 'A%');

/*3. Zaposleni koji primaju platu manju od plate Aditya Bagus*/

SELECT z.ime || ' ' || z.prezime "Naziv zaposlenog", z.odjel_id "Odjel", p.naziv_posla "Posao", p.plata "Plata"
  FROM Zaposleni z, Poslovi p
WHERE z.posao_id = p.id
AND p.plata < (SELECT pp.plata
               FROM Poslovi pp, Zaposleni zz
               WHERE pp.id = zz.posao_id
               AND zz.ime LIKE '%Aditya%'
               AND zz.prezime LIKE '%Bagus%');


/*4. Zaposleni koji ne primaju najvecu i najmanju platu*/

SELECT z.ime || ' ' || z.prezime "Naziv zaposlenog", p.plata "Plata"
  FROM Zaposleni z, Poslovi p
WHERE z.posao_id = p.id
AND z.posao_id = p.id
AND p.plata <> (SELECT Max(pp.plata) FROM Poslovi pp)
AND p.plata <> (SELECT Min(pp.plata) FROM poslovi pp)
ORDER BY p.plata DESC;

/*5. Klijenti cija su dostupna sredstva veca od dostupnih sredstava klijenata koji imaju povecanu stopu dobitka*/

SELECT k.ime || ' ' || k.prezime "Naziv klijenta" , k.dostupna_sredstva "Dostupna sredstva"
  FROM Klijenti k
WHERE k.dostupna_sredstva > ALL (SELECT kk.dostupna_sredstva
                                 FROM Klijenti kk
                                 WHERE kk.povecana_stopa_dobitka IS NOT NULL);

/*UPITI SA VISE OD JEDNOG NIVOA PODUPITA*/

/*1. Poslovnice sa raspolozivim sredstvima vecim od srednje vrijednosti raspolozivih sredstava svih poslovnica
koje imaju vise od jednog odjela*/

SELECT p.sjediste "Sjediste", p.raspoloziva_sredstva "Raspoloziva sredstva"
  FROM Poslovnice p
WHERE p.raspoloziva_sredstva > (SELECT Avg(pp.raspoloziva_sredstva)
                                FROM Poslovnice pp
                                WHERE (SELECT Count(o.id)
                                       FROM Odjeli o
                                       WHERE pp.id = o.poslovnica_id) > 1);

/*2. Utakmice u kojima su domacini imali vise poena od prosjecne vrijednosti poena gostiju svih utakmica ciji poeni su
 takodjer veci od srednje vrijednosti poena gostiju u mecevima*/

SELECT *
  FROM Utakmice
WHERE poeni_domacin > (SELECT Avg(u.poeni_gost)
                       FROM Utakmice u
                       WHERE u.poeni_gost > (SELECT Avg(m.poeni_gost)
                                             FROM Mecevi m));



/*SUBTOTALI*/

/*1. Ukupna dostupna sredstva klijenata po svakoj poslovnici kao i zbir ukupnih sredstava svih poslovnica */

SELECT p.sjediste "Poslovnica", Sum(k.dostupna_sredstva) "Dostupna sredstva"
FROM Poslovnice p, Klijenti k
WHERE p.id = k.poslovnica_id
GROUP BY ROLLUP (p.sjediste);

/*2. Ukupna plata zaposlenog grupisano po odjelu i nazivu posla*/

SELECT Sum(p.plata)"Plata", z.odjel_id "Odjel", p.naziv_posla "Naziv posla"
FROM Zaposleni z, Poslovi p
WHERE z.posao_id = p.id
GROUP BY CUBE (z.odjel_id, p.naziv_posla);

/*UNION*/

SELECT Poslovnice.id, sjediste, raspoloziva_sredstva
FROM Poslovnice
LEFT JOIN Odjeli
ON Poslovnice.id = Odjeli.poslovnica_id
UNION ALL
SELECT Poslovnice.id, sjediste, raspoloziva_sredstva
FROM Poslovnice
RIGHT JOIN Odjeli
ON Poslovnice.id = Odjeli.poslovnica_id

/*INDEKSI*/

CREATE INDEX naziv_klijenta_index ON Klijenti(ime, prezime);
CREATE INDEX informacija_posl_index ON Poslovnice(sjediste, raspoloziva_sredstva);
CREATE INDEX svi_poslovi_index ON Poslovi(naziv_posla, plata);
CREATE INDEX zaposleni_index ON Zaposleni(ime, prezime, datum_zaposlenja);
CREATE INDEX igraci_index ON Igraci(ime, prezime, poeni_ove_sezone);

/*FUNKCIJE*/

/*1. funkcija koja vraca vecu vrijednost varijable tipa float*/
CREATE OR REPLACE FUNCTION je_veci(
  a in float,
  b in float
)
return FLOAT
IS
  BEGIN
    IF (a > b) THEN return a;
    ELSE return b;
    END IF;
  END first_fun;

/*2. Funkcija za provjeru postojanja klijenta koja vraca id klijenta ako je on pronadjen, ako ne onda vraca -1*/

CREATE OR REPLACE FUNCTION klijent_postoji(
  imee in VARCHAR,
  prezimee in VARCHAR
)
  return INTEGER
  IS
    broj INTEGER;
  BEGIN
    SELECT k.id INTO broj
    FROM Klijenti k
    WHERE k.ime LIKE imee
    AND k.prezime LIKE prezimee;

    if(Nvl(broj, 0) != 0) then return broj;
      else return -1;

    END IF;
  END klijent_postoji;

/*3. Funkcija za dobavljanje prosjecne vrijednosti dostupnih sredstava klijenata u odabranoj poslovnici*/

CREATE OR REPLACE FUNCTION daj_dostupna_sredstva(
  poslovnica INTEGER
)
  return FLOAT
  IS
    rez FLOAT;
  BEGIN
    SELECT Avg(k.dostupna_sredstva) INTO rez FROM Klijenti k
    WHERE k.poslovnica_id = poslovnica;
    Nvl(rez, -1);
    return rez;
  END;

/*4. Funkcija koja vraca naziv zaposlenog i njegovu platu*/

CREATE OR REPLACE FUNCTION daj_zaposleni_platu(
  id_zaposlenog INTEGER
)
RETURN VARCHAR
IS
  lv_rez VARCHAR(255);
  lv_ime VARCHAR(255);
  lv_prezime VARCHAR(255);
  lv_naziv VARCHAR(255);
  lv_plata float;
  lv_broj_zap INTEGER;

  CURSOR c_broj_zap IS
    SELECT Count(id) INTO lv_broj_zap FROM Zaposleni
      WHERE id = id_zaposlenog;

BEGIN

  if(lv_broj_zap = 1) then
    SELECT z.ime, z.prezime, p.plata INTO lv_ime, lv_prezime, lv_plata
    FROM Zaposleni z, Poslovi p
    WHERE z.id = id_zaposlenog AND z.posao_id = p.id;
    lv_rez := CONCAT(CONCAT(lv_ime, lv_prezime), TO_CHAR(lv_plata));
    return lv_rez;
  else
    RAISE_APPLICATION_ERROR(-1001, 'Zaposleni ne postoji');
  end IF;

END daj_zaposleni_platu;

/*5. Funkcija koja vraca broj timova*/
CREATE OR REPLACE FUNCTION daj_broj_timova()
  RETURN INTEGER
  IS
  lv_rez INTEGER;
  CURSOR c_broj_timova IS
    SELECT Count(id) INTO lv_rez FROM Timovi;

  BEGIN
    RETURN lv_rez;
  END daj_broj_timova;

/*6. Funkcija koja vraca broj igraca u timu, ili izuzetak ako tim ne postoji.*/

CREATE OR REPLACE FUNCTION daj_broj_igraca(uv_tim_id INTEGER)
  RETURN INTEGER
  IS
  lv_broj_igraca INTEGER;
  lv_tim_postoji  INTEGER;

  CURSOR c_postoji IS
    SELECT Count(id) INTO lv_tim_postoji FROM Timovi
  WHERE uv_tim_id = id;

  BEGIN

    if(lv_tim_postoji > 0) THEN
      SELECT Count(i.id) INTO lv_broj_igraca FROM Igraci i, Timovi t
      WHERE i.tim_id = t.id;
      RETURN lv_broj_igraca;
    else
      RAISE_APPLICATION_ERROR(-13512, 'Tim ne postoji');
    END IF;


  END;

/*7. Funkcija koja vraca broj poena igraca u nekoj utakmici*/
CREATE OR REPLACE FUNCTION daj_broj_poena_igraca_utakmice(
  uv_igrac_id INTEGER,
  uv_utakmica_id INTEGER
)
RETURN INTEGER IS
lv_broj_poena INTEGER;
lv_utakmica_postoji INTEGER;
lv_igrac_postoji INTEGER;

CURSOR c_utakmica IS
  SELECT Count(id) INTO lv_utakmica_postoji
  FROM Utakmice WHERE uv_utakmica_id = id;

CURSOR c_igrac IS
  SELECT Count(id) INTO lv_igrac_postoji
  FROM Igraci WHERE uv_igrac_id = id;

BEGIN

  if(lv_igrac_postoji > 0 AND lv_utakmica_postoji > 0) THEN
    SELECT ie.broj_poena INTO lv_broj_poena FROM Utakmice u, Igraci i, IgraciEfikasnost ie
    WHERE u.id = ie.utakmica_id AND i.id = ie.igrac_id
    AND u.id = uv_utakmica_id AND i.id = uv_igrac_id;
    return lv_broj_poena;
  ELSE
    RAISE_APPLICATION_ERROR(-1345, 'Igrac i/ili utakmica ne postoje');
  END IF;

END;

/*8. Funkcija koja vraca ukupan broj opklada*/
CREATE OR REPLACE FUNCTION daj_ukupan_broj_opklada()
  RETURN INTEGER IS
  lv_ukupno INTEGER;

  CURSOR c_o IS
    SELECT Nvl(Count(om.id), 0) + Nvl(Count(oi.id), 0) + Nvl(Count(ou.id), 0)
    INTO lv_ukupno
    FROM OpkladeUtakmice ou, OpkladeMecevi om, OpkladeIgraci oi;
BEGIN
  return lv_ukupno;
END;

/*9. Funkcija koja vraca ukupno uplaceno novca za igraca u odredjenoj utakmici (tabela opkladeigraci)*/
CREATE OR REPLACE FUNCTION daj_ukupno_novca(
  uv_igrac_id INTEGER,
  uv_utakmica_id INTEGER
)
RETURN FLOAT IS
lv_rez FLOAT;
lv_utakmica_postoji INTEGER;
lv_igrac_postoji INTEGER;

CURSOR c_utakmica IS
  SELECT Count(odabrana_utakmica_id) INTO lv_utakmica_postoji
  FROM OpkladeIgraci WHERE uv_utakmica_id = odabrana_utakmica_id;

CURSOR c_igrac IS
  SELECT Count(odabrani_igrac_id) INTO lv_igrac_postoji
  FROM OpkladeIgraci WHERE uv_igrac_id = odabrana_utakmica_id;

BEGIN

  if(lv_igrac_postoji > 0 AND lv_utakmica_postoji > 0) THEN
   SELECT Sum(uplaceno_novca) INTO lv_rez FROM OpkladeIgraci
   WHERE uv_igrac_id = odabrani_igrac_id
   AND uv_utakmica_id = odabrana_utakmica_id;
   return lv_rez;
  ELSE
    RAISE_APPLICATION_ERROR(-1325, 'Igrac i/ili utakmica ne postoje u opkladama ili ne postoje nikako');
  end If;
END;

/*10. Funkcija koja vraca prosjek raspolozivih sredstava svih poslovnica */
CREATE OR REPLACE FUNCTION daj_prosjek_rs_posl()
  RETURN FLOAT IS
  lv_rez FlOAT;
  BEGIN
    SELECT Avg(raspoloziva_sredstva) INTO lv_rez FROM Poslovnicel;
    return lv_rez;
  END;


/*PROCEDURE*/

CREATE OR REPLACE PROCEDURE  procedura(
  id INTEGER
)
  IS
  BEGIN
    SELECT * FROM Klijenti k WHERE k.id = id;
  END;


