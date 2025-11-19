-- ejercicio 1
select firstname, lastname, country from customers WHERE country = 'Brazil'

-- ejercicio 2

SELECT lastname, firstname, title from employees  WHERE title = 'Sales Support Agent'

-- ejercicio 3

SELECT name from tracks WHERE composer = 'AC/DC'

SELECT t.name, t.Composer, a.Title from tracks as t 
inner JOIN albums as a ON t.albumid = a.albumid 
inner join artists as ar on a.ArtistId = ar.ArtistId
where  ar.Name = 'AC/DC'

-- ejercicio 4
SELECT Firstname, Lastname as Nombre_completo, CustomerId, Country 
FROM customers WHERE country != 'USA'

-- ejercicio 5
SELECT Firstname ||' '|| Lastname as Nombre_completo, City ||' '|| State ||' '|| Country from employees where title = 'Sales Support Agent'

-- ejercicio 6 
SELECT DISTINCT billingcountry from invoices

-- ejercicio 7
SELECT count(*), state from customers where country = 'USA' GROUP by state

SELECT count(*), customers.State from customers where customers.Country = 'USA' group by customers.state

select count(trackid) from invoice_items where invoiceid in (37)

select count(tracks.Name) as total_canciones from tracks 
join albums on tracks.AlbumId = albums.AlbumId
join artists on albums.ArtistId = artists.ArtistId
where artists.Name = 'AC/DC'

select invoiceid, SUM(quantity) as sumatorio from invoice_items group by invoiceid

-- SELECT count(invoiceid), billingcountry from invoices GROUP by billingcountry
select  i.billingcountry, count(ii.quantity) from invoice_items as ii
inner join invoices as i on i.InvoiceId = ii.InvoiceId
group by i.BillingCountry

select strftime('%Y', invoicedate) as año, COUNT(invoiceid) from invoices where año in('2009', '2011')
GROUP by año

select count(invoicedate) from invoices where invoicedate like '%2009%' 
or invoicedate like '%2010%' 
or invoicedate like '%2011%'


select sum (n_facturas) from 
(select strftime('%Y', invoicedate) as año, count(invoicedate) as n_facturas from invoices 
where invoicedate BETWEEN '2009-01-01' AND '2011-12-31'
GROUP by 1)


select country, count(customerid) from customers where country in ('Spain', 'Brazil')
group  by 1
-- ejercio 15
select name from tracks where name LIKE 'You%'


--parte 2
-- ejercicio 1
select i.InvoiceId as id, c.FirstName ||' '|| c.LastName as nombre, i.InvoiceDate, i.BillingCountry  from invoices i
inner join customers c on i.CustomerId = c.CustomerId 
where c.Country = 'Brazil'

--ejercicio 2

select i.InvoiceId,
e.FirstName ||' '|| e.LastName as nombre_vendedor,
i.InvoiceDate as fecha
from employees e
inner join customers c on e.EmployeeId = c.SupportRepId 
inner join invoices i on c.CustomerId = i.CustomerId

-- ejercicio 3

select 
e.FirstName ||' '|| e.LastName as nombre_empleado,
c.FirstName ||' '|| c.LastName as nombre_cliente,
c.Country as pais,
SUM(i.total)
from employees e
join customers c on e.EmployeeId = c.SupportRepId
join invoices i on c.CustomerId = i.CustomerId
GROUP by 1, 2

-- ejercio 4
SELECT ii.InvoiceId, t.TrackId,  t.Name from invoice_items ii
INNER join tracks t on ii.TrackId = t.TrackId

-- ejercicio 5

select  
t.Name as cancion,
m.name as formato,
a.Title as titulo,
g.Name as genero
from tracks t
inner join albums a on t.AlbumId = a.AlbumId
inner JOIN genres g ON t.GenreId = g.GenreId
inner join media_types m on t.MediaTypeId = m.MediaTypeId


-- ejercicio 6

select p.Name, COUNT(p.Name) from playlist_track pt inner join playlists p on pt.PlaylistId = p.PlaylistId GROUP by 1

-- ejercicio 7

select e.FirstName||' '|| e.lastname as empleado, 
SUM(i.Total) as total
from invoices i 
inner join customers c on i.CustomerId = c.CustomerId
inner join employees e on c.SupportRepId = e.EmployeeId
group by 1

-- ejercicio 8

select e.FirstName||' '|| e.lastname as empleado, 
SUM(i.Total) as total
from invoices i 
inner join customers c on i.CustomerId = c.CustomerId
inner join employees e on c.SupportRepId = e.EmployeeId
where invoicedate LIKE '2009%'
group by 1
order by 2 desc LIMIT 1

-- ejercicio 9 
select ar.Name, ii.TrackId, ii.UnitPrice, ii.Quantity, SUM(ii.UnitPrice * ii.Quantity) as ventas_totales from invoice_items ii 
inner join tracks t on ii.TrackId = t.TrackId
inner join albums a on t.AlbumId = a.AlbumId
INNER join artists ar on a.ArtistId = ar.ArtistId
group by 1
order by 1