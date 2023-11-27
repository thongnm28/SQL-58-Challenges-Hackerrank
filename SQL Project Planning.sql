SELECT Start_Date, End_Date
FROM (
    SELECT tb1.Start_Date, tb2.End_Date
    FROM (
        SELECT Start_Date, ROW_NUMBER() OVER (ORDER BY Start_Date ASC) AS rn
        FROM Projects
        WHERE Start_Date NOT IN (SELECT End_Date FROM Projects)
    ) AS tb1
    INNER JOIN (
        SELECT End_Date, ROW_NUMBER() OVER (ORDER BY End_Date ASC) AS rn
        FROM Projects
        WHERE End_Date NOT IN (SELECT Start_Date FROM Projects)
    ) AS tb2 ON tb1.rn = tb2.rn
) AS project_dates
ORDER BY (End_Date - Start_Date) ASC, Start_Date ASC;