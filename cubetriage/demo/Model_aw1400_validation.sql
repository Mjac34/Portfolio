-- CubeTriage validation SQL — Model_aw1400
-- kor EFTER load.sql; jamfor kalla vs mal per par
-- orphans ska vara 0; rowcount/checksum ska matcha

-- [rowcount] Dim Customer  (primary table — snowflake chain may deviate vid tomma joiner)
SELECT 'source' AS side; SELECT COUNT(*) FROM Dim Customer;
SELECT 'target' AS side; SELECT COUNT(*) FROM Dim Customer;

-- [rowcount] Dim Date  (primary table — snowflake chain may deviate vid tomma joiner)
SELECT 'source' AS side; SELECT COUNT(*) FROM Dim Date;
SELECT 'target' AS side; SELECT COUNT(*) FROM Dim Date;

-- [rowcount] Dim Product  (primary table — snowflake chain may deviate vid tomma joiner)
SELECT 'source' AS side; SELECT COUNT(*) FROM Dim Product;
SELECT 'target' AS side; SELECT COUNT(*) FROM Dim Product;

-- [rowcount] Dim Employee  (primary table — snowflake chain may deviate vid tomma joiner)
SELECT 'source' AS side; SELECT COUNT(*) FROM Dim Employee;
SELECT 'target' AS side; SELECT COUNT(*) FROM Dim Employee;

-- [rowcount] Fact Internet Sales
SELECT 'source' AS side; SELECT COUNT(*) FROM Fact Internet Sales;
SELECT 'target' AS side; SELECT COUNT(*) FROM Fact Internet Sales;

-- [orphans] Fact Internet Sales -> Dim Customer  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Fact Internet Sales f LEFT JOIN Dim Customer d ON f.CustomerKey = d.CustomerKey WHERE d.CustomerKey IS NULL AND f.CustomerKey IS NOT NULL;

-- [orphans] Fact Internet Sales -> Dim Product  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Fact Internet Sales f LEFT JOIN Dim Product d ON f.ProductKey = d.ProductKey WHERE d.ProductKey IS NULL AND f.ProductKey IS NOT NULL;

-- [orphans] Fact Internet Sales -> Dim Date  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Fact Internet Sales f LEFT JOIN Dim Date d ON f.DueDateKey = d.DateKey WHERE d.DateKey IS NULL AND f.DueDateKey IS NOT NULL;

-- [orphans] Fact Internet Sales -> Dim Date  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Fact Internet Sales f LEFT JOIN Dim Date d ON f.ShipDateKey = d.DateKey WHERE d.DateKey IS NULL AND f.ShipDateKey IS NOT NULL;

-- [orphans] Fact Internet Sales -> Dim Date  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Fact Internet Sales f LEFT JOIN Dim Date d ON f.OrderDateKey = d.DateKey WHERE d.DateKey IS NULL AND f.OrderDateKey IS NOT NULL;

-- [rowcount] Fact Reseller Sales
SELECT 'source' AS side; SELECT COUNT(*) FROM Fact Reseller Sales;
SELECT 'target' AS side; SELECT COUNT(*) FROM Fact Reseller Sales;

-- [orphans] Fact Reseller Sales -> Dim Employee  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Fact Reseller Sales f LEFT JOIN Dim Employee d ON f.EmployeeKey = d.EmployeeKey WHERE d.EmployeeKey IS NULL AND f.EmployeeKey IS NOT NULL;

-- [orphans] Fact Reseller Sales -> Dim Product  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Fact Reseller Sales f LEFT JOIN Dim Product d ON f.ProductKey = d.ProductKey WHERE d.ProductKey IS NULL AND f.ProductKey IS NOT NULL;

-- [orphans] Fact Reseller Sales -> Dim Date  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Fact Reseller Sales f LEFT JOIN Dim Date d ON f.OrderDateKey = d.DateKey WHERE d.DateKey IS NULL AND f.OrderDateKey IS NOT NULL;

-- [orphans] Fact Reseller Sales -> Dim Date  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Fact Reseller Sales f LEFT JOIN Dim Date d ON f.DueDateKey = d.DateKey WHERE d.DateKey IS NULL AND f.DueDateKey IS NOT NULL;

-- [orphans] Fact Reseller Sales -> Dim Date  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Fact Reseller Sales f LEFT JOIN Dim Date d ON f.ShipDateKey = d.DateKey WHERE d.DateKey IS NULL AND f.ShipDateKey IS NOT NULL;

