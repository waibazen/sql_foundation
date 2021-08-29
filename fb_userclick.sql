
DROP TABLE IF EXISTS searches;
CREATE TABLE searches (

"Date" VARCHAR(10),
search_id int ,
user_id int,
age_group VARCHAR(25),
search_query VARCHAR(255)
);


INSERT INTO searches ("Date", search_id, user_id, age_group, search_query)
VALUES
('2020-01-01', 101, 9991,'35-55','page');
INSERT INTO searches ("Date", search_id, user_id, age_group, search_query)
VALUES
('2020-01-02', 102, 9991,'35-55','page');
INSERT INTO searches ("Date", search_id, user_id, age_group, search_query)
VALUES
('2020-01-03', 103, 9992,'35-55','events');
INSERT INTO searches ("Date", search_id, user_id, age_group, search_query)
VALUES
('2020-01-04', 103, 9993,'35-55','events');
INSERT INTO searches ("Date", search_id, user_id, age_group, search_query)
VALUES
('2020-01-05', 104, 9993,'35-55','events');
INSERT INTO searches ("Date", search_id, user_id, age_group, search_query)
VALUES
('2020-01-06', 105, 9992,'35-55','events');

--Over the last 5 days, how many users made more than 1 searches?
WITH search_agg as
(
SELECT user_id, count(search_id) as count_search
FROM searches
WHERE "Date"> dateadd(day,-5,'2020-01-05')
GROUP BY user_id
HAVING count(search_id) >1
)
SELECT * FROM search_agg



	

