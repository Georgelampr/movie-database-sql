/*Ερώτημα 1*/

SELECT title,duration 
FROM Movie JOIN Genres ON movieid = genMovieId
WHERE duration > 120 AND genre = 'Action'

/*Ερώτημα 2*/
SELECT
    movieid, title,
    (COUNT(DISTINCT actsPersonId) + COUNT(DISTINCT dirpersonid)) AS total_contributors
FROM Movie LEFT JOIN Actsin ON movieid = actsmovieid
LEFT JOIN Directedby ON movieid = dirmovieid
GROUP BY movieid, title
ORDER BY total_contributors DESC
FETCH FIRST 3 ROWS only;

/* Ερώτημα 3*/
SELECT  lastname,firstname 
FROM Person Join Actsin ON personId = actsPersonId 
JOIN Movie ON actsMovieId = movieId
Where title = 'The Tourist'

/* Ερώτημα 4*/
SELECT title , votesAvg
FROM Movie Join DirectedBy ON movieId = dirMovieId
JOIN Person On dirPersonId = personId
WHERE lastname = 'Cameron' AND firstname = 'James'

/* Ερώτημα 5*/
SELECT title, revenue 
FROM Movie JOIN ProducedBy ON movieId = proMovieId
WHERE cname = 'Warner Bros'
ORDER BY revenue DESC
FETCH FIRST 2 ROWS only;

/* Ερώτημα 6*/
SELECT lastName, firstName, COUNT(movieId)
FROM Person JOIN Actsin ON personId = actsPersonId
JOIN Movie ON actsMovieId = movieId
GROUP BY lastName, firstName
HAVING COUNT(movieId) >= 5

/* Ερώτημα 7*/
SELECT cname,cCountry, SUM(revenue)
FROM ProducedBy JOIN Movie ON proMovieId = movieId 
GROUP BY cname,cCountry
HAVING SUM(revenue)>500000000
ORDER BY SUM(revenue) DESC

/* Ερώτημα 8*/
SELECT lastname, firstname,dirPersonId, COUNT(dirPersonId)  
FROM Person JOIN DirectedBy ON personId = dirPersonId
JOIN Movie ON dirMovieId = movieId 
WHERE sequelOf is not null AND votesAvg > 7 
GROUP BY dirPersonId, lastname, firstname
HAVING COUNT(dirPersonId)  >= 2

/*Ερώτημα 9*/
SELECT DISTINCT dirPersonId, lastName, firstName
FROM DirectedBy JOIN Person ON dirPersonId = personId
WHERE dirPersonId IN (SELECT actsPersonId FROM actsIn
                       WHERE dirMovieId = actsMovieId)