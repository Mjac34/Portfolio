-- 1. Vi är i processen av att analysera våra kunders köphistorik. Kan du visa oss den totala mängden kunden Sara Huiting har betalat för via faktura?
-- Ge oss kundens namn, och den totala summan (utan skatt)

SELECT 
	SUM(invLine.Quantity * invLine.UnitPrice) as 'Totals Sara Huiting'
FROM 
	Sales.Invoices AS saleInv 
INNER JOIN 
	Sales.InvoiceLines AS invLine ON (saleInv.InvoiceID = invLine.InvoiceID)
WHERE 
	saleInv.BillToCustomerID = 905

--2.Ge oss nu top 10 kunders totala köphistorik via faktura. Visa högst totalkostnad först. (utan skatt).
SELECT 
	TOP 10 saleInv.BillToCustomerID, SUM(invLine.Quantity * invLine.UnitPrice) AS TotalPurchase
FROM 
	Sales.Invoices AS saleInv
INNER JOIN 
	Sales.InvoiceLines AS invLine ON saleInv.InvoiceID = invLine.InvoiceID
GROUP BY 
	saleInv.BillToCustomerID
ORDER BY 
	TotalPurchase DESC;

--3.Vi behöver se över vårt lager. Ge oss en rapport med produktnamn, aktuellt produktantal för 
-- varje produkt med ett nuvarande lagersaldo under 1000 och produktantalgränsen för när nyinventering bör ske. 
--Sortera på nuvarande lagersaldo i fallande ordning.
SELECT 
	s.StockItemID, s.StockItemName, h.QuantityOnHand, h.ReorderLevel
FROM 
	Warehouse.StockItems AS s
INNER JOIN 
	Warehouse.StockItemHoldings AS h ON s.StockItemID = h.StockItemID
WHERE 
	h.QuantityOnHand < 1000
ORDER BY 
	h.QuantityOnHand DESC;

--4. Hämta fakturaID, fakturadatum och totalbelopp (utan skatt) för fakturor med en totalsumma på över 10 000.
SELECT 
	i.InvoiceID, i.InvoiceDate, SUM(invLine.Quantity * invLine.UnitPrice) AS Total
FROM 
	Sales.Invoices AS i
INNER JOIN 
	Sales.InvoiceLines AS invLine ON i.InvoiceID = invLine.InvoiceID
GROUP BY 
	i.InvoiceID, i.InvoiceDate
HAVING 
	SUM(invLine.Quantity * invLine.UnitPrice) > 10000;

--5. Skriv ett query som visar alla slutpriser(med skatt, ta värden över 0) för transaktioner, samt räknar hur många gånger varje enskilt pris 
--förekommer i tabellen. Sortera så att högst antal förekommanden av priser är först.

SELECT 
	TransactionAmount AS FinalPrice, 
	COUNT(*) AS Frequency
FROM 
	Sales.CustomerTransactions
WHERE 
	TransactionAmount > 0
GROUP BY 
	TransactionAmount
ORDER BY 
	Frequency DESC;

--6. Titta på specialrabatter. Utgå från rabatt med ID = 2 och gör sedan ett räkneexempel. 
--Ta ner rabatten från procent till decimalform och räkna ut det nya priset efter applicerad rabatt, för en fiktiv produkt som kostar 565kr.

SELECT 
	565 AS OriginalPrice,
	SUM((Sales.SpecialDeals.DiscountPercentage /100)* 565) AS DiscountedPrice,
	565 - SUM((Sales.SpecialDeals.DiscountPercentage /100)* 565) AS NewPrice
FROM 
	Sales.SpecialDeals
WHERE 
	SpecialDealID = 2

--7. Skriv en SQL-fråga som hämtar de två köpleveransmetoderna som är mest populära(mest använda). Visa även antal gånger dessa använts på köpbeställningar(PurchasingOrders) och sortera
--så att högst antal förekommanden är först.

