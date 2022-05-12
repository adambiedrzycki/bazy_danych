CREATE DATABASE company;

CREATE SCHEMA ksiegowosc;

CREATE TABLE ksiegowosc.pracownicy ( 
id_pracownika INTEGER PRIMARY KEY NOT NULL, 
imie VARCHAR(20) NOT NULL, 
nazwisko VARCHAR(20) NOT NULL, 
adres VARCHAR(6) NOT NULL,
telefon INTEGER);

CREATE TABLE ksiegowosc.godziny ( 
id_godziny INTEGER PRIMARY KEY NOT NULL, 
"data" DATE NOT NULL,
liczba_godzin INTEGER NOT NULL, 
id_pracownika INTEGER NOT NULL,
FOREIGN KEY(id_pracownika)
REFERENCES ksiegowosc.pracownicy(id_pracownika));

CREATE TABLE ksiegowosc.pensja ( 
id_pensji INTEGER PRIMARY KEY NOT NULL, 
stanowisko VARCHAR(20) NOT NULL, 
kwota FLOAT NOT NULL);

CREATE TABLE ksiegowosc.premia ( 
id_premii INTEGER PRIMARY KEY NOT NULL, 
rodzaj VARCHAR(20) NOT NULL, 
kwota FLOAT NOT NULL);

CREATE TABLE ksiegowosc.wynagrodzenia (
id_wynagrodzenia INTEGER PRIMARY KEY NOT NULL,
"data" DATE NOT NULL,
id_pracownika INTEGER NOT NULL,
FOREIGN KEY(id_pracownika)
REFERENCES ksiegowosc.pracownicy(id_pracownika),
id_godziny INTEGER NOT NULL,
FOREIGN KEY(id_godziny)
REFERENCES ksiegowosc.godziny(id_godziny),
id_pensji INTEGER NOT NULL,
FOREIGN KEY(id_pensji)
REFERENCES ksiegowosc.pensja(id_pensji),
id_premii INTEGER NOT NULL,
FOREIGN KEY(id_premii)
REFERENCES ksiegowosc.premia(id_premii)
);

--uzupe³nianie tabeli pracownicy:

INSERT INTO ksiegowosc.pracownicy VALUES (1, 'Adam', 'Biedrzycki', '24-100', '518740782');
INSERT INTO ksiegowosc.pracownicy VALUES (2, 'Tomasz', 'Sanicki', '38-200', '795979125');
INSERT INTO ksiegowosc.pracownicy VALUES (3, 'Ania', 'Dzbania', '21-420', '531421433');
INSERT INTO ksiegowosc.pracownicy VALUES (4, 'Jan', 'Kapela', '12-120', '571293482');
INSERT INTO ksiegowosc.pracownicy VALUES (5, 'Szymon', 'Szasz³yk', '42-123', '512429840');
INSERT INTO ksiegowosc.pracownicy VALUES (6, 'Bogumi³a', 'Vito', '13-120', '551293482');
INSERT INTO ksiegowosc.pracownicy VALUES (7, 'Joanna', 'Jakubowicz', '52-120', '571292482');
INSERT INTO ksiegowosc.pracownicy VALUES (8, 'Marian', 'Tymosz', '12-410', '576393482');
INSERT INTO ksiegowosc.pracownicy VALUES (9, 'Micha³', 'Sikorski', '21-370', '571293472');
INSERT INTO ksiegowosc.pracownicy VALUES (10, 'Jan', 'Bargiel', '42-930', '573333482');

--uzupe³nianie tabeli godziny:

INSERT INTO ksiegowosc.godziny VALUES (1, '2022-03-28' , 6, 1);
INSERT INTO ksiegowosc.godziny VALUES (2, '2022-03-23' , 6, 2);
INSERT INTO ksiegowosc.godziny VALUES (3, '2022-03-24' , 5, 4);
INSERT INTO ksiegowosc.godziny VALUES (4, '2022-03-21' , 4, 3);
INSERT INTO ksiegowosc.godziny VALUES (5, '2022-03-26' , 6, 10);
INSERT INTO ksiegowosc.godziny VALUES (6, '2022-03-22' , 4, 7);
INSERT INTO ksiegowosc.godziny VALUES (7, '2022-03-24' , 7, 8);
INSERT INTO ksiegowosc.godziny VALUES (8, '2022-03-23' , 8, 9);
INSERT INTO ksiegowosc.godziny VALUES (9, '2022-03-22' , 8, 5);
INSERT INTO ksiegowosc.godziny VALUES (10, '2022-03-21' , 8, 6);

--uzupe³nianie tabeli premia:

INSERT INTO ksiegowosc.premia VALUES (1, 'regulaminowa', 40);
INSERT INTO ksiegowosc.premia VALUES (2, 'regulaminowa', 50);
INSERT INTO ksiegowosc.premia VALUES (3, 'regulaminowa', 60);
INSERT INTO ksiegowosc.premia VALUES (4, 'regulaminowa', 70);
INSERT INTO ksiegowosc.premia VALUES (5, 'regulaminowa', 85);
INSERT INTO ksiegowosc.premia VALUES (6, 'regulaminowa', 90);
INSERT INTO ksiegowosc.premia VALUES (7, 'regulaminowa', 100);
INSERT INTO ksiegowosc.premia VALUES (8, 'regulaminowa', 150);
INSERT INTO ksiegowosc.premia VALUES (9, 'regulaminowa', 120);
INSERT INTO ksiegowosc.premia VALUES (10, 'regulaminowa', 180);

--uzupe³nianie tabeli pensja:

INSERT INTO ksiegowosc.pensja VALUES (1, 'analityk', 3522);
INSERT INTO ksiegowosc.pensja VALUES (2, 'programista', 4210);
INSERT INTO ksiegowosc.pensja VALUES (3, 'technik', 3012);
INSERT INTO ksiegowosc.pensja VALUES (4, 'administrator', 3412);
INSERT INTO ksiegowosc.pensja VALUES (5, 'konsultant', 3212);
INSERT INTO ksiegowosc.pensja VALUES (6, 'menad¿er', 4110);
INSERT INTO ksiegowosc.pensja VALUES (7, 'research specialist', 3510);
INSERT INTO ksiegowosc.pensja VALUES (8, 'grafik', 3452);
INSERT INTO ksiegowosc.pensja VALUES (9, 'kierowca', 3228);
INSERT INTO ksiegowosc.pensja VALUES (10, 'handlowiec', 3724);

--uzupe³nienie tabeli wynagrodzenia:

INSERT INTO ksiegowosc.wynagrodzenia VALUES (1, '2022-03-28', 1, 1, 1, 1);
INSERT INTO ksiegowosc.wynagrodzenia VALUES (2, '2022-03-28', 2, 2, 2, 2);
INSERT INTO ksiegowosc.wynagrodzenia VALUES (3, '2022-03-28', 3, 3, 3, 3);
INSERT INTO ksiegowosc.wynagrodzenia VALUES (4, '2022-03-28', 4, 4, 4, 4);
INSERT INTO ksiegowosc.wynagrodzenia VALUES (5, '2022-03-28', 5, 5, 5, 5);
INSERT INTO ksiegowosc.wynagrodzenia VALUES (6, '2022-03-28', 6, 6, 6, 6);
INSERT INTO ksiegowosc.wynagrodzenia VALUES (7, '2022-03-28', 7, 7, 7, 7);
INSERT INTO ksiegowosc.wynagrodzenia VALUES (8, '2022-03-28', 8, 8, 8, 8);
INSERT INTO ksiegowosc.wynagrodzenia VALUES (9, '2022-03-28', 9, 9, 9, 9);
INSERT INTO ksiegowosc.wynagrodzenia VALUES (10, '2022-03-28', 10, 10, 10, 10);

