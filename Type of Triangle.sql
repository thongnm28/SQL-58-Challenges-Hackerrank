SELECT 
    CASE 
        WHEN A >= (B + C) OR B >= (A + C) OR C >= (B + A) THEN 'Not A Triangle'
        WHEN A = B AND A = C THEN 'Equilateral'
        WHEN A <> B AND B <> C AND C <> A THEN 'Scalene'
        ELSE 'Isosceles'
    END AS output
FROM triangles;