SELECT 
	PO.DeliveryMethodID, COUNT(PO.DeliveryMethodID) AS Total, DM.DeliveryMethodName
FROM 
	Purchasing.PurchaseOrders AS PO
INNER JOIN 
	Application.DeliveryMethods AS DM ON (PO.DeliveryMethodID = DM.DeliveryMethodID)
GROUP BY 
	PO.DeliveryMethodID, DM.DeliveryMethodName
ORDER BY 
	2 DESC

--8. Som nyanställda behöver ni registreras i databasen. Lägg in ert namn och övrig relevant information i Application.People tabellen 
--på liknande sätt som andra registrerade anställda. Fokusera enbart på de kolumner som inte tillåter null värden just nu, resterande kolumner kan vi ta vid senare tillfälle. 
--Låt P.K, Search Name och Datum hanteras automatiskt. Ni får logga in, men är inte External logon provider och heller inte försäljare. Låt LastEditedBy referera till id 1.

INSERT INTO Application.People 
    (FullName, PreferredName, IsPermittedToLogon, IsExternalLogonProvider, IsSystemUser, IsEmployee, IsSalesperson, LastEditedBy)
VALUES 
    ('Malin Jacobs', 'Malin', 1, 0, 1, 1, 0, 1);

--9. Vi behöver lägga till några nya färger i databasen. Färgerna är: Turquoise, Lime Green, Pink och Jade. 
--Skriv en query för att lägga till de nya färgerna. Ni måste även referera senast ändringen (LastEditedBy) till ert personliga PersonID.

INSERT INTO 
	Warehouse.Colors (ColorName, LastEditedBy)
VALUES 
    ('Turquoise', 3262),
    ('Lime Green', 3262),
    ('Pink', 3262),
    ('Jade', 3262);

--10. Det blev en misskommunikation och vi behöver inte den nya färgen Lime Green. Var snäll och radera den från databasen.

DELETE FROM 
	Warehouse.Colors
WHERE 
	ColorName = 'Lime Green';

--11. Vad är det minsta enhetspriset för en orderrad år 2013? Visa orderdatum(OrderDate) i YEAR och det minsta enhetspriset. Ta bort dubletter.

SELECT DISTINCT
    YEAR(OrderDate) AS OrderYear, 
    MIN(UnitPrice) AS MinUnitPrice
FROM 
    Sales.OrderLines AS SOL
	INNER JOIN Sales.Orders AS SO ON (SOL.OrderID = SO.OrderID)
WHERE 
    YEAR(OrderDate) = 2013 
GROUP BY 
    YEAR(OrderDate); 

--12. Hämta en lista över alla orders som är plockade (PickingCompletedWhen är inte null) och som innehåller produkter som 
--har ett enhetspris högre än det genomsnittliga enhetspriset för alla orderrader. Visa OrderId och enhetspris.

SELECT OrderId, UnitPrice
FROM Sales.OrderLines
WHERE PickingCompletedWhen IS NOT NULL
  AND UnitPrice > (
      SELECT AVG(UnitPrice)
      FROM Sales.OrderLines
  );


--14. Visa produkter i lagret med ett enhetspris mellan 5 och 20 och typisk vikt per enhet mellan 0.1 och 0.4. Sortera på enhetspris stigande.
--Därefter, skriv ett nytt query under som räknar totala antalet produkter som uppfyller villkoren av första frågan.

SELECT *
FROM Warehouse.StockItems
WHERE UnitPrice BETWEEN 5 AND 20 
  AND TypicalWeightPerUnit BETWEEN 0.1 AND 0.4
ORDER BY UnitPrice ASC;


SELECT COUNT(*) AS TotalProducts
FROM Warehouse.StockItems
WHERE UnitPrice BETWEEN 5 AND 20 
  AND TypicalWeightPerUnit BETWEEN 0.1 AND 0.4;

