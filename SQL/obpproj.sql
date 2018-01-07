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