--zad1
CREATE DATABASE firma;
--zad2
CREATE SCHEMA ksiegowosc;
--zad3
CREATE TABLE ksiegowosc.pracownicy ( 
id_pracownika INTEGER PRIMARY KEY NOT NULL, 
imie VARCHAR(20) NOT NULL, 
nazwisko VARCHAR(20) NOT NULL, 
adres VARCHAR(6) NOT NULL,
telefon INTEGER);
COMMENT ON TABLE ksiegowosc.pracownicy IS 'Tabela z pracownikami';

CREATE TABLE ksiegowosc.godziny ( 
id_godziny INTEGER PRIMARY KEY NOT NULL, 
"data" DATE NOT NULL,
liczba_godzin INTEGER NOT NULL, 
id_pracownika INTEGER NOT NULL,
FOREIGN KEY(id_pracownika)
REFERENCES ksiegowosc.pracownicy(id_pracownika));
COMMENT ON TABLE ksiegowosc.godziny IS 'Tabela z godzinami';

CREATE TABLE ksiegowosc.pensja ( 
id_pensji INTEGER PRIMARY KEY NOT NULL, 
stanowisko VARCHAR(20) NOT NULL, 
kwota FLOAT NOT NULL);
COMMENT ON TABLE ksiegowosc.pensja IS 'Tabela z pensjami';

CREATE TABLE ksiegowosc.premia ( 
id_premii INTEGER PRIMARY KEY NOT NULL, 
rodzaj VARCHAR(20) NOT NULL, 
kwota FLOAT NOT NULL);
COMMENT ON TABLE ksiegowosc.premia IS 'Tabela z premiami';

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
COMMENT ON TABLE ksiegowosc.wynagrodzenia IS 'Tabela z wynagrodzeniami';

--zad4
--uzupełnianie tabeli pracownicy:

INSERT INTO ksiegowosc.pracownicy VALUES (1, 'Adam', 'Biedrzycki', '24-100', '518740782');
INSERT INTO ksiegowosc.pracownicy VALUES (2, 'Tomasz', 'Sanicki', '38-200', '795979125');
INSERT INTO ksiegowosc.pracownicy VALUES (3, 'Ania', 'Dzbania', '21-420', '531421433');
INSERT INTO ksiegowosc.pracownicy VALUES (4, 'Jan', 'Kapela', '12-120', '571293482');
INSERT INTO ksiegowosc.pracownicy VALUES (5, 'Szymon', 'Szaszłyk', '42-123', '512429840');
INSERT INTO ksiegowosc.pracownicy VALUES (6, 'Bogumiła', 'Vito', '13-120', '551293482');
INSERT INTO ksiegowosc.pracownicy VALUES (7, 'Joanna', 'Jakubowicz', '52-120', '571292482');
INSERT INTO ksiegowosc.pracownicy VALUES (8, 'Marian', 'Tymosz', '12-410', '576393482');
INSERT INTO ksiegowosc.pracownicy VALUES (9, 'Michał', 'Sikorski', '21-370', '571293472');
INSERT INTO ksiegowosc.pracownicy VALUES (10, 'Jan', 'Bargiel', '42-930', '573333482');

SELECT * FROM ksiegowosc.pracownicy

--uzupełnianie tabeli godziny:

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

SELECT * FROM ksiegowosc.godziny

--uzupełnianie tabeli premia:

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

SELECT * FROM ksiegowosc.premia;

--uzupełnianie tabeli pensja:

INSERT INTO ksiegowosc.pensja VALUES (1, 'analityk', 3522);
INSERT INTO ksiegowosc.pensja VALUES (2, 'programista', 4210);
INSERT INTO ksiegowosc.pensja VALUES (3, 'technik', 3012);
INSERT INTO ksiegowosc.pensja VALUES (4, 'administrator', 3412);
INSERT INTO ksiegowosc.pensja VALUES (5, 'konsultant', 3212);
INSERT INTO ksiegowosc.pensja VALUES (6, 'menadżer', 4110);
INSERT INTO ksiegowosc.pensja VALUES (7, 'research specialist', 3510);
INSERT INTO ksiegowosc.pensja VALUES (8, 'grafik', 3452);
INSERT INTO ksiegowosc.pensja VALUES (9, 'kierowca', 3228);
INSERT INTO ksiegowosc.pensja VALUES (10, 'handlowiec', 3724);

SELECT * FROM ksiegowosc.pensja

--uzupełnienie tabeli wynagrodzenia:

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

SELECT * FROM ksiegowosc.wynagrodzenia