--15. Lägg ihop kunder och transaktioner. Vi vill se: KundID, Kundnamn som endast inehåller 4 första tecknen och sedan en sammanfogad order summary. 
--Exmpel på hur order summary ska se ut: Before tax: $100 - Total: $150. Ta endast transaktionsvärden över 0.

SELECT 
    Sac.CustomerID, 
    LEFT(Sac.CustomerName, 4) AS CustomerName,
    CONCAT(
        'Before tax: $', CT.AmountExcludingTax, 
        ' - Total: $', CT.AmountExcludingTax + CT.TaxAmount
    ) AS OrderSummary
FROM Sales.Customers AS Sac
INNER JOIN Sales.CustomerTransactions AS CT 
    ON Sac.CustomerID = CT.CustomerID
WHERE CT.TransactionAmount > 0; 

--16. Visa KundID och och kundnamn. Sätt därefter ihop en kontaktinfo som ser ut såhär: Contact: (111) 111-1111 | Url: http//www.aaaaaaa.com.
-- Ta endast fram kunder som har en kundkategori som innehåller 'store'. Visa även kategorin.

SELECT SC.CustomerID,
       SC.CustomerName,
       CC.CustomerCategoryName,
       CONCAT('Contact: ', SC.PhoneNumber, ' | Url: ', SC.WebsiteURL) AS ContactInfo
FROM Sales.Customers AS SC
INNER JOIN Sales.CustomerCategories AS CC
    ON SC.CustomerCategoryID = CC.CustomerCategoryID
WHERE CC.CustomerCategoryName LIKE '%store%';

--17. Vi vill se VILKA det var som senaste redigerade information om länder. Sätt ihop person och länder-tabellerna och visa endast personers id och namn, 
--därefter, visa alla övriga kolumner från länder. Ta bara med länder i Europa och Asien och ta bort personid 1. Sortera stigande på giltigt datum.

SELECT P.PersonID, P.FullName, C.*
FROM Application.People AS P
INNER JOIN Application.Countries AS C
    ON P.PersonID = C.LastEditedBy
WHERE C.Continent IN ('Europe', 'Asia')
    AND P.PersonID != 1
ORDER BY C.ValidFrom ;

--18. Vi behöver uppdatera uppgifter för en av våra registrerade personer.
-- Han är tidigare registrerad som Daniel Magnusson och har precis blivit anställd hos oss. Han är numera en systemanvändare, anställd och försäljare,
-- Daniel bytte dock nyligen efternamn till Franzén. Se till att uppdatera hans nya efternamn. 
-- Han ska ha möjlighet attt logga in och har tilldelats ett arbetsmail: danielf@wideworldimporters.com
-- Se till att göra detta till hans login och uppdatera även tidigare registrerad mail. 

UPDATE Application.People SET FullName='Daniel Franzén', LogonName='daniel@wideworldimporters.com', IsPermittedToLogon=1, IsSystemUser=1, IsEmployee=1, IsSalesperson=1, EmailAddress='daniel@wideworldimporters.com'
WHERE PersonID = 1383

--19. Skapa en valfri Stored Procedure(SP) med två inputvärden och en inner join som du tycker passar. Demonstrera användandet av den därefter. 

CREATE PROCEDURE GetTopSalesOrders
    @StartDate DATE,
    @EndDate DATE
AS
BEGIN
    SELECT 
        ol.OrderID,
        SUM(ol.Quantity) AS TotalQuantity,
        SUM(ol.Quantity * ol.UnitPrice) AS TotalSales
    FROM 
        Sales.Orders AS o
    INNER JOIN 
        Sales.OrderLines AS ol ON o.OrderID = ol.OrderID
    WHERE 
        o.OrderDate BETWEEN @StartDate AND @EndDate
    GROUP BY 
        ol.OrderID
    ORDER BY 
        TotalSales DESC;
END;

EXEC GetTopSalesOrders '2013-01-01', '2013-01-31';