--zad.a

ALTER TABLE ksiegowosc.pracownicy
ALTER COLUMN telefon VARCHAR(16);

UPDATE ksiegowosc.pracownicy
	SET telefon = '(+48)' + telefon;

SELECT * FROM ksiegowosc.pracownicy;

--zad.b

UPDATE ksiegowosc.pracownicy
	SET telefon = SUBSTRING(telefon, 1, 8) + '-' +
		SUBSTRING(telefon, 9 , 3) + '-' +
		SUBSTRING(telefon, 12, 3)

SELECT * FROM ksiegowosc.pracownicy;

--zad.c

SELECT TOP 1 UPPER (pracownicy.id_pracownika), UPPER(pracownicy.imie), UPPER(pracownicy.nazwisko),  UPPER(pracownicy.adres) FROM ksiegowosc.pracownicy ORDER BY LEN(nazwisko) DESC ;

--zad.d

SELECT
	CONVERT(VARCHAR(32), HashBytes('MD5', pracownicy.imie), 2) as imie,	
	CONVERT(VARCHAR(32), HashBytes('MD5', pracownicy.nazwisko), 2) as nazwisko,	
	CONVERT(VARCHAR(32), HashBytes('MD5', CONVERT(VARCHAR(32), pracownicy.id_pracownika)), 2) as id_pracownika,
	CONVERT(VARCHAR(32), HashBytes('MD5', pracownicy.adres), 2) as adres,
	CONVERT(VARCHAR(32), HashBytes('MD5', CONVERT(VARCHAR(32), pracownicy.telefon)), 2) as telefon,
	CONVERT(VARCHAR(32), HashBytes('MD5', CONVERT(VARCHAR(32), pensja.kwota)), 2) as pensja

FROM  ((ksiegowosc.pracownicy
 INNER JOIN ksiegowosc.wynagrodzenia ON wynagrodzenia.id_wynagrodzenia = pracownicy.id_pracownika)
 INNER JOIN ksiegowosc.pensja on pensja.id_pensji = wynagrodzenia.id_pensji);

 --zad.f

 SELECT pracownicy.imie ,pracownicy.nazwisko, pensja.kwota, premia.kwota from ksiegowosc.pracownicy

left join ksiegowosc.wynagrodzenia ON pracownicy.id_pracownika = wynagrodzenia.id_pracownika
left join ksiegowosc.pensja ON wynagrodzenia.id_pensji = pensja.id_pensji
left join ksiegowosc.premia ON wynagrodzenia.id_premii = premia.id_premii

--zad.g

SELECT pracownicy.imie +' ' + pracownicy.nazwisko + ', w dniu ' + CONVERT(VARCHAR(32), godziny.data) + ' otrzyma³ pensjê ca³kowit¹ na kwotê ' +
	CONVERT(VARCHAR(32), pensja.kwota + premia.kwota) + ' z³' + ', gdzie wynagrodzenie zasadnicze wynosi³o: ' + CONVERT(VARCHAR(32), pensja.kwota) + ' z³' +
	', premia:' + CONVERT(VARCHAR(32), premia.kwota)+ ' z³' + ', nadgodziny: ' + CONVERT(VARCHAR(32), premia.kwota + 100)+ ' z³'  AS RAPORT
	FROM ((((ksiegowosc.pracownicy
	INNER JOIN ksiegowosc.wynagrodzenia ON wynagrodzenia.id_pracownika = pracownicy.id_pracownika)
	INNER JOIN ksiegowosc.godziny ON godziny.id_godziny = wynagrodzenia.id_godziny)
	INNER JOIN ksiegowosc.pensja ON pensja.id_pensji = wynagrodzenia.id_pensji)
	INNER JOIN ksiegowosc.premia ON premia.id_premii = wynagrodzenia.id_premii)