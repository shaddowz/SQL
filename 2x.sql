WITH CTE AS
(
SELECT *, ROW_NUMBER() OVER (PARTITION BY ID, [email] ORDER BY ID, [email]) as Dupe
FROM TableX
where email is not null
and email != ''
and id is not null
and id != ''
)

--DELETE x
--FROM TableX x
--INNER JOIN cte ON cte.id = x.id
--WHERE cte.DUPE <> 1