--20. Skriv en fråga som visar kundnamn och kundkategori för alla kunder som hade transaktioner under året 2014. För varje kund, visa:
--Kundens namn i stora bokstäver.
--Kundkategori.
--Den totala summan av transaktioner (utan skatt) för 2014, avrundat till noll decimaler.
--Det genomsnittliga transaktionsbeloppet(utan skatt) för 2014, avrundat till en decimal.

SELECT 
    UPPER(C.CustomerName) AS CustomerName,
    CC.CustomerCategoryName AS CustomerCategory,
    CAST (SUM(CT.AmountExcludingTax) AS INT) AS TotalTransactions,
    CAST(AVG(CT.AmountExcludingTax) AS DECIMAL(10, 1)) AS AverageTransactionAmount
FROM 
    Sales.Customers AS C
INNER JOIN 
    Sales.CustomerTransactions AS CT ON c.CustomerID = ct.CustomerID
INNER JOIN 
    Sales.CustomerCategories AS CC ON c.CustomerCategoryID = CC.CustomerCategoryID
WHERE 
    YEAR(ct.TransactionDate) = 2014
GROUP BY 
    c.CustomerName, CC.CustomerCategoryName
ORDER BY 
    TotalTransactions DESC;

	
--21. Skriv en fråga som visar information om produkter (StockItems) som har haft transaktioner under året 2014. För varje produkt visa:
--Produktens namn (StockItemName) i små bokstäver.
--Färg på produkten (ColorName). Ta med alla StockItems även de som inte har en matchning med color.
--Antalet gånger en transaktion med produkten förekommit under året.
--Den totala kvantiteten som förekom i transaktioner under året. Ta endast ingående produktkvantitet(inga minustal).
--Den genomsnittliga kvantiteten per transaktion, avrundad till noll decimaler.
--Sortera resultatet i fallande ordning efter totalt antal sålda enheter. 

SELECT 
    LOWER(SI.StockItemName) AS ProductName,
    C.ColorName AS ProductColor,
    COUNT(SIT.StockItemTransactionID) AS TransactionCount,
    CAST (SUM(SIT.Quantity) AS INT) AS TotalQuantity,
    CAST (AVG(SIT.Quantity) AS INT) AS AverageQuantityPerTransaction
FROM 
    Warehouse.StockItems AS SI
LEFT JOIN 
    Warehouse.Colors AS C ON SI.ColorID = C.ColorID
LEFT JOIN 
    Warehouse.StockItemTransactions AS SIT ON SI.StockItemID = SIT.StockItemID
WHERE 
    YEAR(SIT.TransactionOccurredWhen) = 2014 
    AND SIT.Quantity > 0
GROUP BY 
    SI.StockItemName, C.ColorName
ORDER BY 
    TotalQuantity DESC;


--22. Vi har noterat att en vanlig förekommande rapport är översikt kring våra kunders fakturor och transaktioner. Kan du skapa en view som innehåller: 
--kundnamn, kundkategori, fakturaID, fakturadatum, summa (utan skatt) och levereringsinstruktioner. Filtrera bort kostnader under 1000 (utan skatt)
-- Skriv ett query som skapar denna view med ett passande namn och sedan ett query som använder sig av samma view och även filtrerar på kostnad (utan skatt) fallande. 

CREATE VIEW SalesInvoicesAndTransactions AS 
SELECT SC.CustomerName, SC.CustomerCategoryID, SCC.CustomerCategoryName, SCT.AmountExcludingTax, DM.DeliveryMethodID, DM.DeliveryMethodName
FROM Sales.Customers AS SC
INNER JOIN Sales.Invoices AS SI ON SC.CustomerID = SI.CustomerID
INNER JOIN Sales.CustomerTransactions AS SCT ON SCT.CustomerID = SI.CustomerID
INNER JOIN Application.DeliveryMethods AS DM ON DM.DeliveryMethodID = SI.DeliveryMethodID
INNER JOIN Sales.CustomerCategories AS SCC ON SCC.CustomerCategoryID = SC.CustomerCategoryID

