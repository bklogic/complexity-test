WITH RECURSIVE hierarchy AS (
    (SELECT 1 AS level from information_schema.tables limit 1)
    UNION ALL
    (SELECT h.level+1 from information_schema.tables
    JOIN hierarchy h ON h.level < 32 limit 1)
),
T AS (
SELECT row_number() OVER (ORDER BY 1) AS rn
FROM hierarchy
)
SELECT 
(rn-1)/16+1 AS id1, (rn-1)/8+1 AS id2, (rn-1)/4+1 AS id3, (rn-1)/2+1 AS id4, (rn-1)/1+1 AS id5
FROM T
