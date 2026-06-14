
-- 1. Top 3 Products with Highest Total Sales
SELECT 
    item_nbr,
    SUM(units) AS total_units_sold
FROM train
GROUP BY item_nbr
ORDER BY total_units_sold DESC
LIMIT 3;

-- 2. Join Sales Data from train with Weather Stations
SELECT 
    t.date,
    t.store_nbr,
    t.item_nbr,
    t.units,
    k.station_nbr,
    w.tavg,
    w.tmin,
    w.tmax,
    w.preciptotal,
    w.snowfall,
    w.codesum
FROM train t
INNER JOIN key k ON t.store_nbr = k.store_nbr
INNER JOIN weather w ON k.station_nbr = w.station_nbr 
    AND t.date = w.date
ORDER BY t.date, t.store_nbr, t.item_nbr
  limit 10;

-- 3. Daily Sales and Average Temperature for One Top Product
-- First, identify top product (e.g., if product 111 is top 3)
SELECT 
    t.date,
    t.store_nbr,
    SUM(t.units) AS daily_units_sold,
    AVG(w.tavg) AS avg_daily_temperature
FROM train t
INNER JOIN key k ON t.store_nbr = k.store_nbr
INNER JOIN weather w ON k.station_nbr = w.station_nbr 
    AND t.date = w.date
WHERE t.item_nbr = 111
GROUP BY t.date, t.store_nbr
ORDER BY t.date, t.store_nbr
  limit 3;