--Total store revenue --

SELECT sum( total) as total_sales 
FROM invoices

-- Monthly revenue trend --

SELECT
	g.name as Genre,
	sum(b.unitprice * b.quantity) as Revenue
from invoice_items as b
JOIN tracks as t on b.TrackId = t.TrackId
JOIN genres as g on g.GenreId = t.GenreId
group by g.name
order by Revenue DESC

-- Revenue by Country--

SELECT
	c.Country, sum(i.total) as Spending
from customers as c
JOIN invoices as i on c.Country = i.BillingCountry
group by
	c.Country
order by
	Spending DESC
	
-- Revenue by genre--

SELECT
    g.Name AS Genre,
    SUM(ii.UnitPrice * ii.Quantity) AS Revenue
FROM invoice_items ii
JOIN tracks t ON ii.TrackId = t.TrackId
JOIN genres g ON t.GenreId = g.GenreId
GROUP BY g.Name
ORDER BY Revenue DESC;

-- Revenue by artist--

SELECT
	a.name as Artist,
	sum(i.UnitPrice * i.Quantity) as Revenue
from invoice_items as i
JOIN tracks as t on i.TrackId = t.TrackId
JOIN albums as b on t.AlbumId = b.AlbumId
JOIN artists as a on b.ArtistId = a.ArtistId
GROUP by a.name
order by Revenue DESC;

-- Which customers haven't purchased in a long time?--

SELECT
	c.CustomerId,
	c.FirstName,
	c.LastName,
	c.Country,
	t.LastPurchaseDate,
	round(julianday((select max(InvoiceDate) FROM invoices)) - julianday(t.LastPurchaseDate), 0) as DaysSinceLastPurchase
FROM customers as c
JOIN (SELECT
		CustomerId,
		max(InvoiceDate) as LastPurchaseDate
	FROM invoices
	group by CustomerId) as t
on c.CustomerId = t.CustomerId
order by DaysSinceLastPurchase DESC
LIMIT 20;
	
