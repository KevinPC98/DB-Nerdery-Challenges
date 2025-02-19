-- Your answers here:
-- 1
SELECT C.NAME, COUNT(*) AS COUNT FROM COUNTRIES C
    INNER JOIN STATES S ON C.ID = S.COUNTRY_id
     GROUP BY C.NAME;
-- 2
SELECT COUNT(*) AS EMPLOYEES_WITHOUT_BOSSES FROM EMPLOYEES
     WHERE SUPERVISOR_ID IS NULL;
-- 3
SELECT  C.NAME, O.ADDRESS, COUNT(*) FROM OFFICES O 
    INNER JOIN COUNTRIES C ON O.COUNTRY_ID = C.ID 
     INNER JOIN EMPLOYEES E ON E.OFFICE_ID = O.ID 
      GROUP BY O.ADDRESS, C.NAME ORDER BY COUNT 
       DESC LIMIT 5;
-- 4
SELECT SUPERVISOR_ID, COUNT(*) AS COUNT FROM EMPLOYEES
    WHERE SUPERVISOR_ID IS NOT NULL
     GROUP BY SUPERVISOR_ID
     ORDER BY COUNT 
      DESC LIMIT 3;
-- 5
SELECT COUNT(*) AS LIST_OF_OFFICE FROM STATES S 
    INNER JOIN OFFICES O ON S.ID = O.STATE_ID 
     WHERE S.NAME LIKE 'Colorado';
-- 6
SELECT  NAME, COUNT(*) AS COUNT FROM 
    OFFICES O INNER JOIN EMPLOYEES E ON O.ID = E.OFFICE_ID 
     GROUP BY NAME ORDER BY COUNT DESC;
-- 7
(SELECT O.ADDRESS, COUNT(*) AS COUNT FROM 
    EMPLOYEES E INNER JOIN OFFICES O ON E.OFFICE_ID = O.ID 
    GROUP BY O.ADDRESS ORDER BY COUNT DESC LIMIT 1)
    UNION
(SELECT O.ADDRESS, COUNT(*) AS COUNT FROM
    EMPLOYEES E INNER JOIN OFFICES O ON E.OFFICE_ID = O.ID
    GROUP BY O.ADDRESS ORDER BY COUNT LIMIT 1);
--8
SELECT 
 E1.UUID, CONCAT(E1.FIRST_NAME, ' ', E1.LAST_NAME) AS FULL_NAME, E1.EMAIL, E1.JOB_TITLE,
 O.NAME AS COMPANY, C.NAME AS COUNTRY, S.NAME AS STATE, E2.FIRST_NAME AS BOSS_NAME
FROM EMPLOYEES E1 
    INNER JOIN EMPLOYEES E2 ON E1.SUPERVISOR_ID = E2.ID
    INNER JOIN OFFICES O ON E1.OFFICE_ID = O.ID
    INNER JOIN COUNTRIES C ON O.COUNTRY_ID = C.ID
    INNER JOIN STATES S ON O.STATE_ID = S.ID;