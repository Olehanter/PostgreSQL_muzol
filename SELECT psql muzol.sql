-- проверим
SELECT * FROM album;

 -- название и выход альбомов в 2018
SELECT name, create_at FROM Album
WHERE create_at = '2018-06-06';

--названия сборников, вышедших в период с 2018 по 2020 год включительно;
SELECT name, year_issue FROM Compilation
WHERE year_issue BETWEEN '2018-01-01' AND '2020-12-31';

--название и продолжительность самого длительного трека;
SELECT name, duration FROM Track
WHERE duration = (SELECT MAX(duration) FROM Track)
ORDER BY duration DESC;

 --название треков, продолжительность которых не менее 3,5 минуты;
SELECT name, duration FROM Track
WHERE duration > '03:30:00';

--исполнители, чье имя состоит из 1 слова;
SELECT name FROM executor
WHERE name NOT LIKE '% %';

--название треков, которые содержат слово "Мой"/"My".
SELECT name FROM Track
WHERE name LIKE '%My%' OR name LIKE '%Мой%';

