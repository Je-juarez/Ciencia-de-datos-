USE Chinook;
SELECT*
FROM Artist;

SELECT name FROM sys.tables;

SELECT TOP 5*
FROM Artist;

SELECT*
FROM Artist
WHERE ArtistId = 10;

SELECT*
FROM Artist
ORDER BY Name ASC;

--SELECT*
--FROM Artist
--ORDER BY Name DES;

SELECT COUNT(*) AS TotalTracks
FROM Track;

SELECT*
FROM Invoice;

SELECT AlbumId, AVG(miliseconds) AS Duracion
FROM Track
GROUP BY AlbumId
HAVING AVG(Miliseconds) > 231636;

SELECT name FROM sys.tables;
Select *
FROM Invoice;

--Ejercicio 1
Select *
FROM Customer;

--Ejercicio 2
SELECT*
FROM Track
WHERE UnitPrice>0.99;

SELECT Name, UnitPrice
FROM Track
WHERE UnitPrice>0.99;

--Ejercicio 3
SELECT Album.Title AS Album_Title, Artist.Name AS Artist_Name, COUNT(Track.AlbumId) AS Num_Tracks 
FROM Album 
INNER JOIN Artist ON Album.ArtistId = Artist.ArtistId 
INNER JOIN Track ON Album.AlbumId = Track.AlbumId 
GROUP BY Album.Title, Artist.Name 
ORDER BY Num_Tracks DESC;

--Ejercicio 4
select concat(cus.FirstName, ' ', cus.LastName) as Nombre, inv.InvoiceDate, inv.Total  
from Invoice inv
join Customer cus on cus.CustomerId = inv.CustomerId
order by InvoiceDate asc;

--Ejercicio 5
SELECT a.Name, COUNT(b.TrackId) as Num_canciones
From Genre a
INNER JOIN Track b ON a.GenreId = b.GenreId
group by a.Name
ORDER BY Num_canciones desc;