WHERE SCT.AmountExcludingTax >=1000

SELECT *
FROM SalesInvoicesAndTransactions
ORDER BY AmountExcludingTax DESC ;

--23. Titta på beställningar och beräkna det genomsnittliga enhetspriset per kundID år 2013. 
--Visa sedan endast rader med ett genomsnittligt enhetspris lika med och över 60 -3p

SELECT 
    SC.CustomerID, 
    CAST(AVG(SOL.UnitPrice) AS DECIMAL(10, 2)) AS AverageUnitPrice
FROM 
    Sales.Customers AS SC
INNER JOIN 
    Sales.Orders AS SO ON SC.CustomerID = SO.CustomerID
INNER JOIN 
    Sales.OrderLines AS SOL ON SOL.OrderID = SO.OrderID
WHERE 
    YEAR(SO.OrderDate) = 2013
GROUP BY 
    SC.CustomerID
HAVING 
    AVG(SOL.UnitPrice) >= 60;

--24. Skriv en query som hämtar CustomerID, en kolumn kallad "OrderCount" som räknar antalet beställningar varje kund har gjort,
--en kolumn kallad "AvgOrderValue" som visar det genomsnittliga enhetspriset på ordrar avrundat till två decimaler, samt en kolumn kallad 
--"CustomerSummary" som innehåller en sammanfattning i formatet "Customer [CustomerID] - Orders: [OrderCount] - Avg: $[AvgOrderValue]". 
--Filtrera för kunder som har lagt fler eller lika med 100 beställningar och sortera resultatet i fallande ordning efter AvgOrderValue

SELECT 
    SC.CustomerID,
    COUNT(DISTINCT SO.OrderID) AS OrderCount,
    CAST(AVG(SOL.UnitPrice) AS DECIMAL(10, 2)) AS AvgOrderValue,
    CONCAT(
        'Customer ', SC.CustomerID, 
        ' - Orders: ', COUNT(DISTINCT SO.OrderID), 
        ' - Avg: $', CAST(AVG(SOL.UnitPrice) AS DECIMAL(10, 2))
    ) AS CustomerSummary
FROM 
    Sales.Customers AS SC
INNER JOIN 
    Sales.Orders AS SO ON SC.CustomerID = SO.CustomerID
INNER JOIN 
    Sales.OrderLines AS SOL ON SO.OrderID = SOL.OrderID
GROUP BY 
    SC.CustomerID
HAVING 
    COUNT(SO.OrderID) >= 100
ORDER BY 
    AvgOrderValue DESC;

-- 25. Skriv en query som hämtar CustomerID, CustomerName, antalet beställningar per kund, samt det totala beloppet (enhetspris gånger kvantitet) 
--för alla deras beställningar av items i kategorin 'Clothing'. Filtrera för kunder vars totala belopp är större än 10 000 
--och sortera resultatet i fallande ordning efter totalbeloppet.

SELECT 
    SC.CustomerID,
    SC.CustomerName,
    COUNT(DISTINCT SO.OrderID) AS OrderCount,
    SUM(SOL.UnitPrice * SOL.Quantity) AS TotalAmount
FROM 
    Sales.Customers AS SC
INNER JOIN 
    Sales.Orders AS SO ON SC.CustomerID = SO.CustomerID
INNER JOIN 
    Sales.OrderLines AS SOL ON SO.OrderID = SOL.OrderID
INNER JOIN
	Warehouse.StockItemStockGroups AS WSG ON SOL.StockItemID = WSG.StockItemID
INNER JOIN
	Warehouse.StockGroups AS SG ON WSG.StockGroupID = SG.StockGroupID
WHERE SG.StockGroupName = 'Clothing'
GROUP BY SC.CustomerID, SC.CustomerName
HAVING SUM(SOL.UnitPrice * SOL.Quantity) >= 10000
ORDER BY TotalAmount DESC;