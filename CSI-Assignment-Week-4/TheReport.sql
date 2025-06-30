SELECT 
    CASE 
        WHEN g.Grade < 8 THEN NULL
        ELSE s.Name
    END AS name,
    g.Grade,s.Marks

FROM Students s

JOIN Grades g ON s.marks BETWEEN g.Min_Mark AND g.Max_Mark

ORDER BY g.Grade DESC,
    CASE
        WHEN g.Grade < 8 THEN s.Marks
        ELSE s.Name
        END;