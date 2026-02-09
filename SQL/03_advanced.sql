--Running total revenue by month--

select
	YearMonth,
	MonthlyRevenue,
	sum(MonthlyRevenue) OVER (order by YearMonth) as RunningTotalRevenue
FROM (
	SELECT 
		strftime('%Y-%m', InvoiceDate) AS YearMonth,
		SUM(Total) AS MonthlyRevenue
	FROM invoices
	GROUP BY YearMonth
	ORDER BY YearMonth)
order by YearMonth;