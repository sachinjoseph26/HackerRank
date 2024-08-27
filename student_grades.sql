-- You are given two tables: Students and Grades. Students contains three columns ID, Name and Marks.
-- Ketty gives Eve a task to generate a report containing three columns: Name, Grade and Mark. 
-- Ketty doesnt want the NAMES of those students who received a grade lower_ than 8. 
-- The report must be in descending order by grade 
-- i.e. higher grades are entered first. If there is more than one student with the same grade (8-10) 
-- assigned to them, order those particular students by their name alphabetically. 
-- Finally, if the grade is lower than 8, use "NULL" as their name and list them by their grades in descending order. 
-- If there is more than one student with the same grade (1-7) assigned to them, order those particular students by their marks in ascending order.
-- Write a query to help Eve.

with cte as (
    SELECT s.Name as name,g.grade as grade,s.marks as mark
FROM Students S
JOIN 
Grades G ON S.Marks BETWEEN G.Min_Mark AND G.Max_Mark
)
select (case when grade<8 then 'NULL'
        else name end),
        grade,mark from cte
order by grade desc,mark asc,
case when grade >=8 then name else mark end asc;