--AdamBiedrzycki Wprowadzenie do SQL(æwieczenie 4)
--zadanie 1

CREATE DATABASE firma;

USE firma;
GO
--tworzenie schematu:
--zadanie 2

CREATE SCHEMA rozliczenia;

--tworzenie tabeli:
--zadanie 3

CREATE TABLE rozliczenia.pracownicy ( 
id_pracownika INTEGER PRIMARY KEY NOT NULL, 
imie NVARCHAR(20) NOT NULL, 
nazwisko NVARCHAR(20) NOT NULL, 
adres NVARCHAR(6) NOT NULL,
telefon INTEGER);

CREATE TABLE rozliczenia.godziny ( 
id_godziny INTEGER PRIMARY KEY NOT NULL, 
"data" DATE NOT NULL, liczba_godzin INTEGER NOT NULL, 
id_pracownika INTEGER FOREIGN KEY 
REFERENCES rozliczenia.pracownicy(id_pracownika) NOT NULL);

CREATE TABLE rozliczenia.premie ( 
id_premii INTEGER PRIMARY KEY NOT NULL, 
rodzaj NVARCHAR(20) NOT NULL, 
kwota FLOAT NOT NULL);

CREATE TABLE rozliczenia.pensje ( 
id_pensje INTEGER PRIMARY KEY NOT NULL, 
stanowisko NVARCHAR(20) NOT NULL, 
kwota FLOAT NOT NULL, 
id_premii INTEGER FOREIGN KEY 
REFERENCES rozliczenia.premie(id_premii) NOT NULL);

ALTER TABLE rozliczenia.godziny 
ADD CONSTRAINT id_pracownika 
FOREIGN KEY (id_pracownika) 
REFERENCES rozliczenia.pracownicy(id_pracownika);

ALTER TABLE rozliczenia.pensje 
ADD CONSTRAINT id_premii 
FOREIGN KEY  (id_premii) 
REFERENCES rozliczenia.premie(id_premii);

--zadanie 4
--uzupe³nianie tabeli pracownicy:

INSERT INTO rozliczenia.pracownicy VALUES (1, 'Adam', 'Biedrzycki', '24-100', '518740782');
INSERT INTO rozliczenia.pracownicy VALUES (2, 'Tomasz', 'Sanicki', '38-200', '795979125');
INSERT INTO rozliczenia.pracownicy VALUES (3, 'Ania', 'Dzbania', '21-420', '531421433');
INSERT INTO rozliczenia.pracownicy VALUES (4, 'Jan', 'Kapela', '12-120', '571293482');
INSERT INTO rozliczenia.pracownicy VALUES (5, 'Szymon', 'Szasz³yk', '42-123', '512429840');
INSERT INTO rozliczenia.pracownicy VALUES (6, 'Bogumi³a', 'Vito', '13-120', '551293482');
INSERT INTO rozliczenia.pracownicy VALUES (7, 'Joanna', 'Jakubowicz', '52-120', '571292482');
INSERT INTO rozliczenia.pracownicy VALUES (8, 'Marian', 'Tymosz', '12-410', '576393482');
INSERT INTO rozliczenia.pracownicy VALUES (9, 'Micha³', 'Sikorski', '21-370', '571293472');
INSERT INTO rozliczenia.pracownicy VALUES (10, 'Jan', 'Bargiel', '42-930', '573333482');

SELECT * FROM rozliczenia.pracownicy

--uzupe³nianie tabeli godziny:

INSERT INTO rozliczenia.godziny VALUES (1, '2022-03-28' , 6, 1)
INSERT INTO rozliczenia.godziny VALUES (2, '2022-03-23' , 6, 2)
INSERT INTO rozliczenia.godziny VALUES (3, '2022-03-24' , 5, 4)
INSERT INTO rozliczenia.godziny VALUES (4, '2022-03-21' , 4, 3)
INSERT INTO rozliczenia.godziny VALUES (5, '2022-03-26' , 6, 10)
INSERT INTO rozliczenia.godziny VALUES (6, '2022-03-22' , 4, 7)
INSERT INTO rozliczenia.godziny VALUES (7, '2022-03-24' , 7, 8)
INSERT INTO rozliczenia.godziny VALUES (8, '2022-03-23' , 8, 9)
INSERT INTO rozliczenia.godziny VALUES (9, '2022-03-22' , 8, 5)
INSERT INTO rozliczenia.godziny VALUES (10, '2022-03-21' , 8, 6)

SELECT * FROM rozliczenia.godziny

--uzupe³nianie tabeli premie:

INSERT INTO rozliczenia.premie VALUES (1, 'regulaminowa', 40)
INSERT INTO rozliczenia.premie VALUES (2, 'regulaminowa', 50)
INSERT INTO rozliczenia.premie VALUES (3, 'regulaminowa', 60)
INSERT INTO rozliczenia.premie VALUES (4, 'regulaminowa', 70)
INSERT INTO rozliczenia.premie VALUES (5, 'regulaminowa', 85)
INSERT INTO rozliczenia.premie VALUES (6, 'regulaminowa', 90)
INSERT INTO rozliczenia.premie VALUES (7, 'regulaminowa', 100)
INSERT INTO rozliczenia.premie VALUES (8, 'regulaminowa', 150)
INSERT INTO rozliczenia.premie VALUES (9, 'regulaminowa', 120)
INSERT INTO rozliczenia.premie VALUES (10, 'regulaminowa', 180)

SELECT * FROM rozliczenia.premie;

--uzupe³nianie tabeli pensje:

INSERT INTO rozliczenia.pensje VALUES (1, 'analityk', 3522, 1)
INSERT INTO rozliczenia.pensje VALUES (2, 'programista', 4210, 2)
INSERT INTO rozliczenia.pensje VALUES (3, 'technik', 3012, 3)
INSERT INTO rozliczenia.pensje VALUES (4, 'administrator', 3412, 4)
INSERT INTO rozliczenia.pensje VALUES (5, 'konsultant', 3212, 5)
INSERT INTO rozliczenia.pensje VALUES (6, 'menad¿er', 4110, 6)
INSERT INTO rozliczenia.pensje VALUES (7, 'research specialist', 3510, 7)
INSERT INTO rozliczenia.pensje VALUES (8, 'grafik', 3452, 8)
INSERT INTO rozliczenia.pensje VALUES (9, 'kierowca', 3228, 9)
INSERT INTO rozliczenia.pensje VALUES (10, 'handlowiec', 3724, 10)

SELECT * FROM rozliczenia.pensje

--wyœwietl nazwiska pracowników i ich adresy
--zadanie 5

SELECT nazwisko, adres FROM rozliczenia.pracownicy;

--Napisz zapytanie, które przekonwertuje datê w tabeli godziny tak, aby wyœwietlana by³a
--informacja jaki to dzieñ tygodnia i jaki miesi¹c (funkcja DATEPART x2).
--zadanie 6

SELECT DATEPART(MONTH, [data]) AS miesiac, DATEPART (WEEK, [data]) AS tydzien FROM rozliczenia.godziny;

--W tabeli pensje zmieñ nazwê atrybutu kwota na kwota_brutto oraz dodaj nowy o nazwie
--kwota_netto. Oblicz kwotê netto i zaktualizuj wartoœci w tabeli. Zak³adamy podatek liniowy 19%.
--zadanie 7
EXEC SP_RENAME 'rozliczenia.pensje.kwota' , 'kwota_brutto', 'COLUMN';

ALTER TABLE rozliczenia.pensje ADD kwota_netto AS (pensje.kwota_brutto/1.19);

SELECT * 
FROM rozliczenia.pensje;