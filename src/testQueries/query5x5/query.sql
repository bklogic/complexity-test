WITH RECURSIVE H AS (
  (SELECT 1 AS level from information_schema.tables limit 1)
    UNION ALL
    (SELECT h.level+1 from information_schema.tables
    JOIN H h ON h.level < 160
    limit 1)
),
T AS (
SELECT row_number() OVER (ORDER BY 1) AS rn
FROM h
)
SELECT 
(rn-1)/80+1 AS id11, 
(rn-1)/40+1 AS id22, (rn-1)/20+1 AS id23, (rn-1)/10+1 AS id24, (rn-1)/5+1 AS id25,
(rn-1)/40+1 AS id32, (rn-1)/20+1 AS id33, (rn-1)/10+1 AS id34, (rn-1)/5+1 AS id35,
(rn-1)/40+1 AS id42, (rn-1)/20+1 AS id43, (rn-1)/10+1 AS id44, (rn-1)/5+1 AS id45,
(rn-1)/40+1 AS id52, (rn-1)/20+1 AS id53, (rn-1)/10+1 AS id54, (rn-1)/5+1 AS id55
FROM T
