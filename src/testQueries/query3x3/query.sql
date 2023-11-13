WITH RECURSIVE H AS (
  (SELECT 1 AS level from information_schema.tables limit 1)
    UNION ALL
    (SELECT h.level+1 from information_schema.tables
    JOIN H h ON h.level < 8
    limit 1)
),
T AS (
SELECT row_number() OVER (ORDER BY 1) AS rn
FROM h
)
SELECT 
(rn-1)/4+1 AS id11, 
(rn-1)/2+1 AS id22, (rn-1)/1+1 AS id23,
(rn-1)/2+1 AS id32, (rn-1)/1+1 AS id33
FROM T