--zad5
--a
--Wyświetl tylko id pracownika oraz jego nazwisko.
SELECT id_pracownika, nazwisko FROM ksiegowosc.pracownicy
--b
--Wyświetl id pracowników, których płaca jest większa niż 1000.
SELECT pracownicy.id_pracownika FROM ksiegowosc.pracownicy
INNER JOIN ksiegowosc.wynagrodzenia
ON pracownicy.id_pracownika = wynagrodzenia.id_pracownika
INNER JOIN ksiegowosc.pensja
ON wynagrodzenia.id_pensji = pensja.id_pensji
WHERE pensja.kwota > 1000;
--c
--Wyświetl id pracowników nieposiadających premii,których płaca jest większa niż 2000.
SELECT wynagrodzenia.id_pracownika, pensja.Kwota
FROM ksiegowosc.wynagrodzenia
JOIN ksiegowosc.pensja
ON wynagrodzenia.id_pensji = pensja.id_pensji
WHERE pensja.kwota > 2000 AND wynagrodzenia.id_premii IS NULL;
--d
--Wyświetl pracowników, których pierwsza litera imienia zaczyna się na literę ‘J’. 
SELECT * FROM ksiegowosc.pracownicy WHERE imie LIKE 'J%';
--e
--Wyświetl pracowników, których nazwisko zawiera literę ‘n’ oraz imię kończy się na literę ‘a’.
SELECT * FROM ksiegowosc.pracownicy WHERE nazwisko LIKE '%n%' AND imie LIKE '%a'
--f
--Wyświetl imię i nazwisko pracowników oraz liczbę ich nadgodzin, przyjmując, iż standardowy czas pracy to 160 h miesięcznie. 
SELECT pracownicy.imie, pracownicy.nazwisko, (godziny.liczba_godzin - 160) AS Liczba_nadgodzin
FROM ksiegowosc.pracownicy
JOIN ksiegowosc.wynagrodzenia
ON pracownicy.id_pracownika = wynagrodzenia.id_pracownika
JOIN ksiegowosc.godziny
ON wynagrodzenia.id_godziny = godziny.id_godziny;
--g
--Wyświetl imię i nazwisko pracowników, których pensja zawiera się w przedziale 1500 –3000PLN.
SELECT pracownicy.imie, pracownicy.nazwisko, pensja.kwota
FROM ksiegowosc.pracownicy
JOIN ksiegowosc.wynagrodzenia
ON pracownicy.id_pracownika = wynagrodzenia.id_pracownika
JOIN ksiegowosc.pensja
ON wynagrodzenia.id_pensji = pensja.id_pensji
WHERE pensja.kwota BETWEEN 1500 AND 3500;
--h
--Wyświetl imię i nazwisko pracowników, którzy pracowali w nadgodzinachi nie otrzymali premii.
SELECT pracownicy.imie, pracownicy.nazwisko
FROM ksiegowosc.pracownicy
JOIN ksiegowosc.wynagrodzenia
ON pracownicy.id_pracownika = wynagrodzenia.id_pracownika
JOIN ksiegowosc.godziny
ON wynagrodzenia.id_godziny = godziny.id_godziny
WHERE godziny.liczba_godzin > 160 AND wynagrodzenia.id_premii IS NULL;
--i
--Uszereguj pracowników według pensji.
SELECT pracownicy.id_pracownika, pracownicy.imie, pracownicy.nazwisko, pensja.kwota
FROM ksiegowosc.pracownicy
JOIN ksiegowosc.wynagrodzenia
ON pracownicy.id_pracownika = wynagrodzenia.id_pracownika
JOIN ksiegowosc.Pensja
ON wynagrodzenia.ID_pensji = pensja.id_pensji
ORDER BY pensja.kwota;
--j
--Uszereguj pracowników według pensji i premii malejąco.
SELECT pracownicy.id_pracownika, pracownicy.imie, pracownicy.nazwisko, pensja.kwota, premia.kwota
FROM ksiegowosc.pracownicy
JOIN ksiegowosc.wynagrodzenia
ON pracownicy.id_pracownika = wynagrodzenia.id_pracownika
JOIN ksiegowosc.pensja
ON wynagrodzenia.id_pensji = pensja.id_pensji
JOIN ksiegowosc.premia
ON wynagrodzenia.id_premii = premia.id_premii
ORDER BY pensja.kwota DESC, premia.kwota DESC;
--k
--Zlicz i pogrupuj pracowników według pola ‘stanowisko’
SELECT stanowisko, COUNT(stanowisko)
FROM ksiegowosc.pensja GROUP BY stanowisko;
--l
--Policz średnią, minimalną i maksymalną płacę dla stanowiska ‘kierownik’ (jeżeli takiego nie masz, to przyjmij dowolne inne).
SELECT stanowisko, MIN(kwota) AS minimalna_kwota, MAX(kwota) AS max_kwota, AVG(kwota) AS srednia_kwota 
FROM ksiegowosc.pensja 
GROUP BY stanowisko
HAVING stanowisko = 'analityk';
--m
--Policz sumę wszystkich wynagrodzeń.
SELECT SUM(kwota) AS suma_wynagrodzen
FROM ksiegowosc.pensja;
--n
--Policz sumę wynagrodzeń w ramach danego stanowiska.
SELECT stanowisko, SUM(kwota) AS suma_wynagrodzen
FROM ksiegowosc.pensja 
GROUP BY stanowisko;
--o
--Wyznacz liczbę premii przyznanych dla pracowników danego stanowiska.
SELECT pensja.stanowisko, COUNT(id_premii)
FROM ksiegowosc.pensja 
JOIN ksiegowosc.wynagrodzenia
ON pensja.id_pensji = wynagrodzenia.id_pensji
GROUP BY pensja.stanowisko;
--p
--Usuń wszystkich pracowników mających pensję mniejszą niż 1200 zł.
ALTER TABLE ksiegowosc.godziny DROP CONSTRAINT godziny_id_pracownika_fkey;
ALTER TABLE ksiegowosc.wynagrodzenia DROP CONSTRAINT wynagrodzenia_id_pracownika_fkey;

DELETE FROM ksiegowosc.pracownicy
USING ksiegowosc.wynagrodzenia, ksiegowosc.pensja
WHERE wynagrodzenia.id_pracownika = pracownicy.id_pracownika
AND pensja.id_pensji = wynagrodzenia.id_pensji
AND pensja.kwota < 3250;
SELECT * FROM ksiegowosc.pracownicy